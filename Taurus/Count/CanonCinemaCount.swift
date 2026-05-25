//
//  CanonCinemaCount.swift
//  Taurus
//
//  Created by 吴坤城 on 6/9/24.
//

import Foundation

func CanonCinemaResolutionSpeed(cameradata:CameraData) -> Double {
    if cameradata.CameraName == "CinemaEOS C70" {
        if cameradata.Codec.contains("HQ") {
            if cameradata.Resolution.contains("2K") {
                return 205
            }
        }
        else if cameradata.Codec.contains("ST") {
            if cameradata.Resolution.contains("4K") {
                return 398
            }
            else if cameradata.Resolution.contains("2K") {
                return 101
            }
        }
        else if cameradata.Codec.contains("LT") {
            if cameradata.Resolution.contains("4K") {
                return 258
            }
            else if cameradata.Resolution.contains("2K") {
                return 66
            }
        }
        else if cameradata.Codec == "XF-AVC Intra" {
            if cameradata.Resolution.contains("4K") || cameradata.Resolution.contains("UHD") {
                return 240
            }
            else if cameradata.Resolution.contains("2K") || cameradata.Resolution.contains("FHD") {
                if cameradata.Rate == "59.940" || cameradata.Rate == "50.000" {
                    return 310
                }
                else {
                    return 160
                }
            }
        }
        else if cameradata.Codec == "XF-AVC LongGOP" {
            if cameradata.Resolution.contains("4K") || cameradata.Resolution.contains("UHD") {
                if cameradata.Rate == "59.940" || cameradata.Rate == "50.000" {
                    return 310
                }
                else {
                    return 160
                }
            }
            else if cameradata.Resolution == "HD S35[10bit 4:2:2]" || cameradata.Resolution == "HD S16[10bit 4:2:2]" {
                return 24
            }
            else {
                return 50
            }
        }
    }
    
    else if cameradata.CameraName == "CinemaEOS R5C" {
        if cameradata.Codec.contains("HQ") {
            if cameradata.Resolution.contains("6K") {
                return 1700
            }
            else {
                return 430
            }
        }
        else if cameradata.Codec.contains("ST") {
            if cameradata.Resolution.contains("8K") {
                return 1580
            }
            else if cameradata.Resolution.contains("6K") {
                return 836
            }
            else {
                return 212
            }
        }
        else if cameradata.Codec.contains("LT") {
            if cameradata.Resolution.contains("8K") {
                return 1030
            }
            else if cameradata.Resolution.contains("6K") {
                return 544
            }
            else {
                return 138
            }
        }
        else if cameradata.Codec == "XF-AVC Intra" {
            if cameradata.Resolution.contains("4K") || cameradata.Resolution.contains("UHD") {
                if cameradata.Rate == "59.940" || cameradata.Rate == "50.000" {
                    return 810
                }
                else {
                    return 410
                }
            }
            else if cameradata.Resolution.contains("2K") || cameradata.Resolution.contains("FHD") {
                if cameradata.Rate == "59.940" || cameradata.Rate == "50.000" {
                    return 310
                }
                else {
                    return 160
                }
            }
        }
        else if cameradata.Codec == "XF-AVC LongGOP" {
            if cameradata.Resolution.contains("4K") || cameradata.Resolution.contains("UHD") {
                if cameradata.Rate == "59.940" || cameradata.Rate == "50.000" {
                    return 260
                }
                else {
                    return 160
                }
            }
            else if cameradata.Resolution.contains("2K") || cameradata.Resolution.contains("FHD") {
                return 50
            }
            else if cameradata.Resolution == "HD FF[10bit 4:2:2]" || cameradata.Resolution == "HD S35[10bit 4:2:2]" || cameradata.Resolution == "HD S16[10bit 4:2:2]" {
                return 24
            }
            else {
                return 50
            }
        }
    }
    
    else if cameradata.CameraName == "CinemaEOS C500 Mark2" {
        if cameradata.Codec == "Cinema RAW Light" {
            if cameradata.Resolution.contains("6K") {
                return 2100
            }
            else if cameradata.Resolution.contains("4.2K") {
                return 1480
            }
            else if cameradata.Resolution.contains("3.8K") {
                return 1330
            }
            else if cameradata.Resolution.contains("4K") {
                return 1000
            }
            else if cameradata.Resolution.contains("2K") {
                return 250
            }
        }
        else if cameradata.Codec.contains("HQ") {
            if cameradata.Resolution.contains("6K") {
                return 1700
            }
            else if cameradata.Resolution.contains("4.2K") {
                return 1200
            }
            else if cameradata.Resolution.contains("3.8K") {
                return 1080
            }
            else if cameradata.Resolution.contains("4K") {
                return 807
            }
            else if cameradata.Resolution.contains("2K") {
                return 205
            }
        }
        else if cameradata.Codec.contains("ST") {
            if cameradata.Resolution.contains("6K") {
                return 836
            }
            else if cameradata.Resolution.contains("4.2K") {
                return 590
            }
            else if cameradata.Resolution.contains("3.8K") {
                return 531
            }
            else if cameradata.Resolution.contains("4K") {
                return 398
            }
            else if cameradata.Resolution.contains("2K") {
                return 101
            }
        }
        else if cameradata.Codec.contains("LT") {
            if cameradata.Resolution.contains("6K") {
                return 544
            }
            else if cameradata.Resolution.contains("4.2K") {
                return 384
            }
            else if cameradata.Resolution.contains("3.8K") {
                return 345
            }
            else if cameradata.Resolution.contains("4K") {
                return 259
            }
            else if cameradata.Resolution.contains("2K") {
                return 66
            }
        }
        else if cameradata.Codec == "XF-AVC Intra" {
            if cameradata.Resolution.contains("4K") || cameradata.Resolution.contains("UHD") {
                if cameradata.Rate == "59.940" || cameradata.Rate == "50.000" {
                    return 810
                }
                else {
                    return 410
                }
            }
            else if cameradata.Resolution.contains("2K") || cameradata.Resolution.contains("FHD") {
                if cameradata.Rate == "59.940" || cameradata.Rate == "50.000" {
                    return 310
                }
                else {
                    return 160
                }
            }
        }
        else if cameradata.Codec == "XF-AVC LongGOP" {
            if cameradata.Resolution.contains("4K") || cameradata.Resolution.contains("UHD") {
                if cameradata.Rate == "59.940" || cameradata.Rate == "50.000" {
                    return 260
                }
                else {
                    return 160
                }
            }
            else if cameradata.Resolution.contains("2K") || cameradata.Resolution.contains("FHD") {
                return 50
            }
            else if cameradata.Resolution == "HD FF[10bit 4:2:2]" || cameradata.Resolution == "HD S35[10bit 4:2:2]" || cameradata.Resolution == "HD S16[10bit 4:2:2]" {
                return 24
            }
            else {
                return 50
            }
        }
    }
    
    else if cameradata.CameraName.contains("C400") {
        if cameradata.Codec.contains("RAW") {
            if cameradata.Codec.contains("HQ") {
                if cameradata.Resolution.contains("6K") {
                    return 1730
                }
                else if cameradata.Resolution.contains("4.3K") {
                    return 916
                }
                else if cameradata.Resolution.contains("2K") {
                    return 230
                }
            }
            else if cameradata.Codec.contains("ST") {
                if cameradata.Resolution.contains("6K") {
                    return 850
                }
                else if cameradata.Resolution.contains("4.3K") {
                    return 451
                }
                else if cameradata.Resolution.contains("2K") {
                    return 114
                }
            }
            else if cameradata.Codec.contains("LT") {
                if cameradata.Resolution.contains("6K") {
                    return 553
                }
                else if cameradata.Resolution.contains("4.3K") {
                    return 293
                }
                else if cameradata.Resolution.contains("2K") {
                    return 74
                }
            }
        }
        else if cameradata.Codec == "XF-HEVC S LongGOP" {
            if cameradata.Resolution.contains("4:2:2") {
                if cameradata.Resolution.contains("4K") || cameradata.Resolution.contains("UHD") {
                    if cameradata.Rate == "59.940" || cameradata.Rate == "50.000" {
                        return 225
                    }
                    else {
                        return 135
                    }
                }
                else {
                    return 50
                }
            }
            if cameradata.Resolution.contains("4:2:0") {
                if cameradata.Resolution.contains("4K") || cameradata.Resolution.contains("UHD") {
                    if cameradata.Rate == "59.940" || cameradata.Rate == "50.000" {
                        return 150
                    }
                    else {
                        return 100
                    }
                }
                else {
                    return 35
                }
            }
        }
        else if cameradata.Codec == "XF-AVC S Intra" {
            if cameradata.Resolution.contains("4K") || cameradata.Resolution.contains("UHD") {
                return 480
            }
            else if cameradata.Resolution.contains("2K") || cameradata.Resolution.contains("FHD") {
                return 120
            }
        }
        else if cameradata.Codec == "XF-AVC S LongGOP" {
            if cameradata.Resolution.contains("4:2:2") {
                if cameradata.Resolution.contains("4K") || cameradata.Resolution.contains("UHD") {
                    if cameradata.Rate == "50.000" || cameradata.Rate == "59.940" {
                        return 250
                    }
                    else {
                        return 150
                    }
                }
                else {
                    return 50
                }
            }
            else if cameradata.Resolution.contains("4:2:0") {
                if cameradata.Resolution.contains("4K") || cameradata.Resolution.contains("UHD") {
                    if cameradata.Rate == "50.000" || cameradata.Rate == "59.940" {
                        return 150
                    }
                    else {
                        return 100
                    }
                }
                else {
                    return 35
                }
            }
        }
        else if cameradata.Codec == "XF-AVC Intra" {
            if cameradata.Resolution.contains("4K") || cameradata.Resolution.contains("UHD") {
                return 480
            }
            else if cameradata.Resolution.contains("2K") || cameradata.Resolution.contains("FHD") {
                return 120
            }
        }
        else if cameradata.Codec == "XF-AVC LongGOP" {
            if cameradata.Resolution.contains("4K") || cameradata.Resolution.contains("UHD") {
                if cameradata.Rate == "50.000" || cameradata.Rate == "59.940" {
                    return 250
                }
                else {
                    return 150
                }
            }
            else {
                return 50
            }
        }
    }
    
    else if cameradata.CameraName.contains("C80") {
        if cameradata.Codec.contains("RAW") {
            if cameradata.Codec.contains("ST") {
                return 451
            }
            else if cameradata.Codec.contains("LT") {
                if cameradata.Resolution.contains("6K") {
                    return 553
                }
                else if cameradata.Resolution.contains("4.3K") && cameradata.Rate != "59.940" {
                    return 293
                }
                else {
                    return 271.2
                }
            }
        }
        else if cameradata.Codec == "XF-HEVC S LongGOP" {
            if cameradata.Resolution.contains("4:2:2") {
                if cameradata.Resolution.contains("4K") || cameradata.Resolution.contains("UHD") {
                    if cameradata.Rate == "59.940" || cameradata.Rate == "50.000" {
                        return 225
                    }
                    else {
                        return 135
                    }
                }
                else {
                    return 50
                }
            }
            if cameradata.Resolution.contains("4:2:0") {
                if cameradata.Resolution.contains("4K") || cameradata.Resolution.contains("UHD") {
                    if cameradata.Rate == "59.940" || cameradata.Rate == "50.000" {
                        return 150
                    }
                    else {
                        return 100
                    }
                }
                else {
                    return 35
                }
            }
        }
        else if cameradata.Codec == "XF-AVC S Intra" {
            if (cameradata.Resolution.contains("4K") || cameradata.Resolution.contains("UHD")) {
                if cameradata.Rate == "50.000" || cameradata.Rate == "59.940" {
                    return 240
                }
                else {
                    return 480
                }
            }
            else if cameradata.Resolution.contains("2K") || cameradata.Resolution.contains("FHD") {
                return 120
            }
        }
        else if cameradata.Codec == "XF-AVC S LongGOP" {
            if cameradata.Resolution.contains("4:2:2") {
                if cameradata.Resolution.contains("4K") || cameradata.Resolution.contains("UHD") {
                    if cameradata.Rate == "50.000" || cameradata.Rate == "59.940" {
                        return 250
                    }
                    else {
                        return 150
                    }
                }
                else {
                    return 50
                }
            }
            else if cameradata.Resolution.contains("4:2:0") {
                if cameradata.Resolution.contains("4K") || cameradata.Resolution.contains("UHD") {
                    if cameradata.Rate == "50.000" || cameradata.Rate == "59.940" {
                        return 150
                    }
                    else {
                        return 100
                    }
                }
                else {
                    return 35
                }
            }
        }
        else if cameradata.Codec == "XF-AVC Intra" {
            if (cameradata.Resolution.contains("4K") || cameradata.Resolution.contains("UHD")) {
                if cameradata.Rate == "50.000" || cameradata.Rate == "59.940" {
                    return 240
                }
                else {
                    return 480
                }
            }
            else if cameradata.Resolution.contains("2K") || cameradata.Resolution.contains("FHD") {
                return 120
            }
        }
        else if cameradata.Codec == "XF-AVC LongGOP" {
            if cameradata.Resolution.contains("4K") || cameradata.Resolution.contains("UHD") {
                if cameradata.Rate == "50.000" || cameradata.Rate == "59.940" {
                    return 250
                }
                else {
                    return 150
                }
            }
            else {
                return 50
            }
        }
    }
    
    else if cameradata.CameraName == "CinemaEOS C300 Mark3" {
        if cameradata.Codec == "Cinema RAW Light" {
            if cameradata.Resolution.contains("4K") {
                return 1000
            }
            else if cameradata.Resolution.contains("2K") {
                return 250
            }
        }
        else if cameradata.Codec == "XF-AVC Intra" {
            if cameradata.Resolution.contains("4K") || cameradata.Resolution.contains("UHD") {
                if cameradata.Rate == "59.940" || cameradata.Rate == "50.000" {
                    return 810
                }
                else {
                    return 410
                }
            }
            else if cameradata.Resolution.contains("2K") || cameradata.Resolution.contains("FHD") {
                if cameradata.Rate == "59.940" || cameradata.Rate == "50.000" {
                    return 310
                }
                else {
                    return 160
                }
            }
        }
        else if cameradata.Codec == "XF-AVC LongGOP" {
            if cameradata.Resolution.contains("4K") || cameradata.Resolution.contains("UHD") {
                if cameradata.Rate == "59.940" || cameradata.Rate == "50.000" {
                    return 260
                }
                else {
                    return 160
                }
            }
            else if cameradata.Resolution.contains("2K") || cameradata.Resolution.contains("FHD") {
                return 50
            }
            else if cameradata.Resolution == "HD FF[10bit 4:2:2]" || cameradata.Resolution == "HD S35[10bit 4:2:2]" || cameradata.Resolution == "HD S16[10bit 4:2:2]" {
                return 24
            }
            else {
                return 50
            }
        }
    }
    return 0
}

