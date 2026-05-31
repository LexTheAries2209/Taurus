//
//  PanaCount.swift
//  Taurus
//
//  Created by 吴坤城 on 12/7/23.
//

import Foundation
import Combine

func PanaNormalizedCodecName(_ PanaCodecName:String) -> String {
    let normalizedAspectName = PanaCodecName.replacingOccurrences(of: "][17:9]", with: "]")
    if normalizedAspectName.hasPrefix("S1R2_ProRes 422_") || normalizedAspectName.hasPrefix("S1R2_ProRes 422 HQ_") || normalizedAspectName.hasPrefix("S1M2_ProRes 422_") || normalizedAspectName.hasPrefix("S1M2_ProRes 422 HQ_") || normalizedAspectName.hasPrefix("S1M2E_ProRes 422_") || normalizedAspectName.hasPrefix("S1M2E_ProRes 422 HQ_") {
        return normalizedAspectName
    }
    return normalizedAspectName.replacingOccurrences(of: "_4K[", with: "_UHD[")
}

func PanaS1R2CodecSpeed(_ PanaCameraCodecName:String) -> Double {
    let normalizedName = PanaNormalizedCodecName(PanaCameraCodecName)
    switch normalizedName {
    case "S1R2_ProRes 422_5.8K[5760*3040][10bit 4:2:2][23.976p]","S1R2_ProRes 422_5.8K[5760*3040][10bit 4:2:2][24p]" :
        return 1000
    case "S1R2_ProRes 422_5.8K[5760*3040][10bit 4:2:2][25p]" :
        return 1100
    case "S1R2_ProRes 422_5.8K[5760*3040][10bit 4:2:2][29.97p]" :
        return 1300
    case "S1R2_ProRes 422 HQ_5.8K[5760*3040][10bit 4:2:2][23.976p]","S1R2_ProRes 422 HQ_5.8K[5760*3040][10bit 4:2:2][24p]" :
        return 1500
    case "S1R2_ProRes 422 HQ_5.8K[5760*3040][10bit 4:2:2][25p]" :
        return 1600
    case "S1R2_ProRes 422 HQ_5.8K[5760*3040][10bit 4:2:2][29.97p]" :
        return 1900
    case "S1R2_ProRes 422_4.7K 4:3[4736*3552][10bit 4:2:2][23.976p]" :
        return 986
    case "S1R2_ProRes 422_4.7K 4:3[4736*3552][10bit 4:2:2][24p]" :
        return 987
    case "S1R2_ProRes 422_4.7K 4:3[4736*3552][10bit 4:2:2][25p]" :
        return 1000
    case "S1R2_ProRes 422_4.7K 4:3[4736*3552][10bit 4:2:2][29.97p]" :
        return 1200
    case "S1R2_ProRes 422 HQ_4.7K 4:3[4736*3552][10bit 4:2:2][23.976p]","S1R2_ProRes 422 HQ_4.7K 4:3[4736*3552][10bit 4:2:2][24p]","S1R2_ProRes 422 HQ_4.7K 4:3[4736*3552][10bit 4:2:2][25p]" :
        return 1500
    case "S1R2_ProRes 422 HQ_4.7K 4:3[4736*3552][10bit 4:2:2][29.97p]" :
        return 1800
    case "S1R2_ProRes RAW_5.8K[5760*3040][12bit RAW][23.976p]","S1R2_ProRes RAW_5.8K[5760*3040][12bit RAW][24p]" :
        return 2200
    case "S1R2_ProRes RAW_5.8K[5760*3040][12bit RAW][25p]" :
        return 2300
    case "S1R2_ProRes RAW_5.8K[5760*3040][12bit RAW][29.97p]" :
        return 2800
    case "S1R2_ProRes RAW HQ_5.8K[5760*3040][12bit RAW][23.976p]","S1R2_ProRes RAW HQ_5.8K[5760*3040][12bit RAW][24p]" :
        return 3400
    case "S1R2_ProRes RAW HQ_5.8K[5760*3040][12bit RAW][25p]" :
        return 3500
    case "S1R2_ProRes RAW HQ_5.8K[5760*3040][12bit RAW][29.97p]" :
        return 4200
    case "S1R2_ProRes 422_DCI 4K[10bit 4:2:2][23.976p]" :
        return 519
    case "S1R2_ProRes 422_DCI 4K[10bit 4:2:2][24p]" :
        return 519
    case "S1R2_ProRes 422_DCI 4K[10bit 4:2:2][25p]" :
        return 541
    case "S1R2_ProRes 422_DCI 4K[10bit 4:2:2][29.97p]" :
        return 648
    case "S1R2_ProRes 422_DCI 4K[10bit 4:2:2][50p]" :
        return 1100
    case "S1R2_ProRes 422_DCI 4K[10bit 4:2:2][59.94p]" :
        return 1300
    case "S1R2_ProRes 422 HQ_DCI 4K[10bit 4:2:2][23.976p]" :
        return 778
    case "S1R2_ProRes 422 HQ_DCI 4K[10bit 4:2:2][24p]" :
        return 779
    case "S1R2_ProRes 422 HQ_DCI 4K[10bit 4:2:2][25p]" :
        return 811
    case "S1R2_ProRes 422 HQ_DCI 4K[10bit 4:2:2][29.97p]" :
        return 972
    case "S1R2_ProRes 422 HQ_DCI 4K[10bit 4:2:2][50p]" :
        return 1560
    case "S1R2_ProRes 422 HQ_DCI 4K[10bit 4:2:2][59.94p]" :
        return 1900
    case "S1R2_ProRes 422_UHD[10bit 4:2:2][23.976p]" :
        return 486
    case "S1R2_ProRes 422_UHD[10bit 4:2:2][24p]" :
        return 487
    case "S1R2_ProRes 422_UHD[10bit 4:2:2][25p]" :
        return 507
    case "S1R2_ProRes 422_UHD[10bit 4:2:2][29.97p]" :
        return 608
    case "S1R2_ProRes 422_UHD[10bit 4:2:2][50p]" :
        return 1000
    case "S1R2_ProRes 422_UHD[10bit 4:2:2][59.94p]" :
        return 1200
    case "S1R2_ProRes 422 HQ_UHD[10bit 4:2:2][23.976p]" :
        return 729
    case "S1R2_ProRes 422 HQ_UHD[10bit 4:2:2][24p]" :
        return 730
    case "S1R2_ProRes 422 HQ_UHD[10bit 4:2:2][25p]" :
        return 760
    case "S1R2_ProRes 422 HQ_UHD[10bit 4:2:2][29.97p]" :
        return 911
    case "S1R2_ProRes 422 HQ_UHD[10bit 4:2:2][50p]" :
        return 1500
    case "S1R2_ProRes 422 HQ_UHD[10bit 4:2:2][59.94p]" :
        return 1800
    case "S1R2_ProRes 422_FHD[10bit 4:2:2][23.976p]" :
        return 121
    case "S1R2_ProRes 422_FHD[10bit 4:2:2][24p]" :
        return 121
    case "S1R2_ProRes 422_FHD[10bit 4:2:2][25p]" :
        return 126
    case "S1R2_ProRes 422_FHD[10bit 4:2:2][29.97p]" :
        return 151
    case "S1R2_ProRes 422_FHD[10bit 4:2:2][50p]" :
        return 252
    case "S1R2_ProRes 422_FHD[10bit 4:2:2][59.94p]" :
        return 302
    case "S1R2_ProRes 422_FHD[10bit 4:2:2][100p]" :
        return 505
    case "S1R2_ProRes 422_FHD[10bit 4:2:2][119.88p]" :
        return 601
    case "S1R2_ProRes 422_FHD[10bit 4:2:2][120p]" :
        return 606
    case "S1R2_ProRes 422 HQ_FHD[10bit 4:2:2][23.976p]" :
        return 181
    case "S1R2_ProRes 422 HQ_FHD[10bit 4:2:2][24p]" :
        return 182
    case "S1R2_ProRes 422 HQ_FHD[10bit 4:2:2][25p]" :
        return 189
    case "S1R2_ProRes 422 HQ_FHD[10bit 4:2:2][29.97p]" :
        return 227
    case "S1R2_ProRes 422 HQ_FHD[10bit 4:2:2][50p]" :
        return 378
    case "S1R2_ProRes 422 HQ_FHD[10bit 4:2:2][59.94p]" :
        return 454
    case "S1R2_ProRes 422 HQ_FHD[10bit 4:2:2][100p]" :
        return 757
    case "S1R2_ProRes 422 HQ_FHD[10bit 4:2:2][119.88p]" :
        return 901
    case "S1R2_ProRes 422 HQ_FHD[10bit 4:2:2][120p]" :
        return 908

    case "S1R2_HEVC LongGOP_8.1K[8064*5376][10bit 4:2:0][23.976p/24p][OG]","S1R2_HEVC LongGOP_8.1K[8064*5376][10bit 4:2:0][23.976p/24p/25p/29.97p][OG]","S1R2_HEVC LongGOP_8.1K 3:2[8064*5376][10bit 4:2:0][23.976p/24p/25p/29.97p]","S1R2_HEVC LongGOP_7.2K[7200*4800][10bit 4:2:0][25p/29.97p][OG]","S1R2_HEVC LongGOP_7.2K[7200*4800][10bit 4:2:0][23.976p/24p/25p/29.97p][OG]","S1R2_HEVC LongGOP_7.2K 3:2[7200*4800][10bit 4:2:0][23.976p/24p/25p/29.97p]","S1R2_HEVC LongGOP_6.4K[6432*4288][10bit 4:2:0][23.976p/24p/25p/29.97p][OG]","S1R2_HEVC LongGOP_6.4K 3:2[6432*4288][10bit 4:2:0][23.976p/24p/25p/29.97p]","S1R2_HEVC LongGOP_8K[10bit 4:2:0][23.976p/24p/25p/29.97p]","S1R2_HEVC LongGOP_8.1K[8128*4288][10bit 4:2:0][23.976p/24p/25p/29.97p]","S1R2_HEVC LongGOP_8K[7680*4320][10bit 4:2:0][23.976p/24p/25p/29.97p]","S1R2_HEVC LongGOP_5.9K[10bit 4:2:0][47.95p/48p/50p/59.94p]","S1R2_HEVC LongGOP_5.9K[5888*3312][10bit 4:2:0][47.95p/48p/50p/59.94p]","S1R2_HEVC LongGOP_5.8K[5760*3040][10bit 4:2:0][47.95p/48p/50p/59.94p]","S1R2_HEVC LongGOP_4.7K 4:3[4736*3552][10bit 4:2:0][47.95p/48p/50p/59.94p]","S1R2_HEVC LongGOP_DCI 4K[10bit 4:2:0][100p/119.88p]","S1R2_HEVC LongGOP_UHD[10bit 4:2:0][100p/119.88p]","S1R2_HEVC LongGOP_DCI 4K[10bit 4:2:0][100p/119.88p/120p]","S1R2_HEVC LongGOP_UHD[10bit 4:2:0][100p/119.88p/120p]" :
        return 300
    case "S1R2_HEVC LongGOP_5.9K[10bit 4:2:0][23.976p/24p/25p/29.97p]","S1R2_HEVC LongGOP_5.9K[5888*3312][10bit 4:2:0][23.976p/24p/25p/29.97p]","S1R2_HEVC LongGOP_5.8K[5760*3040][10bit 4:2:0][23.976p/24p/25p/29.97p]","S1R2_HEVC LongGOP_4.7K 4:3[4736*3552][10bit 4:2:0][23.976p/24p/25p/29.97p]","S1R2_HEVC LongGOP_DCI 4K[10bit 4:2:0][47.95p/48p/50p/59.94p]","S1R2_HEVC LongGOP_UHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","S1R2_AVC LongGOP_DCI 4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","S1R2_AVC LongGOP_UHD[10bit 4:2:2][47.95p/48p/50p/59.94p]" :
        return 200
    case "S1R2_HEVC LongGOP_DCI 4K[10bit 4:2:0][23.976p/24p/25p/29.97p]","S1R2_HEVC LongGOP_UHD[10bit 4:2:0][23.976p/24p/25p/29.97p]","S1R2_HEVC LongGOP_FHD[10bit 4:2:0][100p/119.88p]","S1R2_HEVC LongGOP_FHD[10bit 4:2:0][100p/119.88p/120p]","S1R2_AVC LongGOP_DCI 4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","S1R2_AVC LongGOP_UHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","S1R2_AVC LongGOP_FHD[10bit 4:2:2][100p/119.88p]","S1R2_AVC LongGOP_FHD[10bit 4:2:2][100p/119.88p/120p]" :
        return 150
    case "S1R2_HEVC LongGOP_FHD[10bit 4:2:0][23.976p/24p/25p/29.97p]","S1R2_HEVC LongGOP_FHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","S1R2_AVC LongGOP_FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","S1R2_AVC LongGOP_FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]" :
        return 100

    case "S1R2_AVC ALL-I_DCI 4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","S1R2_AVC ALL-I_UHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","S1R2_AVC ALL-I_FHD[10bit 4:2:2][100p/119.88p]","S1R2_AVC ALL-I_FHD[10bit 4:2:2][100p/119.88p/120p]" :
        return 400
    case "S1R2_AVC ALL-I_DCI 4K[10bit 4:2:2][47.95p/48p/50p/59.94p][Light]","S1R2_AVC ALL-I_UHD[10bit 4:2:2][47.95p/48p/50p/59.94p][Light]" :
        return 600
    case "S1R2_AVC ALL-I_DCI 4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","S1R2_AVC ALL-I_UHD[10bit 4:2:2][47.95p/48p/50p/59.94p]" :
        return 800
    case "S1R2_AVC ALL-I_FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","S1R2_AVC ALL-I_FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]" :
        return 200
    default :
        return 0
    }
}

