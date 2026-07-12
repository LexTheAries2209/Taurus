import Foundation

struct ARRIRecordingCatalog: CameraCatalog {
    private typealias FrameRate = (id: String, framesPerSecond: Double)

    // ARRI Formats and Data Rate Calculator v2.6.3, accessed 2026-07-12.
    private static let alexa35OpenGateBytesPerFrame = 23_219_803.779_206_83
    private static let hdeDataPerHourMultiplier = 0.5
    private static let oneTerabyteFrameRates: [FrameRate] = [
        ("0.750", 0.750), ("1.000", 1.000), ("20.000", 20.000),
        ("23.976", 23.976), ("24.000", 24.000), ("25.000", 25.000),
        ("27.000", 27.000), ("29.000", 29.000), ("29.970", 29.970),
        ("30.000", 30.000), ("35.000", 35.000)
    ]
    private static let twoTerabyteFrameRates: [FrameRate] = [
        ("0.750", 0.750), ("1.000", 1.000), ("20.000", 20.000),
        ("23.976", 23.976), ("24.000", 24.000), ("25.000", 25.000),
        ("27.000", 27.000), ("29.000", 29.000), ("29.970", 29.970),
        ("30.000", 30.000), ("35.000", 35.000), ("37.000", 37.000),
        ("38.000", 38.000), ("40.000", 40.000), ("41.000", 41.000),
        ("42.000", 42.000), ("43.000", 43.000), ("45.000", 45.000),
        ("48.000", 48.000), ("50.000", 50.000), ("55.000", 55.000),
        ("59.940", 59.940), ("60.000", 60.000), ("65.000", 65.000),
        ("70.000", 70.000), ("72.000", 72.000), ("75.000", 75.000)
    ]

    private let modes: [RecordingMode] =
        Self.makeModes(mediaID: "Compact Drive 1TB", frameRates: Self.oneTerabyteFrameRates) +
        Self.makeModes(mediaID: "Compact Drive 2TB", frameRates: Self.twoTerabyteFrameRates)

    private let media: [MediaSpec] = [
        MediaSpec(id: "Compact Drive 1TB", usableCapacityBytes: 937_687_040_000),
        MediaSpec(id: "Compact Drive 2TB", usableCapacityBytes: 1_875_369_984_000)
    ]

    func recordingMode(for selection: CameraSelection) -> RecordingMode? {
        modes.first { $0.selection == selection }
    }

    func mediaSpec(for id: String) -> MediaSpec? {
        media.first { $0.id == id }
    }

    func frameRates(for selection: CameraSelection) -> [String] {
        modes.lazy
            .filter { Self.matches($0.selection, selection, ignoringFrameRate: true) }
            .map(\.selection.frameRateID)
    }

    private static func makeModes(mediaID: String, frameRates: [FrameRate]) -> [RecordingMode] {
        frameRates.map { frameRate in
            RecordingMode(
                selection: CameraSelection(
                    brandID: "ARRI",
                    cameraID: "ALEXA 35",
                    codecID: "ARRIRAW",
                    codecLevelID: nil,
                    formatID: nil,
                    resolutionID: "4.6K S35[4608*3164][OG]",
                    frameRateID: frameRate.id,
                    mediaID: mediaID
                ),
                bitrateMbps: alexa35OpenGateBytesPerFrame * frameRate.framesPerSecond * 8 / 1_000_000,
                hdeDataPerHourMultiplier: hdeDataPerHourMultiplier,
                halvesRecordMinutes: false
            )
        }
    }

    private static func matches(
        _ candidate: CameraSelection,
        _ selection: CameraSelection,
        ignoringFrameRate: Bool
    ) -> Bool {
        candidate.brandID == selection.brandID &&
        candidate.cameraID == selection.cameraID &&
        candidate.codecID == selection.codecID &&
        candidate.codecLevelID == selection.codecLevelID &&
        candidate.formatID == selection.formatID &&
        candidate.resolutionID == selection.resolutionID &&
        (ignoringFrameRate || candidate.frameRateID == selection.frameRateID) &&
        candidate.mediaID == selection.mediaID &&
        candidate.manualBitrate == selection.manualBitrate &&
        candidate.manualWidth == selection.manualWidth &&
        candidate.manualHeight == selection.manualHeight
    }
}