private func CanonCinemaC50CodecSpeed(cameradata: CameraData) -> Double {
    let codec = cameradata.Codec
    
    if codec.contains("Cinema RAW Light") {
        return CanonCinemaC50RawSpeed(cameradata: cameradata)
    }
    else if codec.hasPrefix("XF-HEVC S Intra") {
        return CanonCinemaC50HEVCSIntraSpeed(cameradata: cameradata)
    }
    else if codec == "XF-HEVC S LongGOP" {
        return CanonCinemaC50LongGOPSpeed(cameradata: cameradata, highColorSpeed: 135, lowColorSpeed: 100)
    }
    else if codec.hasPrefix("XF-AVC S Intra") {
        return CanonCinemaC50AVCSIntraSpeed(cameradata: cameradata)
    }
    else if codec == "XF-AVC S LongGOP" {
        return CanonCinemaC50LongGOPSpeed(cameradata: cameradata, highColorSpeed: 150, lowColorSpeed: 100)
    }
    else if codec == "XF-AVC Intra" {
        return CanonCinemaC50XFAVCSpeed(cameradata: cameradata, isIntra: true)
    }
    else if codec == "XF-AVC LongGOP" {
        return CanonCinemaC50XFAVCSpeed(cameradata: cameradata, isIntra: false)
    }
    
    return 0
}

