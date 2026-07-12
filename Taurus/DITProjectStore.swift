import Combine
import Foundation

final class DITProjectStore: ObservableObject {
    @Published private(set) var projects: [DITProject] = []

    let fileURL: URL
    private let fileManager: FileManager
    private let encoder: JSONEncoder
    private let decoder: JSONDecoder

    init(fileURL: URL? = nil, fileManager: FileManager = .default) {
        self.fileManager = fileManager
        self.fileURL = fileURL ?? Self.defaultFileURL(fileManager: fileManager)
        self.encoder = JSONEncoder()
        self.decoder = JSONDecoder()
        _ = try? load()
    }

    @discardableResult
    func load() throws -> [DITProject] {
        guard fileManager.fileExists(atPath: fileURL.path) else {
            projects = []
            return projects
        }
        let data = try Data(contentsOf: fileURL)
        projects = try decoder.decode([DITProject].self, from: data)
        return projects
    }

    func save() throws {
        let directory = fileURL.deletingLastPathComponent()
        try fileManager.createDirectory(at: directory, withIntermediateDirectories: true)
        let data = try encoder.encode(projects)
        try data.write(to: fileURL, options: .atomic)
    }

    @discardableResult
    func add(_ project: DITProject = DITProject()) throws -> DITProject {
        projects.append(project)
        try save()
        return project
    }

    @discardableResult
    func duplicate(_ project: DITProject) throws -> DITProject {
        let copy = DITProject(
            name: project.name.isEmpty ? "副本" : "\(project.name) 副本",
            items: project.items,
            transferProfile: project.transferProfile,
            notes: project.notes
        )
        projects.append(copy)
        try save()
        return copy
    }

    func update(_ project: DITProject) throws {
        guard let index = projects.firstIndex(where: { $0.id == project.id }) else { return }
        projects[index] = project
        try save()
    }

    func remove(id: UUID) throws {
        projects.removeAll { $0.id == id }
        try save()
    }

    func exportProject(_ project: DITProject, to url: URL) throws {
        try fileManager.createDirectory(
            at: url.deletingLastPathComponent(),
            withIntermediateDirectories: true
        )
        let data = try encoder.encode(project)
        try data.write(to: url, options: .atomic)
    }

    func importProject(from url: URL) throws -> DITProject {
        let project = try decoder.decode(DITProject.self, from: Data(contentsOf: url))
        projects.append(project)
        try save()
        return project
    }

    private static func defaultFileURL(fileManager: FileManager) -> URL {
        let base = fileManager.urls(for: .applicationSupportDirectory, in: .userDomainMask).first
            ?? fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
            ?? URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true)
        return base.appendingPathComponent("Taurus", isDirectory: true)
            .appendingPathComponent("DITProjects.json")
    }
}
