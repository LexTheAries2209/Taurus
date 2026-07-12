import SwiftUI
import UniformTypeIdentifiers

struct DITPlannerView: View {
    @ObservedObject var selectionStore: CameraSelectionStore
    @ObservedObject var projectStore: DITProjectStore

    @State private var selectedProjectID: UUID?
    @State private var selectedItemID: UUID?
    @State private var exportErrorMessage = ""
    @State private var showsExportError = false

    private var selectedProject: DITProject? {
        guard let selectedProjectID else { return nil }
        return projectStore.projects.first { $0.id == selectedProjectID }
    }

    private var selectedItem: PlanItem? {
        guard let selectedItemID else { return nil }
        return selectedProject?.items.first { $0.id == selectedItemID }
    }

    var body: some View {
        HStack(spacing: 0) {
            projectSidebar
                .frame(minWidth: 180, idealWidth: 210, maxWidth: 250)

            Divider()

            if let project = selectedProject {
                projectWorkspace(project)
            } else {
                emptyState(title: "暂无项目", systemImage: "rectangle.3.group", message: "新建一个项目开始多机位规划")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .onAppear(perform: selectInitialProject)
        .onChange(of: selectedProjectID) { _ in selectedItemID = nil }
        .alert("操作失败", isPresented: $showsExportError) {
            Button("好", role: .cancel) {}
        } message: {
            Text(exportErrorMessage)
        }
    }

    private var projectSidebar: some View {
        VStack(spacing: 0) {
            HStack {
                Text("项目")
                    .font(.headline)
                Spacer()
                Button(action: createProject) {
                    Image(systemName: "plus")
                }
                .buttonStyle(.borderless)
                .help("新建项目")
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)

            List(selection: $selectedProjectID) {
                ForEach(projectStore.projects) { project in
                    VStack(alignment: .leading, spacing: 2) {
                        Text(project.name.isEmpty ? "未命名项目" : project.name)
                            .lineLimit(1)
                        Text("\(project.items.count) 个机位")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .tag(Optional(project.id))
                    .contextMenu {
                        Button("复制方案") { duplicate(project) }
                        Button("删除项目", role: .destructive) { delete(project) }
                    }
                }
            }
            .listStyle(.sidebar)

            HStack {
                Button("复制方案") {
                    if let project = selectedProject { duplicate(project) }
                }
                .disabled(selectedProject == nil)
                Spacer()
                Button("删除", role: .destructive) {
                    if let project = selectedProject { delete(project) }
                }
                .disabled(selectedProject == nil)
            }
            .padding(10)
        }
    }

    private func projectWorkspace(_ project: DITProject) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 12) {
                TextField("项目名称", text: projectNameBinding(project))
                    .textFieldStyle(.roundedBorder)
                    .frame(maxWidth: 220)

                Button("添加当前机位", action: addCurrentSelection)
                    .disabled(!isCurrentSelectionUsable)

                Menu("导出") {
                    Button("导出 JSON") { exportJSON() }
                    Button("导出 CSV") { exportCSV() }
                    Button("导出 PDF") { exportPDF() }
                }

                Button("导入 JSON", action: importJSON)

                Spacer()

                let summary = DITProjectCalculator.summarize(project)
                SummaryBadge(title: "原始数据", value: formatBytes(summary.totalRawDataBytes))
                SummaryBadge(title: "存储需求", value: formatBytes(summary.totalStorageBytes))
                SummaryBadge(title: "每日双备份", value: summary.canCompleteDailyDoubleBackup ? "可完成" : "需调整")
            }
            .padding(12)

            Divider()

            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("机位规划")
                        .font(.headline)
                    List(selection: $selectedItemID) {
                        ForEach(project.items) { item in
                            VStack(alignment: .leading, spacing: 3) {
                                Text(item.name)
                                    .lineLimit(1)
                                Text("\(item.cameraLabel) · \(item.cameraCount) 台 · \(formatBytes(itemStorage(project: project, item: item)))")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                    .lineLimit(1)
                            }
                            .tag(Optional(item.id))
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .listStyle(.inset)
                }
                .padding(12)
                .frame(minWidth: 330, idealWidth: 390, maxWidth: .infinity)

                Divider()

                inspector
                    .frame(minWidth: 280, idealWidth: 330, maxWidth: 360)
                    .padding(12)
            }
        }
    }

