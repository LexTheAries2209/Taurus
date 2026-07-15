import XCTest

@testable import Taurus

final class DITProjectTests: XCTestCase {
    func testReplacingRecordingModePreservesPlanningAndTransferParameters() {
        let existing = PlanItem(
            name: "A 机位",
            positionNote: "主机位",
            selection: CameraSelection(
                brandID: "ARRI",
                cameraID: "ALEXA 35",
                codecID: "ARRIRAW",
                resolutionID: "4.6K",
                frameRateID: "24.000",
                mediaID: "Compact Drive 1TB"
            ),
            bitrateMbps: 3_000,
            media: MediaSpec(id: "Compact Drive 1TB", usableCapacityBytes: 900_000_000_000),
            readerSpeedMBps: 780,
            hdeDataPerHourMultiplier: 0.5,
            cameraCount: 3,
            dailyPowerOnHours: 12,
            recordingRatio: 0.65,
            shootDays: 8,
            backupCopies: 3,
            safetyMargin: 0.25
        )
        let draft = PlanItem(
            name: "A 机位",
            selection: CameraSelection(
                brandID: "SONY",
                cameraID: "CineAlta Venice 2[8K]",
                codecID: "X-OCN XT",
                resolutionID: "8.6K FF[8640*5760][3:2]",
                frameRateID: "29.970",
                mediaID: "AXS S66 1TB"
            ),
            bitrateMbps: 6_784.5,
            media: MediaSpec(id: "AXS S66 1TB", usableCapacityBytes: 1_000_000_000_000)
        )

        let updated = DITPlanItemBuilder.replacingRecordingMode(of: existing, with: draft)

        XCTAssertEqual(updated.id, existing.id)
        XCTAssertEqual(updated.positionNote, existing.positionNote)
        XCTAssertEqual(updated.selection, draft.selection)
        XCTAssertEqual(updated.bitrateMbps, draft.bitrateMbps)
        XCTAssertEqual(updated.media, draft.media)
        XCTAssertNil(updated.hdeDataPerHourMultiplier)
        XCTAssertEqual(updated.readerSpeedMBps, existing.readerSpeedMBps)
        XCTAssertEqual(updated.cameraCount, existing.cameraCount)
        XCTAssertEqual(updated.dailyPowerOnHours, existing.dailyPowerOnHours)
        XCTAssertEqual(updated.recordingRatio, existing.recordingRatio)
        XCTAssertEqual(updated.shootDays, existing.shootDays)
        XCTAssertEqual(updated.backupCopies, existing.backupCopies)
        XCTAssertEqual(updated.safetyMargin, existing.safetyMargin)
    }

    func testPlannerColumnWidthsCanMoveFlexibleSpaceIntoCameraColumn() {
        let availableWidth: CGFloat = 900
        let initial = PlannerTableColumnWidths().resolved(for: availableWidth)
        var adjusted = initial

        adjusted.adjust(.nameCamera, by: -120)

        XCTAssertEqual(initial.totalWidth, availableWidth, accuracy: 0.001)
        XCTAssertEqual(adjusted.totalWidth, availableWidth, accuracy: 0.001)
        XCTAssertEqual(adjusted.name, initial.name - 120, accuracy: 0.001)
        XCTAssertEqual(adjusted.camera, initial.camera + 120, accuracy: 0.001)
    }

    func testPlannerColumnResizeStopsAtMinimumWidths() {
        var widths = PlannerTableColumnWidths().resolved(for: 900)
        let initialTotal = widths.totalWidth

        widths.adjust(.nameCamera, by: -10_000)

        XCTAssertEqual(widths.name, PlannerTableColumnWidths.minimumName, accuracy: 0.001)
        XCTAssertEqual(widths.totalWidth, initialTotal, accuracy: 0.001)
    }

