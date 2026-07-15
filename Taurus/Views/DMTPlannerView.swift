import SwiftUI
import UniformTypeIdentifiers

struct DMTPlannerView: View {
  @ObservedObject var projectStore: DMTProjectStore
  @ObservedObject var favoriteStore: DMTFavoriteStore
  let language: AppLanguage

  @State private var selectedProjectID: UUID?
  @State private var selectedItemID: UUID?
  @State private var comparisonItemIDs: Set<UUID> = []
  @AppStorage("dmtPlanner.nameColumnWidth") private var tableNameColumnWidth = 170.0
  @AppStorage("dmtPlanner.cameraColumnWidth") private var tableCameraColumnWidth = 220.0
  @AppStorage("dmtPlanner.countColumnWidth") private var tableCountColumnWidth = 52.0
  @AppStorage("dmtPlanner.storageColumnWidth") private var tableStorageColumnWidth = 112.0
  @AppStorage("dmtPlanner.comparisonColumnWidth") private var tableComparisonColumnWidth = 28.0
  @State private var showsAddItem = false
  @State private var editingItem: PlanItem?
  @State private var showsComparison = false
  @State private var exportErrorMessage = ""
  @State private var showsExportError = false

  private var copy: DMTPlannerCopy { language.copy.dmtPlanner }

  private var selectedProject: DMTProject? {
    guard let selectedProjectID else { return nil }
    return projectStore.projects.first { $0.id == selectedProjectID }
  }

  private var selectedItem: PlanItem? {
    guard let selectedItemID else { return nil }
    return selectedProject?.items.first { $0.id == selectedItemID }
  }

  private var selectedItemSummary: PlanItemSummary? {
    guard let selectedItemID, let project = selectedProject else { return nil }
    return DMTProjectCalculator.summarize(project)
      .itemSummaries.first { $0.itemID == selectedItemID }
  }

  private var tableColumnWidths: PlannerTableColumnWidths {
    PlannerTableColumnWidths(
      name: CGFloat(tableNameColumnWidth),
      camera: CGFloat(tableCameraColumnWidth),
      count: CGFloat(tableCountColumnWidth),
      storage: CGFloat(tableStorageColumnWidth),
      comparison: CGFloat(tableComparisonColumnWidth)
    )
  }

  private var tableColumnWidthsBinding: Binding<PlannerTableColumnWidths> {
    Binding(
      get: { tableColumnWidths },
      set: { widths in
        tableNameColumnWidth = Double(widths.name)
        tableCameraColumnWidth = Double(widths.camera)
        tableCountColumnWidth = Double(widths.count)
        tableStorageColumnWidth = Double(widths.storage)
        tableComparisonColumnWidth = Double(widths.comparison)
      }
    )
  }

  var body: some View {
    HStack(spacing: 0) {
      projectSidebar
        .frame(minWidth: 180, idealWidth: 210, maxWidth: 250)

      Divider()

      if let project = selectedProject {
        projectWorkspace(project)
      } else {
        emptyState(
          title: copy.text("暂无项目"),
          systemImage: "rectangle.3.group",
          message: copy.text("新建一个项目开始多机位规划")
        )
          .frame(maxWidth: .infinity, maxHeight: .infinity)
      }
    }
    .onAppear(perform: selectInitialProject)
    .onChange(of: selectedProjectID) { _ in
      selectedItemID = nil
      comparisonItemIDs.removeAll()
    }
    .alert(copy.text("操作失败"), isPresented: $showsExportError) {
      Button(copy.text("好"), role: .cancel) {}
    } message: {
      Text(exportErrorMessage)
    }
    .sheet(isPresented: $showsAddItem) {
      DMTAddPlanItemView(language: language) { item in
        addPlanItem(item)
      }
    }
    .sheet(item: $editingItem) { item in
      DMTAddPlanItemView(existingItem: item, language: language) { updatedItem in
        updatePlanItem(updatedItem)
      }
    }
    .sheet(isPresented: $showsComparison) {
      if let project = selectedProject {
        DMTModeComparisonView(project: project, itemIDs: comparisonItemIDs, language: language)
      }
    }
  }