    @ViewBuilder
    private var inspector: some View {
        Form {
            if let item = selectedItem {
                Section("录制模式") {
                    InspectorRow(label: "摄影机", value: item.cameraLabel)
                    InspectorRow(label: "编码", value: item.selection.codecID)
                    InspectorRow(label: "帧率", value: item.selection.frameRateID)
                    InspectorRow(label: "码率", value: "\(formatNumber(item.bitrateMbps)) Mbps")
                    InspectorRow(label: "介质", value: item.media.id)
                }

                Section("拍摄参数") {
                    TextField("机位名称", text: itemBinding(item, keyPath: \.name))
                    Stepper("摄影机数量：\(item.cameraCount)", value: itemBinding(item, keyPath: \.cameraCount), in: 1...99)
                    Stepper("每日开机：\(formatNumber(item.dailyPowerOnHours)) 小时", value: itemBinding(item, keyPath: \.dailyPowerOnHours), in: 0.5...24, step: 0.5)
                    Stepper("拍摄天数：\(formatNumber(item.shootDays))", value: itemBinding(item, keyPath: \.shootDays), in: 0.5...365, step: 0.5)
                    Stepper("保留副本：\(item.backupCopies)", value: itemBinding(item, keyPath: \.backupCopies), in: 1...5)
                    HStack {
                        Text("实际录制比例")
                        Slider(value: itemBinding(item, keyPath: \.recordingRatio), in: 0.05...1)
                        Text("\(Int(item.recordingRatio * 100))%")
                            .monospacedDigit()
                    }
                    HStack {
                        Text("安全余量")
                        Slider(value: itemBinding(item, keyPath: \.safetyMargin), in: 0...1)
                        Text("\(Int(item.safetyMargin * 100))%")
                            .monospacedDigit()
                    }
                }
            }

            if let project = selectedProject {
                Section("传输配置") {
                    Stepper(
                        "读卡器：\(formatNumber(project.transferProfile.readerSpeedMBps)) MB/s",
                        value: transferBinding(project, keyPath: \.readerSpeedMBps),
                        in: 10...10_000,
                        step: 10
                    )
                    Stepper(
                        "目标盘：\(formatNumber(project.transferProfile.targetDiskSpeedMBps)) MB/s",
                        value: transferBinding(project, keyPath: \.targetDiskSpeedMBps),
                        in: 10...10_000,
                        step: 10
                    )
                    Stepper(
                        "每日窗口：\(formatNumber(project.transferProfile.offloadWindowHoursPerDay)) 小时",
                        value: transferBinding(project, keyPath: \.offloadWindowHoursPerDay),
                        in: 0.5...24,
                        step: 0.5
                    )
                }
            }
        }
    }

    private var isCurrentSelectionUsable: Bool {
        guard case .success = RecordingCalculator.calculate(selectionStore) else { return false }
        return MediaCapacity(cameradata: selectionStore) > 0
    }

    private func addCurrentSelection() {
        guard var project = selectedProject,
              case let .success(metrics) = RecordingCalculator.calculate(selectionStore) else { return }
        let capacityGB = MediaCapacity(cameradata: selectionStore)
        guard capacityGB.isFinite, capacityGB > 0 else { return }
        let selection = CameraSelection(selectionStore: selectionStore)
        let item = PlanItem(
            name: selectionStore.CameraName,
            selection: selection,
            bitrateMbps: metrics.bitrateMbps,
            media: MediaSpec(id: selectionStore.Media, usableCapacityBytes: capacityGB * 1_000_000_000)
        )
        project.items.append(item)
        project.touch()
        try? projectStore.update(project)
        selectedItemID = item.id
    }

    @MainActor
    private func exportJSON() {
        guard let project = selectedProject,
              let url = DITPlanFilePanel.chooseSaveURL(
                defaultName: "\(project.name).json",
                contentType: .json
              ) else { return }
        do {
            try projectStore.exportProject(project, to: url)
        } catch {
            showExportError(error)
        }
    }

    @MainActor
    private func exportCSV() {
        guard let project = selectedProject,
              let url = DITPlanFilePanel.chooseSaveURL(
                defaultName: "\(project.name).csv",
                contentType: .commaSeparatedText
              ) else { return }
        do {
            try DITPlanExport.csvData(for: project).write(to: url, options: .atomic)
        } catch {
            showExportError(error)
        }
    }

