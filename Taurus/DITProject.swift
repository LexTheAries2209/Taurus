import Foundation

/// A persisted, immutable snapshot of the recording choice used by a plan item.
struct PlanItem: Codable, Equatable, Identifiable {
    let id: UUID
    var name: String
    var selection: CameraSelection
    var bitrateMbps: Double
    var media: MediaSpec
    /// Active HDE output ratio. Nil means HDE is disabled or unavailable.
    var hdeDataPerHourMultiplier: Double?
    var cameraCount: Int
    var dailyPowerOnHours: Double
    var recordingRatio: Double
    var shootDays: Double
    /// Number of copies retained after ingest. A value of 2 represents a double backup.
    var backupCopies: Int
    /// Fractional headroom, for example 0.2 represents 20%.
    var safetyMargin: Double

    init(
        id: UUID = UUID(),
        name: String = "机位",
        selection: CameraSelection,
        bitrateMbps: Double,
        media: MediaSpec,
        hdeDataPerHourMultiplier: Double? = nil,
        cameraCount: Int = 1,
        dailyPowerOnHours: Double = 8,
        recordingRatio: Double = 0.5,
        shootDays: Double = 1,
        backupCopies: Int = 2,
        safetyMargin: Double = 0.1
    ) {
        self.id = id
        self.name = name
        self.selection = selection
        self.bitrateMbps = bitrateMbps
        self.media = media
        self.hdeDataPerHourMultiplier = hdeDataPerHourMultiplier
        self.cameraCount = cameraCount
        self.dailyPowerOnHours = dailyPowerOnHours
        self.recordingRatio = recordingRatio
        self.shootDays = shootDays
        self.backupCopies = backupCopies
        self.safetyMargin = safetyMargin
    }

    var mediaID: String { media.id }

    var effectiveCopyCount: Int { max(1, backupCopies) }

    var usesHDE: Bool { hdeDataPerHourMultiplier != nil }

    var cameraLabel: String {
        "\(selection.brandID) \(selection.cameraID)"
    }
}

enum ARRIHDE {
    static func multiplier(for selection: CameraSelection) -> Double? {
        guard selection.brandID == "ARRI", selection.codecID == "ARRIRAW" else { return nil }
        return ARRIRecordingCatalog()
            .recordingMode(for: selection)?
            .hdeDataPerHourMultiplier
    }
}

struct TransferProfile: Codable, Equatable, Identifiable {
    let id: UUID
    var name: String
    var readerSpeedMBps: Double
    var targetDiskSpeedMBps: Double
    var offloadWindowHoursPerDay: Double

    init(
        id: UUID = UUID(),
        name: String = "默认卸载配置",
        readerSpeedMBps: Double = 200,
        targetDiskSpeedMBps: Double = 200,
        offloadWindowHoursPerDay: Double = 12
    ) {
        self.id = id
        self.name = name
        self.readerSpeedMBps = readerSpeedMBps
        self.targetDiskSpeedMBps = targetDiskSpeedMBps
        self.offloadWindowHoursPerDay = offloadWindowHoursPerDay
    }

    var effectiveSpeedMBps: Double {
        min(readerSpeedMBps, targetDiskSpeedMBps)
    }
}

struct PlanItemSummary: Equatable {
    let itemID: UUID
    let itemName: String
    let rawDataPerCameraPerDayBytes: Double
    let rawDataPerDayBytes: Double
    let rawDataPerCameraProjectBytes: Double
    let rawDataBytes: Double
    let dailyStorageBytes: Double
    let storageBytes: Double
    let requiredMediaCount: Int
    let recordMinutesPerMedia: Double
    let transferSeconds: Double
}

struct PlanSummary: Equatable {
    let itemSummaries: [PlanItemSummary]
    let dailyRawDataBytes: Double
    let totalRawDataBytes: Double
    let dailyStorageBytes: Double
    let totalStorageBytes: Double
    let mediaCounts: [String: Int]
    let totalTransferSeconds: Double
    let dailyTransferSeconds: Double
    let effectiveTransferSpeedMBps: Double
    let canCompleteDailyDoubleBackup: Bool
    let issues: [DITPlanIssue]