    func testDuplicatedPlanItemPreservesSettingsWithNewID() {
        let item = PlanItem(
            name: "A 机位",
            positionNote: "斯坦尼康",
            selection: CameraSelection(
                brandID: "ARRI",
                cameraID: "ALEXA 35",
                codecID: "ARRIRAW",
                resolutionID: "4.6K",
                frameRateID: "24.000",
                mediaID: "Compact Drive 1TB"
            ),
            bitrateMbps: 3_000,
            media: MediaSpec(id: "Compact Drive 1TB", usableCapacityBytes: 900_000_000_000),
            readerSpeedMBps: 780,
            hdeDataPerHourMultiplier: 0.5,
            cameraCount: 3,
            dailyPowerOnHours: 12,
            recordingRatio: 0.65,
            shootDays: 8,
            backupCopies: 3,
            safetyMargin: 0.25
        )

        let copy = item.duplicated()

        XCTAssertNotEqual(copy.id, item.id)
        XCTAssertEqual(copy.name, "A 机位 副本")
        XCTAssertEqual(copy.positionNote, item.positionNote)
        XCTAssertEqual(copy.selection, item.selection)
        XCTAssertEqual(copy.bitrateMbps, item.bitrateMbps)
        XCTAssertEqual(copy.media, item.media)
        XCTAssertEqual(copy.readerSpeedMBps, item.readerSpeedMBps)
        XCTAssertEqual(copy.hdeDataPerHourMultiplier, item.hdeDataPerHourMultiplier)
        XCTAssertEqual(copy.cameraCount, item.cameraCount)
        XCTAssertEqual(copy.dailyPowerOnHours, item.dailyPowerOnHours)
        XCTAssertEqual(copy.recordingRatio, item.recordingRatio)
        XCTAssertEqual(copy.shootDays, item.shootDays)
        XCTAssertEqual(copy.backupCopies, item.backupCopies)
        XCTAssertEqual(copy.safetyMargin, item.safetyMargin)
    }

    func testPlanItemDecodesLegacyJSONWithoutPositionNote() throws {
        let item = PlanItem(
            name: "A 机位",
            selection: CameraSelection(
                brandID: "ARRI",
                cameraID: "ALEXA 35",
                codecID: "ARRIRAW",
                resolutionID: "4.6K",
                frameRateID: "24.000",
                mediaID: "Compact Drive 1TB"
            ),
            bitrateMbps: 3_000,
            media: MediaSpec(id: "Compact Drive 1TB", usableCapacityBytes: 900_000_000_000)
        )
        let encoded = try JSONEncoder().encode(item)
        var object = try XCTUnwrap(
            JSONSerialization.jsonObject(with: encoded) as? [String: Any]
        )
        object.removeValue(forKey: "positionNote")
        let legacyData = try JSONSerialization.data(withJSONObject: object)

        let decoded = try JSONDecoder().decode(PlanItem.self, from: legacyData)

        XCTAssertNil(decoded.positionNote)
        XCTAssertEqual(decoded.name, item.name)
        XCTAssertEqual(decoded.selection, item.selection)
    }

    func testProjectPlanItemsCanBeReorderedByMenuAndDragSemantics() {
        let selection = CameraSelection(
            brandID: "ARRI",
            cameraID: "ALEXA 35",
            codecID: "ARRIRAW",
            resolutionID: "4.6K",
            frameRateID: "24.000",
            mediaID: "Compact Drive 1TB"
        )
        let media = MediaSpec(id: "Compact Drive 1TB", usableCapacityBytes: 900_000_000_000)
        let itemA = PlanItem(name: "A", selection: selection, bitrateMbps: 100, media: media)
        let itemB = PlanItem(name: "B", selection: selection, bitrateMbps: 100, media: media)
        let itemC = PlanItem(name: "C", selection: selection, bitrateMbps: 100, media: media)
        var project = DITProject(items: [itemA, itemB, itemC])

        XCTAssertTrue(project.movePlanItem(id: itemC.id, by: -1))
        XCTAssertEqual(project.items.map(\.id), [itemA.id, itemC.id, itemB.id])
        XCTAssertFalse(project.movePlanItem(id: itemA.id, by: -1))

        XCTAssertTrue(
            project.movePlanItems(fromOffsets: IndexSet(integer: 0), toOffset: 3)
        )
        XCTAssertEqual(project.items.map(\.id), [itemC.id, itemB.id, itemA.id])
    }

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
        XCTAssertEqual(hdeItemSummary.cardCycles, rawItemSummary.cardCycles)
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