    @MainActor
    private func exportPDF() {
        guard let project = selectedProject,
              let url = DITPlanFilePanel.chooseSaveURL(
                defaultName: "\(project.name).pdf",
                contentType: .pdf
              ) else { return }
        do {
            try DITPlanExport.pdfData(for: project).write(to: url, options: .atomic)
        } catch {
            showExportError(error)
        }
    }

    @MainActor
    private func importJSON() {
        guard let url = DITPlanFilePanel.chooseOpenURL() else { return }
        do {
            let project = try projectStore.importProject(from: url)
            selectedProjectID = project.id
        } catch {
            showExportError(error)
        }
    }

    private func showExportError(_ error: Error) {
        exportErrorMessage = error.localizedDescription
        showsExportError = true
    }

    private func selectInitialProject() {
        if selectedProjectID == nil { selectedProjectID = projectStore.projects.first?.id }
    }

    private func createProject() {
        if let project = try? projectStore.add(DITProject()) {
            selectedProjectID = project.id
        }
    }

    private func duplicate(_ project: DITProject) {
        if let copy = try? projectStore.duplicate(project) { selectedProjectID = copy.id }
    }

    private func delete(_ project: DITProject) {
        try? projectStore.remove(id: project.id)
        if selectedProjectID == project.id { selectedProjectID = projectStore.projects.first?.id }
    }

    private func deleteItems(at offsets: IndexSet) {
        guard var project = selectedProject else { return }
        let removedIDs = offsets.map { project.items[$0].id }
        project.items.remove(atOffsets: offsets)
        project.touch()
        try? projectStore.update(project)
        if let selectedItemID, removedIDs.contains(selectedItemID) { self.selectedItemID = nil }
    }

    private func projectNameBinding(_ project: DITProject) -> Binding<String> {
        Binding(
            get: { projectStore.projects.first { $0.id == project.id }?.name ?? "" },
            set: { value in
                var updated = projectStore.projects.first { $0.id == project.id } ?? project
                updated.name = value
                updated.touch()
                try? projectStore.update(updated)
            }
        )
    }

    private func itemBinding<Value>(_ item: PlanItem, keyPath: WritableKeyPath<PlanItem, Value>) -> Binding<Value> {
        Binding(
            get: { (selectedItem ?? item)[keyPath: keyPath] },
            set: { value in
                guard var project = selectedProject,
                      let index = project.items.firstIndex(where: { $0.id == item.id }) else { return }
                project.items[index][keyPath: keyPath] = value
                project.touch()
                try? projectStore.update(project)
            }
        )
    }

    private func transferBinding(
        _ project: DITProject,
        keyPath: WritableKeyPath<TransferProfile, Double>
    ) -> Binding<Double> {
        Binding(
            get: {
                (projectStore.projects.first { $0.id == project.id } ?? project)
                    .transferProfile[keyPath: keyPath]
            },
            set: { value in
                var updated = projectStore.projects.first { $0.id == project.id } ?? project
                updated.transferProfile[keyPath: keyPath] = value
                updated.touch()
                try? projectStore.update(updated)
            }
        )
    }

    private func emptyState(title: String, systemImage: String, message: String) -> some View {
        VStack(spacing: 8) {
            Image(systemName: systemImage)
                .font(.title)
                .foregroundColor(.secondary)
            Text(title)
                .font(.headline)
            Text(message)
                .font(.callout)
                .foregroundColor(.secondary)
        }
    }

    private func itemStorage(project: DITProject, item: PlanItem) -> Double {
        DITProjectCalculator.summarize(project).itemSummaries.first { $0.itemID == item.id }?.storageBytes ?? 0
    }

    private func formatBytes(_ bytes: Double) -> String {
        guard bytes.isFinite, bytes >= 0, bytes <= Double(Int64.max) else { return "—" }
        let formatter = ByteCountFormatter()
        formatter.countStyle = .file
        formatter.allowsNonnumericFormatting = false
        return formatter.string(fromByteCount: Int64(bytes))
    }
}

private struct SummaryBadge: View {
    let title: String
    let value: String

    var body: some View {
        VStack(alignment: .trailing, spacing: 2) {
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
            Text(value)
                .font(.callout)
                .monospacedDigit()
        }
    }
}

private struct InspectorRow: View {
    let label: String
    let value: String

    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Text(label)
            Spacer(minLength: 12)
            Text(value)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.trailing)
                .lineLimit(2)
        }
    }
}
