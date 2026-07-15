import SwiftUI

enum DITPlanItemBuilder {
  static func make(
    from selectionStore: CameraSelectionStore,
    name: String,
    usesHDE: Bool = false
  ) -> PlanItem? {
    guard case .success(let metrics) = RecordingCalculator.calculate(selectionStore) else {
      return nil
    }

    let capacityGB = MediaCapacity(cameradata: selectionStore)
    let capacityBytes = capacityGB * 1_000_000_000
    guard capacityBytes.isFinite, capacityBytes > 0 else { return nil }

    let trimmedName = name.trimmingCharacters(in: .whitespacesAndNewlines)
    let itemName = trimmedName.isEmpty ? selectionStore.CameraName : trimmedName
    guard itemName != CameraSelectionStore.cameraPlaceholder else { return nil }

    let selection = CameraSelection(selectionStore: selectionStore)
    let hdeMultiplier = usesHDE ? ARRIHDE.multiplier(for: selection) : nil

    return PlanItem(
      name: itemName,
      selection: selection,
      bitrateMbps: metrics.bitrateMbps,
      media: MediaSpec(id: selectionStore.Media, usableCapacityBytes: capacityBytes),
      hdeDataPerHourMultiplier: hdeMultiplier
    )
  }

  static func replacingRecordingMode(of existingItem: PlanItem, with draftItem: PlanItem)
    -> PlanItem
  {
    PlanItem(
      id: existingItem.id,
      name: draftItem.name,
      positionNote: existingItem.positionNote,
      selection: draftItem.selection,
      bitrateMbps: draftItem.bitrateMbps,
      media: draftItem.media,
      readerSpeedMBps: existingItem.readerSpeedMBps,
      hdeDataPerHourMultiplier: draftItem.hdeDataPerHourMultiplier,
      cameraCount: existingItem.cameraCount,
      dailyPowerOnHours: existingItem.dailyPowerOnHours,
      recordingRatio: existingItem.recordingRatio,
      shootDays: existingItem.shootDays,
      backupCopies: existingItem.backupCopies,
      safetyMargin: existingItem.safetyMargin
    )
  }
}

struct DITAddPlanItemView: View {
  let existingItem: PlanItem?
  let onSave: (PlanItem) -> Void

  @Environment(\.presentationMode) private var presentationMode
  @StateObject private var draftSelection: CameraSelectionStore
  @State private var itemName: String
  @State private var usesHDE: Bool
  @State private var showsCameraSearch = false

  init(existingItem: PlanItem? = nil, onSave: @escaping (PlanItem) -> Void) {
    let draftSelection = CameraSelectionStore()
    if let existingItem {
      draftSelection.restore(existingItem.selection)
    }

    self.existingItem = existingItem
    self.onSave = onSave
    _draftSelection = StateObject(wrappedValue: draftSelection)
    _itemName = State(initialValue: existingItem?.name ?? "")
    _usesHDE = State(initialValue: existingItem?.usesHDE ?? false)
  }

  private var calculation: CalculationResult {
    RecordingCalculator.calculate(draftSelection)
  }

  private var hdeMultiplier: Double? {
    guard case .success = calculation else { return nil }
    return ARRIHDE.multiplier(for: CameraSelection(selectionStore: draftSelection))
  }

  private var draftItem: PlanItem? {
    guard
      let item = DITPlanItemBuilder.make(
        from: draftSelection,
        name: itemName,
        usesHDE: usesHDE
      )
    else { return nil }

    guard let existingItem else { return item }
    return DITPlanItemBuilder.replacingRecordingMode(of: existingItem, with: item)
  }

