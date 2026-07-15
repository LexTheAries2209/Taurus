import CoreGraphics
import XCTest

@testable import Taurus

final class DITPlanExportTests: XCTestCase {
    func testCSVIncludesDetailAndSummaryRows() throws {
        let project = sampleProject(name: "项目, 一")

        let data = DITPlanExport.csvData(for: project)
        let csv = try XCTUnwrap(String(data: data, encoding: .utf8))

        XCTAssertEqual(Data(data.prefix(3)), Data([0xEF, 0xBB, 0xBF]))
        XCTAssertTrue(csv.contains("\"项目, 一\""), csv)
        XCTAssertTrue(csv.contains("A 机位"), csv)
        XCTAssertTrue(csv.contains("机位备注"), csv)
        XCTAssertTrue(csv.contains("主机位"), csv)
        XCTAssertTrue(csv.contains("汇总"), csv)
        XCTAssertTrue(csv.contains("HDE"), csv)
        XCTAssertTrue(csv.contains("不适用"), csv)
        XCTAssertTrue(csv.contains("单机每日(GB)"), csv)
        XCTAssertTrue(csv.contains("卡次"), csv)
        XCTAssertTrue(csv.contains("每张卡时长(分钟)"), csv)
        XCTAssertTrue(csv.contains("180.00,360.00,1080.00,2376.00,2,1200.00,6.60"), csv)
    }

    func testPDFContainsReadablePages() throws {
        let project = sampleProject()

        let data = try DITPlanExport.pdfData(for: project)
        XCTAssertEqual(Data(data.prefix(4)), Data("%PDF".utf8))
        XCTAssertGreaterThan(data.count, 1_000)

        let provider = CGDataProvider(data: data as CFData)
        let document = try XCTUnwrap(provider.flatMap(CGPDFDocument.init))
        XCTAssertGreaterThan(document.numberOfPages, 0)

        let previewURL = FileManager.default.temporaryDirectory
            .appendingPathComponent("Taurus-P3-report-preview.pdf")
        try data.write(to: previewURL, options: .atomic)
    }

    func testCSVRowsHaveConsistentColumnCounts() throws {
        let data = DITPlanExport.csvData(for: sampleProject())
        let csv = try XCTUnwrap(String(data: data, encoding: .utf8))
        let columnCounts = csv
            .split(separator: "\n")
            .map { $0.split(separator: ",", omittingEmptySubsequences: false).count }

        XCTAssertEqual(Set(columnCounts), [24], csv)
    }

    func testPDFRejectsEmptyOrInvalidProject() {
        XCTAssertThrowsError(try DITPlanExport.pdfData(for: DITProject()))
    }

    private func sampleProject(name: String = "测试项目") -> DITProject {
        let selection = CameraSelection(
            brandID: "[General]",
            cameraID: "Manual Codec",
            codecID: "ProRes 422 HQ",
            resolutionID: "UHD",
            frameRateID: "24.000",
            mediaID: "1TB"
        )
        let item = PlanItem(
            name: "A 机位",
            positionNote: "主机位",
            selection: selection,
            bitrateMbps: 100,
            media: MediaSpec(id: "1TB", usableCapacityBytes: 900_000_000_000),
            readerSpeedMBps: 100,
            cameraCount: 2,
            dailyPowerOnHours: 8,
            recordingRatio: 0.5,
            shootDays: 3,
            backupCopies: 2,
            safetyMargin: 0.1
        )
        return DITProject(
            name: name,
            items: [item],
            transferProfile: TransferProfile(
                readerSpeedMBps: 100,
                targetDiskSpeedMBps: 200,
                offloadWindowHoursPerDay: 3
            )
        )
    }
}
