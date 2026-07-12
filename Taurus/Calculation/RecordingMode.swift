import Foundation

struct MediaSpec: Equatable, Hashable {
    let id: String
    let usableCapacityBytes: Double
    let proResUsableCapacityBytes: Double?

    init(
        id: String,
        usableCapacityBytes: Double,
        proResUsableCapacityBytes: Double? = nil
    ) {
        self.id = id
        self.usableCapacityBytes = usableCapacityBytes
        self.proResUsableCapacityBytes = proResUsableCapacityBytes
    }
}

struct RecordingMode: Equatable, Hashable {
    let selection: CameraSelection
    let bitrateMbps: Double
    let hdeDataPerHourMultiplier: Double?
    let halvesRecordMinutes: Bool
    let recordingBytesPerSecond: Double?
    let recordingCapacityBytes: Double?
    let recordDurationSecondsOffset: Double

    init(
        selection: CameraSelection,
        bitrateMbps: Double,
        hdeDataPerHourMultiplier: Double?,
        halvesRecordMinutes: Bool,
        recordingBytesPerSecond: Double? = nil,
        recordingCapacityBytes: Double? = nil,
        recordDurationSecondsOffset: Double = 0
    ) {
        self.selection = selection
        self.bitrateMbps = bitrateMbps
        self.hdeDataPerHourMultiplier = hdeDataPerHourMultiplier
        self.halvesRecordMinutes = halvesRecordMinutes
        self.recordingBytesPerSecond = recordingBytesPerSecond
        self.recordingCapacityBytes = recordingCapacityBytes
        self.recordDurationSecondsOffset = recordDurationSecondsOffset
    }
}
