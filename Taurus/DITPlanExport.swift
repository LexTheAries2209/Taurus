import AppKit
import CoreText
import Foundation
import UniformTypeIdentifiers

enum DITPlanExport {
    enum ExportError: LocalizedError {
        case invalidProject
        case pdfContext

        var errorDescription: String? {
            switch self {
            case .invalidProject:
                return "项目中没有可导出的有效机位数据。"
            case .pdfContext:
                return "无法创建 PDF 文档。"
            }
        }
    }

    static func csvData(for project: DITProject) -> Data {
        let summary = DITProjectCalculator.summarize(project)
        let summaryByID = Dictionary(
            uniqueKeysWithValues: summary.itemSummaries.map { ($0.itemID, $0) })
        var rows: [[String]] = [
            [
                "项目", "机位", "摄影机", "编码", "HDE", "分辨率", "帧率", "介质",
                "摄影机数量", "每日开机(小时)", "实际录制比例", "拍摄天数", "备份份数", "安全余量",
                "单机每日(GB)", "全部机位每日(GB)", "项目原始数据(GB)", "存储需求(GB)",
                "卡次", "每张卡时长(分钟)", "卸载时间(小时)",
            ]
        ]

        for item in project.items {
            guard let itemSummary = summaryByID[item.id] else { continue }
            rows.append([
                project.name,
                item.name,
                item.cameraLabel,
                item.selection.codecID,
                hdeDescription(item),
                item.selection.resolutionID,
                item.selection.frameRateID,
                item.media.id,
                String(item.cameraCount),
                number(item.dailyPowerOnHours),
                percentage(item.recordingRatio),
                number(item.shootDays),
                String(item.backupCopies),
                percentage(item.safetyMargin),
                number(itemSummary.rawDataPerCameraPerDayBytes / 1_000_000_000),
                number(itemSummary.rawDataPerDayBytes / 1_000_000_000),
                number(itemSummary.rawDataBytes / 1_000_000_000),
                number(itemSummary.storageBytes / 1_000_000_000),
                String(itemSummary.cardCycles),
                number(itemSummary.recordMinutesPerMedia),
                number(itemSummary.transferSeconds / 3_600),
            ])
        }

        rows.append(
            [project.name, "汇总"]
                + Array(repeating: "", count: 12)
                + [
                    number(summary.dailyRawDataGB),
                    number(summary.totalRawDataGB),
                    number(summary.totalStorageGB),
                    summary.cardCyclesByMedia.map { "\($0.key): \($0.value)" }.sorted().joined(separator: "；"),
                    "",
                    number(summary.totalTransferHours),
                ]
        )

        let csv =
            rows.map { $0.map(escapeCSV).joined(separator: ",") }.joined(separator: "\n") + "\n"
        return Data("\u{FEFF}\(csv)".utf8)
    }

    static func pdfData(for project: DITProject) throws -> Data {
        let summary = DITProjectCalculator.summarize(project)
        guard !project.items.isEmpty, summary.issues.isEmpty else {
            throw ExportError.invalidProject
        }

        let attributedText = reportAttributedText(project: project, summary: summary)
        let framesetter = CTFramesetterCreateWithAttributedString(
            attributedText as CFAttributedString)
        let pageRect = CGRect(x: 0, y: 0, width: 595, height: 842)
        let contentRect = pageRect.insetBy(dx: 44, dy: 52)
        let output = NSMutableData()
        var mediaBox = pageRect
        guard let consumer = CGDataConsumer(data: output as CFMutableData),
            let context = CGContext(consumer: consumer, mediaBox: &mediaBox, nil)
        else {
            throw ExportError.pdfContext
        }

        var location = 0
        var pageNumber = 0
        while location < attributedText.length {
            pageNumber += 1
            context.beginPDFPage([kCGPDFContextMediaBox as String: pageRect] as CFDictionary)
            let path = CGPath(rect: contentRect, transform: nil)
            let frame = CTFramesetterCreateFrame(
                framesetter,
                CFRange(location: location, length: 0),
                path,
                nil
            )
            CTFrameDraw(frame, context)
            let visibleRange = CTFrameGetVisibleStringRange(frame)
            guard visibleRange.length > 0 else {
                context.endPDFPage()
                context.closePDF()
                throw ExportError.pdfContext
            }
            drawFooter(pageNumber: pageNumber, in: context, pageRect: pageRect)
            context.endPDFPage()
            location += visibleRange.length
        }

        context.closePDF()
        return output as Data
    }

