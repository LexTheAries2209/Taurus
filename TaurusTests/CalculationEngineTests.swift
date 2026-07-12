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
        bitrateMbps: 141.09375,
        includesHDE: true,
        halvesRecordMinutes: false
    )

    private let expectedAlexa35Metrics = RecordingMetrics(
        recordMinutes: 900.9083204134367,
        bitrateMbps: 141.09375,
        bitrateMBps: 17.63671875,
        dataPerHourGB: 62.00408935546875,
        hdeDataPerHourGB: 37.20245361328125
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
            bitrateMbps: 141.09375,
            includesHDE: true,
            halvesRecordMinutes: false
        )

        XCTAssertEqual(mode.selection, selection)
        XCTAssertEqual(mode.bitrateMbps, 141.09375)
    }

    func testEngineCalculatesMetricsFromCatalogMode() {
        let catalog = InMemoryCatalog(
            modes: [alexa35Mode],
            media: [MediaSpec(id: "Compact Drive 1TB", usableCapacityGB: 931)]
        )

        XCTAssertEqual(
            DefaultCalculationEngine().calculate(alexa35Selection, using: catalog),
            .success(expectedAlexa35Metrics)
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
        XCTAssertEqual(
            DefaultCalculationEngine().calculate(
                alexa35Selection,
                using: ARRIRecordingCatalog()
            ),
            .success(expectedAlexa35Metrics)
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
}
