//
//  BMDCount.swift
//  Taurus
//
//  Created by 吴坤城 on 5/10/24.
//

import Foundation

func BMDCodecSpeedMBPS(cameradata:CameraData) -> Double {
    if cameradata.CameraName.contains("Cine") {
        if cameradata.Resolution.contains("Immersive") {
            switch cameradata.Codec {
            case "Blackmagic RAW 5:1" :
                return 854
            case "Blackmagic RAW 8:1" :
                return 534
            case "Blackmagic RAW 12:1" :
                return 356
            case "Blackmagic RAW 18:1" :
                return 237
            default :
                return 0
            }
        }
        else if cameradata.Resolution.contains("17K") {
            switch cameradata.Codec {
            case "Blackmagic RAW 3:1" :
                return 1700
            case "Blackmagic RAW 8:1" :
                return 638
            case "Blackmagic RAW 12:1" :
                return 425
            case "Blackmagic RAW 18:1" :
                return 284
            default :
                return 0
            }
        }
        else if cameradata.Resolution.contains("12K") {
            switch cameradata.Codec {
            case "Blackmagic RAW 3:1" :
                return 1200
            case "Blackmagic RAW 8:1" :
                return 448
            case "Blackmagic RAW 12:1" :
                return 299
            case "Blackmagic RAW 18:1" :
                return 199
            default :
                return 0
            }
        }
        else if cameradata.Resolution.contains("9K") {
            switch cameradata.Codec {
            case "Blackmagic RAW 3:1" :
                return 714
            case "Blackmagic RAW 8:1" :
                return 268
            case "Blackmagic RAW 12:1" :
                return 179
            case "Blackmagic RAW 18:1" :
                return 119
            default :
                return 0
            }
        }
        else if cameradata.Resolution.contains("8K") {
            switch cameradata.Codec {
            case "Blackmagic RAW 3:1" :
                return 758
            case "Blackmagic RAW 5:1" :
                return 455
            case "Blackmagic RAW 8:1" :
                return 284
            case "Blackmagic RAW 12:1" :
                return 190
            default :
                return 0
            }
        }
        else if cameradata.Resolution.contains("4K") {
            switch cameradata.Codec {
            case "Blackmagic RAW 3:1" :
                return 191
            case "Blackmagic RAW 4:1" :
                return 144
            case "Blackmagic RAW 5:1" :
                return 115
            case "Blackmagic RAW 6:1" :
                return 95.9
            default :
                return 0
            }
        }
    }
    
    else if cameradata.CameraName == "Blackmagic URSA Mini Pro 12K" {
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
    if cameradata.CameraName.contains("17K 65") {
        if cameradata.Resolution.contains("17K") {
            if cameradata.Resolution.contains("[17:9]") {
                return 1.1406
            }
            else if cameradata.Resolution.contains("[16:9]"){
                return 1.22483
            }
            else if cameradata.Resolution.contains("[2:1]"){
                return 1.0863
            }
            else if cameradata.Resolution.contains("[2.4:1]"){
                return 1.1019
            }
            else if cameradata.Resolution.contains("[OG]"){
                return 1
            }
        }
        else if cameradata.Resolution.contains("12K") {
            if cameradata.Resolution.contains("[3:2]") {
                return 1
            }
            else if cameradata.Resolution.contains("[17:9]"){
                return 1.24074
            }
            else if cameradata.Resolution.contains("[16:9]"){
                return 1.1631945
            }
            else if cameradata.Resolution.contains("[2.4:1]"){
                return 1.57277
            }
            else if cameradata.Resolution.contains("[6:5]"){
                return 1.273632
            }
        }
        else if cameradata.Resolution.contains("8K 65") || cameradata.Resolution.contains("4K 65") {
            if cameradata.Resolution.contains("[OG]") {
                return 1
            }
            else if cameradata.Resolution.contains("[2:1]"){
                return 1.08631
            }
        }
        else if cameradata.Resolution.contains("8K LF") || cameradata.Resolution.contains("4K LF"){
            if cameradata.Resolution.contains("[3:2]") {
                return 1.42578125
            }
            else if cameradata.Resolution.contains("[16:9]"){
                return 1.65846
            }
            else if cameradata.Resolution.contains("[17:9]"){
                return 1.769
            }
            else if cameradata.Resolution.contains("[6:5]"){
                return 1.81592
            }
            else if cameradata.Resolution.contains("[2.4:1]"){
                return 1.242426
            }
        }
    }
    
    else if cameradata.CameraName.contains("Immersive") {
        return 1
    }
    
    else if cameradata.CameraName.contains("12K LF") {
        if cameradata.Resolution.contains("12K") {
            if cameradata.Resolution.contains("[OG]") {
                return 1
            }
            else if cameradata.Resolution.contains("[17:9]"){
                return 1.24074
            }
            else if cameradata.Resolution.contains("[16:9]"){
                return 1.1631945
            }
            else if cameradata.Resolution.contains("[2.4:1]"){
                return 1.57277
            }
            else if cameradata.Resolution.contains("[6:5]"){
                return 1.273632
            }
        }
        else if cameradata.Resolution.contains("8K LF") || cameradata.Resolution.contains("4K LF"){
            if cameradata.Resolution.contains("[OG]") {
                return 1.42578125
            }
            else if cameradata.Resolution.contains("[16:9]"){
                return 1.65846
            }
            else if cameradata.Resolution.contains("[17:9]"){
                return 1.769
            }
            else if cameradata.Resolution.contains("[6:5]"){
                return 1.81592
            }
            else if cameradata.Resolution.contains("[2.4:1]"){
                return 1.242426
            }
        }
        else if cameradata.Resolution.contains("9K") {
            if cameradata.Resolution.contains("[3:2]") {
                return 1
            }
            else if cameradata.Resolution.contains("[16:9]"){
                return 1.38544
            }
            else if cameradata.Resolution.contains("[17:9]"){
                return 1.2926
            }
            else if cameradata.Resolution.contains("[6:5]"){
                return 1.197472
            }
            else if cameradata.Resolution.contains("[2.4:1]"){
                return 1.63783
            }
        }
    }
    
    else if cameradata.CameraName == "Blackmagic URSA Mini Pro 12K" {
        if cameradata.Resolution.contains("[17:9]") {
            return 1
        }
        else if cameradata.Resolution.contains("[16:9]"){
            return 1.0667
        }
        else if cameradata.Resolution.contains("[2.4:1]"){
            return 1.2676
        }
        else if cameradata.Resolution.contains("[6:5]"){
            return 1.6180
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
    if cameradata.CameraName == "Blackmagic Cinema Camera 6K" {
        return BMCC6KCodecSpeedMbps(cameradata: cameradata)
    }

    return (BMDCodecSpeedMBPS(cameradata:cameradata) * RateMultiplier(cameradata: cameradata) * 8) / BMDResolutionMutiplier (cameradata:cameradata)
}

private func BMCC6KCodecSpeedMbps(cameradata:CameraData) -> Double {
    let storageMBpsAt30 = BMCC6KStorageRateMBpsAt30(cameradata: cameradata)
    let rate = RateSpeed(cameradata: cameradata)
    if storageMBpsAt30 == 0 || rate == 0 {
        return 0
    }

    return storageMBpsAt30 * 8 * rate / 30
}

private func BMCC6KStorageRateMBpsAt30(cameradata:CameraData) -> Double {
    let values: [String: (Double, Double, Double, Double)] = [
        "6K FF[6048*4032][OG]": (370, 223, 140, 94),
        "4.8K FF[4832*4032][6:5 ANA]": (297, 179, 112, 75),
        "6K FF[6048*3200][17:9]": (295, 177, 111, 75),
        "6K FF[6048*2520][2.4:1]": (233, 140, 88, 59),
        "4K S35[4096*3072][4:3]": (192, 116, 73, 49),
        "4K S35[4096*2160][17:9]": (136, 82, 52, 35),
        "2K S16[2112*1184][16:9]": (40, 24, 16, 11),
        "FHD[1920*1080][16:9]": (33, 20, 13, 9),
    ]

    guard let rates = values[cameradata.Resolution] else {
        return 0
    }

    switch cameradata.Codec {
    case "Blackmagic RAW 3:1":
        return rates.0
    case "Blackmagic RAW 5:1":
        return rates.1
    case "Blackmagic RAW 8:1":
        return rates.2
    case "Blackmagic RAW 12:1":
        return rates.3
    default:
        return 0
    }
}
