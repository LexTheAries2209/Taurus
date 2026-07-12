import XCTest

@testable import Taurus

final class DITProjectTests: XCTestCase {
    func testNumericInputSanitizerRejectsLettersSignsAndExtraDecimals() {
        XCTAssertEqual(
            NumericInputSanitizer.sanitize("-12a.3.4", allowsDecimal: true),
            "12.34"
        )
        XCTAssertEqual(
            NumericInputSanitizer.sanitize("-12abc", allowsDecimal: false),
            "12"
        )
        XCTAssertEqual(
            NumericInputSanitizer.sanitize("1.5", allowsDecimal: false),
            "1"
        )
        XCTAssertEqual(
            NumericInputSanitizer.sanitize(".5", allowsDecimal: true),
            "0.5"
        )
    }

    func testPlanItemBuilderRequiresACompleteRecordingMode() {
        XCTAssertNil(DITPlanItemBuilder.make(from: CameraSelectionStore(), name: "A 机位"))
    }

    func testPlanItemBuilderCreatesAnARRIPlanItem() throws {
        let selection = CameraSelectionStore()
        selection.selectBrand("ARRI")
        selection.selectCamera("ALEXA 35")
        selection.selectCodec("ARRIRAW")
        selection.selectResolution("4.6K S35[4608*3164][OG]")
        selection.selectMedia("Compact Drive 1TB")
        selection.selectRate("24.000")

        let item = try XCTUnwrap(DITPlanItemBuilder.make(from: selection, name: "  A 机位  "))

        XCTAssertEqual(item.name, "A 机位")
        XCTAssertEqual(item.selection.cameraID, "ALEXA 35")
        XCTAssertEqual(item.selection.codecID, "ARRIRAW")
        XCTAssertEqual(item.selection.mediaID, "Compact Drive 1TB")
        XCTAssertGreaterThan(item.bitrateMbps, 0)
        XCTAssertGreaterThan(item.media.usableCapacityBytes, 0)
        XCTAssertNil(item.hdeDataPerHourMultiplier)

        let hdeItem = try XCTUnwrap(
            DITPlanItemBuilder.make(from: selection, name: "A 机位", usesHDE: true)
        )
        XCTAssertEqual(hdeItem.hdeDataPerHourMultiplier ?? 0, 0.5, accuracy: 0.000_001)
    }

    func testHDEReducesProjectDataButDoesNotChangeCameraMediaRequirements() throws {
        let selection = CameraSelection(
            brandID: "ARRI",
            cameraID: "ALEXA 35",
            codecID: "ARRIRAW",
            resolutionID: "4.6K S35[4608*3164][OG]",
            frameRateID: "24.000",
            mediaID: "Compact Drive 1TB"
        )
        let rawItem = PlanItem(
            name: "A 机位",
            selection: selection,
            bitrateMbps: 100,
            media: MediaSpec(id: "Compact Drive 1TB", usableCapacityBytes: 900_000_000_000),
            dailyPowerOnHours: 8,
            recordingRatio: 0.5,
            shootDays: 3,
            backupCopies: 2,
            safetyMargin: 0.1
        )
        var hdeItem = rawItem
        hdeItem.hdeDataPerHourMultiplier = 0.5

        let rawSummary = DITProjectCalculator.summarize(DITProject(items: [rawItem]))
        let hdeSummary = DITProjectCalculator.summarize(DITProject(items: [hdeItem]))
        let rawItemSummary = try XCTUnwrap(rawSummary.itemSummaries.first)
        let hdeItemSummary = try XCTUnwrap(hdeSummary.itemSummaries.first)

        XCTAssertEqual(rawSummary.totalRawDataBytes, 540_000_000_000, accuracy: 0.1)
        XCTAssertEqual(hdeSummary.totalRawDataBytes, 270_000_000_000, accuracy: 0.1)
        XCTAssertEqual(hdeSummary.totalStorageBytes, 594_000_000_000, accuracy: 0.1)
        XCTAssertEqual(hdeSummary.totalTransferSeconds, 2_970, accuracy: 0.001)
        XCTAssertEqual(hdeItemSummary.requiredMediaCount, rawItemSummary.requiredMediaCount)
        XCTAssertEqual(
            hdeItemSummary.recordMinutesPerMedia,
            rawItemSummary.recordMinutesPerMedia,
            accuracy: 0.001
        )
    }

    func testHDEIsRejectedForNonARRIRAWItems() {
        let item = PlanItem(
            selection: CameraSelection(
                brandID: "ARRI",
                cameraID: "ALEXA 35",
                codecID: "ProRes 4444 XQ",
                resolutionID: "4K",
                frameRateID: "24.000",
                mediaID: "Compact Drive 1TB"
            ),
            bitrateMbps: 100,
            media: MediaSpec(id: "Compact Drive 1TB", usableCapacityBytes: 900_000_000_000),
            hdeDataPerHourMultiplier: 0.5
        )

        let summary = DITProjectCalculator.summarize(DITProject(items: [item]))

        XCTAssertTrue(summary.itemSummaries.isEmpty)
        XCTAssertEqual(summary.issues.count, 1)
    }

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
        XCTAssertEqual(
            itemSummary?.rawDataPerCameraPerDayBytes ?? 0, 180_000_000_000, accuracy: 0.1)
        XCTAssertEqual(
            itemSummary?.rawDataPerCameraProjectBytes ?? 0, 540_000_000_000, accuracy: 0.1)
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
            items: [
                PlanItem(
                    selection: selection,
                    bitrateMbps: 139.318822675241,
                    media: MediaSpec(id: "Compact Drive 1TB", usableCapacityBytes: 937_687_040_000)
                )
            ]
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
