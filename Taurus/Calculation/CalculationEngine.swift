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

        guard media.usableCapacityBytes.isFinite,
              media.usableCapacityBytes > 0,
              mode.bitrateMbps.isFinite,
              mode.bitrateMbps > 0 else {
            return .unsupported(.nonFiniteResult)
        }

        if let hdeDataPerHourMultiplier = mode.hdeDataPerHourMultiplier,
           (!hdeDataPerHourMultiplier.isFinite || hdeDataPerHourMultiplier <= 0) {
            return .unsupported(.nonFiniteResult)
        }

        let bitrateMBps = mode.bitrateMbps / 8
        let dataPerHourGB = bitrateMBps * 3600 / 1000
        let recordingBytesPerSecond = mode.recordingBytesPerSecond ?? bitrateMBps * 1_000_000
        let recordingCapacityBytes = mode.recordingCapacityBytes ?? media.usableCapacityBytes

        guard recordingBytesPerSecond.isFinite,
              recordingBytesPerSecond > 0,
              recordingCapacityBytes.isFinite,
              recordingCapacityBytes > 0,
              mode.recordDurationSecondsOffset.isFinite else {
            return .unsupported(.nonFiniteResult)
        }

        var recordMinutes = recordingCapacityBytes / recordingBytesPerSecond / 60
        recordMinutes += mode.recordDurationSecondsOffset / 60
        if mode.halvesRecordMinutes {
            recordMinutes /= 2
        }

        let hdeDataPerHourGB = mode.hdeDataPerHourMultiplier.map {
            dataPerHourGB * $0
        }

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
