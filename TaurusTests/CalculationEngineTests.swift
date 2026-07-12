import XCTest
@testable import Taurus

final class CalculationEngineTests: XCTestCase {
    private let alexa35Selection = CameraSelection(
        brandID: "ARRI",
        cameraID: "ALEXA 35",
        codecID: "ARRIRAW",
        codecLevelID: nil,
        formatID: nil,
        resolutionID: "4.6K S35[4608*3164][OG]",
        frameRateID: "0.750",
        mediaID: "Compact Drive 1TB"
    )

    private let alexa35Mode = RecordingMode(
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
        bitrateMbps: 139.318822675241,
        hdeDataPerHourMultiplier: 0.5,
        halvesRecordMinutes: false
    )

    private let expectedAlexa35Metrics = RecordingMetrics(
        recordMinutes: 897.4016307768114,
        bitrateMbps: 139.318822675241,
        bitrateMBps: 17.414852834405124,
        dataPerHourGB: 62.69347020385845,
        hdeDataPerHourGB: 31.346735101929227
    )

    func testSelectionAndModeAreEquatableValues() {
        let selection = CameraSelection(
            brandID: "ARRI",
            cameraID: "ALEXA 35",
            codecID: "ARRIRAW",
            codecLevelID: nil,
            formatID: nil,
            resolutionID: "4.6K S35[4608*3164][OG]",
            frameRateID: "0.750",
            mediaID: "Compact Drive 1TB"
        )
        let mode = RecordingMode(
            selection: selection,
            bitrateMbps: 139.318822675241,
            hdeDataPerHourMultiplier: 0.5,
            halvesRecordMinutes: false
        )

        XCTAssertEqual(mode.selection, selection)
        XCTAssertEqual(mode.bitrateMbps, 139.318822675241)
    }

    func testEngineCalculatesMetricsFromCatalogMode() {
        let catalog = InMemoryCatalog(
            modes: [alexa35Mode],
            media: [MediaSpec(id: "Compact Drive 1TB", usableCapacityBytes: 937_687_040_000)]
        )

        assertMetrics(
            DefaultCalculationEngine().calculate(alexa35Selection, using: catalog),
            equalTo: expectedAlexa35Metrics
        )
    }

    func testEngineReportsUnsupportedWhenCatalogHasNoMode() {
        XCTAssertEqual(
            DefaultCalculationEngine().calculate(alexa35Selection, using: InMemoryCatalog()),
            .unsupported(.noMatchingRule)
        )
    }

    func testEngineReportsUnsupportedWhenCatalogHasNoMedia() {
        XCTAssertEqual(
            DefaultCalculationEngine().calculate(
                alexa35Selection,
                using: InMemoryCatalog(modes: [alexa35Mode])
            ),
            .unsupported(.noMatchingRule)
        )
    }

    func testAlexa35ARRIRawOpenGateUsesExplicitMode() {
        assertMetrics(
            DefaultCalculationEngine().calculate(
                alexa35Selection,
                using: ARRIRecordingCatalog()
            ),
            equalTo: expectedAlexa35Metrics
        )
    }

    func testAlexa35CatalogUsesLegacyFrameRateChoicesWithinOfficialDriveLimits() {
        let catalog = ARRIRecordingCatalog()

        XCTAssertEqual(
            catalog.mediaSpec(for: alexa35Selection.mediaID),
            MediaSpec(id: "Compact Drive 1TB", usableCapacityBytes: 937_687_040_000)
        )
        XCTAssertEqual(
            catalog.frameRates(for: alexa35Selection),
            [
                "0.750", "1.000", "20.000", "23.976", "24.000", "25.000",
                "29.970", "30.000"
            ]
        )

        let twoTerabyteSelection = CameraSelection(
            brandID: "ARRI",
            cameraID: "ALEXA 35",
            codecID: "ARRIRAW",
            codecLevelID: nil,
            formatID: nil,
            resolutionID: "4.6K S35[4608*3164][OG]",
            frameRateID: "0.750",
            mediaID: "Compact Drive 2TB"
        )

        XCTAssertEqual(
            catalog.mediaSpec(for: twoTerabyteSelection.mediaID),
            MediaSpec(id: "Compact Drive 2TB", usableCapacityBytes: 1_875_369_984_000)
        )
        XCTAssertEqual(
            catalog.frameRates(for: twoTerabyteSelection),
            [
                "0.750", "1.000", "20.000", "23.976", "24.000", "25.000",
                "29.970", "30.000", "40.000", "47.952", "48.000", "50.000",
                "59.940", "60.000", "72.000", "75.000"
            ]
        )
    }

