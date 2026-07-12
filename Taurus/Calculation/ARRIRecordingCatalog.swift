import Foundation

struct ARRIRecordingCatalog: CameraCatalog {
    func cameraOptions() -> [String] {
        [
            "ALEXA 265",
            "ALEXA 35 Live Xtreme",
            "ALEXA 35 Xtreme",
            "ALEXA 35",
            "ALEXA Mini LF",
            "ALEXA SXT",
            "ALEXA LF",
            "ALEXA Mini",
            "ALEXA 65",
            "AMIRA",
            "ALEXA XT",
            "ALEXA Classic"
        ]
    }

    func codecOptions(for cameraID: String) -> [String] {
        let canonicalID = canonicalCameraID(cameraID)
        return unique(
            ARRIOfficialCatalogData.rules
                .filter {
                    $0.cameraID == canonicalID &&
                    !ARRIResolutionDisplayCatalog.entries(
                        cameraID: canonicalID,
                        codecID: $0.codecID
                    ).isEmpty
                }
                .map(\.codecID)
        )
    }

    func resolutionOptions(for selection: CameraSelection) -> [String] {
        let cameraID = canonicalCameraID(selection.cameraID)
        let availableOfficialIDs = Set(cameraCodecRules(for: selection).map(\.resolutionID))
        return ARRIResolutionDisplayCatalog.entries(cameraID: cameraID, codecID: selection.codecID)
            .filter { availableOfficialIDs.contains($0.officialID) }
            .map(\.displayName)
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
              frameRates(for: selection).contains(Self.frameRateID(frameRate)),
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
        guard cameraDefinition(for: selection.cameraID) != nil,
              let media = mediaDefinition(for: selection.mediaID) else {
            return []
        }

        let limits = matchingRules(for: selection).compactMap { $0.mediaLimits[media.sourceID] }
        guard !limits.isEmpty else { return [] }

        return ARRILegacyFrameRateCatalog.candidates(
            cameraID: canonicalCameraID(selection.cameraID),
            codecID: selection.codecID,
            resolutionID: selection.resolutionID,
            maximumFrameRate: limits.map(\.maximumFrameRate).max() ?? 0
        )
            .filter { frameRate in limits.contains { $0.contains(frameRate) } }
            .map(Self.frameRateID)
    }

    private func cameraCodecRules(for selection: CameraSelection) -> [ARRIModeDefinition] {
        let cameraID = canonicalCameraID(selection.cameraID)
        return ARRIOfficialCatalogData.rules.filter {
            $0.cameraID == cameraID &&
            $0.codecID == selection.codecID &&
            ARRIResolutionDisplayCatalog.displayName(
                cameraID: cameraID,
                codecID: selection.codecID,
                officialID: $0.resolutionID
            ) != nil
        }
    }

    private func matchingRules(for selection: CameraSelection) -> [ARRIModeDefinition] {
        cameraCodecRules(for: selection).filter {
            resolutionMatches($0, selection: selection)
        }
    }

    private func cameraDefinition(for cameraID: String) -> ARRICameraDefinition? {
        let canonicalID = canonicalCameraID(cameraID)
        return ARRIOfficialCatalogData.cameras.first { $0.displayName == canonicalID }
    }

    private func mediaDefinition(for displayName: String) -> ARRIMediaDefinition? {
        ARRIOfficialCatalogData.media.first { $0.displayName == displayName }
    }

    private func resolutionMatches(_ rule: ARRIModeDefinition, selection: CameraSelection) -> Bool {
        if rule.resolutionID == selection.resolutionID {
            return true
        }

        return ARRIResolutionDisplayCatalog.displayName(
            cameraID: canonicalCameraID(selection.cameraID),
            codecID: selection.codecID,
            officialID: rule.resolutionID
        ) == selection.resolutionID
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

enum ARRILegacyFrameRateCatalog {
    private static let standardRates: [Double] = [
        0.75, 1, 20, 23.976, 24, 25, 29.97, 30, 40, 47.952, 48, 50,
        59.94, 60, 72, 75, 90, 96, 100, 119.88, 120, 150, 200
    ]

    private static let xtremeLowMaximums: [Double] = [
        45, 55, 65, 70, 80, 85, 105, 125, 140, 145, 165, 190, 195, 210
    ]

    private static let xtremeHighSpeedMilestones: [Double] = [
        230, 239.76, 240, 250, 260, 300, 330, 400, 479.52, 480,
        500, 505, 590, 600, 660
    ]

    static func candidates(
        cameraID: String,
        codecID: String,
        resolutionID: String,
        maximumFrameRate: Double
    ) -> [Double] {
        guard cameraID == "ALEXA 35 Xtreme" else {
            return standardRates.filter { $0 <= maximumFrameRate + 0.000_001 }
        }

        var rates = standardRates
        if codecID == "ARRIRAW",
           !resolutionID.hasPrefix("2K S16"),
           !resolutionID.hasPrefix("FHD S16") {
            rates.removeAll { $0 == 47.952 || $0 == 48 }
        }

        if let matchingMaximum = xtremeLowMaximums.first(where: {
            abs($0 - maximumFrameRate) < 0.000_001
        }) {
            rates.append(matchingMaximum)
        }

        if maximumFrameRate >= 230 - 0.000_001 {
            rates.append(contentsOf: xtremeHighSpeedMilestones.filter {
                $0 <= maximumFrameRate + 0.000_001
            })
        }

        return Array(Set(rates))
            .filter { $0 <= maximumFrameRate + 0.000_001 }
            .sorted()
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
