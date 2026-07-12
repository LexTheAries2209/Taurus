import Combine
import Foundation

struct FavoriteRecordingMode: Codable, Equatable, Identifiable {
    let id: UUID
    var name: String
    let selection: CameraSelection
    let bitrateMbps: Double
    let media: MediaSpec
    let readerSpeedMBps: Double?
    let hdeDataPerHourMultiplier: Double?
    let createdAt: Date

    init(
        id: UUID = UUID(),
        name: String,
        selection: CameraSelection,
        bitrateMbps: Double,
        media: MediaSpec,
        readerSpeedMBps: Double? = DITPlanItemDefaults.readerSpeedMBps,
        hdeDataPerHourMultiplier: Double? = nil,
        createdAt: Date = Date()
    ) {
        self.id = id
        self.name = name
        self.selection = selection
        self.bitrateMbps = bitrateMbps
        self.media = media
        self.readerSpeedMBps = readerSpeedMBps
        self.hdeDataPerHourMultiplier = hdeDataPerHourMultiplier
        self.createdAt = createdAt
    }

    init(item: PlanItem) {
        self.init(
            name: item.name,
            selection: item.selection,
            bitrateMbps: item.bitrateMbps,
            media: item.media,
            readerSpeedMBps: item.readerSpeedMBps,
            hdeDataPerHourMultiplier: item.hdeDataPerHourMultiplier
        )
    }

    func matches(_ item: PlanItem) -> Bool {
        selection == item.selection
            && bitrateMbps == item.bitrateMbps
            && media == item.media
            && readerSpeedMBps == item.readerSpeedMBps
            && hdeDataPerHourMultiplier == item.hdeDataPerHourMultiplier
    }

    func makePlanItem() -> PlanItem {
        PlanItem(
            name: name,
            selection: selection,
            bitrateMbps: bitrateMbps,
            media: media,
            readerSpeedMBps: readerSpeedMBps,
            hdeDataPerHourMultiplier: hdeDataPerHourMultiplier
        )
    }
}

final class DITFavoriteStore: ObservableObject {
    @Published private(set) var favorites: [FavoriteRecordingMode] = []

    let fileURL: URL
    private let fileManager: FileManager
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    init(fileURL: URL? = nil, fileManager: FileManager = .default) {
        self.fileManager = fileManager
        self.fileURL = fileURL ?? Self.defaultFileURL(fileManager: fileManager)
        _ = try? load()
    }

    @discardableResult
    func load() throws -> [FavoriteRecordingMode] {
        guard fileManager.fileExists(atPath: fileURL.path) else {
            favorites = []
            return favorites
        }
        favorites = try decoder.decode(
            [FavoriteRecordingMode].self,
            from: Data(contentsOf: fileURL)
        )
        return favorites
    }

    func save() throws {
        try fileManager.createDirectory(
            at: fileURL.deletingLastPathComponent(),
            withIntermediateDirectories: true
        )
        try encoder.encode(favorites).write(to: fileURL, options: .atomic)
    }

    @discardableResult
    func add(_ item: PlanItem) throws -> FavoriteRecordingMode {
        if let existing = favorites.first(where: { $0.matches(item) }) {
            return existing
        }
        let favorite = FavoriteRecordingMode(item: item)
        favorites.append(favorite)
        try save()
        return favorite
    }

    func remove(id: UUID) throws {
        favorites.removeAll { $0.id == id }
        try save()
    }

    func remove(matching item: PlanItem) throws {
        favorites.removeAll { $0.matches(item) }
        try save()
    }

    func contains(_ item: PlanItem) -> Bool {
        favorites.contains { $0.matches(item) }
    }

    func toggle(_ item: PlanItem) throws {
        if contains(item) {
            try remove(matching: item)
        } else {
            _ = try add(item)
        }
    }

    private static func defaultFileURL(fileManager: FileManager) -> URL {
        let base =
            fileManager.urls(for: .applicationSupportDirectory, in: .userDomainMask).first
            ?? fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
            ?? URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true)
        return base.appendingPathComponent("Taurus", isDirectory: true)
            .appendingPathComponent("DITFavorites.json")
    }
}
