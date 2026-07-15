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

    func testDMTPlannerCopyChangesWithLanguage() {
        let chinese = AppLanguage.chinese.copy.dmtPlanner
        let english = AppLanguage.english.copy.dmtPlanner

        XCTAssertEqual(AppLanguage.chinese.copy.plannerTitle, "DMT 项目规划")
        XCTAssertEqual(AppLanguage.english.copy.plannerTitle, "DMT Project Planner")
        XCTAssertEqual(chinese.text("机位检查器"), "机位检查器")
        XCTAssertEqual(english.text("机位检查器"), "Camera Inspector")
        XCTAssertEqual(english.itemCount(2), "2 cameras")
        XCTAssertEqual(
            english.hdeDataDescription(percent: "60.00"),
            "Project data is approximately 60.00% of ARRIRAW"
        )
    }

    func testCalculatorWindowOpensAboveItsMinimumHeight() {
        XCTAssertEqual(
            WorkspaceWindowMetrics.calculatorMinimumSize,
            CGSize(width: 930, height: 540)
        )
        XCTAssertEqual(
            WorkspaceWindowMetrics.calculatorPreferredSize,
            CGSize(width: 930, height: 620)
        )
        XCTAssertGreaterThan(
            WorkspaceWindowMetrics.calculatorPreferredSize.height,
            WorkspaceWindowMetrics.calculatorMinimumSize.height
        )
    }

    func testWorkspaceWindowResizePreservesCenterAcrossRepeatedSwitches() {
        let initialCenter = CGPoint(x: 860, y: 520)
        let calculatorFrameSize = CGSize(width: 930, height: 648)
        let plannerFrameSize = CGSize(width: 1_320, height: 808)
        var frame = WindowFrameGeometry.centeredFrame(
            size: calculatorFrameSize,
            around: initialCenter
        )

        for targetSize in [plannerFrameSize, calculatorFrameSize, plannerFrameSize, calculatorFrameSize] {
            let centerBeforeResize = CGPoint(x: frame.midX, y: frame.midY)
            frame = WindowFrameGeometry.centeredFrame(
                size: targetSize,
                around: centerBeforeResize
            )

            XCTAssertEqual(frame.midX, initialCenter.x, accuracy: 0.001)
            XCTAssertEqual(frame.midY, initialCenter.y, accuracy: 0.001)
        }
    }

    func testVersionCommentsAreUpdatedInChineseAndEnglish() {
        XCTAssertEqual(
            AppLanguage.chinese.copy.comments(for: "", cameraName: "").first,
            "1. 当前版本为[V2.0.1]。摄影机规格参数数据截止至2026.07.06。计算结果仅供参考，实际数据量可能与计算不同。"
        )
        XCTAssertEqual(
            AppLanguage.english.copy.comments(for: "", cameraName: "").first,
            "1. Current version: V2.0.1. Camera specifications are current through 2026.07.06. Calculation results are estimates and may differ from actual data volumes."
        )
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