    var totalRawDataGB: Double { totalRawDataBytes / 1_000_000_000 }
    var totalStorageGB: Double { totalStorageBytes / 1_000_000_000 }
    var totalTransferHours: Double { totalTransferSeconds / 3_600 }
    var dailyRawDataGB: Double { dailyRawDataBytes / 1_000_000_000 }
    var dailyStorageGB: Double { dailyStorageBytes / 1_000_000_000 }
}

enum DITPlanIssue: Equatable {
    case invalidItem(id: UUID, reason: String)
    case invalidTransferProfile
}

enum DITProjectCalculator {
    static func summarize(
        _ project: DITProject,
        transferProfile: TransferProfile? = nil
    ) -> PlanSummary {
        let profile = transferProfile ?? project.transferProfile
        let validSpeed =
            profile.readerSpeedMBps.isFinite
            && profile.readerSpeedMBps > 0
            && profile.targetDiskSpeedMBps.isFinite
            && profile.targetDiskSpeedMBps > 0
        let validWindow =
            profile.offloadWindowHoursPerDay.isFinite
            && profile.offloadWindowHoursPerDay > 0
        let effectiveSpeed = profile.effectiveSpeedMBps
        var issues: [DITPlanIssue] = validSpeed && validWindow ? [] : [.invalidTransferProfile]
        var itemSummaries: [PlanItemSummary] = []
        var mediaCounts: [String: Int] = [:]
        var totalDailyRaw = 0.0
        var totalRaw = 0.0
        var totalStorage = 0.0
        var dailyStorage = 0.0

        for item in project.items {
            guard isValid(item) else {
                issues.append(.invalidItem(id: item.id, reason: "机位参数必须为有限正数，录制比例和安全余量不能为负"))
                continue
            }

            let captureBytesPerSecond = item.bitrateMbps * 1_000_000 / 8
            let captureRawPerCameraPerDay =
                captureBytesPerSecond
                * item.dailyPowerOnHours * 3_600
                * item.recordingRatio
            let hdeMultiplier = item.hdeDataPerHourMultiplier ?? 1
            let rawPerCameraPerDay = captureRawPerCameraPerDay * hdeMultiplier
            let dailyRaw = rawPerCameraPerDay * Double(item.cameraCount)
            let rawPerCameraProject = rawPerCameraPerDay * item.shootDays
            let raw = dailyRaw * item.shootDays
            let captureRaw = captureRawPerCameraPerDay * Double(item.cameraCount) * item.shootDays
            let storage = raw * Double(item.effectiveCopyCount) * (1 + item.safetyMargin)
            let dailyStorageForItem =
                dailyRaw * Double(item.effectiveCopyCount) * (1 + item.safetyMargin)
            let requiredMediaValue = ceil(
                captureRaw * (1 + item.safetyMargin) / item.media.usableCapacityBytes
            )
            let recordMinutesPerMedia = item.media.usableCapacityBytes / captureBytesPerSecond / 60

            guard captureRawPerCameraPerDay.isFinite,
                rawPerCameraPerDay.isFinite,
                dailyRaw.isFinite,
                rawPerCameraProject.isFinite,
                raw.isFinite,
                storage.isFinite,
                dailyStorageForItem.isFinite,
                recordMinutesPerMedia.isFinite,
                recordMinutesPerMedia > 0,
                requiredMediaValue.isFinite,
                requiredMediaValue > 0,
                requiredMediaValue <= Double(Int.max)
            else {
                issues.append(.invalidItem(id: item.id, reason: "机位计算结果超出支持范围"))
                continue
            }

            let requiredMedia = Int(requiredMediaValue)
            let transferSeconds = validSpeed ? storage / (effectiveSpeed * 1_000_000) : 0
            let nextTotalDailyRaw = totalDailyRaw + dailyRaw
            let nextTotalRaw = totalRaw + raw
            let nextTotalStorage = totalStorage + storage
            let nextDailyStorage = dailyStorage + dailyStorageForItem

            guard transferSeconds.isFinite,
                nextTotalDailyRaw.isFinite,
                nextTotalRaw.isFinite,
                nextTotalStorage.isFinite,
                nextDailyStorage.isFinite
            else {
                issues.append(.invalidItem(id: item.id, reason: "项目汇总结果超出支持范围"))
                continue
            }

            itemSummaries.append(
                PlanItemSummary(
                    itemID: item.id,
                    itemName: item.name,
                    rawDataPerCameraPerDayBytes: rawPerCameraPerDay,
                    rawDataPerDayBytes: dailyRaw,
                    rawDataPerCameraProjectBytes: rawPerCameraProject,
                    rawDataBytes: raw,
                    dailyStorageBytes: dailyStorageForItem,
                    storageBytes: storage,
                    requiredMediaCount: requiredMedia,
                    recordMinutesPerMedia: recordMinutesPerMedia,
                    transferSeconds: transferSeconds
                )
            )
            mediaCounts[item.mediaID, default: 0] += requiredMedia
            totalDailyRaw = nextTotalDailyRaw
            totalRaw = nextTotalRaw
            totalStorage = nextTotalStorage
            dailyStorage = nextDailyStorage
        }

        let dailyTransferSeconds = validSpeed ? dailyStorage / (effectiveSpeed * 1_000_000) : 0
        let canComplete =
            validSpeed && validWindow
            && dailyTransferSeconds <= profile.offloadWindowHoursPerDay * 3_600
            && !itemSummaries.isEmpty
            && issues.isEmpty

        return PlanSummary(
            itemSummaries: itemSummaries,
            dailyRawDataBytes: totalDailyRaw,
            totalRawDataBytes: totalRaw,
            dailyStorageBytes: dailyStorage,
            totalStorageBytes: totalStorage,
            mediaCounts: mediaCounts,
            totalTransferSeconds: itemSummaries.reduce(0) { $0 + $1.transferSeconds },
            dailyTransferSeconds: dailyTransferSeconds,
            effectiveTransferSpeedMBps: validSpeed ? effectiveSpeed : 0,
            canCompleteDailyDoubleBackup: canComplete,
            issues: issues
        )
    }

