import Foundation

enum DMTPlanItemDefaults {
    static let readerSpeedMBps = 200.0
    static let cameraCount = 1
    static let dailyPowerOnHours = 12.0
    static let recordingRatio = 0.5
    static let shootDays = 1.0
    static let backupCopies = 2
    static let safetyMargin = 0.1
}

/// A persisted, immutable snapshot of the recording choice used by a plan item.
struct PlanItem: Codable, Equatable, Identifiable {
    let id: UUID
    var name: String
    /// Optional operational role or rig note, for example main camera or Steadicam.
    var positionNote: String?
    var selection: CameraSelection
    var bitrateMbps: Double
    var media: MediaSpec
    /// Read speed for this camera's media workflow. Nil means a legacy project item
    /// that should fall back to the project transfer profile during migration.
    var readerSpeedMBps: Double?
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
        positionNote: String? = nil,
        selection: CameraSelection,
        bitrateMbps: Double,
        media: MediaSpec,
        readerSpeedMBps: Double? = DMTPlanItemDefaults.readerSpeedMBps,
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
        self.positionNote = positionNote
        self.selection = selection
        self.bitrateMbps = bitrateMbps
        self.media = media
        self.readerSpeedMBps = readerSpeedMBps
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

    /// Restores planning inputs without changing the selected recording mode.
    mutating func resetPlanningParameters() {
        cameraCount = DMTPlanItemDefaults.cameraCount
        dailyPowerOnHours = DMTPlanItemDefaults.dailyPowerOnHours
        recordingRatio = DMTPlanItemDefaults.recordingRatio
        shootDays = DMTPlanItemDefaults.shootDays
        backupCopies = DMTPlanItemDefaults.backupCopies
        safetyMargin = DMTPlanItemDefaults.safetyMargin
        readerSpeedMBps = DMTPlanItemDefaults.readerSpeedMBps
    }

    func duplicated() -> PlanItem {
        let trimmedName = name.trimmingCharacters(in: .whitespacesAndNewlines)
        let copyName = trimmedName.isEmpty ? "机位 副本" : "\(trimmedName) 副本"
        return PlanItem(
            name: copyName,
            positionNote: positionNote,
            selection: selection,
            bitrateMbps: bitrateMbps,
            media: media,
            readerSpeedMBps: readerSpeedMBps,
            hdeDataPerHourMultiplier: hdeDataPerHourMultiplier,
            cameraCount: cameraCount,
            dailyPowerOnHours: dailyPowerOnHours,
            recordingRatio: recordingRatio,
            shootDays: shootDays,
            backupCopies: backupCopies,
            safetyMargin: safetyMargin
        )
    }

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
    /// Legacy project-wide fallback for plan items saved before per-item speeds existed.
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
    let cardCycles: Int
    let readerSpeedMBps: Double
    let effectiveTransferSpeedMBps: Double
    let recordMinutesPerMedia: Double
    let transferSeconds: Double
}

struct PlanSummary: Equatable {
    let itemSummaries: [PlanItemSummary]
    let dailyRawDataBytes: Double
    let totalRawDataBytes: Double
    let dailyStorageBytes: Double
    let totalStorageBytes: Double
    let cardCyclesByMedia: [String: Int]
    let totalTransferSeconds: Double
    let dailyTransferSeconds: Double
    let canCompleteDailyDoubleBackup: Bool
    let issues: [DMTPlanIssue]

    var totalRawDataGB: Double { totalRawDataBytes / 1_000_000_000 }
    var totalStorageGB: Double { totalStorageBytes / 1_000_000_000 }
    var totalTransferHours: Double { totalTransferSeconds / 3_600 }
    var dailyRawDataGB: Double { dailyRawDataBytes / 1_000_000_000 }
    var dailyStorageGB: Double { dailyStorageBytes / 1_000_000_000 }

    /// The slowest effective path in the project, kept as a concise headline metric.
    var effectiveTransferSpeedMBps: Double {
        itemSummaries.map(\.effectiveTransferSpeedMBps).min() ?? 0
    }
}

enum DMTPlanIssue: Equatable {
    case invalidItem(id: UUID, reason: String)
    case invalidTransferProfile
}

