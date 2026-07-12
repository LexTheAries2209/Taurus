import SwiftUI

enum DataOutputTypography {
    static let metricTextStyle: Font.TextStyle = .body
    static let messageTextStyle: Font.TextStyle = .body
}

func formatNumber(_ number: Double) -> String {
    guard number.isFinite else { return "—" }
    return String(format: "%.2f", number)
}

struct RecordingMetricsView: View {
    let result: CalculationResult
    let codecID: String
    let language: AppLanguage

    private var presentation: RecordingMetricsPresentation {
        RecordingMetricsPresentation(result: result, codecID: codecID, copy: language.copy)
    }

    private var metricLabelTrailing: CGFloat {
        language == .english ? 42 : 100
    }

    private var hdeLabelTrailing: CGFloat {
        language == .english ? 8 : 60
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text("")

            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(presentation.labels, id: \.self) { label in
                        Text(label)
                            .font(.system(DataOutputTypography.metricTextStyle))
                    }
                }
                .padding(.trailing, presentation.includesHDE ? hdeLabelTrailing : metricLabelTrailing)

                VStack(alignment: .trailing, spacing: 10) {
                    ForEach(Array(presentation.values.enumerated()), id: \.offset) { _, value in
                        Text(value)
                            .font(.system(DataOutputTypography.metricTextStyle))
                    }
                }
            }

            if let message = presentation.message {
                Text(message)
                    .font(.system(DataOutputTypography.messageTextStyle))
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.top, 10)
            }
        }
        .padding([.leading, .trailing], 30)
    }
}

struct RecordingMetricsPresentation {
    let labels: [String]
    let values: [String]
    let message: String?
    let includesHDE: Bool

    init(result: CalculationResult, codecID: String, copy: LocalizedCopy) {
        switch result {
        case let .success(metrics):
            includesHDE = metrics.hdeDataPerHourGB != nil
            labels = copy.outputLabels(includeHDE: includesHDE)
            var formattedValues = [
                formatNumber(metrics.recordMinutes),
                formatNumber(metrics.bitrateMbps),
                formatNumber(metrics.bitrateMBps),
                formatNumber(metrics.dataPerHourGB)
            ]
            if let hdeDataPerHourGB = metrics.hdeDataPerHourGB {
                formattedValues.append(formatNumber(hdeDataPerHourGB))
            }
            values = formattedValues
            message = nil

        case let .incomplete(fields):
            includesHDE = codecID.contains("ARRIRAW")
            labels = copy.outputLabels(includeHDE: includesHDE)
            values = Array(repeating: "—", count: labels.count)
            message = copy.incompleteCalculationMessage(missing: fields)

        case let .unsupported(issue):
            includesHDE = codecID.contains("ARRIRAW")
            labels = copy.outputLabels(includeHDE: includesHDE)
            values = Array(repeating: "—", count: labels.count)
            message = copy.unsupportedCalculationMessage(issue)
        }
    }
}