    func testAlexa35XtremeUsesLegacyRatePaletteInsteadOfEveryOfficialInteger() {
        let selection = CameraSelection(
            brandID: "ARRI",
            cameraID: "ALEXA 35 Xtreme",
            codecID: "ARRIRAW",
            codecLevelID: nil,
            formatID: nil,
            resolutionID: "4.6K S35[4608*2592]",
            frameRateID: CameraSelectionStore.frameRatePlaceholder,
            mediaID: "Compact Drive 1TB"
        )

        XCTAssertEqual(
            ARRIRecordingCatalog().frameRates(for: selection),
            [
                "0.750", "1.000", "20.000", "23.976", "24.000", "25.000",
                "29.970", "30.000", "40.000", "45.000"
            ]
        )
    }

    func testEveryOfficialARRIModelExposesResolutionsBeforeSelection() {
        let catalog = ARRIRecordingCatalog()

        for cameraID in catalog.cameraOptions() {
            for codecID in catalog.codecOptions(for: cameraID) {
                let selection = CameraSelection(
                    brandID: "ARRI",
                    cameraID: cameraID,
                    codecID: codecID,
                    codecLevelID: nil,
                    formatID: nil,
                    resolutionID: CameraSelectionStore.resolutionPlaceholder,
                    frameRateID: CameraSelectionStore.frameRatePlaceholder,
                    mediaID: CameraSelectionStore.mediaPlaceholder
                )

                XCTAssertFalse(
                    catalog.resolutionOptions(for: selection).isEmpty,
                    "\(cameraID) / \(codecID) has no resolution options"
                )
            }
        }
    }

    func testARRICameraAndCodecOptionsPreserveSupportedLegacySurface() {
        let catalog = ARRIRecordingCatalog()

        XCTAssertEqual(
            catalog.cameraOptions(),
            [
                "ALEXA 265", "ALEXA 35 Live Xtreme", "ALEXA 35 Xtreme", "ALEXA 35",
                "ALEXA Mini LF", "ALEXA SXT", "ALEXA LF", "ALEXA Mini", "ALEXA 65",
                "AMIRA", "ALEXA XT", "ALEXA Classic"
            ]
        )
        XCTAssertFalse(catalog.codecOptions(for: "AMIRA").contains("MPEG-2 HD 422"))
        XCTAssertEqual(
            catalog.codecOptions(for: "ALEXA 35 Live Xtreme"),
            catalog.codecOptions(for: "ALEXA 35 Xtreme")
        )
    }

    func testARRIResolutionOptionsUseLegacyDisplayFormat() {
        let catalog = ARRIRecordingCatalog()

        for cameraID in catalog.cameraOptions() {
            for codecID in catalog.codecOptions(for: cameraID) {
                let selection = CameraSelection(
                    brandID: "ARRI",
                    cameraID: cameraID,
                    codecID: codecID,
                    codecLevelID: nil,
                    formatID: nil,
                    resolutionID: CameraSelectionStore.resolutionPlaceholder,
                    frameRateID: CameraSelectionStore.frameRatePlaceholder,
                    mediaID: CameraSelectionStore.mediaPlaceholder
                )

                let resolutions = catalog.resolutionOptions(for: selection)
                XCTAssertEqual(Set(resolutions).count, resolutions.count)

                for resolution in resolutions {
                    XCTAssertFalse(resolution.contains(" x "), resolution)
                    XCTAssertFalse(resolution.contains("—"), resolution)
                    XCTAssertFalse(resolution.contains("("), resolution)
                }
            }
        }
    }

    func testApprovedNewARRIResolutionDisplayNames() {
        let catalog = ARRIRecordingCatalog()

        XCTAssertTrue(
            resolutions(camera: "ALEXA XT", codec: "ProRes 422 HQ", catalog: catalog)
                .contains("3.2K S35[3164*1778]")
        )
        XCTAssertTrue(
            resolutions(camera: "ALEXA 265", codec: "ARRIRAW", catalog: catalog)
                .contains("5.1K 65mm[5120*3100]")
        )

        let miniRaw = resolutions(camera: "ALEXA Mini", codec: "ARRIRAW", catalog: catalog)
        XCTAssertTrue(miniRaw.contains("1.9K S35[1920*2160][8:9]"))
        XCTAssertTrue(miniRaw.contains("2.5K S35[2560*2145][6:5]"))

        let anamorphicName = "3.8K S35[3840*1608][From 3328*2790][6:5 ANA]"
        XCTAssertTrue(
            resolutions(camera: "ALEXA 35", codec: "ProRes 4444 XQ", catalog: catalog)
                .contains(anamorphicName)
        )
        XCTAssertTrue(
            resolutions(camera: "ALEXA 35 Xtreme", codec: "ProRes 4444 XQ", catalog: catalog)
                .contains(anamorphicName)
        )
    }