    private static func isValid(_ item: PlanItem) -> Bool {
        item.bitrateMbps.isFinite && item.bitrateMbps > 0
            && item.media.usableCapacityBytes.isFinite && item.media.usableCapacityBytes > 0
            && validHDE(item)
            && item.cameraCount > 0
            && item.dailyPowerOnHours.isFinite && item.dailyPowerOnHours > 0
            && item.recordingRatio.isFinite && item.recordingRatio > 0 && item.recordingRatio <= 1
            && item.shootDays.isFinite && item.shootDays > 0
            && item.backupCopies > 0
            && item.safetyMargin.isFinite && item.safetyMargin >= 0
    }

    private static func validHDE(_ item: PlanItem) -> Bool {
        guard let multiplier = item.hdeDataPerHourMultiplier else { return true }
        return item.selection.brandID == "ARRI"
            && item.selection.codecID == "ARRIRAW"
            && multiplier.isFinite
            && multiplier > 0
            && multiplier <= 1
    }
}

struct DITProject: Codable, Equatable, Identifiable {
    let id: UUID
    var name: String
    var createdAt: Date
    var updatedAt: Date
    var items: [PlanItem]
    var transferProfile: TransferProfile
    var notes: String

    init(
        id: UUID = UUID(),
        name: String = "未命名项目",
        createdAt: Date = Date(),
        updatedAt: Date? = nil,
        items: [PlanItem] = [],
        transferProfile: TransferProfile = TransferProfile(),
        notes: String = ""
    ) {
        self.id = id
        self.name = name
        self.createdAt = createdAt
        self.updatedAt = updatedAt ?? createdAt
        self.items = items
        self.transferProfile = transferProfile
        self.notes = notes
    }

    mutating func touch(at date: Date = Date()) {
        updatedAt = date
    }
}
