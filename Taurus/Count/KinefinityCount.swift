//
//  KinefinityCount.swift
//  Taurus
//
//  Created by Codex on 6/4/26.
//

import Foundation

func KinefinityCodecSpeed(cameradata: CameraData) -> Double {
    let resolutionMultiplier = ResolutionMultiplier(cameradata: cameradata)
    let rateMultiplier = RateMultiplier(cameradata: cameradata)

    if cameradata.CameraName == "VISTA" && cameradata.Codec.hasPrefix("H.265") {
        return KinefinityVistaH265Speed(cameradata: cameradata)
    }

    if cameradata.Codec == "CinemaDNG" {
        let raw12bit1080p24Mbps = Double(1920 * 1080 * 12 * 24) / 1_000_000
        return raw12bit1080p24Mbps * resolutionMultiplier * rateMultiplier
    }

    return CodecSpeedCount(cameradata: cameradata) * resolutionMultiplier * rateMultiplier
}

private func KinefinityVistaH265Speed(cameradata: CameraData) -> Double {
    let baseMbps: Double
    switch cameradata.Codec {
    case "H.265 Max":
        baseMbps = 400
    case "H.265 High":
        baseMbps = 200
    case "H.265 Normal":
        baseMbps = 80
    default:
        return 0
    }

    let base4K25Multiplier = Double(4096 * 2160) / Double(1920 * 1080)
    let resolutionMultiplier = ResolutionMultiplier(cameradata: cameradata)
    let rate = RateSpeed(cameradata: cameradata)
    if resolutionMultiplier == 0 || rate == 0 {
        return 0
    }

    return baseMbps * resolutionMultiplier / base4K25Multiplier * rate / 25
}