func PanaS1M2CodecSpeed(_ PanaCameraCodecName:String) -> Double {
    let normalizedName = PanaNormalizedCodecName(PanaCameraCodecName)

    func has(_ text:String) -> Bool {
        normalizedName.contains(text)
    }

    func hasAny(_ texts:[String]) -> Bool {
        texts.contains { normalizedName.contains($0) }
    }

    func proResSpeed(_ p23976:Double, _ p24:Double, _ p25:Double, _ p2997:Double, _ p50:Double? = nil, _ p5994:Double? = nil, _ p100:Double? = nil, _ p11988:Double? = nil, _ p120:Double? = nil) -> Double {
        if has("[23.976p]") { return p23976 }
        if has("[24p]") { return p24 }
        if has("[25p]") { return p25 }
        if has("[29.97p]") { return p2997 }
        if has("[50p]"), let p50 = p50 { return p50 }
        if has("[59.94p]"), let p5994 = p5994 { return p5994 }
        if has("[100p]"), let p100 = p100 { return p100 }
        if has("[119.88p]"), let p11988 = p11988 { return p11988 }
        if has("[120p]"), let p120 = p120 { return p120 }
        return 0
    }

    if has("_ProRes RAW HQ_") {
        if has("5.8K[5760*3040][12bit RAW]") {
            return proResSpeed(3300, 3300, 3437, 4200)
        }
        if has("DCI 4K[12bit RAW]") {
            return proResSpeed(1700, 1700, 1770, 2100, 3500, 4200)
        }
    }

    if has("_ProRes RAW_") {
        if has("5.8K[5760*3040][12bit RAW]") {
            return proResSpeed(2200, 2200, 2292, 2800)
        }
        if has("DCI 4K[12bit RAW]") {
            return proResSpeed(1100, 1100, 1145, 1400, 2333, 2800)
        }
    }

    if has("_ProRes 422 HQ_") {
        if hasAny(["5.8K[5760*3040][10bit 4:2:2]","4.8K 4:3[4800*3600][10bit 4:2:2]"]) {
            return proResSpeed(1500, 1500, 1600, 1900)
        }
        if has("DCI 4K[10bit 4:2:2]") {
            return proResSpeed(778, 779, 811, 972, 1560, 1900)
        }
        if has("UHD[10bit 4:2:2]") {
            return proResSpeed(729, 730, 760, 911, 1500, 1800)
        }
        if has("Cs4K[4096*1728][10bit 4:2:2]") {
            return proResSpeed(622, 623, 649, 778, 1300, 1600)
        }
        if has("3.3K 4:3[3328*2496][10bit 4:2:2]") {
            return proResSpeed(730, 730, 761, 913, 1500, 1800)
        }
        if has("FHD[10bit 4:2:2]") {
            return proResSpeed(181, 182, 189, 227, 378, 454, 757, 901, 908)
        }
    }

    if has("_ProRes 422_") {
        if hasAny(["5.8K[5760*3040][10bit 4:2:2]","4.8K 4:3[4800*3600][10bit 4:2:2]"]) {
            return proResSpeed(1000, 1000, 1100, 1300)
        }
        if has("DCI 4K[10bit 4:2:2]") {
            return proResSpeed(519, 519, 541, 648, 1100, 1300)
        }
        if has("UHD[10bit 4:2:2]") {
            return proResSpeed(486, 487, 507, 608, 1000, 1200)
        }
        if has("Cs4K[4096*1728][10bit 4:2:2]") {
            return proResSpeed(415, 415, 433, 519, 865, 1000)
        }
        if has("3.3K 4:3[3328*2496][10bit 4:2:2]") {
            return proResSpeed(487, 487, 508, 609, 1000, 1200)
        }
        if has("FHD[10bit 4:2:2]") {
            return proResSpeed(121, 121, 126, 151, 252, 302, 505, 601, 606)
        }
    }

    if has("_HEVC LongGOP_") {
        if hasAny(["UHD[10bit 4:2:0][100p/119.88p/120p]","Cs4K[4096*1728][10bit 4:2:0][100p/119.88p/120p]","3.3K 4:3[3328*2496][10bit 4:2:0][100p/119.88p/120p]"]) {
            return 300
        }
        if has("FHD[10bit 4:2:0][200p/239.76p/240p]") {
            return 200
        }
        if has("FHD[10bit 4:2:0][100p/119.88p/120p]") {
            return 150
        }
        if has("FHD[10bit 4:2:0]") {
            return 100
        }
        if hasAny(["6K[5952*2512][10bit 4:2:0][47.95p/48p/50p/59.94p]","5.1K[5088*3392][10bit 4:2:0][47.95p/48p/50p/59.94p]","5.9K[10bit 4:2:0][47.95p/48p/50p/59.94p]","4.8K 4:3[4800*3600][10bit 4:2:0][47.95p/48p/50p/59.94p]"]) {
            return 300
        }
        if hasAny(["6K[5952*3968][10bit 4:2:0]","6K[5952*2512][10bit 4:2:0][23.976p/24p/25p/29.97p]","5.1K[5088*3392][10bit 4:2:0][23.976p/24p/25p/29.97p]","5.9K[10bit 4:2:0][23.976p/24p/25p/29.97p]","4.8K 4:3[4800*3600][10bit 4:2:0][23.976p/24p/25p/29.97p]"]) {
            return 200
        }
        if hasAny(["UHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","Cs4K[4096*1728][10bit 4:2:0][47.95p/48p/50p/59.94p]","3.3K 4:3[3328*2496][10bit 4:2:0][47.95p/48p/50p/59.94p]"]) {
            return 200
        }
        if hasAny(["UHD[10bit 4:2:0][23.976p/24p/25p/29.97p]","Cs4K[4096*1728][10bit 4:2:0][23.976p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:0][23.976p/24p/25p/29.97p]"]) {
            return 150
        }
    }

    if has("_AVC ALL-I_") {
        if has("FHD[10bit 4:2:2][200p/239.76p/240p]") {
            return 800
        }
        if has("FHD[10bit 4:2:2][100p/119.88p/120p]") {
            return 400
        }
        if has("FHD[10bit 4:2:2]") {
            return 200
        }
        if hasAny(["UHD[10bit 4:2:2][47.95p/48p/50p/59.94p][Light]","Cs4K[4096*1728][10bit 4:2:2][47.95p/48p/50p/59.94p][Light]","3.3K 4:3[3328*2496][10bit 4:2:2][47.95p/48p/50p/59.94p][Light]"]) {
            return 600
        }
        if hasAny(["UHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","Cs4K[4096*1728][10bit 4:2:2][47.95p/48p/50p/59.94p]","3.3K 4:3[3328*2496][10bit 4:2:2][47.95p/48p/50p/59.94p]"]) {
            return 800
        }
        if hasAny(["UHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","Cs4K[4096*1728][10bit 4:2:2][23.976p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][23.976p/24p/25p/29.97p]"]) {
            return 400
        }
    }

    if has("_AVC LongGOP_") {
        if has("FHD[10bit 4:2:2][200p/239.76p/240p]") {
            return 200
        }
        if has("FHD[10bit 4:2:2][100p/119.88p/120p]") {
            return 150
        }
        if has("FHD[10bit 4:2:2]") {
            return 100
        }
        if hasAny(["UHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","Cs4K[4096*1728][10bit 4:2:2][47.95p/48p/50p/59.94p]","3.3K 4:3[3328*2496][10bit 4:2:2][47.95p/48p/50p/59.94p]"]) {
            return 200
        }
        if hasAny(["UHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","Cs4K[4096*1728][10bit 4:2:2][23.976p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][23.976p/24p/25p/29.97p]"]) {
            return 150
        }
    }

    return 0
}