private func CanonCinemaC50RawSpeed(cameradata: CameraData) -> Double {
    let codec = cameradata.Codec
    let resolution = cameradata.Resolution
    
    let quality: String
    if codec.hasSuffix("HQ") {
        quality = "HQ"
    }
    else if codec.hasSuffix("ST") {
        quality = "ST"
    }
    else if codec.hasSuffix("LT") {
        quality = "LT"
    }
    else {
        quality = "RAW"
    }
    
    if resolution.contains("7K FF[6960*4640]") {
        switch quality {
        case "HQ": return CanonCinemaC50RateValue(cameradata.Rate, values: ["23.976": 1380, "24.000": 1380, "25.000": 1380, "29.970": 1380], fallbackBase24: 1380)
        case "ST": return CanonCinemaC50RateValue(cameradata.Rate, values: ["23.976": 924, "24.000": 924, "25.000": 924, "29.970": 924], fallbackBase24: 924)
        case "LT": return CanonCinemaC50RateValue(cameradata.Rate, values: ["23.976": 646, "24.000": 646, "25.000": 646, "29.970": 646], fallbackBase24: 646)
        default: return CanonCinemaC50RateValue(cameradata.Rate, values: ["23.976": 2140, "24.000": 2140, "25.000": 2140, "29.970": 2140], fallbackBase24: 2140)
        }
    }
    else if resolution.contains("7K FF[6960*3672]") {
        switch quality {
        case "HQ": return CanonCinemaC50RateValue(cameradata.Rate, values: ["23.976": 1340, "24.000": 1340, "25.000": 1400, "29.970": 1680, "50.000": 1540, "59.940": 1850], fallbackBase24: 1340)
        case "ST": return CanonCinemaC50RateValue(cameradata.Rate, values: ["23.976": 906, "24.000": 906, "25.000": 945, "29.970": 1130, "50.000": 1030, "59.940": 1240], fallbackBase24: 906)
        case "LT": return CanonCinemaC50RateValue(cameradata.Rate, values: ["23.976": 630, "24.000": 630, "25.000": 657, "29.970": 786, "50.000": 721, "59.940": 865], fallbackBase24: 630)
        default: return CanonCinemaC50RateValue(cameradata.Rate, values: ["23.976": 2080, "24.000": 2080, "25.000": 2170, "29.970": 2600, "50.000": 2390, "59.940": 2860], fallbackBase24: 2080)
        }
    }
    else if resolution.contains("5K S35") {
        switch quality {
        case "HQ": return CanonCinemaC50RateValue(cameradata.Rate, values: ["23.976": 672, "24.000": 672, "25.000": 703, "29.970": 840, "50.000": 772, "59.940": 925], fallbackBase24: 672)
        case "ST": return CanonCinemaC50RateValue(cameradata.Rate, values: ["23.976": 453, "24.000": 453, "25.000": 474, "29.970": 567, "50.000": 520, "59.940": 624], fallbackBase24: 453)
        case "LT": return CanonCinemaC50RateValue(cameradata.Rate, values: ["23.976": 315, "24.000": 315, "25.000": 329, "29.970": 393, "50.000": 361, "59.940": 433], fallbackBase24: 315)
        default: return CanonCinemaC50RateValue(cameradata.Rate, values: ["23.976": 1040, "24.000": 1040, "25.000": 1090, "29.970": 1300, "50.000": 1190, "59.940": 1430], fallbackBase24: 1040)
        }
    }
    else if resolution.contains("2.5K S16") {
        switch quality {
        case "HQ": return CanonCinemaC50RateValue(cameradata.Rate, values: ["23.976": 337, "24.000": 337, "25.000": 352, "29.970": 421, "50.000": 386, "59.940": 463], fallbackBase24: 337)
        case "ST": return CanonCinemaC50RateValue(cameradata.Rate, values: ["23.976": 228, "24.000": 228, "25.000": 238, "29.970": 284, "50.000": 261, "59.940": 313], fallbackBase24: 228)
        case "LT": return CanonCinemaC50RateValue(cameradata.Rate, values: ["23.976": 158, "24.000": 158, "25.000": 164, "29.970": 196, "50.000": 180, "59.940": 216], fallbackBase24: 158)
        default: return CanonCinemaC50RateValue(cameradata.Rate, values: ["23.976": 525, "24.000": 525, "25.000": 548, "29.970": 655, "50.000": 600, "59.940": 720], fallbackBase24: 525)
        }
    }
    
    return 0
}

