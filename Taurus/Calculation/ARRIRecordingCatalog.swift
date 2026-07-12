import Foundation

struct ARRIRecordingCatalog: CameraCatalog {
    private let modes: [RecordingMode] = [
        RecordingMode(
            selection: CameraSelection(
                brandID: "ARRI",
                cameraID: "ALEXA 35",
                codecID: "ARRIRAW",
                codecLevelID: nil,
                formatID: nil,
                resolutionID: "4.6K S35[4608*3164][OG]",
                frameRateID: "0.750",
                mediaID: "Compact Drive 1TB"
            ),
            bitrateMbps: 141.09375,
            includesHDE: true,
            halvesRecordMinutes: false
        )
    ]

    private let media: [MediaSpec] = [
        MediaSpec(id: "Compact Drive 1TB", usableCapacityGB: 931)
    ]

    func recordingMode(for selection: CameraSelection) -> RecordingMode? {
        modes.first { $0.selection == selection }
    }

    func mediaSpec(for id: String) -> MediaSpec? {
        media.first { $0.id == id }
    }
}
