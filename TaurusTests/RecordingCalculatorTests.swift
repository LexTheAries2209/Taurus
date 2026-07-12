import XCTest
@testable import Taurus

final class RecordingCalculatorTests: XCTestCase {
    func testInitialStateIsIncomplete() {
        XCTAssertEqual(
            RecordingCalculator.calculate(CameraData()),
            .incomplete([.brand])
        )
    }

    func testManualCodecReturnsExpectedMetrics() throws {
        let data = CameraData()
        data.BrandName = "[General]"
        data.CameraName = "Manual Codec"
        data.ManualCodecSpeed = "100"
        data.Media = "1TB"

        let metrics = try XCTUnwrap(successMetrics(from: RecordingCalculator.calculate(data)))

        XCTAssertEqual(metrics.bitrateMbps, 100, accuracy: 0.000_001)
        XCTAssertEqual(metrics.bitrateMBps, 12.5, accuracy: 0.000_001)
        XCTAssertEqual(metrics.dataPerHourGB, 43.9453125, accuracy: 0.000_001)
        XCTAssertEqual(metrics.recordMinutes, 1271.1253333333334, accuracy: 0.000_001)
        XCTAssertNil(metrics.hdeDataPerHourGB)
        assertPositiveAndFinite(metrics)
    }

    func testManualCodecRejectsEmptyAndZeroBitrate() {
        for bitrate in ["", "0"] {
            let data = CameraData()
            data.BrandName = "[General]"
            data.CameraName = "Manual Codec"
            data.ManualCodecSpeed = bitrate
            data.Media = "1TB"

            XCTAssertEqual(
                RecordingCalculator.calculate(data),
                .unsupported(.invalidManualBitrate)
            )
        }
    }

    func testManualResolutionRejectsEmptyAndZeroDimensions() {
        for dimensions in [("", "2160"), ("4096", ""), ("0", "2160"), ("4096", "0")] {
            let data = CameraData()
            data.BrandName = "[General]"
            data.CameraName = "Manual Resolution"
            data.Codec = "ProRes 422 HQ"
            data.ResolutionWidth = dimensions.0
            data.ResolutionHeight = dimensions.1
            data.Rate = "24.000"
            data.Media = "1TB"

            XCTAssertEqual(
                RecordingCalculator.calculate(data),
                .unsupported(.invalidManualResolution)
            )
        }
    }

    func testCompleteCombinationWithoutRuleIsUnsupported() {
        let data = CameraData()
        data.BrandName = "ARRI"
        data.CameraName = "ALEXA 35"
        data.Codec = "ARRIRAW"
        data.Resolution = "Unknown Resolution"
        data.Rate = "24.000"
        data.Media = "Compact Drive 1TB"

        XCTAssertEqual(
            RecordingCalculator.calculate(data),
            .unsupported(.noMatchingRule)
        )
    }

    func testModeSpecificRequiredFieldsAreReported() {
        let panasonic = CameraData()
        panasonic.BrandName = "Panasonic"
        panasonic.CameraName = "S1R2"
        panasonic.Codec = "ProRes 422 HQ"
        panasonic.Resolution = "5.8K[5760*3040][10bit 4:2:2][23.976p][17:9]"
        panasonic.Media = "CFExpress TypeB 256GB"
        XCTAssertEqual(RecordingCalculator.calculate(panasonic), .incomplete([.format]))

        let canon = CameraData()
        canon.BrandName = "Canon"
        canon.CameraName = "EOS R5 Mark2"
        canon.Codec = "XF-HEVC S Intra FF"
        canon.Resolution = "4K FF[10bit 4:2:2][23.976p]"
        canon.Media = "CFExpress TypeB 256GB"
        XCTAssertEqual(RecordingCalculator.calculate(canon), .incomplete([.codecLevel]))

        let arri = CameraData()
        arri.BrandName = "ARRI"
        arri.CameraName = "ALEXA 35"
        arri.Codec = "ARRIRAW"
        arri.Resolution = "4.6K S35[4608*3164][OG]"
        arri.Media = "Compact Drive 1TB"
        XCTAssertEqual(RecordingCalculator.calculate(arri), .incomplete([.frameRate]))
    }

    func testNonFiniteCalculationIsUnsupported() {
        let data = CameraData()
        data.BrandName = "[General]"
        data.CameraName = "Manual Resolution"
        data.Codec = "ProRes 422 HQ"
        data.ResolutionWidth = "1e308"
        data.ResolutionHeight = "1e308"
        data.Rate = "24.000"
        data.Media = "1TB"

        XCTAssertEqual(
            RecordingCalculator.calculate(data),
            .unsupported(.nonFiniteResult)
        )
    }