func PanaS1M2ECodecSpeed(_ PanaCameraCodecName:String) -> Double {
    let normalizedName = PanaNormalizedCodecName(PanaCameraCodecName)

    func has(_ text:String) -> Bool {
        normalizedName.contains(text)
    }

    func hasAny(_ texts:[String]) -> Bool {
        texts.contains { normalizedName.contains($0) }
    }

    func proResSpeed(_ p23976:Double, _ p24:Double, _ p25:Double, _ p2997:Double, _ p50:Double? = nil, _ p5994:Double? = nil) -> Double {
        if has("[23.976p]") { return p23976 }
        if has("[24p]") { return p24 }
        if has("[25p]") { return p25 }
        if has("[29.97p]") { return p2997 }
        if has("[50p]"), let p50 = p50 { return p50 }
        if has("[59.94p]"), let p5994 = p5994 { return p5994 }
        return 0
    }

    if has("_ProRes RAW HQ_") {
        if has("5.8K[5776*3056][12bit RAW]") {
            return proResSpeed(3386, 3389, 3530, 4232)
        }
        if has("DCI 4K[12bit RAW]") {
            return proResSpeed(1697, 1699, 1769, 2121, 3539, 4242)
        }
    }

    if has("_ProRes RAW_") {
        if has("5.8K[5776*3056][12bit RAW]") {
            return proResSpeed(2257, 2259, 2354, 2821)
        }
        if has("DCI 4K[12bit RAW]") {
            return proResSpeed(1131, 1132, 1180, 1414, 2359, 2828)
        }
    }

    if has("_ProRes 422 HQ_") {
        if has("5.8K[5776*3056][10bit 4:2:2]") {
            return proResSpeed(1551, 1553, 1618, 1939)
        }
        if has("DCI 4K[10bit 4:2:2]") {
            return proResSpeed(778, 779, 811, 972, 1622, 1944)
        }
        if has("UHD[10bit 4:2:2]") {
            return proResSpeed(729, 730, 760, 911, 1520, 1822)
        }
        if has("Cs4K[4096*1728][10bit 4:2:2]") {
            return proResSpeed(622, 623, 649, 778, 1298, 1556)
        }
        if has("3.3K 4:3[3328*2496][10bit 4:2:2]") {
            return proResSpeed(730, 731, 761, 913, 1523)
        }
        if has("FHD[10bit 4:2:2]") {
            return proResSpeed(181, 182, 189, 227, 378, 454)
        }
    }

    if has("_ProRes 422_") {
        if has("5.8K[5776*3056][10bit 4:2:2]") {
            return proResSpeed(1034, 1035, 1078, 1293)
        }
        if has("DCI 4K[10bit 4:2:2]") {
            return proResSpeed(519, 519, 541, 648, 1081, 1296)
        }
        if has("UHD[10bit 4:2:2]") {
            return proResSpeed(486, 487, 507, 608, 1014, 1215)
        }
        if has("Cs4K[4096*1728][10bit 4:2:2]") {
            return proResSpeed(415, 415, 433, 519, 865, 1037)
        }
        if has("3.3K 4:3[3328*2496][10bit 4:2:2]") {
            return proResSpeed(487, 487, 508, 609, 1015)
        }
        if has("FHD[10bit 4:2:2]") {
            return proResSpeed(121, 121, 126, 151, 252, 302)
        }
    }

    if has("_HEVC LongGOP_") {
        if has("6K[5952*2512][10bit 4:2:0][47.95p/48p/50p/59.94p]") {
            return 300
        }
        if hasAny(["6K[5952*3968][10bit 4:2:0][23.976p/24p/25p/29.97p]","6K[5952*3136][10bit 4:2:0][23.976p/24p/25p/29.97p]","6K[5952*2512][10bit 4:2:0][23.976p/24p/25p/29.97p]","5.9K[5888*3312][10bit 4:2:0][23.976p/24p/25p/29.97p]"]) {
            return 200
        }
        if has("FHD[10bit 4:2:0][100p/119.88p/120p]") {
            return 150
        }
        if hasAny(["FHD[10bit 4:2:0][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:0][47.95p/48p/50p/59.94p]"]) {
            return 100
        }
        if hasAny(["UHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","Cs4K[4096*1728][10bit 4:2:0][47.95p/48p/50p/59.94p]","3.3K 4:3[3328*2496][10bit 4:2:0][47.95p/48p/50p]"]) {
            return 200
        }
        if hasAny(["UHD[10bit 4:2:0][23.976p/24p/25p/29.97p]","Cs4K[4096*1728][10bit 4:2:0][23.976p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:0][23.976p/24p/25p/29.97p]"]) {
            return 150
        }
    }

    if has("_AVC ALL-I_") {
        if has("FHD[10bit 4:2:2][100p/119.88p/120p]") {
            return 400
        }
        if hasAny(["FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]"]) {
            return 200
        }
        if hasAny(["UHD[10bit 4:2:2][47.95p/48p/50p/59.94p][Light]","Cs4K[4096*1728][10bit 4:2:2][47.95p/48p/50p/59.94p][Light]","3.3K 4:3[3328*2496][10bit 4:2:2][47.95p/48p/50p][Light]"]) {
            return 600
        }
        if hasAny(["UHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","Cs4K[4096*1728][10bit 4:2:2][47.95p/48p/50p/59.94p]","3.3K 4:3[3328*2496][10bit 4:2:2][47.95p/48p/50p]"]) {
            return 800
        }
        if hasAny(["UHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","Cs4K[4096*1728][10bit 4:2:2][23.976p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][23.976p/24p/25p/29.97p]"]) {
            return 400
        }
    }

    if has("_AVC LongGOP_") {
        if has("FHD[10bit 4:2:2][100p/119.88p/120p]") {
            return 150
        }
        if hasAny(["FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]"]) {
            return 100
        }
        if hasAny(["UHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","Cs4K[4096*1728][10bit 4:2:2][47.95p/48p/50p/59.94p]","3.3K 4:3[3328*2496][10bit 4:2:2][47.95p/48p/50p]"]) {
            return 200
        }
        if hasAny(["UHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","Cs4K[4096*1728][10bit 4:2:2][23.976p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][23.976p/24p/25p/29.97p]"]) {
            return 150
        }
    }

    return 0
}

