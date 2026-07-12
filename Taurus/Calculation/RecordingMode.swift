import Foundation

struct MediaSpec: Equatable, Hashable {
    let id: String
    let usableCapacityGB: Double
}

struct RecordingMode: Equatable, Hashable {
    let selection: CameraSelection
    let bitrateMbps: Double
    let includesHDE: Bool
    let halvesRecordMinutes: Bool
}