enum DMTProjectCalculator {
    static func summarize(
        _ project: DMTProject,
        transferProfile: TransferProfile? = nil
    ) -> PlanSummary {
        let profile = transferProfile ?? project.transferProfile
        let validTargetSpeed =
            profile.targetDiskSpeedMBps.isFinite
            && profile.targetDiskSpeedMBps > 0
        let validWindow =
            profile.offloadWindowHoursPerDay.isFinite
            && profile.offloadWindowHoursPerDay > 0
        var issues: [DMTPlanIssue] = validTargetSpeed && validWindow ? [] : [.invalidTransferProfile]
        var itemSummaries: [PlanItemSummary] = []
        var cardCyclesByMedia: [String: Int] = [:]
        var totalDailyRaw = 0.0
        var totalRaw = 0.0
        var totalStorage = 0.0
        var dailyStorage = 0.0
        var dailyTransfer = 0.0

        for item in project.items {
            guard isValid(item) else {
                issues.append(.invalidItem(id: item.id, reason: "机位参数必须为有限正数，录制比例和安全余量不能为负"))
                continue
            }

            let captureBytesPerSecond = item.bitrateMbps * 1_000_000 / 8
            let readerSpeed = item.readerSpeedMBps ?? profile.readerSpeedMBps
            let validReaderSpeed = readerSpeed.isFinite && readerSpeed > 0
            let effectiveSpeed = validTargetSpeed && validReaderSpeed
                ? min(readerSpeed, profile.targetDiskSpeedMBps)
                : 0
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
            // Card cycles represent total media turnovers, not the physical card pool.
            let cardCyclesValue = ceil(
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
                validReaderSpeed,
                recordMinutesPerMedia.isFinite,
                recordMinutesPerMedia > 0,
                cardCyclesValue.isFinite,
                cardCyclesValue > 0,
                cardCyclesValue <= Double(Int.max)
            else {
                issues.append(.invalidItem(id: item.id, reason: "机位计算结果超出支持范围"))
                continue
            }

            let cardCycles = Int(cardCyclesValue)
            let transferSeconds = effectiveSpeed > 0
                ? storage / (effectiveSpeed * 1_000_000)
                : 0
            let dailyTransferSeconds = effectiveSpeed > 0
                ? dailyStorageForItem / (effectiveSpeed * 1_000_000)
                : 0
            let nextTotalDailyRaw = totalDailyRaw + dailyRaw
            let nextTotalRaw = totalRaw + raw
            let nextTotalStorage = totalStorage + storage
            let nextDailyStorage = dailyStorage + dailyStorageForItem
            let nextDailyTransfer = dailyTransfer + dailyTransferSeconds

            guard transferSeconds.isFinite,
                nextTotalDailyRaw.isFinite,
                nextTotalRaw.isFinite,
                nextTotalStorage.isFinite,
                nextDailyStorage.isFinite,
                dailyTransferSeconds.isFinite,
                nextDailyTransfer.isFinite
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
                    cardCycles: cardCycles,
                    readerSpeedMBps: readerSpeed,
                    effectiveTransferSpeedMBps: effectiveSpeed,
                    recordMinutesPerMedia: recordMinutesPerMedia,
                    transferSeconds: transferSeconds
                )
            )
            cardCyclesByMedia[item.mediaID, default: 0] += cardCycles
            totalDailyRaw = nextTotalDailyRaw
            totalRaw = nextTotalRaw
            totalStorage = nextTotalStorage
            dailyStorage = nextDailyStorage
            dailyTransfer = nextDailyTransfer
        }

        let canComplete =
            validTargetSpeed && validWindow
            && dailyTransfer <= profile.offloadWindowHoursPerDay * 3_600
            && !itemSummaries.isEmpty
            && issues.isEmpty

        return PlanSummary(
            itemSummaries: itemSummaries,
            dailyRawDataBytes: totalDailyRaw,
            totalRawDataBytes: totalRaw,
            dailyStorageBytes: dailyStorage,
            totalStorageBytes: totalStorage,
            cardCyclesByMedia: cardCyclesByMedia,
            totalTransferSeconds: itemSummaries.reduce(0) { $0 + $1.transferSeconds },
            dailyTransferSeconds: dailyTransfer,
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

struct DMTProject: Codable, Equatable, Identifiable {
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

    @discardableResult
    mutating func movePlanItem(id: UUID, by offset: Int) -> Bool {
        guard offset != 0,
            let sourceIndex = items.firstIndex(where: { $0.id == id })
        else { return false }
        let destinationIndex = sourceIndex + offset
        guard items.indices.contains(destinationIndex) else { return false }

        items.swapAt(sourceIndex, destinationIndex)
        touch()
        return true
    }

    @discardableResult
    mutating func movePlanItems(fromOffsets offsets: IndexSet, toOffset destination: Int) -> Bool {
        guard !offsets.isEmpty,
            offsets.allSatisfy(items.indices.contains),
            (0...items.count).contains(destination)
        else { return false }

        let movingItems = offsets.map { items[$0] }
        var remainingItems = items.enumerated()
            .filter { !offsets.contains($0.offset) }
            .map(\.element)
        let removedBeforeDestination = offsets.filter { $0 < destination }.count
        let insertionIndex = min(
            remainingItems.count,
            max(0, destination - removedBeforeDestination)
        )
        remainingItems.insert(contentsOf: movingItems, at: insertionIndex)
        guard remainingItems != items else { return false }

        items = remainingItems
        touch()
        return true
    }
}
