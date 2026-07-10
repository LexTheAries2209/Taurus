import XCTest
@testable import Taurus

final class CameraDataSelectionTests: XCTestCase {
    func testChangingBrandClearsCameraAndAllDependentSelections() {
        let data = CameraData()
        data.BrandName = "ARRI"
        data.CameraName = "ALEXA 35"
        data.Codec = "ARRIRAW"
        data.CanonCodecLevel = "High"
        data.Format = "S35"
        data.Resolution = "4.6K S35[4608*3164][OG]"
        data.Rate = "24"
        data.Media = "Codex Compact Drive 2TB"
        data.ManualCodecSpeed = "100"
        data.ResolutionWidth = "4096"
        data.ResolutionHeight = "2160"

        data.selectBrand("Canon")

        XCTAssertEqual(data.BrandName, "Canon")
        XCTAssertEqual(data.CameraName, "请选择机型")
        XCTAssertEqual(data.Codec, "请选择编码")
        XCTAssertEqual(data.CanonCodecLevel, "请选择级别")
        XCTAssertEqual(data.Format, "请选择幅面")
        XCTAssertEqual(data.Resolution, "请选择分辨率")
        XCTAssertEqual(data.Rate, "请选择帧率")
        XCTAssertEqual(data.Media, "请选择储存卡")
        XCTAssertEqual(data.ManualCodecSpeed, "")
        XCTAssertEqual(data.ResolutionWidth, "")
        XCTAssertEqual(data.ResolutionHeight, "")
    }

    func testChangingCodecClearsOldResolutionAndDownstreamSelections() {
        let data = CameraData()
        data.BrandName = "ARRI"
        data.CameraName = "ALEXA 35"
        data.Codec = "ARRIRAW"
        data.CanonCodecLevel = "High"
        data.Format = "S35"
        data.Resolution = "4.6K S35[4608*3164][OG]"
        data.Rate = "24"
        data.Media = "Codex Compact Drive 2TB"

        data.selectCodec("ProRes 4444 XQ")

        XCTAssertEqual(data.Codec, "ProRes 4444 XQ")
        XCTAssertEqual(data.CanonCodecLevel, "请选择级别")
        XCTAssertEqual(data.Format, "请选择幅面")
        XCTAssertEqual(data.Resolution, "请选择分辨率")
        XCTAssertEqual(data.Rate, "请选择帧率")
        XCTAssertEqual(data.Media, "请选择储存卡")
    }

    func testChangingResolutionClearsOldRateAndMedia() {
        let data = CameraData()
        data.Resolution = "UHD S35"
        data.Rate = "24"
        data.Media = "Codex Compact Drive 2TB"

        data.selectResolution("4K S35")

        XCTAssertEqual(data.Resolution, "4K S35")
        XCTAssertEqual(data.Rate, "请选择帧率")
        XCTAssertEqual(data.Media, "请选择储存卡")
    }

    func testChangingARRIMediaClearsOldRate() {
        let data = CameraData()
        data.BrandName = "ARRI"
        data.Rate = "24"
        data.Media = "Codex Compact Drive 1TB"

        data.selectMedia("Codex Compact Drive 2TB")

        XCTAssertEqual(data.Media, "Codex Compact Drive 2TB")
        XCTAssertEqual(data.Rate, "请选择帧率")
    }

    func testChangingDJIMediaPreservesSelectedRate() {
        let data = CameraData()
        data.BrandName = "DJI"
        data.Rate = "24"
        data.Media = "CFexpress Type B 1TB"

        data.selectMedia("CFexpress Type B 2TB")

        XCTAssertEqual(data.Media, "CFexpress Type B 2TB")
        XCTAssertEqual(data.Rate, "24")
    }

    func testMediaDependentBrandCanCompleteMediaThenRateSelection() {
        let data = CameraData()

        data.selectBrand("ARRI")
        data.selectCamera("ALEXA 35")
        data.selectCodec("ARRIRAW")
        data.selectResolution("4.6K S35[4608*3164][OG]")
        data.selectMedia("Compact Drive 1TB")
        data.selectRate("24.000")

        XCTAssertEqual(data.Media, "Compact Drive 1TB")
        XCTAssertEqual(data.Rate, "24.000")
    }

    func testChangingRateStillClearsMediaWhenRateDoesNotDependOnMedia() {
        let data = CameraData()
        data.BrandName = "DJI"
        data.Rate = "23.976"
        data.Media = "DJI PROSSD 1TB"

        data.selectRate("24.000")

        XCTAssertEqual(data.Rate, "24.000")
        XCTAssertEqual(data.Media, "请选择储存卡")
    }
}
