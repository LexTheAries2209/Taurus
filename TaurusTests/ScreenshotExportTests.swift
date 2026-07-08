import Foundation

@main
struct ScreenshotExportTests {
    static func main() {
        testDefaultFileNameUsesStableTimestamp()
        testEnglishInterfaceCopy()
    }

    private static func testDefaultFileNameUsesStableTimestamp() {
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

        precondition(fileName == "Taurus-Screenshot-20260708-190506.png", "Unexpected screenshot file name: \(fileName)")
    }

    private static func testEnglishInterfaceCopy() {
        let copy = AppLanguage.english.copy

        precondition(copy.calculatorTitle == "Data Calculator")
        precondition(copy.resetButton == "Reset")
        precondition(copy.noOption == "No Options")
        precondition(copy.outputLabels(includeHDE: true) == [
            "Record Time [Min]:",
            "Data Rate [mbps]:",
            "Data Rate [MBps]:",
            "Data per Hour [GB]:",
            "Data per Hour [GB][HDE]:"
        ])
        precondition(copy.localizedOptionTitle("储存卡速度不足以录制该格式") == "Media speed is too slow for this format")
    }
}
