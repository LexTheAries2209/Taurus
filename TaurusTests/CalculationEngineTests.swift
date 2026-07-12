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

    func testAlexa35ARRIRawOpenGateUsesExplicitModeWithoutXbit() {
        assertMetrics(
            DefaultCalculationEngine().calculate(
                alexa35Selection,
                using: ARRIRecordingCatalog()
            ),
            equalTo: expectedAlexa35Metrics
        )
    }

    func testAlexa35CatalogUsesOfficialFrameRateLimitsForEachDrive() {
        let catalog = ARRIRecordingCatalog()

        XCTAssertEqual(
            catalog.mediaSpec(for: alexa35Selection.mediaID),
            MediaSpec(id: "Compact Drive 1TB", usableCapacityBytes: 937_687_040_000)
        )
        XCTAssertEqual(
            catalog.frameRates(for: alexa35Selection),
            [
                "0.750", "1.000", "20.000", "23.976", "24.000", "25.000",
                "27.000", "29.000", "29.970", "30.000", "35.000"
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
                "27.000", "29.000", "29.970", "30.000", "35.000", "37.000",
                "38.000", "40.000", "41.000", "42.000", "43.000", "45.000",
                "48.000", "50.000", "55.000", "59.940", "60.000", "65.000",
                "70.000", "72.000", "75.000"
            ]
        )
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