    private static func reportAttributedText(project: DITProject, summary: PlanSummary)
        -> NSAttributedString
    {
        let output = NSMutableAttributedString()
        let bodyFont = NSFont(name: "PingFangSC-Regular", size: 10) ?? NSFont.systemFont(ofSize: 10)
        let bodyStyle = NSMutableParagraphStyle()
        bodyStyle.lineSpacing = 3
        bodyStyle.paragraphSpacing = 2
        let bodyAttributes: [NSAttributedString.Key: Any] = [
            .font: bodyFont,
            .foregroundColor: NSColor.black,
            .paragraphStyle: bodyStyle,
        ]
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: NSFont(name: "PingFangSC-Semibold", size: 22)
                ?? NSFont.boldSystemFont(ofSize: 22),
            .foregroundColor: NSColor.black,
        ]
        let subtitleAttributes: [NSAttributedString.Key: Any] = [
            .font: NSFont.systemFont(ofSize: 11, weight: .medium),
            .foregroundColor: NSColor(calibratedWhite: 0.35, alpha: 1),
        ]
        let sectionStyle = NSMutableParagraphStyle()
        sectionStyle.paragraphSpacingBefore = 16
        sectionStyle.paragraphSpacing = 6
        let sectionAttributes: [NSAttributedString.Key: Any] = [
            .font: NSFont(name: "PingFangSC-Semibold", size: 14)
                ?? NSFont.boldSystemFont(ofSize: 14),
            .foregroundColor: NSColor.black,
            .paragraphStyle: sectionStyle,
        ]
        let itemAttributes: [NSAttributedString.Key: Any] = [
            .font: NSFont(name: "PingFangSC-Semibold", size: 11)
                ?? NSFont.boldSystemFont(ofSize: 11),
            .foregroundColor: NSColor.black,
            .paragraphStyle: bodyStyle,
        ]

        appendLine(project.name, attributes: titleAttributes, to: output)
        appendLine("Taurus DIT 项目报告", attributes: subtitleAttributes, to: output)
        appendLine("更新于 \(date(project.updatedAt))", attributes: subtitleAttributes, to: output)

        appendLine("项目汇总", attributes: sectionAttributes, to: output)
        appendLine(
            "每日原始数据：\(number(summary.dailyRawDataGB)) GB", attributes: bodyAttributes, to: output)
        appendLine(
            "原始数据：\(number(summary.totalRawDataGB)) GB", attributes: bodyAttributes, to: output)
        appendLine(
            "每日备份存储：\(number(summary.dailyStorageGB)) GB", attributes: bodyAttributes, to: output)
        appendLine(
            "存储需求（含备份和安全余量）：\(number(summary.totalStorageGB)) GB", attributes: bodyAttributes,
            to: output)
        appendLine(
            "卸载时间：\(number(summary.totalTransferHours)) 小时", attributes: bodyAttributes, to: output)
        appendLine(
            "每日双备份：\(summary.canCompleteDailyDoubleBackup ? "可在窗口内完成" : "无法在窗口内完成")",
            attributes: bodyAttributes,
            to: output
        )

        appendLine("传输配置", attributes: sectionAttributes, to: output)
        appendLine(
            "读卡器：\(number(project.transferProfile.readerSpeedMBps)) MB/s",
            attributes: bodyAttributes,
            to: output)
        appendLine(
            "目标盘：\(number(project.transferProfile.targetDiskSpeedMBps)) MB/s",
            attributes: bodyAttributes,
            to: output)
        appendLine(
            "每日卸载窗口：\(number(project.transferProfile.offloadWindowHoursPerDay)) 小时",
            attributes: bodyAttributes, to: output)
        appendLine(
            "有效速度：\(number(summary.effectiveTransferSpeedMBps)) MB/s", attributes: bodyAttributes,
            to: output)

        appendLine("机位明细", attributes: sectionAttributes, to: output)

