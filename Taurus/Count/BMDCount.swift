//
//  BMDCount.swift
//  Taurus
//
//  Created by 吴坤城 on 5/10/24.
//

import Foundation

func BMDCodecSpeedMBPS(cameradata:CameraData) -> Double {
    if cameradata.CameraName == "Blackmagic URSA Mini Pro 12K" {
        if cameradata.Resolution.contains("12K") {
            switch cameradata.Codec {
            case "Blackmagic RAW 5:1" :
                return 578
            case "Blackmagic RAW 8:1" :
                return 361
            case "Blackmagic RAW 12:1" :
                return 241
            case "Blackmagic RAW 18:1" :
                return 160
            default :
                return 0
            }
        }
        else if cameradata.Resolution.contains("8K") {
            switch cameradata.Codec {
            case "Blackmagic RAW 5:1" :
                return 257
            case "Blackmagic RAW 8:1" :
                return 161
            case "Blackmagic RAW 12:1" :
                return 107
            case "Blackmagic RAW 18:1" :
                return 71
            default :
                return 0
            }
        }
        else if cameradata.Resolution.contains("4K S35") {
            switch cameradata.Codec {
            case "Blackmagic RAW 5:1" :
                return 161
            case "Blackmagic RAW 8:1" :
                return 107
            case "Blackmagic RAW 12:1" :
                return 80
            case "Blackmagic RAW 18:1" :
                return 53
            default :
                return 0
            }
        }
        else if cameradata.Resolution.contains("6K") {
            switch cameradata.Codec {
            case "Blackmagic RAW 5:1" :
                return 146
            case "Blackmagic RAW 8:1" :
                return 91
            case "Blackmagic RAW 12:1" :
                return 61
            case "Blackmagic RAW 18:1" :
                return 40
            default :
                return 0
            }
        }
        else if cameradata.Resolution.contains("4K S16") {
            switch cameradata.Codec {
            case "Blackmagic RAW 5:1" :
                return 64.8
            case "Blackmagic RAW 8:1" :
                return 40.5
            case "Blackmagic RAW 12:1" :
                return 27.1
            case "Blackmagic RAW 18:1" :
                return 18
            default :
                return 0
            }
        }
    }
    return 0
}

func BMDResolutionMutiplier(cameradata:CameraData) -> Double {
    if cameradata.Resolution.contains("[17:9]") {
        return 1
    }
    else if cameradata.Resolution.contains("[16:9]"){
        return 1.0667
    }
    else if cameradata.Resolution.contains("[2.4:1]"){
        return 1.2676
    }
    else {
        return 0
    }
}


func BMDCodecSpeedmbps(cameradata:CameraData) -> Double {
    return (BMDCodecSpeedMBPS(cameradata:cameradata) * RateMultiplier(cameradata: cameradata) * 8) / BMDResolutionMutiplier (cameradata:cameradata)
}