func PanaGH7CodecSpeed(_ PanaCameraCodecName:String) -> Double {
    let normalizedName = PanaNormalizedCodecName(PanaCameraCodecName)

    func has(_ text:String) -> Bool {
        normalizedName.contains(text)
    }

    func hasAny(_ texts:[String]) -> Bool {
        texts.contains { normalizedName.contains($0) }
    }

    func proResSpeed(_ p23976:Double, _ p24:Double, _ p25:Double, _ p2997:Double, _ p50:Double? = nil, _ p5994:Double? = nil) -> Double {
        if has("[23.976p]") { return p23976 }
        if has("[24p]") { return p24 }
        if has("[25p]") { return p25 }
        if has("[29.97p]") { return p2997 }
        if has("[50p]"), let p50 = p50 { return p50 }
        if has("[59.94p]"), let p5994 = p5994 { return p5994 }
        return 0
    }

    if has("_ProRes RAW HQ_") {
        if hasAny(["5.7K[5728*3024][12bit RAW]","DCI 5.7K[5728*3024][12bit RAW]"]) {
            return proResSpeed(3300, 3300, 3500, 4200)
        }
        if has("DCI 4K[12bit RAW]") {
            return proResSpeed(1700, 1700, 1800, 2100, 3500, 4200)
        }
    }

    if has("_ProRes RAW_") {
        if hasAny(["5.7K[5728*3024][12bit RAW]","DCI 5.7K[5728*3024][12bit RAW]"]) {
            return proResSpeed(2200, 2200, 2300, 2800)
        }
        if has("DCI 4K[12bit RAW]") {
            return proResSpeed(1100, 1100, 1200, 1400, 2400, 2800)
        }
    }

    if has("_ProRes 422 HQ_") {
        if hasAny(["5.7K[5728*3024][10bit 4:2:2]","DCI 5.7K[5728*3024][10bit 4:2:2]"]) {
            return proResSpeed(1500, 1500, 1600, 1900)
        }
        if has("DCI 4K[10bit 4:2:2]") {
            return proResSpeed(778, 779, 811, 972, 1600, 1900)
        }
        if has("FHD[10bit 4:2:2]") {
            return proResSpeed(181, 182, 189, 227, 378, 454)
        }
    }

    if has("_ProRes 422_") {
        if hasAny(["5.7K[5728*3024][10bit 4:2:2]","DCI 5.7K[5728*3024][10bit 4:2:2]"]) {
            return proResSpeed(1000, 1000, 1100, 1300)
        }
        if has("DCI 4K[10bit 4:2:2]") {
            return proResSpeed(519, 519, 541, 648, 1100, 1300)
        }
        if has("FHD[10bit 4:2:2]") {
            return proResSpeed(121, 121, 126, 151, 252, 302)
        }
    }

    if has("_HEVC LongGOP_") {
        if hasAny(["5.7K[5728*3024][10bit 4:2:0][47.95p/48p/50p/59.94p]","DCI 5.7K[5728*3024][10bit 4:2:0][47.95p/48p/50p/59.94p]","4.4K 4:3[4352*3264][10bit 4:2:0][47.95p/48p/50p/59.94p]","UHD[10bit 4:2:0][100p/119.88p]","UHD[10bit 4:2:0][100p/119.88p/120p]","DCI 4K[10bit 4:2:0][100p/119.88p]","DCI 4K[10bit 4:2:0][100p/119.88p/120p]"]) {
            return 300
        }
        if hasAny(["5.8K[5760*4320][10bit 4:2:0][23.976p/24p/25p/29.97p][OG]","5.7K[5728*3024][10bit 4:2:0][23.976p/24p/25p/29.97p]","DCI 5.7K[5728*3024][10bit 4:2:0][23.976p/24p/25p/29.97p]"]) {
            return 200
        }
        if hasAny(["UHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","DCI 4K[10bit 4:2:0][47.95p/48p/50p/59.94p]"]) {
            return 200
        }
        if hasAny(["UHD[10bit 4:2:0][23.976p/24p/25p/29.97p]","DCI 4K[10bit 4:2:0][23.976p/24p/25p/29.97p]"]) {
            return 150
        }
        if hasAny(["FHD[10bit 4:2:0][100p/119.88p]","FHD[10bit 4:2:0][100p/119.88p/120p]"]) {
            return 150
        }
        if has("FHD[10bit 4:2:0][200p/239.76p]") {
            return 200
        }
        if hasAny(["FHD[10bit 4:2:0][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:0][47.95p/48p/50p/59.94p]"]) {
            return 100
        }
    }

    if has("_AVC ALL-I_") {
        if hasAny(["FHD[10bit 4:2:2][100p/119.88p]","FHD[10bit 4:2:2][100p/119.88p/120p]"]) {
            return 400
        }
        if has("FHD[10bit 4:2:2][200p/239.76p]") {
            return 800
        }
        if hasAny(["FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]"]) {
            return 200
        }
        if hasAny(["UHD[10bit 4:2:2][47.95p/48p/50p/59.94p][Light]","DCI 4K[10bit 4:2:2][47.95p/48p/50p/59.94p][Light]"]) {
            return 600
        }
        if hasAny(["UHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","DCI 4K[10bit 4:2:2][47.95p/48p/50p/59.94p]"]) {
            return 800
        }
        if hasAny(["UHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","DCI 4K[10bit 4:2:2][23.976p/24p/25p/29.97p]"]) {
            return 400
        }
    }

    if has("_AVC LongGOP_") {
        if hasAny(["FHD[10bit 4:2:2][100p/119.88p]","FHD[10bit 4:2:2][100p/119.88p/120p]"]) {
            return 150
        }
        if has("FHD[10bit 4:2:2][200p/239.76p]") {
            return 200
        }
        if hasAny(["FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]"]) {
            return 100
        }
        if hasAny(["UHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","DCI 4K[10bit 4:2:2][47.95p/48p/50p/59.94p]"]) {
            return 200
        }
        if hasAny(["UHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","DCI 4K[10bit 4:2:2][23.976p/24p/25p/29.97p]"]) {
            return 150
        }
    }

    return 0
}

