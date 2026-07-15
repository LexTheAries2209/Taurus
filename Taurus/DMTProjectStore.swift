import Combine
import Foundation

final class DMTProjectStore: ObservableObject {
    @Published private(set) var projects: [DMTProject] = []

    let fileURL: URL
    private let fileManager: FileManager
    private let encoder: JSONEncoder
    private let decoder: JSONDecoder
    private let legacyFileURL: URL?

    init(fileURL: URL? = nil, fileManager: FileManager = .default) {
        self.fileManager = fileManager
        self.fileURL = fileURL ?? Self.defaultFileURL(fileManager: fileManager)
        self.legacyFileURL = fileURL == nil ? Self.legacyFileURL(fileManager: fileManager) : nil
        self.encoder = JSONEncoder()
        self.decoder = JSONDecoder()
        _ = try? load()
    }

    @discardableResult
    func load() throws -> [DMTProject] {
        let sourceURL: URL
        if fileManager.fileExists(atPath: fileURL.path) {
            sourceURL = fileURL
        } else if let legacyFileURL, fileManager.fileExists(atPath: legacyFileURL.path) {
            sourceURL = legacyFileURL
        } else {
            projects = []
            return projects
        }
        let data = try Data(contentsOf: sourceURL)
        projects = try decoder.decode([DMTProject].self, from: data)
        if sourceURL != fileURL {
            try save()
        }
        return projects
    }

    func save() throws {
        let directory = fileURL.deletingLastPathComponent()
        try fileManager.createDirectory(at: directory, withIntermediateDirectories: true)
        let data = try encoder.encode(projects)
        try data.write(to: fileURL, options: .atomic)
    }

    @discardableResult
    func add(_ project: DMTProject = DMTProject()) throws -> DMTProject {
        projects.append(project)
        try save()
        return project
    }

    @discardableResult
    func duplicate(_ project: DMTProject) throws -> DMTProject {
        let copy = DMTProject(
            name: project.name.isEmpty ? "副本" : "\(project.name) 副本",
            items: project.items,
            transferProfile: project.transferProfile,
            notes: project.notes
        )
        projects.append(copy)
        try save()
        return copy
    }

    func update(_ project: DMTProject) throws {
        guard let index = projects.firstIndex(where: { $0.id == project.id }) else { return }
        projects[index] = project
        try save()
    }

    func remove(id: UUID) throws {
        projects.removeAll { $0.id == id }
        try save()
    }

    func exportProject(_ project: DMTProject, to url: URL) throws {
        try fileManager.createDirectory(
            at: url.deletingLastPathComponent(),
            withIntermediateDirectories: true
        )
        let data = try encoder.encode(project)
        try data.write(to: url, options: .atomic)
    }

    func importProject(from url: URL) throws -> DMTProject {
        var project = try decoder.decode(DMTProject.self, from: Data(contentsOf: url))
        if projects.contains(where: { $0.id == project.id }) {
            project = DMTProject(
                name: project.name.isEmpty ? "导入项目" : "\(project.name) 副本",
                items: project.items,
                transferProfile: project.transferProfile,
                notes: project.notes
            )
        }
        projects.append(project)
        try save()
        return project
    }

    private static func defaultFileURL(fileManager: FileManager) -> URL {
        let base = fileManager.urls(for: .applicationSupportDirectory, in: .userDomainMask).first
            ?? fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
            ?? URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true)
        return base.appendingPathComponent("Taurus", isDirectory: true)
            .appendingPathComponent("DMTProjects.json")
    }

    private static func legacyFileURL(fileManager: FileManager) -> URL {
        let base =
            fileManager.urls(for: .applicationSupportDirectory, in: .userDomainMask).first
            ?? fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
            ?? URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true)
        return base.appendingPathComponent("Taurus", isDirectory: true)
            .appendingPathComponent("DITProjects.json")
    }
}
