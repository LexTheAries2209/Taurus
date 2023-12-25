//
//  PanaCount.swift
//  Taurus
//
//  Created by 吴坤城 on 12/7/23.
//

import Foundation
import Combine

//松下机型码率计算区
func PanaCodecSpeed(cameradata:CameraData) -> Double {
    let PanaCodecName = cameradata.Codec + "_" + cameradata.Resolution
    switch PanaCodecName {
    case "Prores 422_FHD[10bit 4:2:2][23.98p]","Prores 422_FHD[10bit 4:2:2][24p]" :
        return 121
    case "Prores 422_FHD[10bit 4:2:2][25p]" :
        return 126
    case "Prores 422 HQ_FHD[10bit 4:2:2][23.98p]","Prores 422 HQ_FHD[10bit 4:2:2][24p]" :
        return 181
    case "Prores 422 HQ_FHD[10bit 4:2:2][25p]" :
        return 189
    case "Prores 422_FHD[10bit 4:2:2][29.97p]" :
        return 151
    case "Prores 422 HQ_FHD[10bit 4:2:2][29.97p]" :
        return 227
    case "Prores 422_FHD[10bit 4:2:2][50p]" :
        return 252
    case "Prores 422_FHD[10bit 4:2:2][59.94p]" :
        return 302
    case "Prores 422 HQ_FHD[10bit 4:2:2][50p]" :
        return 378
    case "Prores 422 HQ_FHD[10bit 4:2:2][59.94p]" :
        return 454
    case "Prores 422_3.3K 4:3[3328*2496][10bit 4:2:2][23.98p]","Prores 422_3.3K 4:3[3328*2496][10bit 4:2:2][24p]" :
        return 487
    case "Prores 422_3.3K 4:3[3328*2496][10bit 4:2:2][25p]" :
        return 508
    case "Prores 422_DCI 4K[10bit 4:2:2][23.98p]","Prores 422_DCI 4K[10bit 4:2:2][24p]" :
        return 519
    case "Prores 422_DCI 4K[10bit 4:2:2][25p]" :
        return 541
    case "Prores 422_3.3K 4:3[3328*2496][10bit 4:2:2][29.97p]" :
        return 609
    case "Prores 422_DCI 4K[10bit 4:2:2][29.97p]" :
        return 648
    case "Prores 422 HQ_3.3K 4:3[3328*2496][10bit 4:2:2][23.98p]","Prores 422 HQ_3.3K 4:3[3328*2496][10bit 4:2:2][24p]" :
        return 730
    case "Prores 422 HQ_3.3K 4:3[3328*2496][10bit 4:2:2][25p]" :
        return 761
    case "Prores 422 HQ_DCI 4K[10bit 4:2:2][23.98p]","Prores 422 HQ_DCI 4K[10bit 4:2:2][24p]" :
        return 778
    case "Prores 422 HQ_DCI 4K[10bit 4:2:2][25p]" :
        return 811
    case "Prores 422 HQ_3.3K 4:3[3328*2496][10bit 4:2:2][29.97p]" :
        return 913
    case "Prores 422 HQ_DCI 4K[10bit 4:2:2][29.97p]" :
        return 972
    case "Prores 422_DCI 5.8K[5776*3056][10bit 4:2:2][23.98p]","Prores 422_DCI 5.8K[5776*3056][10bit 4:2:2][24p]","Prores 422_3.3K 4:3[3328*2496][10bit 4:2:2][50p]" :
        return 1000
    case "Prores 422_DCI 5.8K[5776*3056][10bit 4:2:2][25p]","Prores 422_DCI 4K[10bit 4:2:2][50p]" :
        return 1100
    case "Prores 422_DCI 5.8K[5776*3056][10bit 4:2:2][29.97p]","Prores 422_DCI 4K[10bit 4:2:2][59.94p]" :
        return 1300
    case "Prores 422 HQ_DCI 5.8K[5776*3056][10bit 4:2:2][23.98p]","Prores 422 HQ_DCI 5.8K[5776*3056][10bit 4:2:2][24p]","Prores 422 HQ_3.3K 4:3[3328*2496][10bit 4:2:2][50p]" :
        return 1500
    case "Prores 422 HQ_DCI 5.8K[5776*3056][10bit 4:2:2][25p]","Prores 422 HQ_DCI 4K[10bit 4:2:2][50p]" :
        return 1560
    case "Prores 422 HQ_DCI 5.8K[5776*3056][10bit 4:2:2][29.97p]","Prores 422 HQ_DCI 4K[10bit 4:2:2][59.94p]" :
        return 1900
        
    case "HEVC LongGOP_6K 3:2[5952*3968][10bit 4:2:0][23.98p/24p/25p/29.97p]","HEVC LongGOP_DCI 6K[5952*3136][10bit 4:2:0][23.98p/24p/25p/29.97p]","HEVC LongGOP_5.9K[5888*3312][10bit 4:2:0][23.98p/24p/25p/29.97p]","HEVC LongGOP_DCI 4K[10bit 4:2:0][48p/50p/59.94p]","HEVC LongGOP_3.3K 4:3[3328*2496][10bit 4:2:0][48p/50p]","HEVC LongGOP_UHD[10bit 4:2:0][48p/50p/59.94p]","AVC LongGOP_DCI 4K[10bit 4:2:2][48p/50p/59.94p]","AVC LongGOP_3.3K 4:3[3328*2496][10bit 4:2:2][48p/50p]","AVC LongGOP_UHD[10bit 4:2:2][48p/50p/59.94p]" :
        return 200
    case "HEVC LongGOP_DCI 4K[10bit 4:2:0][23.98p/24p/25p/29.97p]","HEVC LongGOP_3.3K 4:3[3328*2496][10bit 4:2:0][23.98p/24p/25p/29.97p]","HEVC LongGOP_UHD[10bit 4:2:0][23.98p/24p/25p/29.97p]","HEVC LongGOP_FHD[10bit 4:2:0][100p/119.88p]","AVC LongGOP_DCI 4K[10bit 4:2:2][23.98p/24p/25p/29.97p]","AVC LongGOP_3.3K 4:3[3328*2496][10bit 4:2:2][23.98p/24p/25p/29.97p]","AVC LongGOP_UHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","AVC LongGOP_FHD[10bit 4:2:2][100p/119.88p]" :
        return 150
    case "HEVC LongGOP_FHD[10bit 4:2:0][23.98p/24p/25p/29.97p]","HEVC LongGOP_FHD[10bit 4:2:0][48p/50p/59.94p]","AVC LongGOP_FHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","AVC LongGOP_FHD[10bit 4:2:2][48p/50p/59.94p]" :
        return 100
        
    case "AVC ALL-I_DCI 4K[10bit 4:2:2][23.98p/24p/25p/29.97p]","AVC ALL-I_3.3K 4:3[3328*2496][10bit 4:2:2][23.98p/24p/25p/29.97p]","AVC ALL-I_UHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","AVC ALL-I_FHD[10bit 4:2:2][100p/119.88p]" :
        return 400
    case "AVC ALL-I_DCI 4K[10bit 4:2:2][48p/50p/59.94p][Light]","AVC ALL-I_3.3K 4:3[3328*2496][10bit 4:2:2][48p/50p][Light]","AVC ALL-I_UHD[10bit 4:2:2][48p/50p/59.94p][Light]" :
        return 600
    case "AVC ALL-I_DCI 4K[10bit 4:2:2][48p/50p/59.94p]","AVC ALL-I_3.3K 4:3[3328*2496][10bit 4:2:2][48p/50p]","AVC ALL-I_UHD[10bit 4:2:2][48p/50p/59.94p]" :
        return 800
    case "AVC ALL-I_FHD[10bit 4:2:2][48p/50p/59.94p]","AVC ALL-I_FHD[10bit 4:2:2][23.98p/24p/25p/29.97p]" :
        return 200
    default :
        return 0.00000001
    }
}
