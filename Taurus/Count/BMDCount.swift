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
    
    else if cameradata.CameraName == "Blackmagic URSA Mini Pro 4.6K G2" {
        if cameradata.Resolution.contains("4.6K S35") {
            switch cameradata.Codec {
            case "Blackmagic RAW 3:1" :
                return 146.4
            case "Blackmagic RAW 5:1" :
                return 88
            case "Blackmagic RAW 8:1" :
                return 54.4
            case "Blackmagic RAW 12:1" :
                return 36.8
            case "ProRes 4444 XQ" :
                return 288
            case "ProRes 4444" :
                return 190.4
            case "ProRes 422 HQ" :
                return 126.5
            case "ProRes 422" :
                return 84.8
            case "ProRes 422 LT" :
                return 58.8
            case "ProRes 422 Proxy" :
                return 25.84
            default :
                return 0
            }
        }
        else if cameradata.Resolution.contains("4K S35") {
            switch cameradata.Codec {
            case "Blackmagic RAW 3:1" :
                return 140.08
            case "Blackmagic RAW 5:1" :
                return 83.815
            case "Blackmagic RAW 8:1" :
                return 52.9
            case "Blackmagic RAW 12:1" :
                return 35.28
            case "ProRes 4444 XQ" :
                return 275.6
            case "ProRes 4444" :
                return 181.9
            case "ProRes 422 HQ" :
                return 121.22
            case "ProRes 422" :
                return 81.15
            case "ProRes 422 LT" :
                return 56.2
            case "ProRes 422 Proxy" :
                return 24.7
            default :
                return 0
            }
        }
        else if cameradata.Resolution.contains("UHD S35") {
            switch cameradata.Codec {
            case "Blackmagic RAW 3:1" :
                return 101.6
            case "Blackmagic RAW 5:1" :
                return 60.8
            case "Blackmagic RAW 8:1" :
                return 38.4
            case "Blackmagic RAW 12:1" :
                return 25.6
            case "ProRes 4444 XQ" :
                return 200
            case "ProRes 4444" :
                return 132
            case "ProRes 422 HQ" :
                return 88
            case "ProRes 422" :
                return 58.88
            case "ProRes 422 LT" :
                return 40.8
            case "ProRes 422 Proxy" :
                return 17.92
            default :
                return 0
            }
        }
        else if cameradata.Resolution.contains("2K S16") {
            switch cameradata.Codec {
            case "Blackmagic RAW 3:1" :
                return 36.37
            case "Blackmagic RAW 5:1" :
                return 22.05
            case "Blackmagic RAW 8:1" :
                return 13.23
            case "Blackmagic RAW 12:1" :
                return 8.82
            case "ProRes 4444 XQ" :
                return 68.9
            case "ProRes 4444" :
                return 45.474
            case "ProRes 422 HQ" :
                return 30.32
            case "ProRes 422" :
                return 20.28
            case "ProRes 422 LT" :
                return 14.06
            case "ProRes 422 Proxy" :
                return 6.173
            default :
                return 0
            }
        }
        else if cameradata.Resolution.contains("HD S16") {
            switch cameradata.Codec {
            case "Blackmagic RAW 3:1" :
                return 26.4
            case "Blackmagic RAW 5:1" :
                return 16
            case "Blackmagic RAW 8:1" :
                return 9.6
            case "Blackmagic RAW 12:1" :
                return 6.4
            case "ProRes 4444 XQ" :
                return 50
            case "ProRes 4444" :
                return 33
            case "ProRes 422 HQ" :
                return 22
            case "ProRes 422" :
                return 14.72
            case "ProRes 422 LT" :
                return 10.2
            case "ProRes 422 Proxy" :
                return 4.48
            default :
                return 0
            }
        }
    }
    return 0
}

func BMDResolutionMutiplier(cameradata:CameraData) -> Double {
    if cameradata.CameraName.contains("12K") {
        if cameradata.Resolution.contains("[17:9]") {
            return 1
        }
        else if cameradata.Resolution.contains("[16:9]"){
            return 1.0667
        }
        else if cameradata.Resolution.contains("[2.4:1]"){
            return 1.2676
        }
    }
    else if cameradata.CameraName.contains("4.6K") {
        if cameradata.Resolution.contains("[16:9]") {
            return 1
        }
        else if cameradata.Resolution.contains("[17:9]"){
            return 1.0667
        }
        else if cameradata.Resolution.contains("[2.4:1]"){
            return 1.35
        }
    }
    return 0
}


func BMDCodecSpeedmbps(cameradata:CameraData) -> Double {
    return (BMDCodecSpeedMBPS(cameradata:cameradata) * RateMultiplier(cameradata: cameradata) * 8) / BMDResolutionMutiplier (cameradata:cameradata)
}
