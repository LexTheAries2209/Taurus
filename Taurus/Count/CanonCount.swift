//
//  CanonCount.swift
//  Taurus
//
//  Created by 吴坤城 on 12/7/23.
//

import Foundation
import Combine

func CanonCodecSpeed(cameradata:CameraData) -> Double {
    let CanonCodecName = cameradata.Codec + "_" + cameradata.Resolution
    switch CanonCodecName {
    case "IPB Light AVC_FHD FF[8bit 4:2:0][25p/29.97p][From 4K]","IPB Light AVC_FHD S35[8bit 4:2:0][25p/29.97p]","IPB Light AVC_FHD FF[8bit 4:2:0][25p/29.97p]","IPB Light AVC_FHD FF[8bit 4:2:0][23.976p/25p/29.97p]","IPB Light AVC_FHD S35[8bit 4:2:0][23.976p/25p/29.97p]" :
        return 12
    case "IPB Light HEVC_FHD FF[10bit 4:2:2][25p/29.97p][From 4K]","IPB Light HEVC_FHD S35[10bit 4:2:2][25p/29.97p]","IPB Light HEVC_FHD FF[10bit 4:2:2][25p/29.97p]","IPB Light HEVC_FHD FF[10bit 4:2:2][23.976p/25p/29.97p]","IPB Light HEVC_FHD S35[10bit 4:2:2][23.976p/25p/29.97p]" :
        return 28
    case "IPB AVC_FHD FF[8bit 4:2:0][23.976p/25p/29.97p][From 4K]","IPB AVC_FHD S35[8bit 4:2:0][23.976p/25p/29.97p]","IPB AVC_FHD FF[8bit 4:2:0][23.976p/25p/29.97p]" :
        return 30
    case "IPB Light AVC_FHD FF[8bit 4:2:0][50p/59.94p][From 4K]","IPB Light AVC_FHD S35[8bit 4:2:0][50p/59.94p]","IPB Light AVC_FHD FF[8bit 4:2:0][50p/59.94p]" :
        return 35
    case "IPB HEVC_FHD FF[10bit 4:2:2][23.976p/25p/29.97p][From 4K]","IPB HEVC_FHD S35[10bit 4:2:2][23.976p/25p/29.97p]","IPB HEVC_FHD FF[10bit 4:2:2][23.976p/25p/29.97p]" :
        return 45
    case "IPB Light HEVC_FHD FF[10bit 4:2:2][50p/59.94p][From 4K]","IPB Light HEVC_FHD S35[10bit 4:2:2][50p/59.94p]","IPB Light HEVC_FHD FF[10bit 4:2:2][50p/59.94p]" :
        return 50
    case "IPB AVC_FHD FF[8bit 4:2:0][50p/59.94p][From 4K]","IPB AVC_FHD S35[8bit 4:2:0][50p/59.94p]","IPB Light AVC_DCI 4K FF[8bit 4:2:0][23.976p/24p/25p/29.97p][From 8.2K]","IPB Light AVC_UHD FF[8bit 4:2:0][23.976p/25p/29.97p][From 7.7K]","IPB Light AVC_DCI 4K S35[8bit 4:2:0][23.976p/24p/25p/29.97p][From 5.1K]","IPB Light AVC_UHD S35[8bit 4:2:0][23.976p/25p/29.97p][From 4.8K]","IPB Light AVC_UHD FF[8bit 4:2:0][23.976p/25p/29.97p][From 5.1K]","IPB Light AVC_UHD S35[8bit 4:2:0][23.976p/25p/29.97p][From 3.4K]","IPB AVC_FHD FF[8bit 4:2:0][50p/59.94p]","IPB Light AVC_UHD S35[8bit 4:2:0][23.976p/25p/29.97p][From 7K]","IPB Light AVC_DCI 4K FF[8bit 4:2:0][23.976p/24p/25p/29.97p][From 6K]","IPB Light AVC_UHD FF[8bit 4:2:0][23.976p/25p/29.97p][From 5.6K]","IPB Light AVC_DCI 4K S35[8bit 4:2:0][23.976p/24p/25p/29.97p]","IPB Light AVC_UHD S35[8bit 4:2:0][23.976p/25p/29.97p]","IPB Light AVC_UHD FF[8bit 4:2:0][23.976p/25p/29.97p][From 6K]" :
        return 60
    case "IPB Light AVC_FHD FF[8bit 4:2:0][100p/119.88p]","IPB Light AVC_FHD S35[8bit 4:2:0][100p/119.88p]" :
        return 70
    case "IPB Light HEVC_DCI 4K FF[10bit 4:2:2][23.976p/24p/25p/29.97p][From 8.2K]","IPB Light HEVC_DCI 4K S35[10bit 4:2:2][23.976p/24p/25p/29.97p][From 5.1K]","IPB Light HEVC_UHD FF[10bit 4:2:2][23.976p/25p/29.97p][From 7.7K]","IPB Light HEVC_UHD S35[10bit 4:2:2][23.976p/25p/29.97p][From 4.8K]","IPB Light HEVC_UHD FF[10bit 4:2:2][23.976p/25p/29.97p][From 5.1K]","IPB Light HEVC_UHD S35[10bit 4:2:2][23.976p/25p/29.97p][From 3.4K]","IPB Light HEVC_UHD S35[10bit 4:2:2][23.976p/25p/29.97p][From 7K]","IPB Light HEVC_DCI 4K FF[10bit 4:2:2][23.976p/24p/25p/29.97p][From 6K]","IPB Light HEVC_DCI 4K S35[10bit 4:2:2][23.976p/24p/25p/29.97p]","IPB Light HEVC_UHD FF[10bit 4:2:2][23.976p/25p/29.97p][From 5.6K]","IPB Light HEVC_UHD S35[10bit 4:2:2][23.976p/25p/29.97p]","IPB Light HEVC_UHD FF[10bit 4:2:2][23.976p/25p/29.97p][From 6K]" :
        return 85
    case "ALL-I AVC_FHD FF[8bit 4:2:0][23.976p/25p/29.97p][From 4K]","ALL-I AVC_FHD S35[8bit 4:2:0][23.976p/25p/29.97p]","IPB HEVC_FHD FF[10bit 4:2:2][50p/59.94p][From 4K]","IPB HEVC_FHD S35[10bit 4:2:2][50p/59.94p]","IPB HEVC_FHD FF[10bit 4:2:2][50p/59.94p]","ALL-I AVC_FHD FF[8bit 4:2:0][23.976p/25p/29.97p]" :
        return 90
    case "IPB Light HEVC_FHD FF[10bit 4:2:2][100p/119.88p]","IPB Light HEVC_FHD S35[10bit 4:2:2][100p/119.88p]" :
        return 100
    case "IPB AVC_DCI 4K FF[8bit 4:2:0][23.976p/24p/25p/29.97p][From 8.2K]","IPB AVC_UHD FF[8bit 4:2:0][23.976p/25p/29.97p][From 7.7K]","IPB AVC_DCI 4K S35[8bit 4:2:0][23.976p/24p/25p/29.97p][From 5.1K]","IPB AVC_UHD S35[8bit 4:2:0][23.976p/25p/29.97p][From 4.8K]","IPB Light AVC_DCI 4K FF[8bit 4:2:0][50p/59.94p]","IPB Light AVC_UHD FF[8bit 4:2:0][50p/59.94p]","IPB Light AVC_DCI 4K S35[8bit 4:2:0][50p/59.94p][From 5.1K]","IPB Light AVC_UHD S35[8bit 4:2:0][50p/59.94p][From 4.8K]","IPB AVC_UHD FF[8bit 4:2:0][23.976p/25p/29.97p][From 5.1K]","IPB AVC_UHD S35[8bit 4:2:0][23.976p/25p/29.97p][From 3.4K]","IPB Light AVC_UHD FF[8bit 4:2:0][50p/59.94p][From 5.1K]","IPB Light AVC_UHD S35[8bit 4:2:0][50p/59.94p][From 3.4K]","IPB AVC_FHD FF[8bit 4:2:0][100p/119.88p]","IPB AVC_FHD S35[8bit 4:2:0][100p/119.88p]","IPB AVC_UHD S35[8bit 4:2:0][23.976p/25p/29.97p][From 7K]","IPB Light AVC_UHD S16[8bit 4:2:0][50p/59.94p]","IPB Light AVC_UHD S35[8bit 4:2:0][50p/59.94p]","IPB AVC_DCI 4K FF[8bit 4:2:0][23.976p/24p/25p/29.97p][From 6K]","IPB AVC_UHD FF[8bit 4:2:0][23.976p/25p/29.97p][From 5.6K]","IPB AVC_DCI 4K S35[8bit 4:2:0][23.976p/24p/25p/29.97p]","IPB AVC_UHD S35[8bit 4:2:0][23.976p/25p/29.97p]","IPB Light AVC_DCI 4K FF[8bit 4:2:0][50p/59.94p][From 6K]","IPB Light AVC_UHD FF[8bit 4:2:0][50p/59.94p][From 5.6K]","IPB Light AVC_DCI 4K S35[8bit 4:2:0][50p/59.94p]","IPB AVC_UHD FF[8bit 4:2:0][23.976p/25p/29.97p][From 6K]","IPB Light AVC_UHD FF[8bit 4:2:0][50p/59.94p][From 6K]" :
        return 120
    case "ALL-I HEVC_FHD FF[10bit 4:2:2][23.976p/25p/29.97p][From 4K]","ALL-I HEVC_FHD S35[10bit 4:2:2][23.976p/25p/29.97p]","ALL-I HEVC_FHD FF[10bit 4:2:2][23.976p/25p/29.97p]" :
        return 135
    case "IPB HEVC_DCI 4K FF[10bit 4:2:2][23.976p/24p/25p/29.97p][From 8.2K]","IPB HEVC_UHD FF[10bit 4:2:2][23.976p/25p/29.97p][From 7.7K]","IPB HEVC_DCI 4K S35[10bit 4:2:2][23.976p/24p/25p/29.97p][From 5.1K]","IPB HEVC_UHD S35[10bit 4:2:2][23.976p/25p/29.97p][From 4.8K]","IPB Light HEVC_DCI 4K FF[10bit 4:2:2][50p/59.94p]","IPB Light HEVC_UHD FF[10bit 4:2:2][50p/59.94p]","IPB Light HEVC_DCI 4K S35[10bit 4:2:2][50p/59.94p][From 5.1K]","IPB Light HEVC_UHD S35[10bit 4:2:2][50p/59.94p][From 4.8K]","IPB HEVC_UHD FF[10bit 4:2:2][23.976p/25p/29.97p][From 5.1K]","IPB HEVC_UHD S35[10bit 4:2:2][23.976p/25p/29.97p][From 3.4K]","IPB Light HEVC_UHD FF[10bit 4:2:2][50p/59.94p][From 5.1K]","IPB Light HEVC_UHD S35[10bit 4:2:2][50p/59.94p][From 3.4K]","IPB HEVC_UHD S35[10bit 4:2:2][23.976p/25p/29.97p][From 7K]","IPB Light HEVC_UHD S16[10bit 4:2:2][50p/59.94p]","IPB Light HEVC_UHD S35[10bit 4:2:2][50p/59.94p]","IPB HEVC_DCI 4K FF[10bit 4:2:2][23.976p/24p/25p/29.97p][From 6K]","IPB HEVC_UHD FF[10bit 4:2:2][23.976p/25p/29.97p][From 5.6K]","IPB HEVC_DCI 4K S35[10bit 4:2:2][23.976p/24p/25p/29.97p]","IPB HEVC_UHD S35[10bit 4:2:2][23.976p/25p/29.97p]","IPB Light HEVC_UHD FF[10bit 4:2:2][50p/59.94p][From 5.6K]","IPB Light HEVC_DCI 4K FF[10bit 4:2:2][50p/59.94p][From 6K]","IPB Light HEVC_DCI 4K S35[10bit 4:2:2][50p/59.94p]","IPB HEVC_UHD FF[10bit 4:2:2][23.976p/25p/29.97p][From 6K]","IPB Light HEVC_UHD FF[10bit 4:2:2][50p/59.94p][From 6K]" :
        return 170
    case "ALL-I AVC_FHD FF[8bit 4:2:0][50p/59.94p][From 4K]","ALL-I AVC_FHD S35[8bit 4:2:0][50p/59.94p]","IPB HEVC_FHD FF[10bit 4:2:2][100p/119.88p]","IPB HEVC_FHD S35[10bit 4:2:2][100p/119.88p]","ALL-I AVC_FHD FF[8bit 4:2:0][50p/59.94p]" :
        return 180
    case "ALL-I HEVC_FHD FF[10bit 4:2:2][50p/59.94p][From 4K]","ALL-I HEVC_FHD S35[10bit 4:2:2][50p/59.94p]","IPB AVC_DCI 4K FF[8bit 4:2:0][50p/59.94p]","IPB AVC_UHD FF[8bit 4:2:0][50p/59.94p]","IPB AVC_DCI 4K S35[8bit 4:2:0][50p/59.94p][From 5.1K]","IPB AVC_UHD S35[8bit 4:2:0][50p/59.94p][From 4.8K]","IPB Light HEVC_DCI 8K FF[8bit 4:2:0][23.976p/24p/25p/29.97p]","IPB Light HEVC_8K FF[8bit 4:2:0][23.976p/25p/29.97p]","IPB AVC_UHD FF[8bit 4:2:0][50p/59.94p][From 5.1K]","IPB AVC_UHD S35[8bit 4:2:0][50p/59.94p][From 3.4K]","IPB AVC_UHD S16[8bit 4:2:0][50p/59.94p]","IPB AVC_UHD S35[8bit 4:2:0][50p/59.94p]","ALL-I HEVC_FHD FF[10bit 4:2:2][50p/59.94p]","IPB AVC_DCI 4K FF[8bit 4:2:0][50p/59.94p][From 6K]","IPB AVC_UHD FF[8bit 4:2:0][50p/59.94p][From 5.6K]","IPB AVC_DCI 4K S35[8bit 4:2:0][50p/59.94p]","IPB AVC_UHD FF[8bit 4:2:0][50p/59.94p][From 6K]" :
        return 230
    case "IPB HEVC_DCI 4K FF[10bit 4:2:2][50p/59.94p]","IPB HEVC_UHD FF[10bit 4:2:2][50p/59.94p]","IPB HEVC_DCI 4K S35[10bit 4:2:2][50p/59.94p][From 5.1K]","IPB HEVC_UHD S35[10bit 4:2:2][50p/59.94p][From 4.8K]","IPB Light HEVC_DCI 8K FF[10bit 4:2:2][23.976p/24p/25p/29.97p]","IPB Light HEVC_8K FF[10bit 4:2:2][23.976p/25p/29.97p]","IPB HEVC_UHD FF[10bit 4:2:2][50p/59.94p][From 5.1K]","IPB HEVC_UHD S35[10bit 4:2:2][50p/59.94p][From 3.4K]","IPB HEVC_UHD S16[10bit 4:2:2][50p/59.94p]","IPB HEVC_UHD S35[10bit 4:2:2][50p/59.94p]","IPB HEVC_DCI 4K FF[10bit 4:2:2][50p/59.94p][From 6K]","IPB HEVC_UHD FF[10bit 4:2:2][50p/59.94p][From 5.6K]","IPB HEVC_DCI 4K S35[10bit 4:2:2][50p/59.94p]","IPB HEVC_UHD FF[10bit 4:2:2][50p/59.94p][From 6K]" :
        return 340
    case "ALL-I AVC_FHD FF[8bit 4:2:0][100p/119.88p][From 4k]","ALL-I AVC_FHD FF[8bit 4:2:0][100p/119.88p]","ALL-I AVC_FHD S35[8bit 4:2:0][100p/119.88p]","ALL-I HEVC_FHD FF[10bit 4:2:2][100p/119.88p]","ALL-I HEVC_FHD S35[10bit 4:2:2][100p/119.88p]" :
        return 360
    case "ALL-I HEVC_DCI 4K FF[10bit 4:2:2][23.976p/24p/25p/29.97p][From 8.2K]","ALL-I HEVC_UHD FF[10bit 4:2:2][23.976p/25p/29.97p][From 7.7K]","ALL-I HEVC_DCI 4K S35[10bit 4:2:2][23.976p/24p/25p/29.97p][From 5.1K]","ALL-I HEVC_UHD S35[10bit 4:2:2][23.976p/25p/29.97p][From 4.8K]","ALL-I AVC_DCI 4K FF[8bit 4:2:0][23.976p/24p/25p/29.97p][From 8.2K]","ALL-I AVC_UHD FF[8bit 4:2:0][23.976p/25p/29.97p][From 7.7K]","ALL-I AVC_UHD S35[8bit 4:2:0][23.976p/25p/29.97p][From 4.8K]","ALL-I AVC_DCI 4K S35[8bit 4:2:0][23.976p/24p/25p/29.97p][From 5.1K]","ALL-I HEVC_FHD FF[10bit 4:2:2][100p/119.88p][From 4k]","IPB HEVC_DCI 8K FF[8bit 4:2:0][23.976p/24p/25p/29.97p]","IPB HEVC_8K FF[8bit 4:2:0][23.976p/25p/29.97p]","ALL-I HEVC_DCI 4K FF[10bit 4:2:2][23.976p/24p/25p/29.97p][From 6K]","ALL-I HEVC_UHD FF[10bit 4:2:2][23.976p/25p/29.97p][From 5.6K]","ALL-I AVC_DCI 4K FF[8bit 4:2:0][23.976p/24p/25p/29.97p][From 6K]","ALL-I AVC_UHD FF[8bit 4:2:0][23.976p/25p/29.97p][From 5.6K]","ALL-I HEVC_DCI 4K S35[10bit 4:2:2][23.976p/24p/25p/29.97p]","ALL-I HEVC_UHD S35[10bit 4:2:2][23.976p/25p/29.97p]","ALL-I AVC_DCI 4K S35[8bit 4:2:0][23.976p/24p/25p/29.97p]","ALL-I AVC_UHD S35[8bit 4:2:0][23.976p/25p/29.97p]" :
        return 470
    case "IPB HEVC_DCI 8K FF[10bit 4:2:2][23.976p/24p/25p/29.97p]","IPB HEVC_8K FF[10bit 4:2:2][23.976p/25p/29.97p]","ALL-I AVC_FHD FF[8bit 4:2:0][200p/239.76p]","ALL-I HEVC_FHD FF[10bit 4:2:2][200p/239.76p]" :
        return 680
    case "RAW Light_DCI 6K FF[12bit RAW][23.976p/24p]" :
        return 720
    case "RAW Light_DCI 6K FF[12bit RAW][25p/29.97p]" :
        return 900
    case "ALL-I AVC_DCI 4K FF[8bit 4:2:0][50p/59.94p]","ALL-I AVC_UHD FF[8bit 4:2:0][50p/59.94p]","ALL-I AVC_DCI 4K S35[8bit 4:2:0][50p/59.94p][From 5.1K]","ALL-I AVC_UHD S35[8bit 4:2:0][50p/59.94p][From 4.8K]","ALL-I AVC_DCI 4K FF[8bit 4:2:0][50p/59.94p][From 6K]","ALL-I AVC_UHD FF[8bit 4:2:0][50p/59.94p][From 5.6K]","ALL-I AVC_DCI 4K S35[8bit 4:2:0][50p/59.94p]","ALL-I AVC_UHD S35[8bit 4:2:0][50p/59.94p]" :
        return 940
    case "ALL-I HEVC_DCI 4K FF[10bit 4:2:2][50p/59.94p]","ALL-I HEVC_UHD FF[10bit 4:2:2][50p/59.94p]","ALL-I HEVC_DCI 4K S35[10bit 4:2:2][50p/59.94p][From 5.1K]","ALL-I HEVC_UHD S35[10bit 4:2:2][50p/59.94p][From 4.8K]","ALL-I HEVC_DCI 4K FF[10bit 4:2:2][50p/59.94p][From 6K]","ALL-I HEVC_UHD FF[10bit 4:2:2][50p/59.94p][From 5.6K]","ALL-I HEVC_DCI 4K S35[10bit 4:2:2][50p/59.94p]","ALL-I HEVC_UHD S35[10bit 4:2:2][50p/59.94p]" :
        return 1000
    case "ALL-I HEVC_DCI 8K FF[10bit 4:2:2][23.976p/24p/25p/29.97p]","ALL-I HEVC_8K FF[10bit 4:2:2][23.976p/25p/29.97p]","ALL-I HEVC_DCI 8K FF[8bit 4:2:0][23.976p/24p/25p/29.97p]","ALL-I HEVC_8K FF[8bit 4:2:0][23.976p/25p/29.97p]" :
        return 1300
    case "RAW Light_DCI 8K FF[12bit RAW Light][23.976p/24p]" :
        return 1350
    case "RAW_DCI 6K FF[12bit RAW][23.976p/24p]" :
        return 1600
    case "RAW Light_DCI 8K FF[12bit RAW Light][25/29.97p]" :
        return 1700
    case "RAW Light_DCI 6K FF[12bit RAW][50p/59.94p]" :
        return 1800
    case "ALL-I HEVC_DCI 4K FF[10bit 4:2:2][100p/119.88p]","ALL-I HEVC_UHD FF[10bit 4:2:2][100p/119.88p]","ALL-I AVC_DCI 4K FF[8bit 4:2:0][100p/119.88p]","ALL-I AVC_UHD FF[8bit 4:2:0][100p/119.88p]","ALL-I HEVC_DCI 4K S35[10bit 4:2:2][100p/119.88p]","ALL-I HEVC_UHD S35[10bit 4:2:2][100p/119.88p]","ALL-I AVC_DCI 4K S35[8bit 4:2:0][100p/119.88p]","ALL-I AVC_UHD S35[8bit 4:2:0][100p/119.88p]" :
        return 1880
    case "RAW_DCI 6K FF[12bit RAW][25p/29.97p]" :
        return 2000
    case "RAW_DCI 8K FF[12bit RAW][23.976p/24p/25p/29.97p]","RAW_DCI 6K FF[12bit RAW][50p/59.94p]" :
        return 2600
    default :
        return 0
    }
}
