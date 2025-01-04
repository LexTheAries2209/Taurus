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
    case "IPB Light AVC_FHD FF[8bit 4:2:0][50p/59.94p][From 4K]","IPB Light AVC_FHD S35[8bit 4:2:0][50p/59.94p]","IPB Light AVC_FHD FF[8bit 4:2:0][50p/59.94p]","XF-HEVC S LongGOP FF_2K[10bit 4:2:0][23.976p/24p/25p/29.97p/50p/59.94p][From 4K]","XF-HEVC S LongGOP FF_2K[10bit 4:2:0][23.976p/24p/25p/29.97p/50p/59.94p]","XF-HEVC S LongGOP S35_2K[10bit 4:2:0][23.976p/24p/25p/29.97p/50p/59.94p]","XF-AVC S LongGOP FF_2K[8bit 4:2:0][23.976p/24p/25p/29.97p/50p/59.94p][From 4K]","XF-AVC S LongGOP FF_2K[8bit 4:2:0][23.976p/24p/25p/29.97p/50p/59.94p]","XF-AVC S LongGOP S35_2K[8bit 4:2:0][23.976p/24p/25p/29.97p/50p/59.94p]" :
        return 35
    case "IPB HEVC_FHD FF[10bit 4:2:2][23.976p/25p/29.97p][From 4K]","IPB HEVC_FHD S35[10bit 4:2:2][23.976p/25p/29.97p]","IPB HEVC_FHD FF[10bit 4:2:2][23.976p/25p/29.97p]" :
        return 45
    case "IPB Light HEVC_FHD FF[10bit 4:2:2][50p/59.94p][From 4K]","IPB Light HEVC_FHD S35[10bit 4:2:2][50p/59.94p]","IPB Light HEVC_FHD FF[10bit 4:2:2][50p/59.94p]","XF-HEVC S LongGOP FF_2K[10bit 4:2:2][23.976p/24p/25p/29.97p/50p/59.94p][From 4K]","XF-HEVC S LongGOP FF_2K[10bit 4:2:2][23.976p/24p/25p/29.97p/50p/59.94p]","XF-HEVC S LongGOP S35_2K[10bit 4:2:2][23.976p/24p/25p/29.97p/50p/59.94p]","XF-AVC S LongGOP FF_2K[10bit 4:2:2][23.976p/24p/25p/29.97p/50p/59.94p][From 4K]","XF-AVC S LongGOP FF_2K[10bit 4:2:2][23.976p/24p/25p/29.97p/50p/59.94p]","XF-AVC S LongGOP S35_2K[10bit 4:2:2][23.976p/24p/25p/29.97p/50p/59.94p]" :
        return 50
    case "IPB AVC_FHD FF[8bit 4:2:0][50p/59.94p][From 4K]","IPB AVC_FHD S35[8bit 4:2:0][50p/59.94p]","IPB Light AVC_DCI 4K FF[8bit 4:2:0][23.976p/24p/25p/29.97p][From 8.2K]","IPB Light AVC_UHD FF[8bit 4:2:0][23.976p/25p/29.97p][From 7.7K]","IPB Light AVC_DCI 4K S35[8bit 4:2:0][23.976p/24p/25p/29.97p][From 5.1K]","IPB Light AVC_UHD S35[8bit 4:2:0][23.976p/25p/29.97p][From 4.8K]","IPB Light AVC_UHD FF[8bit 4:2:0][23.976p/25p/29.97p][From 5.1K]","IPB Light AVC_UHD S35[8bit 4:2:0][23.976p/25p/29.97p][From 3.4K]","IPB AVC_FHD FF[8bit 4:2:0][50p/59.94p]","IPB Light AVC_UHD S35[8bit 4:2:0][23.976p/25p/29.97p][From 7K]","IPB Light AVC_DCI 4K FF[8bit 4:2:0][23.976p/24p/25p/29.97p][From 6K]","IPB Light AVC_UHD FF[8bit 4:2:0][23.976p/25p/29.97p][From 5.6K]","IPB Light AVC_DCI 4K S35[8bit 4:2:0][23.976p/24p/25p/29.97p]","IPB Light AVC_UHD S35[8bit 4:2:0][23.976p/25p/29.97p]","IPB Light AVC_UHD FF[8bit 4:2:0][23.976p/25p/29.97p][From 6K]" :
        return 60
    case "IPB Light AVC_FHD FF[8bit 4:2:0][100p/119.88p]","IPB Light AVC_FHD S35[8bit 4:2:0][100p/119.88p]","XF-HEVC S LongGOP FF_2K[10bit 4:2:0][100p/119.88p]","XF-HEVC S LongGOP S35_2K[10bit 4:2:0][100p/119.88p]","XF-AVC S LongGOP FF_2K[8bit 4:2:0][100p/119.88p]","XF-AVC S LongGOP S35_2K[8bit 4:2:0][100p/119.88p]" :
        return 70
    case "IPB Light HEVC_DCI 4K FF[10bit 4:2:2][23.976p/24p/25p/29.97p][From 8.2K]","IPB Light HEVC_DCI 4K S35[10bit 4:2:2][23.976p/24p/25p/29.97p][From 5.1K]","IPB Light HEVC_UHD FF[10bit 4:2:2][23.976p/25p/29.97p][From 7.7K]","IPB Light HEVC_UHD S35[10bit 4:2:2][23.976p/25p/29.97p][From 4.8K]","IPB Light HEVC_UHD FF[10bit 4:2:2][23.976p/25p/29.97p][From 5.1K]","IPB Light HEVC_UHD S35[10bit 4:2:2][23.976p/25p/29.97p][From 3.4K]","IPB Light HEVC_UHD S35[10bit 4:2:2][23.976p/25p/29.97p][From 7K]","IPB Light HEVC_DCI 4K FF[10bit 4:2:2][23.976p/24p/25p/29.97p][From 6K]","IPB Light HEVC_DCI 4K S35[10bit 4:2:2][23.976p/24p/25p/29.97p]","IPB Light HEVC_UHD FF[10bit 4:2:2][23.976p/25p/29.97p][From 5.6K]","IPB Light HEVC_UHD S35[10bit 4:2:2][23.976p/25p/29.97p]","IPB Light HEVC_UHD FF[10bit 4:2:2][23.976p/25p/29.97p][From 6K]" :
        return 85
    case "ALL-I AVC_FHD FF[8bit 4:2:0][23.976p/25p/29.97p][From 4K]","ALL-I AVC_FHD S35[8bit 4:2:0][23.976p/25p/29.97p]","IPB HEVC_FHD FF[10bit 4:2:2][50p/59.94p][From 4K]","IPB HEVC_FHD S35[10bit 4:2:2][50p/59.94p]","IPB HEVC_FHD FF[10bit 4:2:2][50p/59.94p]","ALL-I AVC_FHD FF[8bit 4:2:0][23.976p/25p/29.97p]" :
        return 90
    case "IPB Light HEVC_FHD FF[10bit 4:2:2][100p/119.88p]","IPB Light HEVC_FHD S35[10bit 4:2:2][100p/119.88p]","XF-HEVC S LongGOP FF_4K[10bit 4:2:0][23.976p/24p/25p/29.97p][From 8K]","XF-HEVC S LongGOP FF_4K[10bit 4:2:0][23.976p/24p/25p/29.97p]","XF-HEVC S LongGOP S35_4K[10bit 4:2:0][23.976p/24p/25p/29.97p]","XF-AVC S LongGOP FF_4K[8bit 4:2:0][23.976p/24p/25p/29.97p][From 8K]","XF-AVC S LongGOP FF_4K[8bit 4:2:0][23.976p/24p/25p/29.97p]","XF-AVC S LongGOP S35_4K[8bit 4:2:0][23.976p/24p/25p/29.97p][From 8K]","XF-AVC S LongGOP S35_4K[8bit 4:2:0][23.976p/24p/25p/29.97p]","XF-HEVC S LongGOP FF_2K[10bit 4:2:2][100p/119.88p]","XF-HEVC S LongGOP S35_2K[10bit 4:2:2][100p/119.88p]","XF-AVC S LongGOP FF_2K[10bit 4:2:2][100p/119.88p]","XF-AVC S LongGOP S35_2K[10bit 4:2:2][100p/119.88p]" :
        return 100
    case "IPB AVC_DCI 4K FF[8bit 4:2:0][23.976p/24p/25p/29.97p][From 8.2K]","IPB AVC_UHD FF[8bit 4:2:0][23.976p/25p/29.97p][From 7.7K]","IPB AVC_DCI 4K S35[8bit 4:2:0][23.976p/24p/25p/29.97p][From 5.1K]","IPB AVC_UHD S35[8bit 4:2:0][23.976p/25p/29.97p][From 4.8K]","IPB Light AVC_DCI 4K FF[8bit 4:2:0][50p/59.94p]","IPB Light AVC_UHD FF[8bit 4:2:0][50p/59.94p]","IPB Light AVC_DCI 4K S35[8bit 4:2:0][50p/59.94p][From 5.1K]","IPB Light AVC_UHD S35[8bit 4:2:0][50p/59.94p][From 4.8K]","IPB AVC_UHD FF[8bit 4:2:0][23.976p/25p/29.97p][From 5.1K]","IPB AVC_UHD S35[8bit 4:2:0][23.976p/25p/29.97p][From 3.4K]","IPB Light AVC_UHD FF[8bit 4:2:0][50p/59.94p][From 5.1K]","IPB Light AVC_UHD S35[8bit 4:2:0][50p/59.94p][From 3.4K]","IPB AVC_FHD FF[8bit 4:2:0][100p/119.88p]","IPB AVC_FHD S35[8bit 4:2:0][100p/119.88p]","IPB AVC_UHD S35[8bit 4:2:0][23.976p/25p/29.97p][From 7K]","IPB Light AVC_UHD S16[8bit 4:2:0][50p/59.94p]","IPB Light AVC_UHD S35[8bit 4:2:0][50p/59.94p]","IPB AVC_DCI 4K FF[8bit 4:2:0][23.976p/24p/25p/29.97p][From 6K]","IPB AVC_UHD FF[8bit 4:2:0][23.976p/25p/29.97p][From 5.6K]","IPB AVC_DCI 4K S35[8bit 4:2:0][23.976p/24p/25p/29.97p]","IPB AVC_UHD S35[8bit 4:2:0][23.976p/25p/29.97p]","IPB Light AVC_DCI 4K FF[8bit 4:2:0][50p/59.94p][From 6K]","IPB Light AVC_UHD FF[8bit 4:2:0][50p/59.94p][From 5.6K]","IPB Light AVC_DCI 4K S35[8bit 4:2:0][50p/59.94p]","IPB AVC_UHD FF[8bit 4:2:0][23.976p/25p/29.97p][From 6K]","IPB Light AVC_UHD FF[8bit 4:2:0][50p/59.94p][From 6K]","XF-AVC S Intra ST FF_2K[10bit 4:2:2][23.976p/24p][From 4K]","XF-AVC S Intra ST FF_2K[10bit 4:2:2][23.976p/24p]","XF-AVC S Intra ST S35_2K[10bit 4:2:2][23.976p/24p]" :
        return 120
    case "XF-AVC S Intra ST FF_2K[10bit 4:2:2][25p][From 4K]","XF-AVC S Intra ST FF_2K[10bit 4:2:2][25p]","XF-AVC S Intra ST S35_2K[10bit 4:2:2][25p]" :
        return 125
    case "ALL-I HEVC_FHD FF[10bit 4:2:2][23.976p/25p/29.97p][From 4K]","ALL-I HEVC_FHD S35[10bit 4:2:2][23.976p/25p/29.97p]","ALL-I HEVC_FHD FF[10bit 4:2:2][23.976p/25p/29.97p]","XF-HEVC S LongGOP FF_4K[10bit 4:2:2][23.976p/24p/25p/29.97p][From 8K]","XF-HEVC S LongGOP FF_4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","XF-HEVC S LongGOP S35_4K[10bit 4:2:2][23.976p/24p/25p/29.97p]" :
        return 135
    case "XF-HEVC S LongGOP FF_2K[10bit 4:2:0][200p/239.76p]","XF-AVC S LongGOP FF_2K[8bit 4:2:0][200p/239.76p]" :
        return 140
    case "XF-AVC S LongGOP FF_4K[10bit 4:2:2][23.976p/24p/25p/29.97p][From 8K]","XF-HEVC S LongGOP FF_4K[10bit 4:2:0][50p/59.94p]","XF-HEVC S LongGOP S35_4K[10bit 4:2:0][50p/59.94p]","XF-AVC S LongGOP FF_4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","XF-AVC S LongGOP S35_4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","XF-AVC S LongGOP FF_4K[8bit 4:2:0][50p/59.94p]","XF-AVC S LongGOP S35_4K[8bit 4:2:0][50p/59.94p]","XF-AVC S Intra ST FF_2K[10bit 4:2:2][29.97p][From 4K]","XF-AVC S Intra ST FF_2K[10bit 4:2:2][29.97p]","XF-AVC S Intra ST S35_2K[10bit 4:2:2][29.97p]" :
        return 150
    case "IPB HEVC_DCI 4K FF[10bit 4:2:2][23.976p/24p/25p/29.97p][From 8.2K]","IPB HEVC_UHD FF[10bit 4:2:2][23.976p/25p/29.97p][From 7.7K]","IPB HEVC_DCI 4K S35[10bit 4:2:2][23.976p/24p/25p/29.97p][From 5.1K]","IPB HEVC_UHD S35[10bit 4:2:2][23.976p/25p/29.97p][From 4.8K]","IPB Light HEVC_DCI 4K FF[10bit 4:2:2][50p/59.94p]","IPB Light HEVC_UHD FF[10bit 4:2:2][50p/59.94p]","IPB Light HEVC_DCI 4K S35[10bit 4:2:2][50p/59.94p][From 5.1K]","IPB Light HEVC_UHD S35[10bit 4:2:2][50p/59.94p][From 4.8K]","IPB HEVC_UHD FF[10bit 4:2:2][23.976p/25p/29.97p][From 5.1K]","IPB HEVC_UHD S35[10bit 4:2:2][23.976p/25p/29.97p][From 3.4K]","IPB Light HEVC_UHD FF[10bit 4:2:2][50p/59.94p][From 5.1K]","IPB Light HEVC_UHD S35[10bit 4:2:2][50p/59.94p][From 3.4K]","IPB HEVC_UHD S35[10bit 4:2:2][23.976p/25p/29.97p][From 7K]","IPB Light HEVC_UHD S16[10bit 4:2:2][50p/59.94p]","IPB Light HEVC_UHD S35[10bit 4:2:2][50p/59.94p]","IPB HEVC_DCI 4K FF[10bit 4:2:2][23.976p/24p/25p/29.97p][From 6K]","IPB HEVC_UHD FF[10bit 4:2:2][23.976p/25p/29.97p][From 5.6K]","IPB HEVC_DCI 4K S35[10bit 4:2:2][23.976p/24p/25p/29.97p]","IPB HEVC_UHD S35[10bit 4:2:2][23.976p/25p/29.97p]","IPB Light HEVC_UHD FF[10bit 4:2:2][50p/59.94p][From 5.6K]","IPB Light HEVC_DCI 4K FF[10bit 4:2:2][50p/59.94p][From 6K]","IPB Light HEVC_DCI 4K S35[10bit 4:2:2][50p/59.94p]","IPB HEVC_UHD FF[10bit 4:2:2][23.976p/25p/29.97p][From 6K]","IPB Light HEVC_UHD FF[10bit 4:2:2][50p/59.94p][From 6K]" :
        return 170
    case "ALL-I AVC_FHD FF[8bit 4:2:0][50p/59.94p][From 4K]","ALL-I AVC_FHD S35[8bit 4:2:0][50p/59.94p]","IPB HEVC_FHD FF[10bit 4:2:2][100p/119.88p]","IPB HEVC_FHD S35[10bit 4:2:2][100p/119.88p]","ALL-I AVC_FHD FF[8bit 4:2:0][50p/59.94p]" :
        return 180
    case "XF-HEVC S LongGOP FF_2K[10bit 4:2:2][200p/239.76p]","XF-AVC S LongGOP FF_2K[10bit 4:2:2][200p/239.76p]" :
        return 200
    case "XF-HEVC S LongGOP FF_4K[10bit 4:2:2][50p/59.94p]","XF-HEVC S LongGOP S35_4K[10bit 4:2:2][50p/59.94p]" :
        return 225
    case "ALL-I HEVC_FHD FF[10bit 4:2:2][50p/59.94p][From 4K]","ALL-I HEVC_FHD S35[10bit 4:2:2][50p/59.94p]","IPB AVC_DCI 4K FF[8bit 4:2:0][50p/59.94p]","IPB AVC_UHD FF[8bit 4:2:0][50p/59.94p]","IPB AVC_DCI 4K S35[8bit 4:2:0][50p/59.94p][From 5.1K]","IPB AVC_UHD S35[8bit 4:2:0][50p/59.94p][From 4.8K]","IPB Light HEVC_DCI 8K FF[8bit 4:2:0][23.976p/24p/25p/29.97p]","IPB Light HEVC_8K FF[8bit 4:2:0][23.976p/25p/29.97p]","IPB AVC_UHD FF[8bit 4:2:0][50p/59.94p][From 5.1K]","IPB AVC_UHD S35[8bit 4:2:0][50p/59.94p][From 3.4K]","IPB AVC_UHD S16[8bit 4:2:0][50p/59.94p]","IPB AVC_UHD S35[8bit 4:2:0][50p/59.94p]","ALL-I HEVC_FHD FF[10bit 4:2:2][50p/59.94p]","IPB AVC_DCI 4K FF[8bit 4:2:0][50p/59.94p][From 6K]","IPB AVC_UHD FF[8bit 4:2:0][50p/59.94p][From 5.6K]","IPB AVC_DCI 4K S35[8bit 4:2:0][50p/59.94p]","IPB AVC_UHD FF[8bit 4:2:0][50p/59.94p][From 6K]" :
        return 230
    case "XF-AVC S Intra LT FF_4K[10bit 4:2:2][23.976p/24p][From 8K]","XF-AVC S Intra LT FF_4K[10bit 4:2:2][23.976p/24p]","XF-AVC S Intra LT S35_4K[10bit 4:2:2][23.976p/24p]" :
        return 240
    case "XF-AVC S Intra LT FF_4K[10bit 4:2:2][25p][From 8K]","XF-AVC S Intra LT FF_4K[10bit 4:2:2][25p]","XF-AVC S Intra LT S35_4K[10bit 4:2:2][25p]","XF-AVC S LongGOP FF_4K[10bit 4:2:2][50p/59.94p]","XF-AVC S LongGOP S35_4K[10bit 4:2:2][50p/59.94p]","XF-AVC S Intra ST FF_2K[10bit 4:2:2][50p][From 4K]","XF-AVC S Intra ST FF_2K[10bit 4:2:2][50p]","XF-AVC S Intra ST S35_2K[10bit 4:2:2][50p]" :
        return 250
    case "XF-AVC S Intra LT FF_4K[10bit 4:2:2][29.97p][From 8K]","XF-HEVC S LongGOP FF_4K[10bit 4:2:0][100p/119.88p]","XF-AVC S Intra LT FF_4K[10bit 4:2:2][29.97p]","XF-AVC S Intra LT S35_4K[10bit 4:2:2][29.97p]","XF-AVC S LongGOP FF_4K[8bit 4:2:0][100p/119.88p]","XF-AVC S Intra ST FF_2K[10bit 4:2:2][59.94p][From 4K]","XF-AVC S Intra ST FF_2K[10bit 4:2:2][59.94p]","XF-AVC S Intra ST S35_2K[10bit 4:2:2][59.94p]" :
        return 300
    case "RAW Light_DCI 4K FF[12bit SRAW][23.976p/24p]" :
        return 330
    case "IPB HEVC_DCI 4K FF[10bit 4:2:2][50p/59.94p]","IPB HEVC_UHD FF[10bit 4:2:2][50p/59.94p]","IPB HEVC_DCI 4K S35[10bit 4:2:2][50p/59.94p][From 5.1K]","IPB HEVC_UHD S35[10bit 4:2:2][50p/59.94p][From 4.8K]","IPB Light HEVC_DCI 8K FF[10bit 4:2:2][23.976p/24p/25p/29.97p]","IPB Light HEVC_8K FF[10bit 4:2:2][23.976p/25p/29.97p]","IPB HEVC_UHD FF[10bit 4:2:2][50p/59.94p][From 5.1K]","IPB HEVC_UHD S35[10bit 4:2:2][50p/59.94p][From 3.4K]","IPB HEVC_UHD S16[10bit 4:2:2][50p/59.94p]","IPB HEVC_UHD S35[10bit 4:2:2][50p/59.94p]","IPB HEVC_DCI 4K FF[10bit 4:2:2][50p/59.94p][From 6K]","IPB HEVC_UHD FF[10bit 4:2:2][50p/59.94p][From 5.6K]","IPB HEVC_DCI 4K S35[10bit 4:2:2][50p/59.94p]","IPB HEVC_UHD FF[10bit 4:2:2][50p/59.94p][From 6K]" :
        return 340
    case "RAW Light_DCI 4K FF[12bit SRAW][25p]" :
        return 350
    case "ALL-I AVC_FHD FF[8bit 4:2:0][100p/119.88p][From 4k]","ALL-I AVC_FHD FF[8bit 4:2:0][100p/119.88p]","ALL-I AVC_FHD S35[8bit 4:2:0][100p/119.88p]","ALL-I HEVC_FHD FF[10bit 4:2:2][100p/119.88p]","ALL-I HEVC_FHD S35[10bit 4:2:2][100p/119.88p]","XF-AVC S Intra ST FF_4K[10bit 4:2:2][23.976p/24p][From 8K]","XF-AVC S Intra ST FF_4K[10bit 4:2:2][23.976p/24p]","XF-AVC S Intra ST S35_4K[10bit 4:2:2][23.976p/24p]" :
        return 360
    case "XF-AVC S Intra ST FF_4K[10bit 4:2:2][25p][From 8K]","XF-AVC S Intra ST FF_4K[10bit 4:2:2][25p]","XF-AVC S Intra ST S35_4K[10bit 4:2:2][25p]" :
        return 375
    case "XF-HEVC S LongGOP FF_8K[10bit 4:2:0][23.976p/24p/25p/29.97p]" :
        return 400
    case "RAW Light_DCI 4K FF[12bit SRAW][29.97p]" :
        return 420
    case "XF-AVC S Intra ST FF_4K[10bit 4:2:2][29.97p][From 8K]","XF-HEVC S LongGOP FF_4K[10bit 4:2:2][100p/119.88p]","XF-AVC S Intra ST FF_4K[10bit 4:2:2][29.97p]","XF-AVC S Intra ST S35_4K[10bit 4:2:2][29.97p]" :
        return 450
    case "ALL-I HEVC_DCI 4K FF[10bit 4:2:2][23.976p/24p/25p/29.97p][From 8.2K]","ALL-I HEVC_UHD FF[10bit 4:2:2][23.976p/25p/29.97p][From 7.7K]","ALL-I HEVC_DCI 4K S35[10bit 4:2:2][23.976p/24p/25p/29.97p][From 5.1K]","ALL-I HEVC_UHD S35[10bit 4:2:2][23.976p/25p/29.97p][From 4.8K]","ALL-I AVC_DCI 4K FF[8bit 4:2:0][23.976p/24p/25p/29.97p][From 8.2K]","ALL-I AVC_UHD FF[8bit 4:2:0][23.976p/25p/29.97p][From 7.7K]","ALL-I AVC_UHD S35[8bit 4:2:0][23.976p/25p/29.97p][From 4.8K]","ALL-I AVC_DCI 4K S35[8bit 4:2:0][23.976p/24p/25p/29.97p][From 5.1K]","ALL-I HEVC_FHD FF[10bit 4:2:2][100p/119.88p][From 4k]","IPB HEVC_DCI 8K FF[8bit 4:2:0][23.976p/24p/25p/29.97p]","IPB HEVC_8K FF[8bit 4:2:0][23.976p/25p/29.97p]","ALL-I HEVC_DCI 4K FF[10bit 4:2:2][23.976p/24p/25p/29.97p][From 6K]","ALL-I HEVC_UHD FF[10bit 4:2:2][23.976p/25p/29.97p][From 5.6K]","ALL-I AVC_DCI 4K FF[8bit 4:2:0][23.976p/24p/25p/29.97p][From 6K]","ALL-I AVC_UHD FF[8bit 4:2:0][23.976p/25p/29.97p][From 5.6K]","ALL-I HEVC_DCI 4K S35[10bit 4:2:2][23.976p/24p/25p/29.97p]","ALL-I HEVC_UHD S35[10bit 4:2:2][23.976p/25p/29.97p]","ALL-I AVC_DCI 4K S35[8bit 4:2:0][23.976p/24p/25p/29.97p]","ALL-I AVC_UHD S35[8bit 4:2:0][23.976p/25p/29.97p]" :
        return 470
    case "XF-AVC S Intra HQ FF_4K[10bit 4:2:2][23.976p/24p][From 8K]","XF-AVC S Intra HQ FF_4K[10bit 4:2:2][23.976p/24p]","XF-AVC S Intra HQ S35_4K[10bit 4:2:2][23.976p/24p]" :
        return 480
    case "XF-AVC S Intra HQ FF_4K[10bit 4:2:2][25p][From 8K]","XF-AVC S Intra HQ FF_4K[10bit 4:2:2][25p]","XF-AVC S Intra HQ S35_4K[10bit 4:2:2][25p]","XF-AVC S Intra LT FF_4K[10bit 4:2:2][50p]","XF-AVC S Intra LT S35_4K[10bit 4:2:2][50p]","XF-AVC S LongGOP FF_4K[10bit 4:2:2][100p/119.88p]","XF-AVC S Intra ST FF_2K[10bit 4:2:2][100p]","XF-AVC S Intra ST S35_2K[10bit 4:2:2][100p]" :
        return 500
    case "XF-HEVC S LongGOP FF_8K[10bit 4:2:2][23.976p/24p/25p/29.97p]" :
        return 540
    case "XF-AVC S Intra HQ FF_4K[10bit 4:2:2][29.97p][From 8K]","XF-AVC S Intra HQ FF_4K[10bit 4:2:2][29.97p]","XF-AVC S Intra HQ S35_4K[10bit 4:2:2][29.97p]","XF-AVC S Intra LT FF_4K[10bit 4:2:2][59.94p]","XF-AVC S Intra LT S35_4K[10bit 4:2:2][59.94p]","XF-AVC S Intra ST FF_2K[10bit 4:2:2][119.88p]","XF-AVC S Intra ST S35_2K[10bit 4:2:2][119.88p]" :
        return 600
    case "IPB HEVC_DCI 8K FF[10bit 4:2:2][23.976p/24p/25p/29.97p]","IPB HEVC_8K FF[10bit 4:2:2][23.976p/25p/29.97p]","ALL-I AVC_FHD FF[8bit 4:2:0][200p/239.76p]","ALL-I HEVC_FHD FF[10bit 4:2:2][200p/239.76p]" :
        return 680
    case "RAW Light_DCI 4K FF[12bit SRAW][50p]" :
        return 700
    case "RAW Light_DCI 6K FF[12bit RAW][23.976p/24p]" :
        return 720
    case "RAW_DCI 4K FF[12bit SRAW][23.976p/24p]" :
        return 745
    case "XF-AVC S Intra ST FF_4K[10bit 4:2:2][50p]","XF-AVC S Intra ST S35_4K[10bit 4:2:2][50p]" :
        return 750
    case "RAW_DCI 4K FF[12bit SRAW][25p]" :
        return 780
    case "RAW Light_DCI 4K FF[12bit SRAW][59.94p]" :
        return 840
    case "RAW Light_DCI 6K FF[12bit RAW][25p/29.97p]","XF-AVC S Intra ST FF_4K[10bit 4:2:2][59.94p]","XF-AVC S Intra ST S35_4K[10bit 4:2:2][59.94p]" :
        return 900
    case "RAW_DCI 4K FF[12bit SRAW][29.97p]" :
        return 930
    case "ALL-I AVC_DCI 4K FF[8bit 4:2:0][50p/59.94p]","ALL-I AVC_UHD FF[8bit 4:2:0][50p/59.94p]","ALL-I AVC_DCI 4K S35[8bit 4:2:0][50p/59.94p][From 5.1K]","ALL-I AVC_UHD S35[8bit 4:2:0][50p/59.94p][From 4.8K]","ALL-I AVC_DCI 4K FF[8bit 4:2:0][50p/59.94p][From 6K]","ALL-I AVC_UHD FF[8bit 4:2:0][50p/59.94p][From 5.6K]","ALL-I AVC_DCI 4K S35[8bit 4:2:0][50p/59.94p]","ALL-I AVC_UHD S35[8bit 4:2:0][50p/59.94p]" :
        return 940
    case "XF-HEVC S Intra LT FF_8K[10bit 4:2:2][23.976p/24p]" :
        return 960
    case "ALL-I HEVC_DCI 4K FF[10bit 4:2:2][50p/59.94p]","ALL-I HEVC_UHD FF[10bit 4:2:2][50p/59.94p]","ALL-I HEVC_DCI 4K S35[10bit 4:2:2][50p/59.94p][From 5.1K]","ALL-I HEVC_UHD S35[10bit 4:2:2][50p/59.94p][From 4.8K]","ALL-I HEVC_DCI 4K FF[10bit 4:2:2][50p/59.94p][From 6K]","ALL-I HEVC_UHD FF[10bit 4:2:2][50p/59.94p][From 5.6K]","ALL-I HEVC_DCI 4K S35[10bit 4:2:2][50p/59.94p]","ALL-I HEVC_UHD S35[10bit 4:2:2][50p/59.94p]","XF-HEVC S Intra LT FF_8K[10bit 4:2:2][25p]","XF-AVC S Intra HQ FF_4K[10bit 4:2:2][50p]","XF-AVC S Intra HQ S35_4K[10bit 4:2:2][50p]","XF-AVC S Intra LT FF_4K[10bit 4:2:2][100p]","XF-AVC S Intra ST FF_2K[10bit 4:2:2][200p]" :
        return 1000
    case "XF-HEVC S Intra LT FF_8K[10bit 4:2:2][29.97p]","XF-AVC S Intra HQ FF_4K[10bit 4:2:2][59.94p]","XF-AVC S Intra HQ S35_4K[10bit 4:2:2][59.94p]","XF-AVC S Intra LT FF_4K[10bit 4:2:2][119.88p]","XF-AVC S Intra ST FF_2K[10bit 4:2:2][239.76p]" :
        return 1200
    case "ALL-I HEVC_DCI 8K FF[10bit 4:2:2][23.976p/24p/25p/29.97p]","ALL-I HEVC_8K FF[10bit 4:2:2][23.976p/25p/29.97p]","ALL-I HEVC_DCI 8K FF[8bit 4:2:0][23.976p/24p/25p/29.97p]","ALL-I HEVC_8K FF[8bit 4:2:0][23.976p/25p/29.97p]" :
        return 1300
    case "RAW Light_DCI 8K FF[12bit RAW Light][23.976p/24p]" :
        return 1350
    case "RAW Light_DCI 8K FF[12bit RAW Light][25p]" :
        return 1400
    case "XF-HEVC S Intra ST FF_8K[10bit 4:2:2][23.976p/24p]" :
        return 1440
    case "XF-HEVC S Intra ST FF_8K[10bit 4:2:2][25p]","XF-AVC S Intra ST FF_4K[10bit 4:2:2][100p]" :
        return 1500
    case "RAW_DCI 4K FF[12bit SRAW][50p]" :
        return 1550
    case "RAW_DCI 6K FF[12bit RAW][23.976p/24p]" :
        return 1600
    case "RAW Light_DCI 8K FF[12bit RAW Light][29.97p]" :
        return 1670
    case "RAW Light_DCI 8K FF[12bit RAW Light][25/29.97p]" :
        return 1700
    case "RAW Light_DCI 6K FF[12bit RAW][50p/59.94p]","XF-HEVC S Intra ST FF_8K[10bit 4:2:2][29.97p]","XF-AVC S Intra ST FF_4K[10bit 4:2:2][119.88p]" :
        return 1800
    case "RAW_DCI 4K FF[12bit SRAW][59.94p]" :
        return 1860
    case "ALL-I HEVC_DCI 4K FF[10bit 4:2:2][100p/119.88p]","ALL-I HEVC_UHD FF[10bit 4:2:2][100p/119.88p]","ALL-I AVC_DCI 4K FF[8bit 4:2:0][100p/119.88p]","ALL-I AVC_UHD FF[8bit 4:2:0][100p/119.88p]","ALL-I HEVC_DCI 4K S35[10bit 4:2:2][100p/119.88p]","ALL-I HEVC_UHD S35[10bit 4:2:2][100p/119.88p]","ALL-I AVC_DCI 4K S35[8bit 4:2:0][100p/119.88p]","ALL-I AVC_UHD S35[8bit 4:2:0][100p/119.88p]" :
        return 1880
    case "XF-HEVC S Intra HQ FF_8K[10bit 4:2:2][23.976p/24p]" :
        return 1920
    case "RAW_DCI 6K FF[12bit RAW][25p/29.97p]" :
        return 2000
    case "RAW_DCI 8K FF[12bit RAW][23.976p/24p/25p/29.97p]","RAW_DCI 6K FF[12bit RAW][50p/59.94p]","RAW Light_DCI 8K FF[12bit RAW Light][50p/59.94p]" :
        return 2600
    default :
        return 0
    }
}
