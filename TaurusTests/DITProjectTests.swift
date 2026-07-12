import XCTest
@testable import Taurus

final class DITProjectTests: XCTestCase {
    func testEmptyProjectDoesNotClaimBackupCanComplete() {
        XCTAssertFalse(DITProjectCalculator.summarize(DITProject()).canCompleteDailyDoubleBackup)
    }

    func testSummaryAggregatesCamerasCopiesMarginAndMedia() {
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
            selection: selection,
            bitrateMbps: 100,
            media: MediaSpec(id: "1TB", usableCapacityBytes: 900_000_000_000),
            cameraCount: 2,
            dailyPowerOnHours: 8,
            recordingRatio: 0.5,
            shootDays: 3,
            backupCopies: 2,
            safetyMargin: 0.1
        )
        let project = DITProject(
            name: "测试项目",
            items: [item],
            transferProfile: TransferProfile(
                readerSpeedMBps: 100,
                targetDiskSpeedMBps: 200,
                offloadWindowHoursPerDay: 3
            )
        )

        let summary = DITProjectCalculator.summarize(project)

        XCTAssertTrue(summary.issues.isEmpty)
        XCTAssertEqual(summary.totalRawDataBytes, 1_080_000_000_000, accuracy: 0.1)
        XCTAssertEqual(summary.totalStorageBytes, 2_376_000_000_000, accuracy: 0.1)
        XCTAssertEqual(summary.dailyRawDataBytes, 360_000_000_000, accuracy: 0.1)
        XCTAssertEqual(summary.dailyStorageBytes, 792_000_000_000, accuracy: 0.1)
        XCTAssertEqual(summary.mediaCounts["1TB"], 2)
        XCTAssertEqual(summary.totalTransferSeconds, 23_760, accuracy: 0.001)
        XCTAssertTrue(summary.canCompleteDailyDoubleBackup)

