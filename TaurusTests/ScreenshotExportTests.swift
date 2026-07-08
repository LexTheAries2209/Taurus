import Foundation

@main
struct ScreenshotExportTests {
    static func main() {
        testDefaultFileNameUsesStableTimestamp()
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
}