    func testResetPlanningParametersRestoresDefaultsWithoutChangingRecordingMode() {
        let selection = CameraSelection(
            brandID: "ARRI",
            cameraID: "ALEXA 35",
            codecID: "ARRIRAW",
            resolutionID: "4.6K",
            frameRateID: "24.000",
            mediaID: "Compact Drive 1TB"
        )
        var item = PlanItem(
            selection: selection,
            bitrateMbps: 100,
            media: MediaSpec(id: "Compact Drive 1TB", usableCapacityBytes: 900_000_000_000),
            hdeDataPerHourMultiplier: 0.5,
            cameraCount: 74,
            dailyPowerOnHours: 24,
            recordingRatio: 1,
            shootDays: 12.5,
            backupCopies: 5,
            safetyMargin: 1
        )

        item.resetPlanningParameters()

        XCTAssertEqual(item.cameraCount, 1)
        XCTAssertEqual(item.dailyPowerOnHours, 12)
        XCTAssertEqual(item.recordingRatio, 0.5)
        XCTAssertEqual(item.shootDays, 1)
        XCTAssertEqual(item.backupCopies, 2)
        XCTAssertEqual(item.safetyMargin, 0.1)
        XCTAssertEqual(item.readerSpeedMBps, 200)
        XCTAssertEqual(item.selection, selection)
        XCTAssertEqual(item.hdeDataPerHourMultiplier, 0.5)
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
            readerSpeedMBps: 100,
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
        XCTAssertEqual(summary.cardCyclesByMedia["1TB"], 2)
        XCTAssertEqual(summary.totalTransferSeconds, 23_760, accuracy: 0.001)
        XCTAssertTrue(summary.canCompleteDailyDoubleBackup)

        let itemSummary = try? XCTUnwrap(summary.itemSummaries.first)
        XCTAssertEqual(
            itemSummary?.rawDataPerCameraPerDayBytes ?? 0, 180_000_000_000, accuracy: 0.1)
        XCTAssertEqual(
            itemSummary?.rawDataPerCameraProjectBytes ?? 0, 540_000_000_000, accuracy: 0.1)
        XCTAssertEqual(itemSummary?.recordMinutesPerMedia ?? 0, 1_200, accuracy: 0.001)
        XCTAssertEqual(itemSummary?.readerSpeedMBps ?? 0, 100, accuracy: 0.001)
        XCTAssertEqual(itemSummary?.effectiveTransferSpeedMBps ?? 0, 100, accuracy: 0.001)
    }

    func testTransferTimeUsesReaderSpeedPerPlanItem() throws {
        let selection = CameraSelection(
            brandID: "[General]",
            cameraID: "Manual Codec",
            codecID: "ProRes",
            resolutionID: "UHD",
            frameRateID: "24.000",
            mediaID: "1TB"
        )
        let slow = PlanItem(
            name: "慢读卡器",
            selection: selection,
            bitrateMbps: 100,
            media: MediaSpec(id: "1TB", usableCapacityBytes: 900_000_000_000),
            readerSpeedMBps: 100,
            recordingRatio: 0.5,
            backupCopies: 1,
            safetyMargin: 0
        )
        let fast = PlanItem(
            name: "快读卡器",
            selection: selection,
            bitrateMbps: 100,
            media: MediaSpec(id: "1TB", usableCapacityBytes: 900_000_000_000),
            readerSpeedMBps: 400,
            recordingRatio: 0.5,
            backupCopies: 1,
            safetyMargin: 0
        )
        let project = DITProject(
            items: [slow, fast],
            transferProfile: TransferProfile(
                readerSpeedMBps: 50,
                targetDiskSpeedMBps: 200,
                offloadWindowHoursPerDay: 24
            )
        )

        let summary = DITProjectCalculator.summarize(project)
        let summaries = Dictionary(uniqueKeysWithValues: summary.itemSummaries.map { ($0.itemName, $0) })

        XCTAssertEqual(summaries["慢读卡器"]?.readerSpeedMBps ?? 0, 100, accuracy: 0.001)
        XCTAssertEqual(summaries["慢读卡器"]?.effectiveTransferSpeedMBps ?? 0, 100, accuracy: 0.001)
        XCTAssertEqual(summaries["快读卡器"]?.effectiveTransferSpeedMBps ?? 0, 200, accuracy: 0.001)
        XCTAssertEqual(summaries["慢读卡器"]?.transferSeconds ?? 0, 1_800, accuracy: 0.001)
        XCTAssertEqual(summaries["快读卡器"]?.transferSeconds ?? 0, 900, accuracy: 0.001)
        XCTAssertEqual(summary.totalTransferSeconds, 2_700, accuracy: 0.001)
        XCTAssertEqual(summary.effectiveTransferSpeedMBps, 100, accuracy: 0.001)
    }

    func testLegacyPlanItemFallsBackToProjectReaderSpeed() throws {
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
            bitrateMbps: 100,
            media: MediaSpec(id: "1TB", usableCapacityBytes: 900_000_000_000),
            readerSpeedMBps: nil,
            recordingRatio: 0.5,
            backupCopies: 1,
            safetyMargin: 0
        )
        let project = DITProject(
            items: [item],
            transferProfile: TransferProfile(
                readerSpeedMBps: 100,
                targetDiskSpeedMBps: 200
            )
        )

        let itemSummary = try XCTUnwrap(DITProjectCalculator.summarize(project).itemSummaries.first)

        XCTAssertEqual(itemSummary.readerSpeedMBps, 100, accuracy: 0.001)
        XCTAssertEqual(itemSummary.effectiveTransferSpeedMBps, 100, accuracy: 0.001)
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
        XCTAssertEqual(summary.cardCyclesByMedia, [:])
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