        let itemSummary = try? XCTUnwrap(summary.itemSummaries.first)
        XCTAssertEqual(itemSummary?.rawDataPerCameraPerDayBytes ?? 0, 180_000_000_000, accuracy: 0.1)
        XCTAssertEqual(itemSummary?.rawDataPerCameraProjectBytes ?? 0, 540_000_000_000, accuracy: 0.1)
        XCTAssertEqual(itemSummary?.recordMinutesPerMedia ?? 0, 1_200, accuracy: 0.001)
    }

    func testInvalidItemDoesNotProduceNumbers() {
        let selection = CameraSelection(
            brandID: "[General]",
            cameraID: "Manual Codec",
            codecID: "ProRes",
            resolutionID: "UHD",
            frameRateID: "24.000",
            mediaID: "bad"
        )
        let item = PlanItem(
            selection: selection,
            bitrateMbps: 0,
            media: MediaSpec(id: "bad", usableCapacityBytes: 0)
        )

        let summary = DITProjectCalculator.summarize(DITProject(items: [item]))

        XCTAssertEqual(summary.totalRawDataBytes, 0)
        XCTAssertEqual(summary.totalStorageBytes, 0)
        XCTAssertEqual(summary.mediaCounts, [:])
        XCTAssertEqual(summary.itemSummaries, [])
        XCTAssertEqual(summary.issues.count, 1)
        XCTAssertFalse(summary.canCompleteDailyDoubleBackup)
    }

    func testFiniteInputsThatOverflowAreRejected() {
        let selection = CameraSelection(
            brandID: "[General]",
            cameraID: "Manual Codec",
            codecID: "ProRes",
            resolutionID: "UHD",
            frameRateID: "24.000",
            mediaID: "1TB"
        )
        let item = PlanItem(
            selection: selection,
            bitrateMbps: Double.greatestFiniteMagnitude,
            media: MediaSpec(id: "1TB", usableCapacityBytes: 1)
        )

        let summary = DITProjectCalculator.summarize(DITProject(items: [item]))

        XCTAssertEqual(summary.totalRawDataBytes, 0)
        XCTAssertEqual(summary.itemSummaries, [])
        XCTAssertEqual(summary.issues.count, 1)
    }

    func testStoreRoundTripsAndDuplicatesProject() throws {
        let directory = FileManager.default.temporaryDirectory
            .appendingPathComponent("TaurusDIT-\(UUID().uuidString)", isDirectory: true)
        let url = directory.appendingPathComponent("projects.json")
        defer { try? FileManager.default.removeItem(at: directory) }

        let selection = CameraSelection(
            brandID: "ARRI",
            cameraID: "ALEXA 35",
            codecID: "ARRIRAW",
            resolutionID: "4K",
            frameRateID: "24.000",
            mediaID: "Compact Drive 1TB"
        )
        let project = DITProject(
            name: "Round trip",
            items: [PlanItem(
                selection: selection,
                bitrateMbps: 139.318822675241,
                media: MediaSpec(id: "Compact Drive 1TB", usableCapacityBytes: 937_687_040_000)
            )]
        )
        let store = DITProjectStore(fileURL: url)
        _ = try store.add(project)

        let reloaded = DITProjectStore(fileURL: url)
        XCTAssertEqual(reloaded.projects, [project])

        let copy = try reloaded.duplicate(project)
        XCTAssertEqual(reloaded.projects.count, 2)
        XCTAssertNotEqual(copy.id, project.id)
        XCTAssertEqual(copy.items, project.items)
        XCTAssertTrue(copy.name.contains("副本"))
    }

    func testExportAndImportProject() throws {
        let directory = FileManager.default.temporaryDirectory
            .appendingPathComponent("TaurusDIT-\(UUID().uuidString)", isDirectory: true)
        let storeURL = directory.appendingPathComponent("projects.json")
        let exportURL = directory.appendingPathComponent("export.json")
        defer { try? FileManager.default.removeItem(at: directory) }

        let project = DITProject(name: "导出")
        let store = DITProjectStore(fileURL: storeURL)
        try store.exportProject(project, to: exportURL)
        let imported = try store.importProject(from: exportURL)

        XCTAssertEqual(imported, project)
        XCTAssertEqual(store.projects, [project])
    }

    func testImportingExistingProjectCreatesUniqueCopy() throws {
        let directory = FileManager.default.temporaryDirectory
            .appendingPathComponent("TaurusDIT-\(UUID().uuidString)", isDirectory: true)
        let storeURL = directory.appendingPathComponent("projects.json")
        let exportURL = directory.appendingPathComponent("export.json")
        defer { try? FileManager.default.removeItem(at: directory) }

        let project = DITProject(name: "重复导入")
        let store = DITProjectStore(fileURL: storeURL)
        _ = try store.add(project)
        try store.exportProject(project, to: exportURL)

        let imported = try store.importProject(from: exportURL)

        XCTAssertNotEqual(imported.id, project.id)
        XCTAssertEqual(store.projects.count, 2)
        XCTAssertTrue(imported.name.contains("副本"))
    }

    func testDailyBackupFailsWhenTransferWindowIsTooShort() {
        let selection = CameraSelection(
            brandID: "[General]",
            cameraID: "Manual Codec",
            codecID: "ProRes",
            resolutionID: "UHD",
            frameRateID: "24.000",
            mediaID: "1TB"
        )
        let item = PlanItem(
            selection: selection,
            bitrateMbps: 1_000,
            media: MediaSpec(id: "1TB", usableCapacityBytes: 900_000_000_000),
            dailyPowerOnHours: 12,
            recordingRatio: 1
        )
        let project = DITProject(
            items: [item],
            transferProfile: TransferProfile(
                readerSpeedMBps: 100,
                targetDiskSpeedMBps: 100,
                offloadWindowHoursPerDay: 1
            )
        )

        XCTAssertFalse(DITProjectCalculator.summarize(project).canCompleteDailyDoubleBackup)
    }
}
