enum SelectionField: Hashable {
    case brand
    case camera
    case codec
    case codecLevel
    case format
    case resolution
    case frameRate
    case media
    case manualBitrate
    case manualWidth
    case manualHeight
}

enum CalculationIssue: Equatable {
    case noMatchingRule
    case invalidManualBitrate
    case invalidManualResolution
    case nonFiniteResult
}

enum CalculationResult: Equatable {
    case incomplete(Set<SelectionField>)
    case unsupported(CalculationIssue)
    case success(RecordingMetrics)
}

struct RecordingMetrics: Equatable {
    let recordMinutes: Double
    let bitrateMbps: Double
    let bitrateMBps: Double
    let dataPerHourGB: Double
    let hdeDataPerHourGB: Double?
}