//松下机型码率计算区
func PanaCodecSpeed(cameradata:CameraData) -> Double {
    let PanaCameraCodecName = PanaNormalizedCodecName(cameradata.CameraName + "_" + cameradata.Codec + "_" + cameradata.Resolution)
    let PanaCodecName = PanaNormalizedCodecName(cameradata.Codec + "_" + cameradata.Resolution)
    if cameradata.CameraName == "S1R2" {
        let S1R2CodecSpeed = PanaS1R2CodecSpeed(PanaCameraCodecName)
        if S1R2CodecSpeed != 0 {
            return S1R2CodecSpeed
        }
        if cameradata.Codec == "AVC LongGOP" && (cameradata.Resolution == "UHD[10bit 4:2:2][100p/119.88p]" || cameradata.Resolution == "4K[10bit 4:2:2][100p/119.88p]" || cameradata.Resolution == "4K[10bit 4:2:2][100p/119.88p/120p]") {
            return 0
        }
    }
    if cameradata.CameraName == "S1M2" {
        return PanaS1M2CodecSpeed(PanaCameraCodecName)
    }
    if cameradata.CameraName == "S1M2E" {
        return PanaS1M2ECodecSpeed(PanaCameraCodecName)
    }
    if cameradata.CameraName == "GH7" {
        return PanaGH7CodecSpeed(PanaCameraCodecName)
    }
    switch PanaCodecName {
    case "ProRes 422_FHD[10bit 4:2:2][23.976p]","ProRes 422_FHD[10bit 4:2:2][24p]" :
        return 121
    case "ProRes 422_FHD[10bit 4:2:2][25p]" :
        return 126
    case "ProRes 422 HQ_FHD[10bit 4:2:2][23.976p]","ProRes 422 HQ_FHD[10bit 4:2:2][24p]" :
        return 181
    case "ProRes 422 HQ_FHD[10bit 4:2:2][25p]" :
        return 189
    case "ProRes 422_FHD[10bit 4:2:2][29.97p]" :
        return 151
    case "ProRes 422 HQ_FHD[10bit 4:2:2][29.97p]" :
        return 227
    case "ProRes 422_FHD[10bit 4:2:2][50p]" :
        return 252
    case "ProRes 422_FHD[10bit 4:2:2][59.94p]" :
        return 302
    case "ProRes 422 HQ_FHD[10bit 4:2:2][50p]" :
        return 378
    case "ProRes 422 HQ_FHD[10bit 4:2:2][59.94p]" :
        return 454
    case "ProRes 422_3.3K 4:3[3328*2496][10bit 4:2:2][23.976p]","ProRes 422_3.3K 4:3[3328*2496][10bit 4:2:2][24p]" :
        return 487
    case "ProRes 422_3.3K 4:3[3328*2496][10bit 4:2:2][25p]" :
        return 508
    case "ProRes 422_DCI 4K[10bit 4:2:2][23.976p]","ProRes 422_DCI 4K[10bit 4:2:2][24p]" :
        return 519
    case "ProRes 422_DCI 4K[10bit 4:2:2][25p]" :
        return 541
    case "ProRes 422_3.3K 4:3[3328*2496][10bit 4:2:2][29.97p]" :
        return 609
    case "ProRes 422_DCI 4K[10bit 4:2:2][29.97p]" :
        return 648
    case "ProRes 422 HQ_3.3K 4:3[3328*2496][10bit 4:2:2][23.976p]","ProRes 422 HQ_3.3K 4:3[3328*2496][10bit 4:2:2][24p]" :
        return 730
    case "ProRes 422 HQ_3.3K 4:3[3328*2496][10bit 4:2:2][25p]" :
        return 761
    case "ProRes 422 HQ_DCI 4K[10bit 4:2:2][23.976p]","ProRes 422 HQ_DCI 4K[10bit 4:2:2][24p]" :
        return 778
    case "ProRes 422 HQ_DCI 4K[10bit 4:2:2][25p]" :
        return 811
    case "ProRes 422 HQ_3.3K 4:3[3328*2496][10bit 4:2:2][29.97p]" :
        return 913
    case "ProRes 422 HQ_DCI 4K[10bit 4:2:2][29.97p]" :
        return 972
    case "ProRes 422_DCI 5.8K[5776*3056][10bit 4:2:2][23.976p]","ProRes 422_DCI 5.8K[5776*3056][10bit 4:2:2][24p]","ProRes 422_3.3K 4:3[3328*2496][10bit 4:2:2][50p]","ProRes 422_DCI 5.7K[5728*3024][10bit 4:2:2][23.976p]","ProRes 422_DCI 5.7K[5728*3024][10bit 4:2:2][24p]" :
        return 1000
    case "ProRes 422_DCI 5.8K[5776*3056][10bit 4:2:2][25p]","ProRes 422_DCI 4K[10bit 4:2:2][50p]","ProRes 422_DCI 5.7K[5728*3024][10bit 4:2:2][25p]","ProRes RAW_DCI 4K[12bit RAW][23.976p]","ProRes RAW_DCI 4K[12bit RAW][24p]" :
        return 1100
    case "ProRes RAW_DCI 4K[12bit RAW][25p]" :
        return 1145
    case "ProRes 422_DCI 5.8K[5776*3056][10bit 4:2:2][29.97p]","ProRes 422_DCI 4K[10bit 4:2:2][59.94p]","ProRes 422_DCI 5.7K[5728*3024][10bit 4:2:2][29.97p]" :
        return 1300
    case "ProRes RAW_DCI 4K[12bit RAW][29.97p]" :
        return 1400
    case "ProRes 422 HQ_DCI 5.8K[5776*3056][10bit 4:2:2][23.976p]","ProRes 422 HQ_DCI 5.8K[5776*3056][10bit 4:2:2][24p]","ProRes 422 HQ_3.3K 4:3[3328*2496][10bit 4:2:2][50p]","ProRes 422 HQ_DCI 5.7K[5728*3024][10bit 4:2:2][23.976p]","ProRes 422 HQ_DCI 5.7K[5728*3024][10bit 4:2:2][24p]" :
        return 1500
    case "ProRes 422 HQ_DCI 5.8K[5776*3056][10bit 4:2:2][25p]","ProRes 422 HQ_DCI 4K[10bit 4:2:2][50p]","ProRes 422 HQ_DCI 5.7K[5728*3024][10bit 4:2:2][25p]" :
        return 1560
    case "ProRes RAW HQ_DCI 4K[12bit RAW][23.976p]","ProRes RAW HQ_DCI 4K[12bit RAW][24p]" :
        return 1700
    case "ProRes RAW HQ_DCI 4K[12bit RAW][25p]" :
        return 1770
    case "ProRes 422 HQ_DCI 5.8K[5776*3056][10bit 4:2:2][29.97p]","ProRes 422 HQ_DCI 4K[10bit 4:2:2][59.94p]","ProRes 422 HQ_DCI 5.7K[5728*3024][10bit 4:2:2][29.97p]" :
        return 1900
    case "ProRes RAW HQ_DCI 4K[12bit RAW][29.97p]" :
        return 2100
    case "ProRes RAW_DCI 5.8K[5776*3056][12bit RAW][23.976p]","ProRes RAW_DCI 5.8K[5776*3056][12bit RAW][24p]","ProRes RAW_DCI 5.7K[5728*3024][12bit RAW][23.976p]","ProRes RAW_DCI 5.7K[5728*3024][12bit RAW][24p]" :
        return 2200
    case "ProRes RAW_DCI 5.8K[5776*3056][12bit RAW][25p]","ProRes RAW_DCI 5.7K[5728*3024][12bit RAW][25p]" :
        return 2292
    case "ProRes RAW_DCI 4K[12bit RAW][50p]" :
        return 2333
    case "ProRes RAW_DCI 4K[12bit RAW][59.94p]","ProRes RAW_DCI 5.8K[5776*3056][12bit RAW][29.97p]","ProRes RAW_DCI 5.7K[5728*3024][12bit RAW][29.97p]" :
        return 2800
    case "ProRes RAW HQ_DCI 5.8K[5776*3056][12bit RAW][23.976p]","ProRes RAW HQ_DCI 5.8K[5776*3056][12bit RAW][24p]","ProRes RAW HQ_DCI 5.7K[5728*3024][12bit RAW][23.976p]","ProRes RAW HQ_DCI 5.7K[5728*3024][12bit RAW][24p]" :
        return 3300
    case "ProRes RAW HQ_DCI 5.8K[5776*3056][12bit RAW][25p]","ProRes RAW HQ_DCI 5.7K[5728*3024][12bit RAW][25p]" :
        return 3437
    case "ProRes RAW HQ_DCI 4K[12bit RAW][50p]" :
        return 3500
    case "ProRes RAW HQ_DCI 4K[12bit RAW][59.94p]","ProRes RAW HQ_DCI 5.8K[5776*3056][12bit RAW][29.97p]","ProRes RAW HQ_DCI 5.7K[5728*3024][12bit RAW][29.97p]" :
        return 4200

    case "HEVC LongGOP_8.1K[8128*4288][10bit 4:2:0][23.976p/24p/25p/29.97p]","HEVC LongGOP_DCI 5.7K[5728*3024][10bit 4:2:0][48p/50p/59.94p]","HEVC LongGOP_DCI 5.7K[5728*3024][10bit 4:2:0][47.95p/48p/50p/59.94p]","HEVC LongGOP_DCI 4K[10bit 4:2:0][100p/119.88p]","HEVC LongGOP_UHD[10bit 4:2:0][100p/119.88p]","HEVC LongGOP_4.4K 4:3[4352*3264][10bit 4:2:0][47.95p/48p/50p/59.94p]" :
        return 300
    case "HEVC LongGOP_6K 3:2[5952*3968][10bit 4:2:0][23.976p/24p/25p/29.97p]","HEVC LongGOP_6K 3:2[5952*3968][10bit 4:2:0][23.976p/24p]","HEVC LongGOP_DCI 6K[5952*3136][10bit 4:2:0][23.976p/24p/25p/29.97p]","HEVC LongGOP_5.9K[5888*3312][10bit 4:2:0][23.976p/24p/25p/29.97p]","HEVC LongGOP_DCI 5.8K[5776*3056][10bit 4:2:0][23.976p/24p/25p/29.97p]","HEVC LongGOP_5.1K 3:2[5120*3416][10bit 4:2:0][47.95p/48p/50p/59.94p]","HEVC LongGOP_DCI 4K[10bit 4:2:0][48p/50p/59.94p]","HEVC LongGOP_DCI 4K[10bit 4:2:0]47.95p/48p/50p/59.94p]","HEVC LongGOP_5.4K 3:2[5376*3584][10bit 4:2:0][25p/29.97p]","HEVC LongGOP_3.3K 4:3[3328*2496][10bit 4:2:0][48p/50p]","HEVC LongGOP_UHD[10bit 4:2:0][48p/50p/59.94p]","HEVC LongGOP_UHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","AVC LongGOP_DCI 4K[10bit 4:2:2][48p/50p/59.94p]","AVC LongGOP_DCI 4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","HEVC LongGOP_DCI 4K[10bit 4:2:0][47.95p/48p/50p/59.94p]","HEVC LongGOP_3.3K 4:3[3328*2496][10bit 4:2:0][47.95p/48p/50p]","AVC LongGOP_3.3K 4:3[3328*2496][10bit 4:2:2][48p/50p]","AVC LongGOP_3.3K 4:3[3328*2496][10bit 4:2:2][47.95p/48p/50p]","AVC LongGOP_UHD[10bit 4:2:2][48p/50p/59.94p]","AVC LongGOP_UHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","HEVC LongGOP_5.8K[5760*4320][10bit 4:2:0][23.976p/24p/25p/29.97p][OG]","HEVC LongGOP_DCI 5.7K[5728*3024][10bit 4:2:0][23.976p/24p/25p/29.97p]","HEVC LongGOP_FHD[10bit 4:2:0][200p/239.76p]","AVC LongGOP_FHD[10bit 4:2:2][200p/239.76p]" :
        return 200
    case "HEVC LongGOP_DCI 4K[10bit 4:2:0][23.976p/24p/25p/29.97p]","HEVC LongGOP_3.3K 4:3[3328*2496][10bit 4:2:0][23.976p/24p/25p/29.97p]","HEVC LongGOP_UHD[10bit 4:2:0][23.976p/24p/25p/29.97p]","HEVC LongGOP_FHD[10bit 4:2:0][100p/119.88p]","AVC LongGOP_DCI 4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","AVC LongGOP_3.3K 4:3[3328*2496][10bit 4:2:2][23.976p/24p/25p/29.97p]","AVC LongGOP_UHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","AVC LongGOP_UHD[10bit 4:2:2][100p/119.88p]","AVC LongGOP_FHD[10bit 4:2:2][100p/119.88p]" :
        return 150
    case "HEVC LongGOP_FHD[10bit 4:2:0][23.976p/24p/25p/29.97p]","HEVC LongGOP_FHD[10bit 4:2:0][48p/50p/59.94p]","HEVC LongGOP_FHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","HEVC LongGOP_FHD[10bit 4:2:0][47.95p/48p]","AVC LongGOP_FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","AVC LongGOP_FHD[10bit 4:2:2][48p/50p/59.94p]","AVC LongGOP_FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","AVC LongGOP_FHD[10bit 4:2:2][50p/59.94p]" :
        return 100

    case "AVC ALL-I_DCI 4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","AVC ALL-I_3.3K 4:3[3328*2496][10bit 4:2:2][23.976p/24p/25p/29.97p]","AVC ALL-I_UHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","AVC ALL-I_FHD[10bit 4:2:2][100p/119.88p]" :
        return 400
    case "AVC ALL-I_DCI 4K[10bit 4:2:2][48p/50p/59.94p][Light]","AVC ALL-I_3.3K 4:3[3328*2496][10bit 4:2:2][48p/50p][Light]","AVC ALL-I_UHD[10bit 4:2:2][48p/50p/59.94p][Light]","AVC ALL-I_DCI 4K[10bit 4:2:2][47.95p/48p/50p/59.94p][Light]","AVC ALL-I_3.3K 4:3[3328*2496][10bit 4:2:2][47.95p/48p/50p][Light]","AVC ALL-I_UHD[10bit 4:2:2][47.95p/48p/50p/59.94p][Light]" :
        return 600
    case "AVC ALL-I_DCI 4K[10bit 4:2:2][48p/50p/59.94p]","AVC ALL-I_DCI 4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","AVC ALL-I_3.3K 4:3[3328*2496][10bit 4:2:2][48p/50p]","AVC ALL-I_3.3K 4:3[3328*2496][10bit 4:2:2][47.95p/48p/50p]","AVC ALL-I_UHD[10bit 4:2:2][48p/50p/59.94p]","AVC ALL-I_UHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","AVC ALL-I_FHD[10bit 4:2:2][200p/239.76p]" :
        return 800
    case "AVC ALL-I_FHD[10bit 4:2:2][48p/50p/59.94p]","AVC ALL-I_FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","AVC ALL-I_FHD[10bit 4:2:2][50p/59.94p]","AVC ALL-I_FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]" :
        return 200
    default :
        return 0
    }
}
