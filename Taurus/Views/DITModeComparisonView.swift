import SwiftUI

struct DITModeComparisonView: View {
  let project: DITProject
  let itemIDs: Set<UUID>

  @Environment(\.presentationMode) private var presentationMode

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
        Text("模式比较")
          .font(.headline)
        Text("\(items.count) 个模式")
          .font(.caption)
          .foregroundColor(.secondary)
      }

      Spacer()

      Button {
        presentationMode.wrappedValue.dismiss()
      } label: {
        Label("关闭", systemImage: "xmark")
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

      ComparisonValue(label: "摄影机", value: item.cameraLabel)
      ComparisonValue(label: "编码", value: item.selection.codecID)
      ComparisonValue(label: "HDE", value: hdeDescription(item))
      ComparisonValue(label: "分辨率", value: item.selection.resolutionID)
      ComparisonValue(label: "帧率", value: item.selection.frameRateID)
      ComparisonValue(label: "码率", value: "\(formatNumber(item.bitrateMbps)) Mbps")
      ComparisonValue(label: "介质", value: item.media.id)
      ComparisonValue(label: "单机每日", value: formatBytes(summary?.rawDataPerCameraPerDayBytes))
      ComparisonValue(label: "全部每日", value: formatBytes(summary?.rawDataPerDayBytes))
      ComparisonValue(label: "项目原始量", value: formatBytes(summary?.rawDataBytes))
      ComparisonValue(label: "总存储", value: formatBytes(summary?.storageBytes))
      ComparisonValue(label: "介质数量", value: summary.map { "\($0.requiredMediaCount) 张" } ?? "—")
      ComparisonValue(
        label: "每张卡时长", value: summary.map { "\(formatNumber($0.recordMinutesPerMedia)) 分钟" } ?? "—"
      )
      ComparisonValue(
        label: "卸载时间",
        value: summary.map { "\(formatNumber($0.transferSeconds / 3_600)) 小时" } ?? "—")
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
      return "已启用（\(formatNumber(multiplier * 100))%）"
    }
    return ARRIHDE.multiplier(for: item.selection) == nil ? "不适用" : "未启用"
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
