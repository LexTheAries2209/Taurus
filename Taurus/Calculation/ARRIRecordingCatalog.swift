import Foundation

struct ARRIRecordingCatalog: CameraCatalog {
    func cameraOptions() -> [String] {
        ARRIOfficialCatalogData.cameras.map(\.displayName)
    }

    func codecOptions(for cameraID: String) -> [String] {
        unique(
            ARRIOfficialCatalogData.rules
                .filter { $0.cameraID == canonicalCameraID(cameraID) }
                .map(\.codecID)
        )
    }

    func resolutionOptions(for selection: CameraSelection) -> [String] {
        unique(cameraCodecRules(for: selection).map { $0.resolutionID })
    }

    func mediaOptions(for selection: CameraSelection) -> [String] {
        let supportedMedia = Set(matchingRules(for: selection).flatMap { $0.mediaLimits.keys })
        return ARRIOfficialCatalogData.media
            .filter { supportedMedia.contains($0.sourceID) }
            .map(\.displayName)
    }

    func recordingMode(for selection: CameraSelection) -> RecordingMode? {
        guard let frameRate = Double(selection.frameRateID),
              let camera = cameraDefinition(for: selection.cameraID),
              camera.sensorFrameRates.contains(where: { abs($0 - frameRate) < 0.000_001 }),
              let media = mediaDefinition(for: selection.mediaID),
              let rule = matchingRules(for: selection).first(where: {
                  $0.mediaLimits[media.sourceID]?.contains(frameRate) == true
              }) else {
            return nil
        }

        let sourceID = camera.sourceID
        let bitrateBytesPerFrame = ["alexaClassic", "alexaXT"].contains(sourceID)
            ? rule.bytesPerFrame - 5_125
            : rule.bytesPerFrame

        var recordingBytesPerSecond = rule.bytesPerFrame * frameRate
        if sourceID == "alexaSXT" && selection.codecID == "ARRIRAW" {
            recordingBytesPerSecond = (rule.bytesPerFrame - 200_000) * frameRate
        }
        if sourceID == "alexaXT" && selection.codecID == "ARRIRAW" {
            recordingBytesPerSecond += 150_000
        }

        let usesProResCaptureCapacity = ["alexaLF", "alexaSXT", "alexaXT"].contains(sourceID)
            && selection.codecID.hasPrefix("ProRes")
            && media.kind == "codex_capture"
        let recordingCapacityBytes = usesProResCaptureCapacity
            ? media.proResUsableCapacityBytes
            : nil
        let durationOffset = ["alexaClassic", "alexaXT"].contains(sourceID) ? -5.0 : 0.0

        return RecordingMode(
            selection: selection,
            bitrateMbps: bitrateBytesPerFrame * frameRate * 8 / 1_000_000,
            hdeDataPerHourMultiplier: selection.codecID == "ARRIRAW"
                ? camera.hdeDataPerHourMultiplier
                : nil,
            halvesRecordMinutes: false,
            recordingBytesPerSecond: recordingBytesPerSecond,
            recordingCapacityBytes: recordingCapacityBytes,
            recordDurationSecondsOffset: durationOffset
        )
    }

    func mediaSpec(for id: String) -> MediaSpec? {
        guard let media = mediaDefinition(for: id) else { return nil }
        return MediaSpec(
            id: media.displayName,
            usableCapacityBytes: media.usableCapacityBytes,
            proResUsableCapacityBytes: media.proResUsableCapacityBytes
        )
    }

    func frameRates(for selection: CameraSelection) -> [String] {
        guard let camera = cameraDefinition(for: selection.cameraID),
              let media = mediaDefinition(for: selection.mediaID) else {
            return []
        }

        let limits = matchingRules(for: selection).compactMap { $0.mediaLimits[media.sourceID] }
        guard !limits.isEmpty else { return [] }

        return camera.sensorFrameRates
            .filter { frameRate in limits.contains { $0.contains(frameRate) } }
            .map(Self.frameRateID)
    }

    private func cameraCodecRules(for selection: CameraSelection) -> [ARRIModeDefinition] {
        let cameraID = canonicalCameraID(selection.cameraID)
        return ARRIOfficialCatalogData.rules.filter {
            $0.cameraID == cameraID &&
            $0.codecID == selection.codecID
        }
    }

    private func matchingRules(for selection: CameraSelection) -> [ARRIModeDefinition] {
        cameraCodecRules(for: selection).filter {
            resolutionMatches($0.resolutionID, selection.resolutionID)
        }
    }

    private func cameraDefinition(for cameraID: String) -> ARRICameraDefinition? {
        let canonicalID = canonicalCameraID(cameraID)
        return ARRIOfficialCatalogData.cameras.first { $0.displayName == canonicalID }
    }

    private func mediaDefinition(for displayName: String) -> ARRIMediaDefinition? {
        ARRIOfficialCatalogData.media.first { $0.displayName == displayName }
    }

    private func resolutionMatches(_ officialResolutionID: String, _ selectionResolutionID: String) -> Bool {
        if officialResolutionID == selectionResolutionID {
            return true
        }

        guard let dimensions = selectionResolutionID.range(
            of: #"\d+\*\d+"#,
            options: .regularExpression
        ) else {
            return false
        }
        let officialDimensions = selectionResolutionID[dimensions].replacingOccurrences(of: "*", with: " x ")
        return officialResolutionID.contains("(\(officialDimensions))")
    }

    private func canonicalCameraID(_ cameraID: String) -> String {
        cameraID == "ALEXA 35 Live Xtreme" ? "ALEXA 35 Xtreme" : cameraID
    }

    private func unique(_ values: [String]) -> [String] {
        var seen = Set<String>()
        return values.filter { seen.insert($0).inserted }
    }

    private static func frameRateID(_ frameRate: Double) -> String {
        String(format: "%.3f", frameRate)
    }
}

struct ARRICameraDefinition {
    let sourceID: String
    let displayName: String
    let sensorFrameRates: [Double]
    let hdeDataPerHourMultiplier: Double?
}

struct ARRIMediaDefinition {
    let sourceID: String
    let displayName: String
    let usableCapacityBytes: Double
    let proResUsableCapacityBytes: Double?
    let kind: String
}

struct ARRIFrameRateLimit {
    let minimumFrameRate: Double
    let maximumFrameRate: Double

    func contains(_ frameRate: Double) -> Bool {
        frameRate >= minimumFrameRate - 0.000_001 && frameRate <= maximumFrameRate + 0.000_001
    }
}

struct ARRIModeDefinition {
    let cameraID: String
    let codecID: String
    let resolutionID: String
    let bytesPerFrame: Double
    let mediaLimits: [String: ARRIFrameRateLimit]

    init(
        cameraID: String,
        codecID: String,
        resolutionID: String,
        bytesPerFrame: Double,
        mediaLimitData: String
    ) {
        self.cameraID = cameraID
        self.codecID = codecID
        self.resolutionID = resolutionID
        self.bytesPerFrame = bytesPerFrame
        self.mediaLimits = Dictionary(
            uniqueKeysWithValues: mediaLimitData.split(separator: ";").compactMap { rawLimit in
                let values = rawLimit.split(separator: ":")
                guard values.count == 3,
                      let minimumFrameRate = Double(values[1]),
                      let maximumFrameRate = Double(values[2]) else {
                    return nil
                }
                return (
                    String(values[0]),
                    ARRIFrameRateLimit(
                        minimumFrameRate: minimumFrameRate,
                        maximumFrameRate: maximumFrameRate
                    )
                )
            }
        )
    }
}