  var body: some View {
    VStack(spacing: 0) {
      HStack(spacing: 12) {
        VStack(alignment: .leading, spacing: 3) {
          Text(existingItem == nil ? "添加机位" : "修改录制模式")
            .font(.title2)
            .fontWeight(.semibold)
          Text(
            existingItem == nil
              ? "选择摄影机的完整录制模式，再加入当前项目"
              : "修改摄影机、编码、格式、分辨率、帧率或介质"
          )
            .font(.caption)
            .foregroundColor(.secondary)
        }

        Spacer()

        Button {
          showsCameraSearch = true
        } label: {
          Label("搜索摄影机", systemImage: "magnifyingglass")
        }
        .buttonStyle(.bordered)
        .controlSize(.large)

        Button("取消") {
          presentationMode.wrappedValue.dismiss()
        }
        .keyboardShortcut(.cancelAction)
      }
      .padding(.horizontal, 22)
      .padding(.vertical, 16)

      Divider()

      ScrollView {
        VStack(alignment: .leading, spacing: 18) {
          AddPlanStepHeader(number: "1", title: "选择摄影机和录制模式")

          CameraSelectionPanel(cameradata: draftSelection, language: .chinese)
            .frame(width: 570)
            .padding(.horizontal, 8)

          Divider()

          AddPlanStepHeader(number: "2", title: "确认机位信息")

          HStack(spacing: 12) {
            Text("机位名称")
              .foregroundColor(.secondary)
            TextField("例如：A 机位 - 主摄影机", text: $itemName)
              .textFieldStyle(.roundedBorder)
              .frame(width: 330)
          }

          if let hdeMultiplier {
            HStack(alignment: .center, spacing: 10) {
              VStack(alignment: .leading, spacing: 2) {
                Text("使用 HDE 无损压缩")
                Text("项目数据量约为 ARRIRAW 的 \(formatNumber(hdeMultiplier * 100))%")
                  .font(.caption)
                  .foregroundColor(.secondary)
              }
              Spacer(minLength: 8)
              Toggle("", isOn: $usesHDE)
                .labelsHidden()
                .toggleStyle(.switch)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 2)
          }

          addModePreview
        }
        .padding(22)
        .frame(maxWidth: .infinity, alignment: .leading)
      }

      Divider()

      HStack(spacing: 12) {
        statusMessage
        Spacer()
        Button(action: saveItem) {
          Label(
            existingItem == nil ? "添加到项目" : "保存修改",
            systemImage: existingItem == nil ? "plus" : "checkmark"
          )
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        .disabled(draftItem == nil)
      }
      .padding(.horizontal, 22)
      .padding(.vertical, 14)
    }
    .frame(minWidth: 720, idealWidth: 720, minHeight: 690, idealHeight: 720)
    .sheet(isPresented: $showsCameraSearch) {
      CameraSearchView { entry in
        draftSelection.selectBrand(entry.brandID)
        draftSelection.selectCamera(entry.cameraID)
      }
    }
    .onChange(of: draftSelection.BrandName) { _ in disableUnavailableHDE() }
    .onChange(of: draftSelection.CameraName) { _ in disableUnavailableHDE() }
    .onChange(of: draftSelection.Codec) { _ in disableUnavailableHDE() }
  }

  @ViewBuilder
  private var addModePreview: some View {
    switch calculation {
    case .success(let metrics):
      VStack(alignment: .leading, spacing: 10) {
        Text("录制模式预览")
          .font(.headline)
        HStack(alignment: .top, spacing: 12) {
          AddPlanMetric(
            title: "摄影机", value: "\(draftSelection.BrandName) \(draftSelection.CameraName)")
            .frame(width: 230, alignment: .leading)
          AddPlanMetric(
            title: usesHDE ? "HDE 数据码率" : "码率",
            value:
              "\(formatNumber(metrics.bitrateMbps * (usesHDE ? (hdeMultiplier ?? 1) : 1))) Mbps"
          )
          .frame(width: 145, alignment: .leading)
          AddPlanMetric(title: "介质", value: draftSelection.Media)
            .frame(width: 135, alignment: .leading)
          AddPlanMetric(title: "每卡时长", value: "\(formatNumber(metrics.recordMinutes)) 分钟")
            .frame(width: 120, alignment: .leading)
        }
      }

    case .incomplete(let fields):
      AddPlanMessage(
        systemImage: "arrow.right.circle",
        text: "继续选择：\(missingFieldNames(fields))"
      )

    case .unsupported:
      AddPlanMessage(
        systemImage: "exclamationmark.triangle",
        text: "当前录制组合不可用于项目规划，请更换录制模式"
      )
    }
  }

  @ViewBuilder
  private var statusMessage: some View {
    switch calculation {
    case .success:
      Label(
        existingItem == nil ? "录制模式完整，可以添加" : "录制模式完整，可以保存",
        systemImage: "checkmark.circle"
      )
        .foregroundColor(.green)
    case .incomplete:
      Label("请完成录制模式选择", systemImage: "info.circle")
        .foregroundColor(.secondary)
    case .unsupported:
      Label("当前模式不支持项目规划", systemImage: "exclamationmark.triangle")
        .foregroundColor(.orange)
    }
  }

  private func saveItem() {
    guard let draftItem else { return }
    onSave(draftItem)
    presentationMode.wrappedValue.dismiss()
  }

  private func disableUnavailableHDE() {
    if ARRIHDE.multiplier(for: CameraSelection(selectionStore: draftSelection)) == nil {
      usesHDE = false
    }
  }

  private func missingFieldNames(_ fields: Set<SelectionField>) -> String {
    let names: [(SelectionField, String)] = [
      (.brand, "品牌"),
      (.camera, "摄影机"),
      (.codec, "编码"),
      (.codecLevel, "级别"),
      (.format, "幅面"),
      (.resolution, "分辨率"),
      (.frameRate, "帧率"),
      (.media, "介质"),
      (.manualBitrate, "手动码率"),
      (.manualWidth, "宽度"),
      (.manualHeight, "高度"),
    ]
    return
      names
      .filter { fields.contains($0.0) }
      .map(\.1)
      .joined(separator: "、")
  }
}

private struct AddPlanStepHeader: View {
  let number: String
  let title: String

  var body: some View {
    HStack(spacing: 10) {
      Text(number)
        .font(.headline)
        .foregroundColor(.white)
        .frame(width: 26, height: 26)
        .background(Circle().fill(Color.accentColor))
      Text(title)
        .font(.headline)
    }
  }
}

private struct AddPlanMetric: View {
  let title: String
  let value: String

  var body: some View {
    VStack(alignment: .leading, spacing: 4) {
      Text(title)
        .font(.caption)
        .foregroundColor(.secondary)
      Text(value)
        .lineLimit(2)
        .fixedSize(horizontal: false, vertical: true)
        .minimumScaleFactor(0.8)
        .monospacedDigit()
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}

private struct AddPlanMessage: View {
  let systemImage: String
  let text: String

  var body: some View {
    Label(text, systemImage: systemImage)
      .foregroundColor(.secondary)
  }
}
