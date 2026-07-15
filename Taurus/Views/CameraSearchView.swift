import SwiftUI

struct CameraSearchEntry: Identifiable, Equatable {
    let brandID: String
    let cameraID: String

    var id: String { "\(brandID)|\(cameraID)" }
}

enum CameraSearchIndex {
    static let entries: [CameraSearchEntry] = {
        var result: [CameraSearchEntry] = []
        for (brand, cameras) in CameraModel {
            result.append(contentsOf: cameras.map {
                CameraSearchEntry(brandID: brand, cameraID: $0)
            })
        }
        return result.sorted { lhs, rhs in
            if lhs.brandID == rhs.brandID {
                return lhs.cameraID.localizedCaseInsensitiveCompare(rhs.cameraID) == .orderedAscending
            }
            return lhs.brandID.localizedCaseInsensitiveCompare(rhs.brandID) == .orderedAscending
        }
    }()
}

struct CameraSearchView: View {
    let language: AppLanguage
    let onSelect: (CameraSearchEntry) -> Void

    @Environment(\.presentationMode) private var presentationMode
    @State private var query = ""

    private var copy: DMTPlannerCopy { language.copy.dmtPlanner }

    init(language: AppLanguage = .chinese, onSelect: @escaping (CameraSearchEntry) -> Void) {
        self.language = language
        self.onSelect = onSelect
    }

    private var filteredEntries: [CameraSearchEntry] {
        let trimmed = query.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return CameraSearchIndex.entries }
        return CameraSearchIndex.entries.filter {
            $0.brandID.localizedCaseInsensitiveContains(trimmed)
                || $0.cameraID.localizedCaseInsensitiveContains(trimmed)
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(copy.text("搜索摄影机"))
                    .font(.headline)
                Spacer()
                Button(copy.text("完成")) { presentationMode.wrappedValue.dismiss() }
            }
            .padding(12)

            Divider()

            List(filteredEntries) { entry in
                Button {
                    onSelect(entry)
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack(spacing: 10) {
                        Image(systemName: "video")
                            .foregroundColor(.secondary)
                            .frame(width: 16)
                        VStack(alignment: .leading, spacing: 2) {
                            Text(entry.cameraID)
                                .foregroundColor(.primary)
                            Text(entry.brandID)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                    }
                    .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
            }
            .searchable(text: $query, placement: .toolbar, prompt: copy.text("品牌或机型"))
        }
        .frame(minWidth: 520, minHeight: 420)
    }
}
