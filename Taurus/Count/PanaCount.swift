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
    if normalizedAspectName.hasPrefix("S1R2_ProRes 422_") || normalizedAspectName.hasPrefix("S1R2_ProRes 422 HQ_") {
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
        return 520
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
        return 122
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

    case "S1R2_HEVC LongGOP_8.1K 3:2[8064*5376][10bit 4:2:0][23.976p/24p/25p/29.97p]","S1R2_HEVC LongGOP_8.1K[8128*4288][10bit 4:2:0][23.976p/24p/25p/29.97p]","S1R2_HEVC LongGOP_8K[7680*4320][10bit 4:2:0][23.976p/24p/25p/29.97p]","S1R2_HEVC LongGOP_7.2K 3:2[7200*4800][10bit 4:2:0][23.976p/24p/25p/29.97p]","S1R2_HEVC LongGOP_6.4K 3:2[6432*4288][10bit 4:2:0][23.976p/24p/25p/29.97p]","S1R2_HEVC LongGOP_5.9K[5888*3312][10bit 4:2:0][47.95p/48p/50p/59.94p]","S1R2_HEVC LongGOP_5.8K[5760*3040][10bit 4:2:0][47.95p/48p/50p/59.94p]","S1R2_HEVC LongGOP_4.7K 4:3[4736*3552][10bit 4:2:0][47.95p/48p/50p/59.94p]","S1R2_HEVC LongGOP_DCI 4K[10bit 4:2:0][100p/119.88p]","S1R2_HEVC LongGOP_UHD[10bit 4:2:0][100p/119.88p]" :
        return 300
    case "S1R2_HEVC LongGOP_5.9K[5888*3312][10bit 4:2:0][23.976p/24p/25p/29.97p]","S1R2_HEVC LongGOP_5.8K[5760*3040][10bit 4:2:0][23.976p/24p/25p/29.97p]","S1R2_HEVC LongGOP_4.7K 4:3[4736*3552][10bit 4:2:0][23.976p/24p/25p/29.97p]","S1R2_HEVC LongGOP_DCI 4K[10bit 4:2:0][47.95p/48p/50p/59.94p]","S1R2_HEVC LongGOP_UHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","S1R2_AVC LongGOP_DCI 4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","S1R2_AVC LongGOP_UHD[10bit 4:2:2][47.95p/48p/50p/59.94p]" :
        return 200
    case "S1R2_HEVC LongGOP_DCI 4K[10bit 4:2:0][23.976p/24p/25p/29.97p]","S1R2_HEVC LongGOP_UHD[10bit 4:2:0][23.976p/24p/25p/29.97p]","S1R2_HEVC LongGOP_FHD[10bit 4:2:0][100p/119.88p]","S1R2_AVC LongGOP_DCI 4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","S1R2_AVC LongGOP_UHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","S1R2_AVC LongGOP_UHD[10bit 4:2:2][100p/119.88p]","S1R2_AVC LongGOP_FHD[10bit 4:2:2][100p/119.88p]" :
        return 150
    case "S1R2_HEVC LongGOP_FHD[10bit 4:2:0][23.976p/24p/25p/29.97p]","S1R2_HEVC LongGOP_FHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","S1R2_AVC LongGOP_FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","S1R2_AVC LongGOP_FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]" :
        return 100

    case "S1R2_AVC ALL-I_DCI 4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","S1R2_AVC ALL-I_UHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","S1R2_AVC ALL-I_FHD[10bit 4:2:2][100p/119.88p]" :
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

//松下机型码率计算区
func PanaCodecSpeed(cameradata:CameraData) -> Double {
    let PanaCameraCodecName = PanaNormalizedCodecName(cameradata.CameraName + "_" + cameradata.Codec + "_" + cameradata.Resolution)
    let PanaCodecName = PanaNormalizedCodecName(cameradata.Codec + "_" + cameradata.Resolution)
    if cameradata.CameraName == "S1R2" {
        let S1R2CodecSpeed = PanaS1R2CodecSpeed(PanaCameraCodecName)
        if S1R2CodecSpeed != 0 {
            return S1R2CodecSpeed
        }
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
    case "HEVC LongGOP_6K 3:2[5952*3968][10bit 4:2:0][23.976p/24p/25p/29.97p]","HEVC LongGOP_6K 3:2[5952*3968][10bit 4:2:0][23.976p/24p]","HEVC LongGOP_DCI 6K[5952*3136][10bit 4:2:0][23.976p/24p/25p/29.97p]","HEVC LongGOP_5.9K[5888*3312][10bit 4:2:0][23.976p/24p/25p/29.97p]","HEVC LongGOP_DCI 5.8K[5776*3056][10bit 4:2:0][23.976p/24p/25p/29.97p]","HEVC LongGOP_5.1K 3:2[5120*3416][10bit 4:2:0][47.95p/48p/50p/59.94p]","HEVC LongGOP_DCI 4K[10bit 4:2:0][48p/50p/59.94p]","HEVC LongGOP_DCI 4K[10bit 4:2:0]47.95p/48p/50p/59.94p]","HEVC LongGOP_5.4K 3:2[5376*3584][10bit 4:2:0][25p/29.97p]","HEVC LongGOP_3.3K 4:3[3328*2496][10bit 4:2:0][48p/50p]","HEVC LongGOP_UHD[10bit 4:2:0][48p/50p/59.94p]","HEVC LongGOP_UHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","AVC LongGOP_DCI 4K[10bit 4:2:2][48p/50p/59.94p]","AVC LongGOP_DCI 4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","HEVC LongGOP_DCI 4K[10bit 4:2:0][47.95p/48p/50p/59.94p]","HEVC LongGOP_3.3K 4:3[3328*2496][10bit 4:2:0][47.95p/48p/50p]","AVC LongGOP_3.3K 4:3[3328*2496][10bit 4:2:2][48p/50p]","AVC LongGOP_3.3K 4:3[3328*2496][10bit 4:2:2][47.95p/48p/50p]","AVC LongGOP_UHD[10bit 4:2:2][48p/50p/59.94p]","AVC LongGOP_UHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","HEVC LongGOP_5.8K 4:3[5760*4320][10bit 4:2:0][23.976p/24p/25p/29.97p]","HEVC LongGOP_DCI 5.7K[5728*3024][10bit 4:2:0][23.976p/24p/25p/29.97p]","HEVC LongGOP_FHD[10bit 4:2:0][200p/239.76p]","AVC LongGOP_FHD[10bit 4:2:2][200p/239.76p]" :
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