private func CanonCinemaC50HEVCSIntraSpeed(cameradata: CameraData) -> Double {
    if cameradata.Codec.hasSuffix("HQ") {
        return CanonCinemaC50RateValue(cameradata.Rate, values: ["23.976": 1730, "24.000": 1730], fallbackBase24: 1730)
    }
    else if cameradata.Codec.hasSuffix("ST") {
        return CanonCinemaC50RateValue(cameradata.Rate, values: ["23.976": 1300, "24.000": 1300, "25.000": 1350, "29.970": 1620], fallbackBase24: 1300)
    }
    else if cameradata.Codec.hasSuffix("LT") {
        return CanonCinemaC50RateValue(cameradata.Rate, values: ["23.976": 864, "24.000": 864, "25.000": 900, "29.970": 1080], fallbackBase24: 864)
    }
    return 0
}

private func CanonCinemaC50AVCSIntraSpeed(cameradata: CameraData) -> Double {
    let resolution = cameradata.Resolution
    
    if resolution.contains("2K") || resolution.contains("FHD") {
        return CanonCinemaC50RateValue(camerataRate: cameradata.Rate, low24: 120, low25: 125, low30: 150, high50: 250, high60: 300, hfr100: 500, hfr120: 600, hfr150: 750, hfr180: 900)
    }
    
    if cameradata.Codec.hasSuffix("HQ") {
        return CanonCinemaC50RateValue(camerataRate: cameradata.Rate, low24: 480, low25: 500, low30: 600, high50: 1000, high60: 1200)
    }
    else if cameradata.Codec.hasSuffix("ST") {
        return CanonCinemaC50RateValue(camerataRate: cameradata.Rate, low24: 360, low25: 375, low30: 450, high50: 750, high60: 900, hfr100: 1500, hfr120: 1800)
    }
    else if cameradata.Codec.hasSuffix("LT") {
        return CanonCinemaC50RateValue(camerataRate: cameradata.Rate, low24: 240, low25: 250, low30: 300, high50: 500, high60: 600, hfr100: 1000, hfr120: 1200)
    }
    
    return 0
}

