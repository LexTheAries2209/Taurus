import SwiftUI
import UniformTypeIdentifiers

struct DITPlannerView: View {
  @ObservedObject var selectionStore: CameraSelectionStore
  @ObservedObject var projectStore: DITProjectStore
  @ObservedObject var favoriteStore: DITFavoriteStore
  @Binding var showsPlanner: Bool

  @State private var selectedProjectID: UUID?
  @State private var selectedItemID: UUID?
  @State private var comparisonItemIDs: Set<UUID> = []
  @State private var showsCameraSearch = false
  @State private var showsComparison = false
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

  private var selectedItemSummary: PlanItemSummary? {
    guard let selectedItemID, let project = selectedProject else { return nil }
    return DITProjectCalculator.summarize(project)
      .itemSummaries.first { $0.itemID == selectedItemID }
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
    .onChange(of: selectedProjectID) { _ in
      selectedItemID = nil
      comparisonItemIDs.removeAll()
    }
    .alert("操作失败", isPresented: $showsExportError) {
      Button("好", role: .cancel) {}
    } message: {
      Text(exportErrorMessage)
    }
    .sheet(isPresented: $showsCameraSearch) {
      CameraSearchView(onSelect: selectCamera)
    }
    .sheet(isPresented: $showsComparison) {
      if let project = selectedProject {
        DITModeComparisonView(project: project, itemIDs: comparisonItemIDs)
      }
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
        Section("项目与方案") {
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

        Section("收藏模式") {
          if favoriteStore.favorites.isEmpty {
            Text("暂无收藏")
              .font(.caption)
              .foregroundColor(.secondary)
          } else {
            ForEach(favoriteStore.favorites) { favorite in
              Button {
                addFavoriteToProject(favorite)
              } label: {
                HStack(spacing: 8) {
                  Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .frame(width: 16)
                  VStack(alignment: .leading, spacing: 2) {
                    Text(favorite.name)
                      .foregroundColor(.primary)
                      .lineLimit(1)
                    Text("\(favorite.selection.cameraID) · \(favorite.selection.codecID)")
                      .font(.caption)
                      .foregroundColor(.secondary)
                      .lineLimit(1)
                  }
                }
                .contentShape(Rectangle())
              }
              .buttonStyle(.plain)
              .contextMenu {
                Button("添加到当前项目") { addFavoriteToProject(favorite) }
                Button("删除收藏", role: .destructive) { removeFavorite(favorite) }
              }
            }
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
    let summary = DITProjectCalculator.summarize(project)

    return VStack(alignment: .leading, spacing: 0) {
      HStack(spacing: 10) {
        TextField("项目名称", text: projectNameBinding(project))
          .textFieldStyle(.roundedBorder)
          .font(.headline)
          .frame(minWidth: 180, idealWidth: 240, maxWidth: 280)

        Label("\(project.items.count) 个机位", systemImage: "video")
          .font(.callout)
          .foregroundColor(.secondary)

        Spacer(minLength: 20)

        Button(action: { showsCameraSearch = true }) {
          Image(systemName: "magnifyingglass")
        }
        .help("搜索摄影机")
        .accessibilityLabel("搜索摄影机")

        Button(action: addCurrentSelection) {
          Image(systemName: "plus")
        }
        .disabled(!isCurrentSelectionUsable)
        .help("添加当前计算模式")
        .accessibilityLabel("添加当前计算模式")

        Button(action: { showsComparison = true }) {
          Image(systemName: "rectangle.3.group")
        }
        .disabled(!(2...4).contains(comparisonItemIDs.count))
        .help("比较已勾选的 2 至 4 个模式")
        .accessibilityLabel("模式比较")

        Menu {
          Button("导出 JSON") { exportJSON() }
          Button("导出 CSV") { exportCSV() }
          Button("导出 PDF") { exportPDF() }
        } label: {
          Image(systemName: "square.and.arrow.up")
        }
        .help("导出项目")
        .accessibilityLabel("导出项目")

        Button(action: importJSON) {
          Image(systemName: "square.and.arrow.down")
        }
        .help("导入项目 JSON")
        .accessibilityLabel("导入项目 JSON")
      }
      .controlSize(.large)
      .padding(.horizontal, 18)
      .padding(.vertical, 14)

      Divider()

      HStack(spacing: 0) {
        SummaryMetric(
          title: "每日原始量",
          value: formatBytes(summary.dailyRawDataBytes),
          systemImage: "sun.max"
        )
        SummaryMetric(
          title: "项目原始量",
          value: formatBytes(summary.totalRawDataBytes),
          systemImage: "calendar"
        )
        SummaryMetric(
          title: "备份后存储",
          value: formatBytes(summary.totalStorageBytes),
          systemImage: "externaldrive.badge.plus"
        )
        SummaryMetric(
          title: "每日双备份",
          value: summary.canCompleteDailyDoubleBackup ? "可完成" : "需调整",
          systemImage: summary.canCompleteDailyDoubleBackup
            ? "checkmark.circle" : "exclamationmark.triangle",
          valueColor: summary.canCompleteDailyDoubleBackup ? .green : .orange
        )
      }
      .frame(height: 76)
      .background(Color(nsColor: .controlBackgroundColor).opacity(0.45))

      Divider()

      HStack(spacing: 0) {
        cameraPlan(project)
          .frame(minWidth: 500, idealWidth: 620, maxWidth: .infinity)

        Divider()

        inspector
          .frame(minWidth: 360, idealWidth: 390, maxWidth: 430)
      }
    }
  }

  private func cameraPlan(_ project: DITProject) -> some View {
    VStack(alignment: .leading, spacing: 0) {
      HStack(alignment: .firstTextBaseline) {
        Text("机位规划")
          .font(.title3)
          .fontWeight(.semibold)
        Text("选择机位后在右侧调整参数")
          .font(.caption)
          .foregroundColor(.secondary)
        Spacer()
        if !comparisonItemIDs.isEmpty {
          Text("已选 \(comparisonItemIDs.count) / 4")
            .font(.caption)
            .foregroundColor(.secondary)
        }
      }
      .padding(.horizontal, 18)
      .padding(.top, 18)
      .padding(.bottom, 14)

      CameraPlanHeader()
        .padding(.horizontal, 18)
        .padding(.bottom, 6)

      Divider()

      if project.items.isEmpty {
        emptyState(
          title: "尚未添加机位",
          systemImage: "video.badge.plus",
          message: "使用上方搜索或从计算器添加录制模式"
        )
        .frame(maxWidth: .infinity, maxHeight: .infinity)
      } else {
        List(selection: $selectedItemID) {
          ForEach(project.items) { item in
            CameraPlanRow(
              item: item,
              storage: formatBytes(itemStorage(project: project, item: item)),
              isCompared: comparisonItemIDs.contains(item.id),
              comparisonDisabled: !comparisonItemIDs.contains(item.id)
                && comparisonItemIDs.count >= 4,
              toggleComparison: { toggleComparison(item.id) }
            )
            .tag(Optional(item.id))
            .contextMenu {
              Button(comparisonItemIDs.contains(item.id) ? "移出比较" : "加入比较") {
                toggleComparison(item.id)
              }
              .disabled(!comparisonItemIDs.contains(item.id) && comparisonItemIDs.count >= 4)
              Button(favoriteStore.contains(item) ? "取消收藏" : "收藏模式") {
                toggleFavorite(item)
              }
            }
          }
          .onDelete(perform: deleteItems)
        }
        .listStyle(.inset)
      }
    }
  }

  @ViewBuilder
  private var inspector: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 18) {
        Text("机位检查器")
          .font(.title3)
          .fontWeight(.semibold)

        if let item = selectedItem {
          InspectorSection(title: "录制模式", systemImage: "video") {
            VStack(spacing: 8) {
              InspectorRow(label: "摄影机", value: item.cameraLabel)
              InspectorRow(label: "编码", value: item.selection.codecID)
              InspectorRow(label: "帧率", value: item.selection.frameRateID)
              InspectorRow(label: "码率", value: "\(formatNumber(item.bitrateMbps)) Mbps")
              InspectorRow(label: "介质", value: item.media.id)
            }
          }

          Button {
            toggleFavorite(item)
          } label: {
            Label(
              favoriteStore.contains(item) ? "取消收藏" : "收藏模式",
              systemImage: favoriteStore.contains(item) ? "star.fill" : "star"
            )
          }
          .buttonStyle(.bordered)

          InspectorSection(title: "拍摄参数", systemImage: "slider.horizontal.3") {
            VStack(spacing: 12) {
              InspectorControlRow(label: "机位名称") {
                TextField("机位名称", text: itemBinding(item, keyPath: \.name))
                  .textFieldStyle(.roundedBorder)
                  .frame(width: 190)
              }
              InspectorControlRow(label: "摄影机数量") {
                Stepper(
                  "\(item.cameraCount) 台",
                  value: itemBinding(item, keyPath: \.cameraCount),
                  in: 1...99
                )
                .monospacedDigit()
                .frame(width: 104)
              }
              InspectorControlRow(label: "每日开机") {
                Stepper(
                  "\(formatNumber(item.dailyPowerOnHours)) 小时",
                  value: itemBinding(item, keyPath: \.dailyPowerOnHours),
                  in: 0.5...24,
                  step: 0.5
                )
                .monospacedDigit()
                .frame(width: 130)
              }
              InspectorControlRow(label: "拍摄天数") {
                Stepper(
                  "\(formatNumber(item.shootDays)) 天",
                  value: itemBinding(item, keyPath: \.shootDays),
                  in: 0.5...365,
                  step: 0.5
                )
                .monospacedDigit()
                .frame(width: 118)
              }
              InspectorControlRow(label: "保留副本") {
                Stepper(
                  "\(item.backupCopies) 份",
                  value: itemBinding(item, keyPath: \.backupCopies),
                  in: 1...5
                )
                .monospacedDigit()
                .frame(width: 104)
              }
              InspectorSliderRow(
                label: "实际录制比例",
                value: itemBinding(item, keyPath: \.recordingRatio),
                range: 0.05...1,
                displayValue: "\(Int(item.recordingRatio * 100))%"
              )
              InspectorSliderRow(
                label: "安全余量",
                value: itemBinding(item, keyPath: \.safetyMargin),
                range: 0...1,
                displayValue: "\(Int(item.safetyMargin * 100))%"
              )
            }
          }

          if let summary = selectedItemSummary {
            InspectorSection(title: "规划结果", systemImage: "chart.bar") {
              VStack(spacing: 8) {
                InspectorRow(label: "单机每日", value: formatBytes(summary.rawDataPerCameraPerDayBytes))
                InspectorRow(label: "全部每日", value: formatBytes(summary.rawDataPerDayBytes))
                InspectorRow(
                  label: "单机全项目", value: formatBytes(summary.rawDataPerCameraProjectBytes))
                InspectorRow(label: "项目原始量", value: formatBytes(summary.rawDataBytes))
                InspectorRow(
                  label: "备份后存储", value: formatBytes(summary.storageBytes), emphasized: true)
                InspectorRow(label: "介质数量", value: "\(summary.requiredMediaCount) 张")
                InspectorRow(
                  label: "每张卡时长", value: "\(formatNumber(summary.recordMinutesPerMedia)) 分钟")
                InspectorRow(
                  label: "卸载时间", value: "\(formatNumber(summary.transferSeconds / 3_600)) 小时")
              }
            }
          }
        } else {
          VStack(spacing: 8) {
            Image(systemName: "sidebar.right")
              .font(.title2)
              .foregroundColor(.secondary)
            Text("选择一个机位")
              .font(.headline)
            Text("录制模式、拍摄参数与规划结果将在这里显示")
              .font(.caption)
              .foregroundColor(.secondary)
              .multilineTextAlignment(.center)
          }
          .frame(maxWidth: .infinity)
          .padding(.vertical, 24)
        }

        if let project = selectedProject {
          InspectorSection(title: "传输配置", systemImage: "externaldrive.connected.to.line.below") {
            VStack(spacing: 12) {
              InspectorControlRow(label: "读卡器") {
                Stepper(
                  "\(formatNumber(project.transferProfile.readerSpeedMBps)) MB/s",
                  value: transferBinding(project, keyPath: \.readerSpeedMBps),
                  in: 10...10_000,
                  step: 10
                )
                .monospacedDigit()
                .frame(width: 150)
              }
              InspectorControlRow(label: "目标盘") {
                Stepper(
                  "\(formatNumber(project.transferProfile.targetDiskSpeedMBps)) MB/s",
                  value: transferBinding(project, keyPath: \.targetDiskSpeedMBps),
                  in: 10...10_000,
                  step: 10
                )
                .monospacedDigit()
                .frame(width: 150)
              }
              InspectorControlRow(label: "每日窗口") {
                Stepper(
                  "\(formatNumber(project.transferProfile.offloadWindowHoursPerDay)) 小时",
                  value: transferBinding(project, keyPath: \.offloadWindowHoursPerDay),
                  in: 0.5...24,
                  step: 0.5
                )
                .monospacedDigit()
                .frame(width: 130)
              }
            }
          }
        }
      }
      .padding(18)
    }
    .background(Color(nsColor: .windowBackgroundColor))
  }

  private var isCurrentSelectionUsable: Bool {
    guard case .success = RecordingCalculator.calculate(selectionStore) else { return false }
    return MediaCapacity(cameradata: selectionStore) > 0
  }

  private func addCurrentSelection() {
    guard var project = selectedProject,
      case .success(let metrics) = RecordingCalculator.calculate(selectionStore)
    else { return }
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

  private func selectCamera(_ entry: CameraSearchEntry) {
    selectionStore.selectBrand(entry.brandID)
    selectionStore.selectCamera(entry.cameraID)
    showsPlanner = false
  }

  private func toggleComparison(_ itemID: UUID) {
    if comparisonItemIDs.contains(itemID) {
      comparisonItemIDs.remove(itemID)
    } else if comparisonItemIDs.count < 4 {
      comparisonItemIDs.insert(itemID)
    }
  }

  private func toggleFavorite(_ item: PlanItem) {
    do {
      try favoriteStore.toggle(item)
    } catch {
      showExportError(error)
    }
  }

  private func addFavoriteToProject(_ favorite: FavoriteRecordingMode) {
    guard var project = selectedProject else { return }
    let item = favorite.makePlanItem()
    project.items.append(item)
    project.touch()
    do {
      try projectStore.update(project)
      selectedItemID = item.id
    } catch {
      showExportError(error)
    }
  }

  private func removeFavorite(_ favorite: FavoriteRecordingMode) {
    do {
      try favoriteStore.remove(id: favorite.id)
    } catch {
      showExportError(error)
    }
  }

  @MainActor
  private func exportJSON() {
    guard let project = selectedProject,
      let url = DITPlanFilePanel.chooseSaveURL(
        defaultName: "\(project.name).json",
        contentType: .json
      )
    else { return }
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
      )
    else { return }
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
      )
    else { return }
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
    comparisonItemIDs.subtract(removedIDs)
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

  private func itemBinding<Value>(_ item: PlanItem, keyPath: WritableKeyPath<PlanItem, Value>)
    -> Binding<Value>
  {
    Binding(
      get: { (selectedItem ?? item)[keyPath: keyPath] },
      set: { value in
        guard var project = selectedProject,
          let index = project.items.firstIndex(where: { $0.id == item.id })
        else { return }
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
    DITProjectCalculator.summarize(project).itemSummaries.first { $0.itemID == item.id }?
      .storageBytes ?? 0
  }

  private func formatBytes(_ bytes: Double) -> String {
    guard bytes.isFinite, bytes >= 0, bytes <= Double(Int64.max) else { return "—" }
    let formatter = ByteCountFormatter()
    formatter.countStyle = .file
    formatter.allowsNonnumericFormatting = false
    return formatter.string(fromByteCount: Int64(bytes))
  }
}

private struct SummaryMetric: View {
  let title: String
  let value: String
  let systemImage: String
  let valueColor: Color

  init(title: String, value: String, systemImage: String, valueColor: Color = .primary) {
    self.title = title
    self.value = value
    self.systemImage = systemImage
    self.valueColor = valueColor
  }

  var body: some View {
    HStack(spacing: 10) {
      Image(systemName: systemImage)
        .font(.body)
        .foregroundColor(.secondary)
        .frame(width: 20)

      VStack(alignment: .leading, spacing: 3) {
        Text(title)
          .font(.caption)
          .foregroundColor(.secondary)
          .lineLimit(1)
        Text(value)
          .font(.headline)
          .foregroundColor(valueColor)
          .monospacedDigit()
          .lineLimit(1)
          .minimumScaleFactor(0.8)
      }

      Spacer(minLength: 4)
    }
    .padding(.horizontal, 18)
    .frame(minWidth: 150, maxWidth: .infinity, maxHeight: .infinity)
    .overlay(alignment: .trailing) {
      Divider()
        .padding(.vertical, 14)
    }
  }
}

private struct CameraPlanHeader: View {
  var body: some View {
    HStack(spacing: 12) {
      Text("机位")
        .frame(minWidth: 120, maxWidth: .infinity, alignment: .leading)
      Text("摄影机 / 编码")
        .frame(width: 165, alignment: .leading)
      Text("台数")
        .frame(width: 44, alignment: .trailing)
      Text("项目存储")
        .frame(width: 92, alignment: .trailing)
      Image(systemName: "rectangle.3.group")
        .frame(width: 24)
        .help("模式比较")
    }
    .font(.caption)
    .foregroundColor(.secondary)
  }
}

private struct CameraPlanRow: View {
  let item: PlanItem
  let storage: String
  let isCompared: Bool
  let comparisonDisabled: Bool
  let toggleComparison: () -> Void

  var body: some View {
    HStack(spacing: 12) {
      VStack(alignment: .leading, spacing: 2) {
        Text(item.name)
          .fontWeight(.medium)
          .lineLimit(1)
        Text(item.media.id)
          .font(.caption)
          .foregroundColor(.secondary)
          .lineLimit(1)
      }
      .frame(minWidth: 120, maxWidth: .infinity, alignment: .leading)

      VStack(alignment: .leading, spacing: 2) {
        Text(item.cameraLabel)
          .lineLimit(1)
        Text(item.selection.codecID)
          .font(.caption)
          .foregroundColor(.secondary)
          .lineLimit(1)
      }
      .frame(width: 165, alignment: .leading)

      Text("\(item.cameraCount)")
        .monospacedDigit()
        .frame(width: 44, alignment: .trailing)

      Text(storage)
        .monospacedDigit()
        .lineLimit(1)
        .minimumScaleFactor(0.8)
        .frame(width: 92, alignment: .trailing)

      Button(action: toggleComparison) {
        Image(systemName: isCompared ? "checkmark.circle.fill" : "circle")
      }
      .buttonStyle(.borderless)
      .disabled(comparisonDisabled)
      .frame(width: 24)
      .help(isCompared ? "移出比较" : "加入比较")
    }
    .padding(.vertical, 5)
  }
}

private struct InspectorSection<Content: View>: View {
  let title: String
  let systemImage: String
  let content: Content

  init(title: String, systemImage: String, @ViewBuilder content: () -> Content) {
    self.title = title
    self.systemImage = systemImage
    self.content = content()
  }

  var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      Label(title, systemImage: systemImage)
        .font(.headline)
      content
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding(.bottom, 2)
    .overlay(alignment: .bottom) {
      Divider()
        .offset(y: 10)
    }
  }
}

private struct InspectorControlRow<Content: View>: View {
  let label: String
  let content: Content

  init(label: String, @ViewBuilder content: () -> Content) {
    self.label = label
    self.content = content()
  }

  var body: some View {
    HStack(alignment: .center, spacing: 12) {
      Text(label)
        .foregroundColor(.secondary)
        .lineLimit(1)
      Spacer(minLength: 8)
      content
    }
  }
}

private struct InspectorSliderRow: View {
  let label: String
  @Binding var value: Double
  let range: ClosedRange<Double>
  let displayValue: String

  var body: some View {
    VStack(alignment: .leading, spacing: 6) {
      HStack {
        Text(label)
          .foregroundColor(.secondary)
        Spacer()
        Text(displayValue)
          .monospacedDigit()
      }
      Slider(value: $value, in: range)
    }
  }
}

private struct InspectorRow: View {
  let label: String
  let value: String
  let emphasized: Bool

  init(label: String, value: String, emphasized: Bool = false) {
    self.label = label
    self.value = value
    self.emphasized = emphasized
  }

  var body: some View {
    HStack(alignment: .firstTextBaseline) {
      Text(label)
        .foregroundColor(.secondary)
        .lineLimit(1)
      Spacer(minLength: 12)
      Text(value)
        .fontWeight(emphasized ? .semibold : .regular)
        .monospacedDigit()
        .multilineTextAlignment(.trailing)
        .lineLimit(1)
        .minimumScaleFactor(0.8)
    }
  }
}
