import XCTest
@testable import Taurus

final class DITFavoriteTests: XCTestCase {
    func testCameraSearchIndexContainsKnownOfflineModels() {
        XCTAssertTrue(CameraSearchIndex.entries.contains {
            $0.brandID == "ARRI" && $0.cameraID == "ALEXA 35"
        })
        XCTAssertTrue(CameraSearchIndex.entries.contains {
            $0.brandID == "Nikon" && $0.cameraID == "Z9"
        })
        XCTAssertEqual(
            Set(CameraSearchIndex.entries.map(\.id)).count,
            CameraSearchIndex.entries.count
        )
    }

    func testFavoriteRoundTripAndDuplicateSuppression() throws {
        let directory = FileManager.default.temporaryDirectory
            .appendingPathComponent("TaurusFavorites-\(UUID().uuidString)", isDirectory: true)
        let url = directory.appendingPathComponent("favorites.json")
        defer { try? FileManager.default.removeItem(at: directory) }
        let item = sampleItem()
        let store = DITFavoriteStore(fileURL: url)

        let first = try store.add(item)
        let duplicate = try store.add(item)

        XCTAssertEqual(first, duplicate)
        XCTAssertEqual(store.favorites.count, 1)
        XCTAssertTrue(store.contains(item))
        XCTAssertEqual(DITFavoriteStore(fileURL: url).favorites, [first])
    }

    func testFavoriteCreatesFreshPlanItemAndCanBeToggled() throws {
        let directory = FileManager.default.temporaryDirectory
            .appendingPathComponent("TaurusFavorites-\(UUID().uuidString)", isDirectory: true)
        let url = directory.appendingPathComponent("favorites.json")
        defer { try? FileManager.default.removeItem(at: directory) }
        let source = sampleItem()
        let store = DITFavoriteStore(fileURL: url)

        try store.toggle(source)
        let favorite = try XCTUnwrap(store.favorites.first)
        let restored = favorite.makePlanItem()

        XCTAssertNotEqual(restored.id, source.id)
        XCTAssertEqual(restored.selection, source.selection)
        XCTAssertEqual(restored.media, source.media)

        try store.toggle(source)
        XCTAssertTrue(store.favorites.isEmpty)
    }

    private func sampleItem() -> PlanItem {
        PlanItem(
            name: "ALEXA 35 ARRIRAW",
            selection: CameraSelection(
                brandID: "ARRI",
                cameraID: "ALEXA 35",
                codecID: "ARRIRAW",
                resolutionID: "4.6K",
                frameRateID: "24.000",
                mediaID: "Compact Drive 1TB"
            ),
            bitrateMbps: 1_000,
            media: MediaSpec(
                id: "Compact Drive 1TB",
                usableCapacityBytes: 937_687_040_000
            )
        )
    }
}