    func testUserSelectedARRIResolutionNamesMatchOfficialRules() {
        let catalog = ARRIRecordingCatalog()
        let engine = DefaultCalculationEngine()

        XCTAssertEqual(ARRIOfficialCatalogData.cameras.count, 11)
        XCTAssertEqual(ARRIOfficialCatalogData.rules.count, 317)

        for rule in ARRIOfficialCatalogData.rules {
            guard let displayName = ARRIResolutionDisplayCatalog.displayName(
                cameraID: rule.cameraID,
                codecID: rule.codecID,
                officialID: rule.resolutionID
            ) else {
                XCTAssertEqual(rule.cameraID, "AMIRA")
                XCTAssertEqual(rule.codecID, "MPEG-2 HD 422")
                XCTAssertEqual(rule.resolutionID, "HD (1920 x 1080)")
                continue
            }

            guard let mediaID = rule.mediaLimits.keys.sorted().first,
            let media = ARRIOfficialCatalogData.media.first(where: {
                $0.sourceID == mediaID
            }) else {
                XCTFail("Invalid official rule: \(rule.cameraID) / \(rule.codecID) / \(rule.resolutionID)")
                continue
            }

            let selectionWithoutRate = CameraSelection(
                brandID: "ARRI",
                cameraID: rule.cameraID,
                codecID: rule.codecID,
                codecLevelID: nil,
                formatID: nil,
                resolutionID: displayName,
                frameRateID: CameraSelectionStore.frameRatePlaceholder,
                mediaID: media.displayName
            )

            guard let frameRateID = catalog.frameRates(for: selectionWithoutRate).first else {
                XCTFail("No legacy frame rate for official rule: \(selectionWithoutRate)")
                continue
            }

            let selection = CameraSelection(
                brandID: selectionWithoutRate.brandID,
                cameraID: selectionWithoutRate.cameraID,
                codecID: selectionWithoutRate.codecID,
                codecLevelID: selectionWithoutRate.codecLevelID,
                formatID: selectionWithoutRate.formatID,
                resolutionID: selectionWithoutRate.resolutionID,
                frameRateID: frameRateID,
                mediaID: selectionWithoutRate.mediaID
            )

            guard case let .success(metrics) = engine.calculate(selection, using: catalog) else {
                XCTFail("Official rule is not calculable: \(selection)")
                continue
            }

            XCTAssertGreaterThan(metrics.recordMinutes, 0)
            XCTAssertGreaterThan(metrics.bitrateMbps, 0)
            XCTAssertTrue(metrics.recordMinutes.isFinite)
            XCTAssertTrue(metrics.bitrateMbps.isFinite)
        }
    }

    private struct InMemoryCatalog: CameraCatalog {
        var modes: [RecordingMode] = []
        var media: [MediaSpec] = []

        func recordingMode(for selection: CameraSelection) -> RecordingMode? {
            modes.first { $0.selection == selection }
        }

        func mediaSpec(for id: String) -> MediaSpec? {
            media.first { $0.id == id }
        }
    }

    private func resolutions(
        camera: String,
        codec: String,
        catalog: ARRIRecordingCatalog
    ) -> [String] {
        catalog.resolutionOptions(
            for: CameraSelection(
                brandID: "ARRI",
                cameraID: camera,
                codecID: codec,
                codecLevelID: nil,
                formatID: nil,
                resolutionID: CameraSelectionStore.resolutionPlaceholder,
                frameRateID: CameraSelectionStore.frameRatePlaceholder,
                mediaID: CameraSelectionStore.mediaPlaceholder
            )
        )
    }

    private func assertMetrics(
        _ result: CalculationResult,
        equalTo expected: RecordingMetrics,
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        guard case let .success(metrics) = result else {
            XCTFail("Expected success, got \(result)", file: file, line: line)
            return
        }

        XCTAssertEqual(metrics.recordMinutes, expected.recordMinutes, accuracy: 0.000_001, file: file, line: line)
        XCTAssertEqual(metrics.bitrateMbps, expected.bitrateMbps, accuracy: 0.000_001, file: file, line: line)
        XCTAssertEqual(metrics.bitrateMBps, expected.bitrateMBps, accuracy: 0.000_001, file: file, line: line)
        XCTAssertEqual(metrics.dataPerHourGB, expected.dataPerHourGB, accuracy: 0.000_001, file: file, line: line)

        switch (metrics.hdeDataPerHourGB, expected.hdeDataPerHourGB) {
        case let (.some(actual), .some(expected)):
            XCTAssertEqual(actual, expected, accuracy: 0.000_001, file: file, line: line)
        case (.none, .none):
            break
        default:
            XCTFail("Expected HDE presence to match", file: file, line: line)
        }
    }
}