  private var projectSidebar: some View {
    VStack(spacing: 0) {
      HStack {
        Text(copy.text("项目"))
          .font(.headline)
        Spacer()
        Button(action: createProject) {
          Image(systemName: "plus")
        }
        .buttonStyle(.borderless)
        .help(copy.text("新建项目"))
      }
      .padding(.horizontal, 12)
      .padding(.vertical, 10)

      List(selection: $selectedProjectID) {
        Section(copy.text("项目与方案")) {
          ForEach(projectStore.projects) { project in
            VStack(alignment: .leading, spacing: 2) {
              Text(projectDisplayName(project))
                .lineLimit(1)
              Text(copy.itemCount(project.items.count))
                .font(.caption)
                .foregroundColor(.secondary)
            }
            .tag(Optional(project.id))
            .contextMenu {
              Button(copy.text("复制方案")) { duplicate(project) }
              Button(copy.text("删除项目"), role: .destructive) { delete(project) }
            }
          }
        }

        Section(copy.text("收藏模式")) {
          if favoriteStore.favorites.isEmpty {
            Text(copy.text("暂无收藏"))
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
                Button(copy.text("添加到当前项目")) { addFavoriteToProject(favorite) }
                Button(copy.text("删除收藏"), role: .destructive) { removeFavorite(favorite) }
              }
            }
          }
        }
      }
      .listStyle(.sidebar)