private func CanonCinemaC50LongGOPSpeed(cameradata: CameraData, highColorSpeed: Double, lowColorSpeed: Double) -> Double {
    let resolution = cameradata.Resolution
    let speed24 = resolution.contains("4:2:0") || resolution.contains("8bit") ? lowColorSpeed : highColorSpeed
    
    if resolution.contains("7K FF[6912*4608]") {
        return resolution.contains("4:2:0") ? 360 : 486
    }
    
    if resolution.contains("4K") || resolution.contains("UHD") {
        let high60 = codecLongGOPHigh60Base(speed24)
        let hfr = speed24 == highColorSpeed ? (highColorSpeed == 135 ? 450.0 : 500.0) : 300.0
        return CanonCinemaC50RateValue(camerataRate: cameradata.Rate, low24: speed24, low25: speed24, low30: speed24, high50: high60, high60: high60, hfr100: hfr, hfr120: hfr)
    }
    
    if speed24 == 35 || speed24 == 100 && resolution.contains("4:2:0") || resolution.contains("8bit") {
        return CanonCinemaC50RateValue(camerataRate: cameradata.Rate, low24: 35, low25: 35, low30: 35, high50: 35, high60: 35, hfr100: 70, hfr120: 70, hfr150: 105, hfr180: 105)
    }
    
    return CanonCinemaC50RateValue(camerataRate: cameradata.Rate, low24: 50, low25: 50, low30: 50, high50: 50, high60: 50, hfr100: 100, hfr120: 100, hfr150: 150, hfr180: 150)
}