    func testNonFiniteNumberFormattingUsesDash() {
        XCTAssertEqual(formatNumber(.nan), "—")
        XCTAssertEqual(formatNumber(.infinity), "—")
    }

    func testARRIRAWIncludesHDEMetrics() {
        let data = CameraData()
        data.BrandName = "ARRI"
        data.CameraName = "ALEXA 35"
        data.Codec = "ARRIRAW"
        data.Resolution = "4.6K S35[4608*3164][OG]"
        data.Rate = "0.750"
        data.Media = "Compact Drive 1TB"

        assertOfficialCatalogSuccess(
            RecordingCalculator.calculate(data),
            bitrateMbps: 139.318822675241,
            capacityBytes: 937_687_040_000,
            hdeMultiplier: 0.5
        )
    }

    func testAvailableRecordingRatesUsesOfficialAlexa35Catalog() {
        XCTAssertEqual(
            AvailableRecordingRates(cameradata: alexa35ARRIRawData()),
            [
                "0.750", "1.000", "20.000", "23.976", "24.000", "25.000",
                "27.000", "29.000", "29.970", "30.000", "35.000"
            ]
        )
    }

    func testCameraDataCreatesImmutableSelectionSnapshot() {
        let data = CameraData()
        data.BrandName = "Canon"
        data.CameraName = "EOS R5"
        data.Codec = "RAW"
        data.CanonCodecLevel = "Standard"
        data.Format = "Full Frame"
        data.Resolution = "8K FF[8192*4320][12bit RAW][23.976p/24p/25p/29.97p][17:9]"
        data.Rate = "24.000"
        data.Media = "CFExpress TypeB 256GB"
        data.ManualCodecSpeed = "100"
        data.ResolutionWidth = "8192"
        data.ResolutionHeight = "4320"

        XCTAssertEqual(
            CameraSelection(cameradata: data),
            CameraSelection(
                brandID: "Canon",
                cameraID: "EOS R5",
                codecID: "RAW",
                codecLevelID: "Standard",
                formatID: "Full Frame",
                resolutionID: "8K FF[8192*4320][12bit RAW][23.976p/24p/25p/29.97p][17:9]",
                frameRateID: "24.000",
                mediaID: "CFExpress TypeB 256GB",
                manualBitrate: "100",
                manualWidth: "8192",
                manualHeight: "4320"
            )
        )
    }

    func testCameraDataSnapshotNormalizesUnsetOptionalValues() {
        let selection = CameraSelection(cameradata: CameraData())

        XCTAssertNil(selection.codecLevelID)
        XCTAssertNil(selection.formatID)
        XCTAssertNil(selection.manualBitrate)
        XCTAssertNil(selection.manualWidth)
        XCTAssertNil(selection.manualHeight)
    }

    func testCalculatorPrefersMigratedCatalogBeforeLegacyFallback() {
        let data = alexa35ARRIRawData()
        let selection = CameraSelection(cameradata: data)
        let catalog = TestCatalog(
            mode: RecordingMode(
                selection: selection,
                bitrateMbps: 200,
                hdeDataPerHourMultiplier: nil,
                halvesRecordMinutes: false
            ),
            media: MediaSpec(id: selection.mediaID, usableCapacityBytes: 931_000_000_000)
        )

        assertOfficialCatalogSuccess(
            RecordingCalculator.calculate(data, using: [catalog]),
            bitrateMbps: 200,
            capacityBytes: 931_000_000_000,
            hdeMultiplier: nil
        )
    }

    func testCalculatorFallsBackWhenCatalogDoesNotContainMode() {
        let data = CameraData()
        data.BrandName = "SONY"
        data.CameraName = "FX 3"
        data.Codec = "XAVC S 4K"
        data.Resolution = "UHD FF[10bit 4:2:2][23.976p]"
        data.Media = "SD V60 128GB"

        assertSuccess(
            RecordingCalculator.calculate(data, using: [EmptyCatalog()]),
            bitrateMbps: 100,
            capacityGB: 119.168
        )
    }

    func testCaptureDriveProResHalvesRecordMinutes() {
        let data = CameraData()
        data.BrandName = "ARRI"
        data.CameraName = "ALEXA XT"
        data.Codec = "ProRes 422 HQ"
        data.Resolution = "3.2K S35[3168*1782]"
        data.Rate = "0.750"
        data.Media = "XR Capture Drive 512GB"

        assertSuccess(
            RecordingCalculator.calculate(data),
            bitrateMbps: 16.830000000000002,
            capacityGB: 476.672,
            halvesRecordMinutes: true
        )
    }

