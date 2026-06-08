//
//  KinefinityRate.swift
//  Taurus
//
//  Created by Codex on 6/4/26.
//

import Foundation

func KinefinityRate(cameradata:CameraData) -> [String] {
    guard let mode = KinefinityRecordingModes(cameradata: cameradata).first(where: { $0.resolution == cameradata.Resolution }) else {
        return ["无选项"]
    }

    let maxFPS = KinefinityCodecLimitedMaxFPS(cameradata: cameradata, modeMaxFPS: mode.maxFPS)
    let values = KinefinityCommonRateValues(maxFPS: maxFPS)
    return values.isEmpty ? ["无选项"] : values.map { KinefinityRateLabel($0) }
}

private func KinefinityCodecLimitedMaxFPS(cameradata:CameraData, modeMaxFPS:Double) -> Double {
    if cameradata.CameraName == "MAVO Edge 8K" && cameradata.Resolution.hasPrefix("8K[") {
        if cameradata.Codec == "ProRes 4444 XQ" {
            return min(modeMaxFPS, 30)
        }
        else if cameradata.Codec == "ProRes 4444" {
            return min(modeMaxFPS, 50)
        }
    }

    return modeMaxFPS
}

private func KinefinityCommonRateValues(maxFPS:Double) -> [Double] {
    let commonRates: [Double] = [
        23.976, 24, 25, 29.970, 30,
        40, 47.952, 48, 50, 59.940, 60, 72, 75, 90, 96, 100,
        119.880, 120, 144, 150, 160, 192, 200, 239.760, 240,
        250, 260, 280, 290, 300
    ]
    var filteredRates = commonRates.filter { $0 <= maxFPS + 0.0001 }

    if !filteredRates.contains(where: { abs($0 - maxFPS) < 0.0001 }) {
        filteredRates.append(maxFPS)
    }

    return filteredRates.filter { $0 > 20 }.sorted()
}

private func KinefinityRateLabel(_ value:Double) -> String {
    return String(format: "%.3f", value)
}