private func CanonCinemaC50XFAVCSpeed(cameradata: CameraData, isIntra: Bool) -> Double {
    let resolution = cameradata.Resolution
    
    if isIntra {
        if resolution.contains("4K") || resolution.contains("UHD") {
            return CanonCinemaC50RateValue(camerataRate: cameradata.Rate, low24: 410, low25: 410, low30: 410, high50: 810, high60: 810)
        }
        return CanonCinemaC50RateValue(camerataRate: cameradata.Rate, low24: 160, low25: 160, low30: 160, high50: 310, high60: 310)
    }
    
    if resolution.contains("4K") || resolution.contains("UHD") {
        return CanonCinemaC50RateValue(camerataRate: cameradata.Rate, low24: 160, low25: 160, low30: 160, high50: 260, high60: 260)
    }
    
    return CanonCinemaC50RateValue(camerataRate: cameradata.Rate, low24: 50, low25: 50, low30: 50, high50: 50, high60: 50)
}

private func CanonCinemaC50RateValue(_ rate: String, values: [String: Double], fallbackBase24: Double) -> Double {
    if let value = values[rate] {
        return value
    }
    return fallbackBase24 * RateSpeedValue(rate) / 24
}

private func CanonCinemaC50RateValue(camerataRate rate: String, low24: Double, low25: Double, low30: Double, high50: Double, high60: Double, hfr100: Double? = nil, hfr120: Double? = nil, hfr150: Double? = nil, hfr180: Double? = nil) -> Double {
    switch rate {
    case "23.976", "24.000":
        return low24
    case "25.000":
        return low25
    case "29.970":
        return low30
    case "50.000":
        return high50
    case "59.940":
        return high60
    case "100.000":
        return hfr100 ?? low24 * RateSpeedValue(rate) / 24
    case "119.880", "120.000":
        return hfr120 ?? low24 * RateSpeedValue(rate) / 24
    case "150.000":
        return hfr150 ?? low24 * RateSpeedValue(rate) / 24
    case "179.820":
        return hfr180 ?? low24 * RateSpeedValue(rate) / 24
    default:
        return low24 * RateSpeedValue(rate) / 24
    }
}