        for itemSummary in summary.itemSummaries {
            guard let item = project.items.first(where: { $0.id == itemSummary.itemID }) else {
                continue
            }
            appendLine(item.name, attributes: itemAttributes, to: output)
            appendLine(
                "摄影机：\(item.cameraLabel)（\(item.cameraCount) 台）", attributes: bodyAttributes,
                to: output)
            appendLine(
                "模式：\(item.selection.codecID) / \(item.selection.resolutionID) / \(item.selection.frameRateID)",
                attributes: bodyAttributes, to: output)
            appendLine("HDE：\(hdeDescription(item))", attributes: bodyAttributes, to: output)
            appendLine(
                "介质：\(item.media.id)，预计卡次 \(itemSummary.cardCycles) 次",
                attributes: bodyAttributes,
                to: output)
            appendLine(
                "单机每日：\(number(itemSummary.rawDataPerCameraPerDayBytes / 1_000_000_000)) GB",
                attributes: bodyAttributes, to: output)
            appendLine(
                "全部机位每日：\(number(itemSummary.rawDataPerDayBytes / 1_000_000_000)) GB",
                attributes: bodyAttributes, to: output)
            appendLine(
                "原始数据：\(number(itemSummary.rawDataBytes / 1_000_000_000)) GB",
                attributes: bodyAttributes,
                to: output)
            appendLine(
                "存储需求：\(number(itemSummary.storageBytes / 1_000_000_000)) GB",
                attributes: bodyAttributes,
                to: output)
            appendLine(
                "每张卡时长：\(number(itemSummary.recordMinutesPerMedia)) 分钟", attributes: bodyAttributes,
                to: output)
            appendLine(
                "卸载时间：\(number(itemSummary.transferSeconds / 3_600)) 小时",
                attributes: bodyAttributes,
                to: output)
        }

        return output
    }

    private static func drawFooter(pageNumber: Int, in context: CGContext, pageRect: CGRect) {
        let footer = NSAttributedString(
            string: "Taurus DIT Project Plan - Page \(pageNumber)",
            attributes: [
                .font: NSFont.systemFont(ofSize: 8),
                .foregroundColor: NSColor(calibratedWhite: 0.4, alpha: 1),
            ]
        )
        let framesetter = CTFramesetterCreateWithAttributedString(footer as CFAttributedString)
        let path = CGPath(
            rect: CGRect(x: 44, y: 24, width: pageRect.width - 88, height: 14), transform: nil)
        let frame = CTFramesetterCreateFrame(
            framesetter, CFRange(location: 0, length: 0), path, nil)
        CTFrameDraw(frame, context)
    }

    private static func number(_ value: Double) -> String {
        guard value.isFinite else { return "—" }
        return String(format: "%.2f", locale: Locale(identifier: "en_US_POSIX"), value)
    }

    private static func percentage(_ value: Double) -> String {
        number(value * 100) + "%"
    }

    private static func hdeDescription(_ item: PlanItem) -> String {
        if let multiplier = item.hdeDataPerHourMultiplier {
            return "已启用（\(number(multiplier * 100))%）"
        }
        return ARRIHDE.multiplier(for: item.selection) == nil ? "不适用" : "未启用"
    }

    private static func date(_ value: Date) -> String {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.locale = Locale(identifier: "zh_CN")
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        return formatter.string(from: value)
    }

    private static func appendLine(
        _ value: String,
        attributes: [NSAttributedString.Key: Any],
        to output: NSMutableAttributedString
    ) {
        output.append(NSAttributedString(string: value + "\n", attributes: attributes))
    }

    private static func escapeCSV(_ value: String) -> String {
        guard value.contains(",") || value.contains("\"") || value.contains("\n") else {
            return value
        }
        return "\"\(value.replacingOccurrences(of: "\"", with: "\"\""))\""
    }
}

@MainActor
enum DITPlanFilePanel {
    static func chooseOpenURL() -> URL? {
        let panel = NSOpenPanel()
        panel.title = "导入 Taurus 项目"
        panel.canChooseFiles = true
        panel.canChooseDirectories = false
        panel.allowsMultipleSelection = false
        panel.allowedContentTypes = [.json]
        return panel.runModal() == .OK ? panel.url : nil
    }

    static func chooseSaveURL(defaultName: String, contentType: UTType) -> URL? {
        let panel = NSSavePanel()
        panel.title = "导出 Taurus 项目"
        panel.nameFieldStringValue = defaultName
        panel.canCreateDirectories = true
        panel.allowedContentTypes = [contentType]
        panel.isExtensionHidden = false
        return panel.runModal() == .OK ? panel.url : nil
    }
}