    func testSonyFeatureCombination() {
        let data = CameraData()
        data.BrandName = "SONY"
        data.CameraName = "FX 3"
        data.Codec = "XAVC S 4K"
        data.Resolution = "UHD FF[10bit 4:2:2][23.976p]"
        data.Media = "SD V60 128GB"

        assertSuccess(RecordingCalculator.calculate(data), bitrateMbps: 100, capacityGB: 119.168)
    }

    func testCanonFeatureCombination() {
        let data = CameraData()
        data.BrandName = "Canon"
        data.CameraName = "EOS R5"
        data.Codec = "RAW"
        data.Resolution = "8K FF[8192*4320][12bit RAW][23.976p/24p/25p/29.97p][17:9]"
        data.Media = "CFExpress TypeB 256GB"

        assertSuccess(RecordingCalculator.calculate(data), bitrateMbps: 2600, capacityGB: 238.336)
    }

    func testPanasonicFeatureCombination() {
        let data = CameraData()
        data.BrandName = "Panasonic"
        data.CameraName = "S1R2"
        data.Codec = "ProRes 422 HQ"
        data.Format = "Full Frame"
        data.Resolution = "5.8K[5760*3040][10bit 4:2:2][23.976p][17:9]"
        data.Media = "CFExpress TypeB 256GB"

        assertSuccess(RecordingCalculator.calculate(data), bitrateMbps: 1500, capacityGB: 238.336)
    }

    func testBlackmagicFeatureCombination() {
        let data = CameraData()
        data.BrandName = "Blackmagicdesign"
        data.CameraName = "Blackmagic Cinema Camera 6K"
        data.Codec = "Blackmagic RAW 3:1"
        data.Resolution = "6K FF[6048*4032][OG]"
        data.Rate = "23.976"
        data.Media = "CFExpress TypeB 128GB"

        assertSuccess(RecordingCalculator.calculate(data), bitrateMbps: 2368, capacityGB: 119.168)
    }

    func testCanonCinemaFeatureCombination() {
        let data = CameraData()
        data.BrandName = "Canon Cinema"
        data.CameraName = "CinemaEOS C70"
        data.Codec = "Cinema RAW Light HQ"
        data.Resolution = "DCI 2K S16[12bit RAW]"
        data.Rate = "23.976"
        data.Media = "SD V30 128GB"

        assertSuccess(RecordingCalculator.calculate(data), bitrateMbps: 205, capacityGB: 119.168)
    }

    func testKinefinityFeatureCombination() {
        let data = CameraData()
        data.BrandName = "Kinefinity"
        data.CameraName = "VISTA"
        data.Codec = "H.265 Max"
        data.Format = "FF"
        data.Resolution = "6K[6016*3984][OG]"
        data.Rate = "23.976"
        data.Media = "Built-in 220GB SSD"

        assertSuccess(
            RecordingCalculator.calculate(data),
            bitrateMbps: 1040.2666666666667,
            capacityGB: 204.82
        )
    }

    func testNikonFeatureCombination() {
        let data = CameraData()
        data.BrandName = "Nikon"
        data.CameraName = "ZR"
        data.Codec = "N-RAW HQ"
        data.Resolution = "6K FX[6048*3402][12bit RAW][59.94p]"
        data.Media = "CFExpress TypeB 128GB"

        assertSuccess(RecordingCalculator.calculate(data), bitrateMbps: 3730, capacityGB: 119.168)
    }

    func testDJIFeatureCombination() {
        let data = CameraData()
        data.BrandName = "DJI"
        data.CameraName = "Pocket 3"
        data.Codec = "H.264"
        data.Resolution = "4K[3840*2160][16:9][Normal]"
        data.Rate = "24.000"
        data.Media = "microSD V30 128GB"

        assertSuccess(RecordingCalculator.calculate(data), bitrateMbps: 130, capacityGB: 119.168)
    }

    func testAppleFeatureCombination() {
        let data = CameraData()
        data.BrandName = "Apple"
        data.CameraName = "iPhone 16 Pro"
        data.Codec = "ProRes 422 HQ"
        data.Resolution = "Open Gate[4032*3024]"
        data.Rate = "23.976"
        data.Media = "Built-in 256GB"

        assertSuccess(RecordingCalculator.calculate(data), bitrateMbps: 1034.528, capacityGB: 238.336)
    }

    func testNewOutputTextUsesLegacyBodyStyle() {
        XCTAssertEqual(DataOutputTypography.metricTextStyle, .body)
        XCTAssertEqual(DataOutputTypography.messageTextStyle, .body)
    }