      HStack {
        Button(copy.text("复制方案")) {
          if let project = selectedProject { duplicate(project) }
        }
        .disabled(selectedProject == nil)
        Spacer()
        Button(copy.text("删除"), role: .destructive) {
          if let project = selectedProject { delete(project) }
        }
        .disabled(selectedProject == nil)
      }
      .padding(10)
    }
  }

  private func projectWorkspace(_ project: DMTProject) -> some View {
    let summary = DMTProjectCalculator.summarize(project)

    return VStack(alignment: .leading, spacing: 0) {
      HStack(spacing: 10) {
        TextField(copy.text("项目名称"), text: projectNameBinding(project))
          .textFieldStyle(.roundedBorder)
          .font(.headline)
          .frame(minWidth: 180, idealWidth: 240, maxWidth: 280)

        Label(copy.itemCount(project.items.count), systemImage: "video")
          .font(.callout)
          .foregroundColor(.secondary)

        Spacer(minLength: 20)

        Button(action: { showsComparison = true }) {
          Image(systemName: "rectangle.3.group")
        }
        .disabled(!(2...4).contains(comparisonItemIDs.count))
        .help(copy.text("比较已勾选的 2 至 4 个模式"))
        .accessibilityLabel(copy.text("模式比较"))

        Menu {
          Button(copy.text("导出 JSON")) { exportJSON() }
          Button(copy.text("导出 CSV")) { exportCSV() }
          Button(copy.text("导出 PDF")) { exportPDF() }
        } label: {
          Image(systemName: "square.and.arrow.up")
        }
        .help(copy.text("导出项目"))
        .accessibilityLabel(copy.text("导出项目"))

        Button(action: importJSON) {
          Image(systemName: "square.and.arrow.down")
        }
        .help(copy.text("导入项目 JSON"))
        .accessibilityLabel(copy.text("导入项目 JSON"))
      }
      .controlSize(.large)
      .padding(.horizontal, 18)
      .padding(.vertical, 14)

      Divider()

      HStack(spacing: 0) {
        SummaryMetric(
          title: copy.text("每日原始量"),
          value: formatBytes(summary.dailyRawDataBytes),
          systemImage: "sun.max"
        )
        SummaryMetric(
          title: copy.text("项目原始量"),
          value: formatBytes(summary.totalRawDataBytes),
          systemImage: "calendar"
        )
        SummaryMetric(
          title: copy.text("备份后存储"),
          value: formatBytes(summary.totalStorageBytes),
          systemImage: "externaldrive.badge.plus"
        )
        SummaryMetric(
          title: copy.text("每日双备份"),
          value: copy.text(summary.canCompleteDailyDoubleBackup ? "可完成" : "需调整"),
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

  private func cameraPlan(_ project: DMTProject) -> some View {
    GeometryReader { proxy in
      let availableWidth = max(0, proxy.size.width - 36)
      let resolvedColumnWidths = tableColumnWidths.resolved(for: availableWidth)

      VStack(alignment: .leading, spacing: 0) {
        HStack(alignment: .firstTextBaseline) {
          Text(copy.text("机位规划"))
            .font(.title3)
            .fontWeight(.semibold)
          Text(copy.text("选择机位后在右侧调整参数"))
            .font(.caption)
            .foregroundColor(.secondary)
          Spacer()
          if !comparisonItemIDs.isEmpty {
            Text(copy.selectedModes(comparisonItemIDs.count))
              .font(.caption)
              .foregroundColor(.secondary)
          }
        }
        .padding(.horizontal, 18)
        .padding(.top, 18)
        .padding(.bottom, 14)

        CameraPlanHeader(
          widths: tableColumnWidthsBinding,
          availableWidth: availableWidth,
          copy: copy
        )
        .padding(.horizontal, 18)
        .padding(.bottom, 6)

        Divider()

        if project.items.isEmpty {
          emptyState(
            title: copy.text("尚未添加机位"),
            systemImage: "video.badge.plus",
            message: copy.text("从下方选择摄影机和录制模式")
          )
          .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else {
          List(selection: $selectedItemID) {
            ForEach(project.items) { item in
              CameraPlanRow(
                item: item,
                widths: resolvedColumnWidths,
                storage: formatBytes(itemStorage(project: project, item: item)),
                isCompared: comparisonItemIDs.contains(item.id),
                comparisonDisabled: !comparisonItemIDs.contains(item.id)
                  && comparisonItemIDs.count >= 4,
                copy: copy,
                toggleComparison: { toggleComparison(item.id) }
              )
              .tag(Optional(item.id))
              .contextMenu {
                Button {
                  duplicatePlanItem(item)
                } label: {
                  Label(copy.text("复制机位"), systemImage: "plus.square.on.square")
                }
                Button {
                  movePlanItem(item, by: -1)
                } label: {
                  Label(copy.text("上移"), systemImage: "arrow.up")
                }
                .disabled(!canMovePlanItem(item, by: -1))
                Button {
                  movePlanItem(item, by: 1)
                } label: {
                  Label(copy.text("下移"), systemImage: "arrow.down")
                }
                .disabled(!canMovePlanItem(item, by: 1))
                Divider()
                Button(copy.text(comparisonItemIDs.contains(item.id) ? "移出比较" : "加入比较")) {
                  toggleComparison(item.id)
                }
                .disabled(!comparisonItemIDs.contains(item.id) && comparisonItemIDs.count >= 4)
                Button(copy.text(favoriteStore.contains(item) ? "取消收藏" : "收藏模式")) {
                  toggleFavorite(item)
                }
                Divider()
                Button {
                  resetPlanningParameters(item)
                } label: {
                  Label(copy.text("重置拍摄参数"), systemImage: "arrow.counterclockwise")
                }
                Divider()
                Button(role: .destructive) {
                  deletePlanItem(item)
                } label: {
                  Label(copy.text("删除机位"), systemImage: "trash")
                }
              }
            }
            .onDelete(perform: deleteItems)
            .onMove(perform: moveItems)
          }
          .listStyle(.inset)
        }

        Divider()

        HStack(spacing: 12) {
          Image(systemName: "plus.circle")
            .foregroundColor(.accentColor)
          Text(copy.text("为项目添加一个新的摄影机录制模式"))
            .font(.callout)
            .foregroundColor(.secondary)
          Spacer()
          Button {
            showsAddItem = true
          } label: {
            Label(copy.text("添加机位"), systemImage: "plus")
          }
          .buttonStyle(.borderedProminent)
          .controlSize(.large)
        }
        .padding(.horizontal, 18)
        .padding(.vertical, 14)
      }
    }
  }

  @ViewBuilder
  private var inspector: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 18) {
        Text(copy.text("机位检查器"))
          .font(.title3)
          .fontWeight(.semibold)

        if let item = selectedItem {
          InspectorSection(title: copy.text("录制模式"), systemImage: "video") {
            VStack(spacing: 8) {
              InspectorRow(label: copy.text("摄影机"), value: item.cameraLabel)
              InspectorRow(label: copy.text("编码"), value: item.selection.codecID)
              if let formatID = item.selection.formatID {
                InspectorRow(label: copy.text("幅面"), value: formatID)
              }
              InspectorRow(label: copy.text("格式"), value: item.selection.resolutionID)
              InspectorRow(label: copy.text("帧率"), value: item.selection.frameRateID)
              InspectorRow(
                label: copy.text(item.usesHDE ? "HDE 数据码率" : "码率"),
                value:
                  "\(formatNumber(item.bitrateMbps * (item.hdeDataPerHourMultiplier ?? 1))) Mbps"
              )
              InspectorRow(label: copy.text("介质"), value: item.media.id)

              if let multiplier = ARRIHDE.multiplier(for: item.selection) {
                HStack(alignment: .center, spacing: 10) {
                  VStack(alignment: .leading, spacing: 2) {
                    Text(copy.text("使用 HDE 无损压缩"))
                    Text(copy.hdeDataDescription(percent: formatNumber(multiplier * 100)))
                      .font(.caption)
                      .foregroundColor(.secondary)
                  }
                  Spacer(minLength: 8)
                  Toggle("", isOn: hdeBinding(item, multiplier: multiplier))
                    .labelsHidden()
                    .toggleStyle(.switch)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 4)
              }

              Button {
                editingItem = item
              } label: {
                Label(copy.text("修改录制模式"), systemImage: "pencil")
              }
              .buttonStyle(.bordered)
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding(.top, 4)
            }
          }

          HStack(spacing: 8) {
            Button {
              toggleFavorite(item)
            } label: {
              Label(
                copy.text(favoriteStore.contains(item) ? "取消收藏" : "收藏模式"),
                systemImage: favoriteStore.contains(item) ? "star.fill" : "star"
              )
            }
            .buttonStyle(.bordered)

            Button {
              duplicatePlanItem(item)
            } label: {
              Label(copy.text("复制机位"), systemImage: "plus.square.on.square")
            }
            .buttonStyle(.bordered)
          }

          InspectorSection(title: copy.text("拍摄参数"), systemImage: "slider.horizontal.3") {
            VStack(spacing: 12) {
              InspectorControlRow(label: copy.text("机位名称")) {
                TextField(copy.text("机位名称"), text: itemBinding(item, keyPath: \.name))
                  .textFieldStyle(.roundedBorder)
                  .multilineTextAlignment(.center)
                  .frame(width: InspectorNumberFieldRow.controlWidth)
              }
              InspectorControlRow(label: copy.text("机位备注")) {
                TextField(copy.text("主机位、斯坦尼康等"), text: itemPositionNoteBinding(item))
                  .textFieldStyle(.roundedBorder)
                  .multilineTextAlignment(.center)
                  .frame(width: InspectorNumberFieldRow.controlWidth)
              }
              InspectorNumberFieldRow(
                label: copy.text("摄影机数量"),
                value: integerItemBinding(item, keyPath: \.cameraCount),
                range: 1...99,
                fractionDigits: 0,
                unit: copy.text("台")
              )
              InspectorNumberFieldRow(
                label: copy.text("每日开机"),
                value: itemBinding(item, keyPath: \.dailyPowerOnHours),
                range: 0.5...24,
                fractionDigits: 2,
                unit: copy.text("小时")
              )
              InspectorNumberFieldRow(
                label: copy.text("拍摄天数"),
                value: itemBinding(item, keyPath: \.shootDays),
                range: 0.5...365,
                fractionDigits: 2,
                unit: copy.text("天")
              )
              InspectorNumberFieldRow(
                label: copy.text("保留副本"),
                value: integerItemBinding(item, keyPath: \.backupCopies),
                range: 1...5,
                fractionDigits: 0,
                unit: copy.text("份")
              )
              InspectorSliderRow(
                label: copy.text("实际录制比例"),
                value: itemBinding(item, keyPath: \.recordingRatio),
                range: 0.05...1
              )
              InspectorSliderRow(
                label: copy.text("安全余量"),
                value: itemBinding(item, keyPath: \.safetyMargin),
                range: 0...1
              )
            }
          }

          if let summary = selectedItemSummary {
            InspectorSection(title: copy.text("规划结果"), systemImage: "chart.bar") {
              VStack(spacing: 8) {
                InspectorRow(
                  label: copy.text("单机每日"),
                  value: formatBytes(summary.rawDataPerCameraPerDayBytes)
                )
                InspectorRow(label: copy.text("全部每日"), value: formatBytes(summary.rawDataPerDayBytes))
                InspectorRow(
                  label: copy.text("单机全项目"),
                  value: formatBytes(summary.rawDataPerCameraProjectBytes)
                )
                InspectorRow(label: copy.text("项目原始量"), value: formatBytes(summary.rawDataBytes))
                InspectorRow(
                  label: copy.text("备份后存储"),
                  value: formatBytes(summary.storageBytes),
                  emphasized: true
                )
                InspectorRow(
                  label: copy.text("卡次"),
                  value: "\(summary.cardCycles) \(copy.text("次"))"
                )
                InspectorRow(
                  label: copy.text("读卡器"),
                  value: "\(formatNumber(summary.readerSpeedMBps)) MB/s"
                )
                InspectorRow(
                  label: copy.text("有效速度"),
                  value: "\(formatNumber(summary.effectiveTransferSpeedMBps)) MB/s"
                )
                InspectorRow(
                  label: copy.text("每张卡时长"),
                  value: "\(formatNumber(summary.recordMinutesPerMedia)) \(copy.text("分钟"))"
                )
                InspectorRow(
                  label: copy.text("卸载时间"),
                  value: "\(formatNumber(summary.transferSeconds / 3_600)) \(copy.text("小时"))"
                )
              }
            }
          }
        } else {
          VStack(spacing: 8) {
            Image(systemName: "sidebar.right")
              .font(.title2)
              .foregroundColor(.secondary)
            Text(copy.text("选择一个机位"))
              .font(.headline)
            Text(copy.text("录制模式、拍摄参数与规划结果将在这里显示"))
              .font(.caption)
              .foregroundColor(.secondary)
              .multilineTextAlignment(.center)
          }
          .frame(maxWidth: .infinity)
          .padding(.vertical, 24)
        }

        if let project = selectedProject {
          InspectorSection(
            title: copy.text("传输配置"),
            systemImage: "externaldrive.connected.to.line.below"
          ) {
            VStack(spacing: 12) {
              if let item = selectedItem {
                InspectorNumberFieldRow(
                  label: copy.text("读卡器"),
                  value: itemReaderSpeedBinding(item),
                  range: 10...10_000,
                  fractionDigits: 2,
                  unit: "MB/s"
                )
              }
              InspectorNumberFieldRow(
                label: copy.text("目标盘"),
                value: transferBinding(project, keyPath: \.targetDiskSpeedMBps),
                range: 10...10_000,
                fractionDigits: 2,
                unit: "MB/s"
              )
              InspectorNumberFieldRow(
                label: copy.text("每日窗口"),
                value: transferBinding(project, keyPath: \.offloadWindowHoursPerDay),
                range: 0.5...24,
                fractionDigits: 2,
                unit: copy.text("小时")
              )
            }
          }
        }
      }
      .padding(18)
    }
    .background(Color(nsColor: .windowBackgroundColor))
  }

  private func addPlanItem(_ item: PlanItem) {
    guard var project = selectedProject else { return }
    project.items.append(item)
    project.touch()
    do {
      try projectStore.update(project)
      selectedItemID = item.id
    } catch {
      showExportError(error)
    }
  }

  private func duplicatePlanItem(_ item: PlanItem) {
    guard var project = selectedProject else { return }
    let copy = item.duplicated()
    project.items.append(copy)
    project.touch()
    do {
      try projectStore.update(project)
      selectedItemID = copy.id
    } catch {
      showExportError(error)
    }
  }

  private func updatePlanItem(_ item: PlanItem) {
    guard var project = selectedProject,
      let index = project.items.firstIndex(where: { $0.id == item.id })
    else { return }

    project.items[index] = item
    project.touch()
    do {
      try projectStore.update(project)
      selectedItemID = item.id
    } catch {
      showExportError(error)
    }
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

  private func resetPlanningParameters(_ item: PlanItem) {
    guard var project = selectedProject,
      let index = project.items.firstIndex(where: { $0.id == item.id })
    else { return }

    project.items[index].resetPlanningParameters()
    project.touch()
    do {
      try projectStore.update(project)
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
      let url = DMTPlanFilePanel.chooseSaveURL(
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
      let url = DMTPlanFilePanel.chooseSaveURL(
        defaultName: "\(project.name).csv",
        contentType: .commaSeparatedText
      )
    else { return }
    do {
      try DMTPlanExport.csvData(for: project).write(to: url, options: .atomic)
    } catch {
      showExportError(error)
    }
  }

  @MainActor
  private func exportPDF() {
    guard let project = selectedProject,
      let url = DMTPlanFilePanel.chooseSaveURL(
        defaultName: "\(project.name).pdf",
        contentType: .pdf
      )
    else { return }
    do {
      try DMTPlanExport.pdfData(for: project).write(to: url, options: .atomic)
    } catch {
      showExportError(error)
    }
  }

  @MainActor
  private func importJSON() {
    guard let url = DMTPlanFilePanel.chooseOpenURL() else { return }
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
    if let project = try? projectStore.add(DMTProject()) {
      selectedProjectID = project.id
    }
  }

  private func duplicate(_ project: DMTProject) {
    if let copy = try? projectStore.duplicate(project) { selectedProjectID = copy.id }
  }

  private func delete(_ project: DMTProject) {
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

  private func deletePlanItem(_ item: PlanItem) {
    guard let index = selectedProject?.items.firstIndex(where: { $0.id == item.id }) else {
      return
    }
    deleteItems(at: IndexSet(integer: index))
  }

  private func moveItems(from offsets: IndexSet, to destination: Int) {
    guard var project = selectedProject,
      project.movePlanItems(fromOffsets: offsets, toOffset: destination)
    else { return }
    do {
      try projectStore.update(project)
    } catch {
      showExportError(error)
    }
  }

  private func movePlanItem(_ item: PlanItem, by offset: Int) {
    guard var project = selectedProject,
      project.movePlanItem(id: item.id, by: offset)
    else { return }
    do {
      try projectStore.update(project)
    } catch {
      showExportError(error)
    }
  }

  private func canMovePlanItem(_ item: PlanItem, by offset: Int) -> Bool {
    guard let items = selectedProject?.items,
      let index = items.firstIndex(where: { $0.id == item.id })
    else { return false }
    return items.indices.contains(index + offset)
  }

  private func projectNameBinding(_ project: DMTProject) -> Binding<String> {
    Binding(
      get: {
        let name = projectStore.projects.first { $0.id == project.id }?.name ?? ""
        return name.isEmpty || name == "未命名项目" ? copy.text("未命名项目") : name
      },
      set: { value in
        var updated = projectStore.projects.first { $0.id == project.id } ?? project
        updated.name = value
        updated.touch()
        try? projectStore.update(updated)
      }
    )
  }

  private func projectDisplayName(_ project: DMTProject) -> String {
    let name = project.name.trimmingCharacters(in: .whitespacesAndNewlines)
    return name.isEmpty || name == "未命名项目" ? copy.text("未命名项目") : name
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

  private func hdeBinding(_ item: PlanItem, multiplier: Double) -> Binding<Bool> {
    Binding(
      get: { (selectedItem ?? item).hdeDataPerHourMultiplier != nil },
      set: { enabled in
        guard var project = selectedProject,
          let index = project.items.firstIndex(where: { $0.id == item.id })
        else { return }
        project.items[index].hdeDataPerHourMultiplier = enabled ? multiplier : nil
        project.touch()
        try? projectStore.update(project)
      }
    )
  }

  private func integerItemBinding(
    _ item: PlanItem,
    keyPath: WritableKeyPath<PlanItem, Int>
  ) -> Binding<Double> {
    let binding = itemBinding(item, keyPath: keyPath)
    return Binding(
      get: { Double(binding.wrappedValue) },
      set: { binding.wrappedValue = Int($0.rounded()) }
    )
  }

  private func itemPositionNoteBinding(_ item: PlanItem) -> Binding<String> {
    Binding(
      get: { (selectedItem ?? item).positionNote ?? "" },
      set: { value in
        guard var project = selectedProject,
          let index = project.items.firstIndex(where: { $0.id == item.id })
        else { return }
        project.items[index].positionNote = value.isEmpty ? nil : value
        project.touch()
        try? projectStore.update(project)
      }
    )
  }

  private func transferBinding(
    _ project: DMTProject,
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

  private func itemReaderSpeedBinding(_ item: PlanItem) -> Binding<Double> {
    Binding(
      get: {
        (selectedItem ?? item).readerSpeedMBps ?? DMTPlanItemDefaults.readerSpeedMBps
      },
      set: { value in
        guard var project = selectedProject,
          let index = project.items.firstIndex(where: { $0.id == item.id })
        else { return }
        project.items[index].readerSpeedMBps = value
        project.touch()
        try? projectStore.update(project)
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

  private func itemStorage(project: DMTProject, item: PlanItem) -> Double {
    DMTProjectCalculator.summarize(project).itemSummaries.first { $0.itemID == item.id }?
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

struct PlannerTableColumnWidths: Equatable {
  var name: CGFloat = 170
  var camera: CGFloat = 220
  var count: CGFloat = 52
  var storage: CGFloat = 112
  var comparison: CGFloat = 28

  static let columnGap: CGFloat = 12
  static let headerHeight: CGFloat = 30
  static let minimumName: CGFloat = 120
  static let minimumCamera: CGFloat = 155
  static let minimumCount: CGFloat = 44
  static let minimumStorage: CGFloat = 88
  static let minimumComparison: CGFloat = 24

  var totalWidth: CGFloat {
    name + camera + count + storage + comparison + Self.columnGap * 4
  }

  func resolved(for availableWidth: CGFloat) -> Self {
    var resolved = self
    let extraWidth = availableWidth - totalWidth

    if extraWidth >= 0 {
      resolved.name += extraWidth
      return resolved
    }

    var deficit = -extraWidth
    let nameReduction = min(deficit, max(0, resolved.name - Self.minimumName))
    resolved.name -= nameReduction
    deficit -= nameReduction

    let cameraReduction = min(deficit, max(0, resolved.camera - Self.minimumCamera))
    resolved.camera -= cameraReduction
    deficit -= cameraReduction

    let storageReduction = min(deficit, max(0, resolved.storage - Self.minimumStorage))
    resolved.storage -= storageReduction
    deficit -= storageReduction

    let countReduction = min(deficit, max(0, resolved.count - Self.minimumCount))
    resolved.count -= countReduction
    deficit -= countReduction

    if deficit > 0 {
      resolved.comparison = max(Self.minimumComparison, resolved.comparison - deficit)
    }
    return resolved
  }

  mutating func adjust(_ boundary: PlannerTableColumnBoundary, by delta: CGFloat) {
    switch boundary {
    case .nameCamera:
      let change = clampedChange(
        delta,
        left: name,
        leftMinimum: Self.minimumName,
        right: camera,
        rightMinimum: Self.minimumCamera
      )
      name += change
      camera -= change
    case .cameraCount:
      let change = clampedChange(
        delta,
        left: camera,
        leftMinimum: Self.minimumCamera,
        right: count,
        rightMinimum: Self.minimumCount
      )
      camera += change
      count -= change
    case .countStorage:
      let change = clampedChange(
        delta,
        left: count,
        leftMinimum: Self.minimumCount,
        right: storage,
        rightMinimum: Self.minimumStorage
      )
      count += change
      storage -= change
    case .storageComparison:
      let change = clampedChange(
        delta,
        left: storage,
        leftMinimum: Self.minimumStorage,
        right: comparison,
        rightMinimum: Self.minimumComparison
      )
      storage += change
      comparison -= change
    }
  }

  private func clampedChange(
    _ delta: CGFloat,
    left: CGFloat,
    leftMinimum: CGFloat,
    right: CGFloat,
    rightMinimum: CGFloat
  ) -> CGFloat {
    min(
      max(delta, -(left - leftMinimum)),
      right - rightMinimum
    )
  }
}

enum PlannerTableColumnBoundary {
  case nameCamera
  case cameraCount
  case countStorage
  case storageComparison
}

private struct CameraPlanHeader: View {
  @Binding var widths: PlannerTableColumnWidths
  let availableWidth: CGFloat
  let copy: DMTPlannerCopy

  private var resolvedWidths: PlannerTableColumnWidths {
    widths.resolved(for: availableWidth)
  }

  var body: some View {
    HStack(spacing: 0) {
      Text(copy.text("机位"))
        .frame(width: resolvedWidths.name, alignment: .center)
      PlannerColumnResizeGap(
        widths: $widths,
        resolvedWidths: resolvedWidths,
        boundary: .nameCamera,
        copy: copy
      )
      Text("\(copy.text("摄影机")) / \(copy.text("编码"))")
        .frame(width: resolvedWidths.camera, alignment: .center)
      PlannerColumnResizeGap(
        widths: $widths,
        resolvedWidths: resolvedWidths,
        boundary: .cameraCount,
        copy: copy
      )
      Text(copy.text("台数"))
        .frame(width: resolvedWidths.count, alignment: .center)
      PlannerColumnResizeGap(
        widths: $widths,
        resolvedWidths: resolvedWidths,
        boundary: .countStorage,
        copy: copy
      )
      Text(copy.text("项目存储"))
        .frame(width: resolvedWidths.storage, alignment: .center)
      PlannerColumnResizeGap(
        widths: $widths,
        resolvedWidths: resolvedWidths,
        boundary: .storageComparison,
        copy: copy
      )
      Image(systemName: "rectangle.3.group")
        .frame(width: resolvedWidths.comparison)
        .help(copy.text("模式比较"))
      Spacer(minLength: 0)
    }
    .font(.caption)
    .foregroundColor(.secondary)
    .frame(height: PlannerTableColumnWidths.headerHeight)
  }
}

private struct PlannerColumnResizeGap: View {
  @Binding var widths: PlannerTableColumnWidths
  let resolvedWidths: PlannerTableColumnWidths
  let boundary: PlannerTableColumnBoundary
  let copy: DMTPlannerCopy

  @State private var dragStartWidths: PlannerTableColumnWidths?
  @State private var isHovered = false

  var body: some View {
    ZStack {
      Color.clear
      Rectangle()
        .fill(isHovered ? Color.accentColor : Color.secondary.opacity(0.28))
        .frame(width: 1)
    }
    .frame(
      width: PlannerTableColumnWidths.columnGap,
      height: PlannerTableColumnWidths.headerHeight
    )
    .contentShape(Rectangle())
    .onHover { isHovered = $0 }
    .gesture(
      DragGesture(minimumDistance: 1)
        .onChanged { value in
          if dragStartWidths == nil {
            dragStartWidths = resolvedWidths
          }
          guard let dragStartWidths else { return }
          var updatedWidths = dragStartWidths
          updatedWidths.adjust(boundary, by: value.translation.width)
          widths = updatedWidths
        }
        .onEnded { _ in
          dragStartWidths = nil
        }
    )
    .accessibilityElement()
    .accessibilityLabel(copy.text("调整列宽"))
    .help(copy.text("拖动调整列宽"))
  }
}

private struct CameraPlanRow: View {
  let item: PlanItem
  let widths: PlannerTableColumnWidths
  let storage: String
  let isCompared: Bool
  let comparisonDisabled: Bool
  let copy: DMTPlannerCopy
  let toggleComparison: () -> Void

  var body: some View {
    HStack(spacing: 0) {
      VStack(spacing: 2) {
        Text(item.name)
          .fontWeight(.medium)
          .lineLimit(1)
          .truncationMode(.middle)
        if !positionNote.isEmpty {
          Text(positionNote)
            .font(.caption)
            .foregroundColor(.secondary)
            .lineLimit(1)
            .truncationMode(.middle)
        }
      }
      .multilineTextAlignment(.center)
      .frame(width: widths.name, alignment: .center)

      Color.clear
        .frame(width: PlannerTableColumnWidths.columnGap)

      VStack(alignment: .leading, spacing: 2) {
        Text(item.cameraLabel)
          .lineLimit(1)
          .truncationMode(.middle)
        Text("\(item.selection.codecID)·\(item.media.id)")
          .font(.caption)
          .foregroundColor(.secondary)
          .lineLimit(1)
          .truncationMode(.middle)
      }
      .frame(width: widths.camera, alignment: .leading)

      Color.clear
        .frame(width: PlannerTableColumnWidths.columnGap)

      Text("\(item.cameraCount)")
        .monospacedDigit()
        .frame(width: widths.count, alignment: .center)

      Color.clear
        .frame(width: PlannerTableColumnWidths.columnGap)

      Text(storage)
        .monospacedDigit()
        .lineLimit(1)
        .minimumScaleFactor(0.8)
        .frame(width: widths.storage, alignment: .trailing)

      Color.clear
        .frame(width: PlannerTableColumnWidths.columnGap)

      Button(action: toggleComparison) {
        Image(systemName: isCompared ? "checkmark.circle.fill" : "circle")
      }
      .buttonStyle(.borderless)
      .disabled(comparisonDisabled)
      .frame(width: widths.comparison)
      .help(copy.text(isCompared ? "移出比较" : "加入比较"))

      Spacer(minLength: 0)
    }
    .padding(.vertical, 5)
  }

  private var positionNote: String {
    (item.positionNote ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
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
    HStack(alignment: .center, spacing: 8) {
      Text(label)
        .foregroundColor(.secondary)
        .lineLimit(1)
      Spacer(minLength: 0)
      content
    }
  }
}

private struct InspectorNumberFieldRow: View {
  static let controlWidth: CGFloat = 166
  private static let numberFieldWidth: CGFloat = 128
  private static let unitWidth: CGFloat = 36
  private static let unitSpacing: CGFloat = 2

  let label: String
  @Binding var value: Double
  let range: ClosedRange<Double>
  let fractionDigits: Int
  let unit: String

  var body: some View {
    HStack(spacing: 8) {
      Text(label)
        .foregroundColor(.secondary)
      Spacer(minLength: 0)
      HStack(spacing: Self.unitSpacing) {
        NonnegativeNumberField(
          value: $value,
          range: range,
          fractionDigits: fractionDigits
        )
        .frame(width: Self.numberFieldWidth)

        Text(unit)
          .foregroundColor(.secondary)
          .lineLimit(1)
          .minimumScaleFactor(0.75)
          .frame(width: Self.unitWidth, alignment: .trailing)
      }
      .frame(width: Self.controlWidth, alignment: .trailing)
    }
  }
}

private struct InspectorSliderRow: View {
  let label: String
  @Binding var value: Double
  let range: ClosedRange<Double>

  private var percentageBinding: Binding<Double> {
    Binding(
      get: { value * 100 },
      set: { value = $0 / 100 }
    )
  }

  var body: some View {
    VStack(alignment: .leading, spacing: 6) {
      HStack {
        Text(label)
          .foregroundColor(.secondary)
        Spacer()
        HStack(spacing: 4) {
          NonnegativeNumberField(
            value: percentageBinding,
            range: (range.lowerBound * 100)...(range.upperBound * 100),
            fractionDigits: 0
          )
          .frame(width: 64)
          Text("%")
            .foregroundColor(.secondary)
        }
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
