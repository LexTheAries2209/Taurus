import XCTest
@testable import Taurus

final class ScreenshotExportTests: XCTestCase {
    func testDefaultFileNameUsesStableTimestamp() {
        let calendar = Calendar(identifier: .gregorian)
        let date = calendar.date(from: DateComponents(
            timeZone: TimeZone(secondsFromGMT: 0),
            year: 2026,
            month: 7,
            day: 8,
            hour: 19,
            minute: 5,
            second: 6
        ))!

        let fileName = ScreenshotExport.defaultFileName(now: date, timeZone: TimeZone(secondsFromGMT: 0)!)

        XCTAssertEqual(fileName, "Taurus-Screenshot-20260708-190506.png")
    }

    func testEnglishInterfaceCopy() {
        let copy = AppLanguage.english.copy

        XCTAssertEqual(copy.calculatorTitle, "Data Calculator")
        XCTAssertEqual(copy.resetButton, "Reset")
        XCTAssertEqual(copy.noOption, "No Options")
        XCTAssertEqual(copy.outputLabels(includeHDE: true), [
            "Record Time [Min]:",
            "Data Rate [mbps]:",
            "Data Rate [MBps]:",
            "Data per Hour [GB]:",
            "Data per Hour [GB][HDE]:"
        ])
    }

    func testLocalizedUnsupportedOptionMessages() {
        let copy = AppLanguage.english.copy

        XCTAssertEqual(
            copy.localizedOptionTitle("储存卡速度不足以录制该格式"),
            "Media speed is too slow for this format"
        )
        XCTAssertEqual(
            copy.localizedOptionTitle("该储存卡无法在此机型录制ARRIRAW"),
            "This media cannot record ARRIRAW on this camera"
        )
        XCTAssertEqual(
            copy.localizedOptionTitle("此存储卡只能录制ProRes编码"),
            "This media can only record ProRes"
        )
    }
}