    private func assertSuccess(
        _ result: CalculationResult,
        bitrateMbps: Double,
        capacityGB: Double,
        includesHDE: Bool = false,
        halvesRecordMinutes: Bool = false,
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        guard case let .success(metrics) = result else {
            XCTFail("Expected success, got \(result)", file: file, line: line)
            return
        }

        let recordDivisor = halvesRecordMinutes ? 2.0 : 1.0
        XCTAssertEqual(metrics.bitrateMbps, bitrateMbps, accuracy: 0.000_001, file: file, line: line)
        XCTAssertEqual(metrics.bitrateMBps, bitrateMbps / 8, accuracy: 0.000_001, file: file, line: line)
        XCTAssertEqual(metrics.dataPerHourGB, bitrateMbps * 450 / 1024, accuracy: 0.000_001, file: file, line: line)
        XCTAssertEqual(
            metrics.recordMinutes,
            capacityGB * 2048 / 15 / bitrateMbps / recordDivisor,
            accuracy: 0.000_001,
            file: file,
            line: line
        )

        if includesHDE {
            guard let hdeDataPerHourGB = metrics.hdeDataPerHourGB else {
                XCTFail("Expected HDE metrics", file: file, line: line)
                return
            }
            XCTAssertEqual(hdeDataPerHourGB, bitrateMbps * 270 / 1024, accuracy: 0.000_001, file: file, line: line)
        } else {
            XCTAssertNil(metrics.hdeDataPerHourGB, file: file, line: line)
        }

        assertPositiveAndFinite(metrics, file: file, line: line)
    }

    private func assertOfficialCatalogSuccess(
        _ result: CalculationResult,
        bitrateMbps: Double,
        capacityBytes: Double,
        hdeMultiplier: Double?,
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        guard case let .success(metrics) = result else {
            XCTFail("Expected success, got \(result)", file: file, line: line)
            return
        }

        let bitrateMBps = bitrateMbps / 8
        let dataPerHourGB = bitrateMBps * 3600 / 1000
        XCTAssertEqual(metrics.bitrateMbps, bitrateMbps, accuracy: 0.000_001, file: file, line: line)
        XCTAssertEqual(metrics.bitrateMBps, bitrateMBps, accuracy: 0.000_001, file: file, line: line)
        XCTAssertEqual(metrics.dataPerHourGB, dataPerHourGB, accuracy: 0.000_001, file: file, line: line)
        XCTAssertEqual(
            metrics.recordMinutes,
            capacityBytes / (bitrateMBps * 1_000_000) / 60,
            accuracy: 0.000_001,
            file: file,
            line: line
        )

        if let hdeMultiplier {
            guard let hdeDataPerHourGB = metrics.hdeDataPerHourGB else {
                XCTFail("Expected HDE metrics", file: file, line: line)
                return
            }
            XCTAssertEqual(
                hdeDataPerHourGB,
                dataPerHourGB * hdeMultiplier,
                accuracy: 0.000_001,
                file: file,
                line: line
            )
        } else {
            XCTAssertNil(metrics.hdeDataPerHourGB, file: file, line: line)
        }

        assertPositiveAndFinite(metrics, file: file, line: line)
    }

    private func successMetrics(from result: CalculationResult) -> RecordingMetrics? {
        guard case let .success(metrics) = result else { return nil }
        return metrics
    }

    private func alexa35ARRIRawData() -> CameraData {
        let data = CameraData()
        data.BrandName = "ARRI"
        data.CameraName = "ALEXA 35"
        data.Codec = "ARRIRAW"
        data.Resolution = "4.6K S35[4608*3164][OG]"
        data.Rate = "0.750"
        data.Media = "Compact Drive 1TB"
        return data
    }

    private struct TestCatalog: CameraCatalog {
        let mode: RecordingMode
        let media: MediaSpec

        func recordingMode(for selection: CameraSelection) -> RecordingMode? {
            mode.selection == selection ? mode : nil
        }

        func mediaSpec(for id: String) -> MediaSpec? {
            media.id == id ? media : nil
        }
    }

    private struct EmptyCatalog: CameraCatalog {
        func recordingMode(for selection: CameraSelection) -> RecordingMode? {
            nil
        }

        func mediaSpec(for id: String) -> MediaSpec? {
            nil
        }
    }

    private func assertPositiveAndFinite(
        _ metrics: RecordingMetrics,
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        var values = [
            metrics.recordMinutes,
            metrics.bitrateMbps,
            metrics.bitrateMBps,
            metrics.dataPerHourGB
        ]
        if let hdeDataPerHourGB = metrics.hdeDataPerHourGB {
            values.append(hdeDataPerHourGB)
        }

        for value in values {
            XCTAssertTrue(value.isFinite, "Expected finite value, got \(value)", file: file, line: line)
            XCTAssertGreaterThan(value, 0, file: file, line: line)
        }
    }
}
