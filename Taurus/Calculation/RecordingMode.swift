import Foundation

struct MediaSpec: Equatable, Hashable {
    let id: String
    let usableCapacityBytes: Double
}

struct RecordingMode: Equatable, Hashable {
    let selection: CameraSelection
    let bitrateMbps: Double
    let hdeDataPerHourMultiplier: Double?
    let halvesRecordMinutes: Bool
}
