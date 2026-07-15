import SwiftUI

struct DITModeComparisonView: View {
  let project: DITProject
  let itemIDs: Set<UUID>
  let language: AppLanguage

  @Environment(\.presentationMode) private var presentationMode

  private var copy: DITPlannerCopy { language.copy.ditPlanner }

  private var summaryByID: [UUID: PlanItemSummary] {
    Dictionary(
      uniqueKeysWithValues: DITProjectCalculator.summarize(project)
        .itemSummaries.map { ($0.itemID, $0) }
    )
  }

  private var items: [PlanItem] {
    project.items.filter { itemIDs.contains($0.id) }
  }

  var body: some View {
    VStack(spacing: 0) {
      comparisonToolbar

      Divider()

      ScrollView([.horizontal, .vertical], showsIndicators: true) {
        HStack(alignment: .top, spacing: 12) {
          ForEach(items) { item in
            comparisonColumn(item)
          }
        }
        .padding(16)
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    .frame(minWidth: 720, idealWidth: 960, minHeight: 520, idealHeight: 640)
    .onExitCommand {
      presentationMode.wrappedValue.dismiss()
    }
  }

  private var comparisonToolbar: some View {
    HStack(spacing: 12) {
      VStack(alignment: .leading, spacing: 2) {
        Text(copy.text("模式比较"))
          .font(.headline)
        Text(copy.modeCount(items.count))
          .font(.caption)
          .foregroundColor(.secondary)
      }

      Spacer()

      Button {
        presentationMode.wrappedValue.dismiss()
      } label: {
        Label(copy.text("关闭"), systemImage: "xmark")
      }
      .keyboardShortcut(.cancelAction)
      .buttonStyle(.bordered)
      .controlSize(.large)
    }
    .padding(.horizontal, 16)
    .padding(.vertical, 12)
    .frame(minHeight: 58)
  }

  private func comparisonColumn(_ item: PlanItem) -> some View {
    let summary = summaryByID[item.id]
    return VStack(alignment: .leading, spacing: 10) {
      Text(item.name)
        .font(.headline)
        .lineLimit(2)
        .frame(minHeight: 38, alignment: .topLeading)

      Divider()

      ComparisonValue(label: copy.text("摄影机"), value: item.cameraLabel)
      ComparisonValue(label: copy.text("编码"), value: item.selection.codecID)
      ComparisonValue(label: "HDE", value: hdeDescription(item))
      ComparisonValue(label: copy.text("分辨率"), value: item.selection.resolutionID)
      ComparisonValue(label: copy.text("帧率"), value: item.selection.frameRateID)
      ComparisonValue(label: copy.text("码率"), value: "\(formatNumber(item.bitrateMbps)) Mbps")
      ComparisonValue(label: copy.text("介质"), value: item.media.id)
      ComparisonValue(
        label: copy.text("读卡器"),
        value: summary.map { "\(formatNumber($0.readerSpeedMBps)) MB/s" } ?? "—"
      )
      ComparisonValue(
        label: copy.text("有效速度"),
        value: summary.map { "\(formatNumber($0.effectiveTransferSpeedMBps)) MB/s" } ?? "—"
      )
      ComparisonValue(label: copy.text("单机每日"), value: formatBytes(summary?.rawDataPerCameraPerDayBytes))
      ComparisonValue(label: copy.text("全部每日"), value: formatBytes(summary?.rawDataPerDayBytes))
      ComparisonValue(label: copy.text("项目原始量"), value: formatBytes(summary?.rawDataBytes))
      ComparisonValue(label: copy.text("总存储"), value: formatBytes(summary?.storageBytes))
      ComparisonValue(
        label: copy.text("卡次"),
        value: summary.map { "\($0.cardCycles) \(copy.text("次"))" } ?? "—"
      )
      ComparisonValue(
        label: copy.text("每张卡时长"),
        value: summary.map { "\(formatNumber($0.recordMinutesPerMedia)) \(copy.text("分钟"))" } ?? "—"
      )
      ComparisonValue(
        label: copy.text("卸载时间"),
        value: summary.map { "\(formatNumber($0.transferSeconds / 3_600)) \(copy.text("小时"))" } ?? "—"
      )
    }
    .padding(12)
    .frame(width: 220, alignment: .topLeading)
    .background(Color(nsColor: .controlBackgroundColor))
    .overlay(
      RoundedRectangle(cornerRadius: 6)
        .stroke(Color(nsColor: .separatorColor), lineWidth: 0.5)
    )
    .clipShape(RoundedRectangle(cornerRadius: 6))
  }

  private func formatBytes(_ bytes: Double?) -> String {
    guard let bytes, bytes.isFinite, bytes >= 0, bytes <= Double(Int64.max) else { return "—" }
    let formatter = ByteCountFormatter()
    formatter.countStyle = .file
    formatter.allowsNonnumericFormatting = false
    return formatter.string(fromByteCount: Int64(bytes))
  }

  private func hdeDescription(_ item: PlanItem) -> String {
    if let multiplier = item.hdeDataPerHourMultiplier {
      return copy.hdeState(percent: formatNumber(multiplier * 100))
    }
    return ARRIHDE.multiplier(for: item.selection) == nil
      ? copy.text("不适用")
      : copy.text("未启用")
  }
}

private struct ComparisonValue: View {
  let label: String
  let value: String

  var body: some View {
    VStack(alignment: .leading, spacing: 2) {
      Text(label)
        .font(.caption)
        .foregroundColor(.secondary)
      Text(value)
        .font(.callout)
        .lineLimit(2)
        .frame(minHeight: 32, alignment: .topLeading)
    }
  }
}
