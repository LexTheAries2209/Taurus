//
//  FujiCount.swift
//  Taurus
//
//  Created by Codex on 6/4/26.
//

import Foundation

func FujiCodecSpeed(cameradata:CameraData) -> Double {
    switch cameradata.Codec {
    case "H.265 ALL-I" :
        return 720
    case "H.265 LongGOP" :
        return 200
    case "ProRes 422 HQ","ProRes 422","ProRes 422 LT" :
        return Codecspeed(cameradata:cameradata) * FujiResolutionMultiplier(cameradata:cameradata) * FujiRateMultiplier(cameradata:cameradata)
    default :
        return 0
    }
}

private func FujiRateMultiplier(cameradata:CameraData) -> Double {
    return RateSpeed(cameradata:cameradata) / 24
}

private func FujiResolutionMultiplier(cameradata:CameraData) -> Double {
    switch cameradata.Resolution {
    case "8K[8192*4320][17:9]" :
        return FujiPixelMultiplier(width: 8192, height: 4320)
    case "8K UHD[7680*4320][16:9]" :
        return FujiPixelMultiplier(width: 7680, height: 4320)
    case "8K[8192*2968][2.76:1]" :
        return FujiPixelMultiplier(width: 8192, height: 2968)
    case "8K[8080*3380][2.39:1]" :
        return FujiPixelMultiplier(width: 8080, height: 3380)
    case "6.3K[6382*3590][16:9]" :
        return FujiPixelMultiplier(width: 6382, height: 3590)
    case "5.8K[5824*2436][2.39:1]" :
        return FujiPixelMultiplier(width: 5824, height: 2436)
    case "5.4K[5440*2868][17:9]" :
        return FujiPixelMultiplier(width: 5440, height: 2868)
    case "4.8K[4776*3184][3:2]" :
        return FujiPixelMultiplier(width: 4776, height: 3184)
    case "4.8K[4776*2688][16:9]" :
        return FujiPixelMultiplier(width: 4776, height: 2688)
    case "4.6K[4664*3380][1.38:1]" :
        return FujiPixelMultiplier(width: 4664, height: 3380)
    case "4K[4040*3380][6:5]" :
        return FujiPixelMultiplier(width: 4040, height: 3380)
    case "DCI 4K[4096*2160][17:9]" :
        return FujiPixelMultiplier(width: 4096, height: 2160)
    case "4K UHD[3840*2160][16:9]" :
        return FujiPixelMultiplier(width: 3840, height: 2160)
    case "4K[3840*2880][OG]" :
        return FujiPixelMultiplier(width: 3840, height: 2880)
    case "DCI 2K[2048*1080][17:9]" :
        return FujiPixelMultiplier(width: 2048, height: 1080)
    case "FHD[1920*1080][16:9]" :
        return FujiPixelMultiplier(width: 1920, height: 1080)
    default :
        return 0
    }
}

private func FujiPixelMultiplier(width:Double, height:Double) -> Double {
    return width * height / (1920 * 1080)
}