private func codecLongGOPHigh60Base(_ speed24: Double) -> Double {
    if speed24 == 135 {
        return 225
    }
    if speed24 == 150 {
        return 250
    }
    if speed24 == 100 {
        return 150
    }
    return speed24
}

private func RateSpeedValue(_ rate: String) -> Double {
    let data = CameraData()
    data.Rate = rate
    return RateSpeed(cameradata: data)
}

func CanonCinemaCodecSpeed(cameradata:CameraData) -> Double {
    if cameradata.CameraName == "CinemaEOS C50" {
        return CanonCinemaC50CodecSpeed(cameradata: cameradata)
    }
    else if cameradata.CameraName.contains("C70") {
        if cameradata.Resolution.contains("410mbps") {
            return 410
        }
        else if cameradata.Codec.contains("RAW") || (cameradata.Codec.contains("Intra") && (cameradata.Resolution.contains("4K") || cameradata.Resolution.contains("UHD"))) {
            return CanonCinemaResolutionSpeed(cameradata: cameradata) * RateMultiplier(cameradata: cameradata)
        }
        else {
            return CanonCinemaResolutionSpeed(cameradata: cameradata)
        }
    }
    else if cameradata.CameraName.contains("R5C") || cameradata.CameraName.contains("C500 Mark2") || cameradata.CameraName.contains("C300 Mark3") {
        if cameradata.Codec == "Cinema RAW Light" {
            return CanonCinemaResolutionSpeed(cameradata: cameradata)
        }
        else if cameradata.Codec.contains("RAW") {
            return CanonCinemaResolutionSpeed(cameradata: cameradata) * RateMultiplier(cameradata: cameradata)
        }
        else {
            return CanonCinemaResolutionSpeed(cameradata: cameradata)
        }
    }
    else if cameradata.CameraName.contains("C400") || cameradata.CameraName.contains("C80") {
        if cameradata.Codec.contains("RAW") || cameradata.Codec.contains("Intra") {
            return CanonCinemaResolutionSpeed(cameradata: cameradata) * RateMultiplier(cameradata: cameradata)
        }
        else {
            return CanonCinemaResolutionSpeed(cameradata: cameradata)
        }
    }
    else {
        return 0
    }
}
