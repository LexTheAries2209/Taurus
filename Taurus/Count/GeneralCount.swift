//
//  GeneralCount.swift
//  Taurus
//
//  Created by 吴坤城 on 6/30/24.
//

import Foundation

func GeneralCodecSpeed(cameradata:CameraData) -> Double {
    switch cameradata.Codec {
    case "ARRIRAW[13bit]" :
        return 645
    case "ARRIRAW[12bit]" :
        return 600
    case "Prores 4444 XQ" :
        return 400
    case "CinemaDNG" :
        return 380
    case "Prores 4444" :
        return 264
    case "X-OCN XT" :
        return 226.15
    case "REDCODE HQ" :
        return 199.2
    case "Prores RAW HQ" :
        return 190
    case "Prores 422 HQ" :
        return 176
    case "X-OCN ST" :
        return 154.675
    case "Prores RAW" :
        return 150
    case "REDCODE MQ" :
        return 140
    case "Prores 422" :
        return 117.6
    case "REDCODE LQ" :
        return 87.5
    case "X-OCN LT" :
        return 91.165
    case "Prores 422 LT" :
        return 81.2
    case "REDCODE ELQ" :
        return 54.2
    case "Prores 422 Proxy" :
        return 36
    default :
        return 0
    }
}

//分辨率乘积
func GeneralResolutionMultiplier(cameradata:CameraData) -> Double {
    if cameradata.CameraName == "Select Mode" {
        switch cameradata.Resolution {
        case "HD" :
            return 0.445
        case "2K S16[2048*864][2.4:1]","2K S8[2048*864][2.4:1]" :
            return 0.85
        case "FHD S35[From 2880*1620]","FHD S16[From 1600*900]","FHD S35[From 4096*2304]","FHD S35[From 1920*2160][8:9 ANA]","FHD LF[From 4320*2430]","FHD LF[From UHD]","FHD S16","FHD S8","FHD","2K[1920*1080][16:9]" :
            return 1
        case "2K S16[2048*1024][2:1]","2K S8[2048*1024][2:1]","4K S35[4096*512][8:1]" :
            return 1.01
        case "2K S16[2048*1080][17:9]","2K S8[2048*1080][17:9]","2K FF[2048*1080][17:9]" ,"2K S35[2048*1080][17:9]","2K[2048*1080][17:9]" :
            return 1.07
        case "2K S35[2048*1152][From 2868*1614]","2K S35[2048*1152][From 2868*1612]","2K S35[2048*1152][From 4096*2304]","2K LF[2048*1152][From UHD]","2K S16[2048*1152]","2K S35[2048*1152][From 2880*1620]","2K[2048*1152][16:9]":
            return 1.14
        case "2K S35[2048*858][From 2560*2146][6:5 ANA]","2K S35[2048*858][From 2560*2145][6:5 ANA]" :
            return 0.85
        case "2K S35[2048*1536][From 2868*2152][4:3]" :
            return 1.5
        case "3K S35[3072*1296][2.4:1]","3K S16[3072*1296][2.4:1]" :
            return 1.92
        case "2.8K S35[2880*1620]","3K S35[2880*1620]","3K S16[2880*1620]" :
            return 2.25
        case "3K S35[3072*1536][2:1]","3K S16[3072*1536][2:1]" :
            return 2.4
        case "3K S35[3072*1620][17:9]","3K S16[3072*1620][17:9]" :
            return 2.4
        case "2.6K S35[2578*2160][6:5]" :
            return 2.69
        case "3.2K S35[3168*1782]" :
            return 2.72
        case "3.2K S35[3200*1800]","3.2K[3200*1800][16:9]" :
            return 2.77
        case "2.8K S35[2880*2160][4:3]","2.8K[2880*2160][4:3]" :
            return 3
        case "4K S35[4096*1704][2.4:1]" :
            return 3.366
        case "4K S35[4096*1716][From 2560*2146][6:5 ANA]","4K S35[4096*1716][From 3328*2790][6:5 ANA]","4K FF[4096*1712][2.39:1]","4K S35[4096*1712][2.39:1]","4K S35[4096*1716][2.39:1]","4K[4096*1716][2.4:1]" :
            return 3.39
        case "4K S35[4096*1728][2.4:1]","4K S16[4096*1728][2.4:1]" :
            return 3.41
        case "3.8K S35[3840*1920][From 3072*3072][1:1 ANA]" :
            return 3.56
        case "3.4K S35[3424*2202][OG]","3.4K S35[3424*2202][1.55:1]","2.8K S35[2880*2160][Cilp 3424*2202][4:3]","3.4K[3424*2202][1.55:1]" :
            return 3.64
        case "2.8K LF[2880*2880][1:1]","UHD LF","UHD S35","UHD S35[From 3200*1800]","UHD S35[From 4096*2304]","UHD S35[From 2743*3086][8:9 ANA]","UHD LF[From 4320*2430]","4.5K LF[4448*1856][2.39:1]","UHD S16","4K FF[3840*2160][16:9]","4K S35[3840*2160][16:9]","3.8K S35[3840*2160][16:9]","UHD","4K[3840*2160][16:9]" :
            return 4
        case "4K S35[4096*2048][2:1]","4K S16[4096*2048][2:1]" :
            return 4.05
        case "4K S35[4096*2160][17:9]","4K S16[4096*2160][17:9]","4K FF[4096*2160][17:9]","4K FFcrop[4096*2160][17:9]","4K S35crop[4096*2160][17:9]","4K[4096*2160][17:9]" :
            return 4.27
        case "3.3K S35[3328*2790][6:5]" :
            return 4.48
        case "4K S35[4096*2304]","3K S35[3072*3072][1:1]","4K S35[4096*2304][From 4608*2592]","4K[4096*2304][16:9]" :
            return 4.55
        case "4K S35[4096*2636][From 3414*2198][2.39:1]" :
            return 5.2
        case "5K VV[5120*2160][2.4:1]","5K S35[5120*2160][2.4:1]","5K[5120*2160][2.4:1]" :
            return 5.33
        case "4.6K S35[4608*2592]" :
            return 5.76
        case "4K S35[4096*3024][4:3 ANA]" :
            return 5.97
        case "4.3K LF[4320*2880][3:2]","4.3K[4320*2880][3:2]" :
            return 6
        case "5.5K S35[5480*2296][2.39:1]" :
            return 6.06
        case "5K VV[4800*2700]","5K S35[4800*2700]","5K[4800*2700][16:9]" :
            return 6.25
        case "5K VV[5120*2560][2:1]","5K S35[5120*2560][2:1]" :
            return 6.32
        case "4.5K LF[4448*3096][1.43:1]","4.5K LF[4448*3096][OG]","4.5K[4448*3096][1.43:1]" :
            return 6.64
        case "5K VV[5120*2700][17:9]","5K S35[5120*2700][17:9]","5K[5120*2700][17:9]" :
            return 6.67
        case "4K S35[4096*3432][6:5 ANA]" :
            return 6.78
        case "4.6K S35[4608*3164][OG]","4.6K[4608*3164][1.45:1]" :
            return 7
        case "5.1K 65mm[5120*2880]","5.1K[5120*2880][16:9]" :
            return 7.11
        case "6K FF[6008*2512][2.39:1]" :
            return 7.28
        case "6K FF[6054*2534][2.39:1]" :
            return 7.398
        case "5.5K S35[5248*2952][16:9]","6K[6144*2560][2.4:1]" :
            return 7.47
        case "6K VV[6144*2574][2.4:1]","6K S35[6144*2574][2.4:1]" :
            return 7.63
        case "6K VV[6144*2592][2.4:1]","6K S35[6144*2592][2.4:1]" :
            return 7.68
        case "5.5K S35[5568*2952][17:9]" :
            return 7.92
        case "5.4K S35[5434*3056][16:9]" :
            return 8
        case "5.8K S35[5760*3036][16:9]" :
            return 8.433
        case "5.8K S35[5792*3056][17:9]" :
            return 8.536
        case "5.7K FF[5674*3192][17:9]" :
            return 8.734
        case "6K VV[5760*3240]","6K S35[5760*3240]","6K FFcrop[5952*3136][17:9]","5.8K S35[5760*3240][17:9]","6K[5760*3240][16:9]" :
            return 9
        case "6K VV[6144*3072][2:1]","6K S35[6144*3072][2:1]" :
            return 9.1
        case "6K FF[6008*3168][17:9]" :
            return 9.18
        case "6K FFcrop[6052*3192][16:9]" :
            return 9.316
        case "6K FF[6054*3192][17:9]" :
            return 9.319
        case "6K FF[6054*3272][1.85:1]" :
            return 9.553
        case "6K VV[6144*3240][17:9]","6K S35[6144*3240][17:9]","6K S16[6144*3240][17:9]","6K[6144*3240][17:9]" :
            return 9.6
        case "6.5K 65mm[6560*3100][OG]","6.5K[6560*3100][2.11:1]" :
            return 9.8
        case "6K FFcrop[6052*3404][17:9]" :
            return 9.935
        case "7K VV[7168*3002][2.4:1]","7K S35[7168*3002][2.4:1]" :
            return 10.37
        case "6K FF[6048*4032][3:2]" :
            return 11.76
        case "5.8K S35[5792*4276][4:3 ANA]" :
            return 11.94
        case "7K VV[6720*3780]","7K S35[6720*3780]" :
            return 12.25
        case "7K VV[7168*3584][2:1]","7K S35[7168*3584][2:1]" :
            return 12.39
        case "7K VV[7168*3780][17:9]","7K S35[7168*3780][17:9]" :
            return 13.06
        case "8K S35[8192*3408][2.4:1]" :
            return 13.46
        case "8K FF[8192*3424][2.39:1]","8.2K FF[8192*3432][2.39:1]","8K[8192*3432][2.4:1]" :
            return 13.52
        case "8K VV[8192*3456][2.4:1]","8K S35[8192*3456][2.4:1]" :
            return 13.65
        case "8K VV[7680*4320]","8K S35[7680*4320]","8K FF[7680*4320][16:9]","7.6K FF[7680*4320][16:9]","8K S35[7680*4320][16:9]","8K[7680*4320][16:9]" :
            return 16
        case "8K VV[8192*4096][2:1]","8K S35[8192*4096][2:1]" :
            return 16.18
        case "5.8K S35[5792*5854][6:5 ANA]" :
            return 16.35
        case "8K FF[8192*4320][17:9]","8K[8192*4320][17:9]" :
            return 17.06
        case "8.1K FF[8100*4556][16:9]" :
            return 17.8
        case "8.6K FF[8632*4552][16:9]" :
            return 18.95
        case "8.6K FF[8640*4556][17:9]":
            return 18.98
        case "8.6K FF[8632*4856][17:9]" :
            return 20.21
        case "8.6K FF[8640*5760][3:2]" :
            return 24
        case "12K[12288*5112][2.4:1]" :
            return 30.3
        case "12K[11520*6480][16:9]" :
            return 36
        case "12K[12288*6480][17:9]" :
            return 38.04
        default:
            return 0
        }
    }
    else {
        return (Double(cameradata.ResolutionHeight) ?? 1) * (Double(cameradata.ResolutionWidth) ?? 1) / 1920 / 1080
    }
}

func GeneralSpeed(cameradata:CameraData) -> Double {
    if cameradata.CameraName == "Manual Codec" {
        return (Double(cameradata.ManualCodecSpeed) ?? 1)
    }
    else {
        return GeneralCodecSpeed(cameradata:cameradata) * GeneralResolutionMultiplier(cameradata:cameradata) * (RateSpeed(cameradata:cameradata)/24)
    }
}
