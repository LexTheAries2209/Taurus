import Foundation

protocol CameraCatalog {
    func recordingMode(for selection: CameraSelection) -> RecordingMode?
    func mediaSpec(for id: String) -> MediaSpec?
}

protocol CalculationEngine {
    func calculate(_ selection: CameraSelection, using catalog: CameraCatalog) -> CalculationResult
}

struct DefaultCalculationEngine: CalculationEngine {
    func calculate(_ selection: CameraSelection, using catalog: CameraCatalog) -> CalculationResult {
        guard let mode = catalog.recordingMode(for: selection),
              mode.selection == selection,
              let media = catalog.mediaSpec(for: selection.mediaID) else {
            return .unsupported(.noMatchingRule)
        }

        guard media.usableCapacityGB.isFinite,
              media.usableCapacityGB > 0,
              mode.bitrateMbps.isFinite,
              mode.bitrateMbps > 0 else {
            return .unsupported(.nonFiniteResult)
        }

        let bitrateMBps = mode.bitrateMbps / 8
        let dataPerHourGB = mode.bitrateMbps * 450 / 1024
        var recordMinutes = media.usableCapacityGB * 2048 / 15 / mode.bitrateMbps
        if mode.halvesRecordMinutes {
            recordMinutes /= 2
        }

        let hdeDataPerHourGB = mode.includesHDE
            ? mode.bitrateMbps * 270 / 1024
            : nil

        let metrics = RecordingMetrics(
            recordMinutes: recordMinutes,
            bitrateMbps: mode.bitrateMbps,
            bitrateMBps: bitrateMBps,
            dataPerHourGB: dataPerHourGB,
            hdeDataPerHourGB: hdeDataPerHourGB
        )

        guard isValid(metrics) else {
            return .unsupported(.nonFiniteResult)
        }

        return .success(metrics)
    }

    private func isValid(_ metrics: RecordingMetrics) -> Bool {
        var values = [
            metrics.recordMinutes,
            metrics.bitrateMbps,
            metrics.bitrateMBps,
            metrics.dataPerHourGB
        ]
        if let hdeDataPerHourGB = metrics.hdeDataPerHourGB {
            values.append(hdeDataPerHourGB)
        }
        return values.allSatisfy { $0.isFinite && $0 > 0 }
    }
}
