//
//  SonyCount.swift
//  Taurus
//
//  Created by 吴坤城 on 12/7/23.
//

import Foundation
import Combine

//索尼机型码率计算区
func SonyCodecSpeed(cameradata:CameraData) -> Double {
    let SonyCodecName = cameradata.Codec + "_" + cameradata.Resolution
    switch SonyCodecName {
    case "XAVC S HD_FHD FF[10bit 4:2:2][23.976p]","XAVC S HD_FHD FF[8bit 4:2:0][23.976p]","XAVC S HD_FHD FF[10bit 4:2:2][25p/29.97p]","XAVC S HD_FHD FF[8bit 4:2:0][25p/29.97p]","XAVC S HD_FHD FF[10bit 4:2:2][50p/59.94p]","XAVC S HD_FHD FF[8bit 4:2:0][50p/59.94p]","XAVC S HD_FHD S35[10bit 4:2:2][23.976p]","XAVC S HD_FHD S35[8bit 4:2:0][23.976p]","XAVC S HD_FHD S35[10bit 4:2:2][25p/29.97p]","XAVC S HD_FHD S35[8bit 4:2:0][25p/29.97p]","XAVC S HD_FHD S35[10bit 4:2:2][50p/59.94p]","XAVC S HD_FHD S35[8bit 4:2:0][50p/59.94p]","MPEG-2 LongGOP_FHD FF[10bit 4:2:2][23.976p/25p/29.97p]","MPEG-2 LongGOP_FHD S35[10bit 4:2:2][23.976p/25p/29.97p]" :
        return 50
    case "XAVC S HD_FHD FF[8bit 4:2:0][100p/119.88p]","XAVC S HD_FHD S35[8bit 4:2:0][100p/119.88p]" :
        return 100
    case "XAVC S-I HD_FHD FF[10bit 4:2:2][23.976p]","XAVC S-I HD_FHD S35[10bit 4:2:2][23.976p]" :
        return 89
    case "XAVC S-I HD_FHD FF[10bit 4:2:2][25p]","XAVC S-I HD_FHD S35[10bit 4:2:2][25p]" :
        return 93
    case "XAVC HS 4K_UHD FF[10bit 4:2:2][23.976p]","XAVC HS 4K_UHD FF[10bit 4:2:0][23.976p]","XAVC S 4K_UHD FF[10bit 4:2:2][23.976p]","XAVC S 4K_UHD FF[8bit 4:2:0][23.976p]","XAVC S 4K_UHD FF[8bit 4:2:0][25p/29.97p]","XAVC HS 4K_UHD S35[10bit 4:2:2][23.976p]","XAVC HS 4K_UHD S35[10bit 4:2:0][23.976p]","XAVC S 4K_UHD S35[10bit 4:2:2][23.976p]","XAVC S 4K_UHD S35[8bit 4:2:0][23.976p]","XAVC S 4K_UHD S35[8bit 4:2:0][25p/29.97p]","XAVC HS 4K_UHD FF[10bit 4:2:2][23.976p][From 6K]","XAVC HS 4K_UHD FF[10bit 4:2:0][23.976p][From 6K]","XAVC HS 4K_UHD FF[10bit 4:2:2][23.976p][From 7K]","XAVC HS 4K_UHD FF[10bit 4:2:0][23.976p][From 7K]","XAVC S 4K_UHD FF[10bit 4:2:2][23.976p][From 6K]","XAVC S 4K_UHD FF[8bit 4:2:0][23.976p][From 6K]","XAVC S 4K_UHD FF[10bit 4:2:2][23.976p][From 7K]","XAVC S 4K_UHD FF[8bit 4:2:0][23.976p][From 7K]","XAVC S 4K_UHD FF[8bit 4:2:0][25p/29.97p][From 6K]","XAVC S 4K_UHD FF[8bit 4:2:0][25p/29.97p][From 7K]" :
        return 100
    case "XAVC S-I HD_FHD FF[10bit 4:2:2][29.97p]","XAVC S-I HD_FHD S35[10bit 4:2:2][29.97p]" :
        return 111
    case "XAVC S 4K_UHD FF[10bit 4:2:2][25p/29.97p]","XAVC S 4K_UHD S35[10bit 4:2:2][25p/29.97p]","XAVC S 4K_UHD FF[10bit 4:2:2][25p/29.97p][From 6K]","XAVC S 4K_UHD FF[10bit 4:2:2][25p/29.97p][From 7K]" :
        return 140
    case "XAVC HS 4K_UHD FF[10bit 4:2:0][50p/59.94p]","XAVC S 4K_UHD FF[8bit 4:2:0][50p/59.94p]","XAVC HS 4K_UHD S35[10bit 4:2:0][50p/59.94p]","XAVC S 4K_UHD S35[8bit 4:2:0][50p/59.94p]","XAVC HS 4K_UHD FF[10bit 4:2:0][50p/59.94p][From 6K]","XAVC HS 4K_UHD FF[10bit 4:2:0][50p/59.94p][From 7K]","XAVC S 4K_UHD FF[8bit 4:2:0][50p/59.94p][From 6K]","XAVC S 4K_UHD FF[8bit 4:2:0][50p/59.94p][From 7K]" :
        return 150
    case "XAVC S-I HD_FHD FF[10bit 4:2:2][50p]","XAVC S-I HD_FHD S35[10bit 4:2:2][50p]" :
        return 185
    case "XAVC HS 4K_UHD FF[10bit 4:2:2][50p/59.94p]","XAVC HS 4K_UHD FF[10bit 4:2:0][100p/119.88p]","XAVC S 4K_UHD FF[10bit 4:2:2][50p/59.94p]","XAVC S 4K_UHD FF[8bit 4:2:0][100p/119.88p]","XAVC HS 4K_UHD S35[10bit 4:2:2][50p/59.94p]","XAVC HS 4K_UHD S35[10bit 4:2:0][100p/119.88p]","XAVC S 4K_UHD S35[10bit 4:2:2][50p/59.94p]","XAVC S 4K_UHD S35[8bit 4:2:0][100p/119.88p]","XAVC HS 4K_UHD FF[10bit 4:2:2][50p/59.94p][From 6K]","XAVC HS 4K_UHD FF[10bit 4:2:2][50p/59.94p][From 7K]","XAVC S 4K_UHD FF[10bit 4:2:2][50p/59.94p][From 6K]","XAVC S 4K_UHD FF[10bit 4:2:2][50p/59.94p][From 7K]" :
        return 200
    case "XAVC S-I HD_FHD FF[10bit 4:2:2][59.94p]","XAVC S-I HD_FHD S35[10bit 4:2:2][59.94p]" :
        return 222
    case "XAVC S-I DCI 4K_DCI 4K FF[10bit 4:2:2][23.976p/24p]","XAVC S-I 4K_UHD FF[10bit 4:2:2][23.976p]","XAVC S-I DCI 4K_DCI 4K S35[10bit 4:2:2][23.976p/24p]","XAVC S-I 4K_UHD S35[10bit 4:2:2][23.976p]","XAVC S-I DCI 4K_DCI 4K FF[10bit 4:2:2][23.976p][From 6K]","XAVC S-I 4K_UHD FF[10bit 4:2:2][23.976p][From 6K]","XAVC S-I DCI 4K_DCI 4K FF[10bit 4:2:2][23.976p][From 7K]","XAVC S-I 4K_UHD FF[10bit 4:2:2][23.976p][From 7K]" :
        return 240
    case "XAVC S-I DCI 4K_DCI 4K FF[10bit 4:2:2][25p]","XAVC S-I 4K_UHD FF[10bit 4:2:2][25p]","XAVC S-I DCI 4K_DCI 4K S35[10bit 4:2:2][25p]","XAVC S-I 4K_UHD S35[10bit 4:2:2][25p]","XAVC S-I DCI 4K_DCI 4K FF[10bit 4:2:2][25p][From 6K]","XAVC S-I 4K_UHD FF[10bit 4:2:2][25p][From 6K]","XAVC S-I DCI 4K_DCI 4K FF[10bit 4:2:2][25p][From 7K]","XAVC S-I 4K_UHD FF[10bit 4:2:2][25p][From 7K]" :
        return 250
    case "XAVC HS 4K_UHD FF[10bit 4:2:2][100p/119.88p]","XAVC S 4K_UHD FF[10bit 4:2:2][100p/119.88p]","XAVC HS 4K_UHD S35[10bit 4:2:2][100p/119.88p]","XAVC S 4K_UHD S35[10bit 4:2:2][100p/119.88p]" :
        return 280
    case "XAVC S-I DCI 4K_DCI 4K FF[10bit 4:2:2][29.97p]","XAVC S-I 4K_UHD FF[10bit 4:2:2][29.97p]","XAVC S-I DCI 4K_DCI 4K S35[10bit 4:2:2][29.97p]","XAVC S-I 4K_UHD S35[10bit 4:2:2][29.97p]","XAVC S-I DCI 4K_DCI 4K FF[10bit 4:2:2][29.97p][From 6K]","XAVC S-I 4K_UHD FF[10bit 4:2:2][29.97p][From 6K]","XAVC S-I DCI 4K_DCI 4K FF[10bit 4:2:2][29.97p][From 7K]","XAVC S-I 4K_UHD FF[10bit 4:2:2][29.97p][From 7K]" :
        return 300
    case "XAVC HS 8K_8K FF[10bit 4:2:0][23.976p/25p/29.97p][From 8.6K]","XAVC HS 8K_8K FF[10bit 4:2:0][23.976p/25p/29.97p][From 8.2K]","XAVC HS 8K_8K FF[10bit 4:2:0][23.976p/25p]" :
        return 400
    case "XAVC S-I DCI 4K_DCI 4K FF[10bit 4:2:2][50p]","XAVC S-I 4K_UHD FF[10bit 4:2:2][50p]","XAVC S-I DCI 4K_DCI 4K S35[10bit 4:2:2][50p]","XAVC S-I 4K_UHD S35[10bit 4:2:2][50p]","XAVC S-I DCI 4K_DCI 4K FF[10bit 4:2:2][50p][From 6K]","XAVC S-I 4K_UHD FF[10bit 4:2:2][50p][From 6K]","XAVC S-I 4K_UHD FF[10bit 4:2:2][50p][From 7K]" :
        return 500
    case "XAVC HS 8K_8K FF[10bit 4:2:2][23.976p/25p/29.97p][From 8.6K]","XAVC HS 8K_8K FF[10bit 4:2:2][23.976p/25p/29.97p][From 8.2K]":
        return 520
    case "XAVC S-I DCI 4K_DCI 4K FF[10bit 4:2:2][59.94p]","XAVC S-I 4K_UHD FF[10bit 4:2:2][59.94p]","XAVC S-I DCI 4K_DCI 4K S35[10bit 4:2:2][59.94p]","XAVC S-I 4K_UHD S35[10bit 4:2:2][59.94p]","XAVC S-I DCI 4K_DCI 4K FF[10bit 4:2:2][59.94p][From 6K]","XAVC S-I 4K_UHD FF[10bit 4:2:2][59.94p][From 6K]","XAVC S-I 4K_UHD FF[10bit 4:2:2][59.94p][From 7K]" :
        return 600
    default :
        return 0
    }
}
