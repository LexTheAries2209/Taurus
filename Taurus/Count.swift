//
//  Count.swift
//  Taurus
//
//  Created by 吴坤城 on 11/27/23.
//

import Foundation
import Combine

//编码码率 1080p24
func Codecspeed(cameradata:CameraData) -> Double {
    switch cameradata.Codec {
    case "ARRIRAW" :
        return 600
    case "Prores 4444 XQ" :
        return 400
    case "Prores 4444" :
        return 264
    case "REDCODE HQ" :
        return 199.2
    case "Prores 422 HQ" :
        return 176
    case "REDCODE MQ" :
        return 140
    case "Prores 422" :
        return 117.6
    case "REDCODE LQ" :
        return 87.5
    case "Prores 422 LT" :
        return 81.2
    case "MPEG-2 HD 422" :
        return 66
    case "REDCODE ELQ" :
        return 54.2
    default :
        return 0.000000001
    }
}


//分辨率乘积
func ResolutionMultiplier(cameradata:CameraData) -> Double {
    switch cameradata.Resolution {
    case "2K S16[2048*864][2.4:1]","2K S8[2048*864][2.4:1]" :
        return 0.85
    case "FHD S35[From 2880*1620]","FHD S16[From 1600*900]","FHD S35[From 4096*2304]","FHD S35[From 1920*2160][8:9 ANA]","FHD LF[From 4320*2430]","FHD LF[From UHD]","FHD S16","FHD S8" :
        return 1
    case "2K S16[2048*1024][2:1]","2K S8[2048*1024][2:1]","4K S35[4096*512][8:1]" :
        return 1.01
    case "2K S16[2048*1080][17:9]","2K S8[2048*1080][17:9]" :
        return 1.07
    case "2K S35[2048*1152][From 2868*1614]","2K S35[2048*1152][From 2868*1612]","2K S35[2048*1152][From 4096*2304]","2K LF[2048*1152][From UHD]","2K S16[2048*1152]","2K S35[2048*1152][From 2880*1620]":
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
    case "3.2K S35[3200*1800]" :
        return 2.77
    case "2.8K S35[2880*2160][4:3]":
        return 3
    case "4K S35[4096*1716][From 2560*2146][6:5 ANA]","4K S35[4096*1716][From 3328*2790][6:5 ANA]" :
        return 3.39
    case "4K S35[4096*1728][2.4:1]","4K S16[4096*1728][2.4:1]" :
        return 3.41
    case "3.8K S35[3840*1920][From 3072*3072][1:1 ANA]" :
        return 3.56
    case "3.4K S35[3424*2202][OG]","3.4K S35[3424*2202][3:2]" :
        return 3.64
    case "2.8K LF[2880*2880][1:1]","UHD LF","UHD S35","UHD S35[From 3200*1800]","UHD S35[From 4096*2304]","UHD S35[From 2743*3086][8:9 ANA]","UHD LF[From 4320*2430]","4.5K LF[4448*1856][2.39:1]","UHD S16" :
        return 4
    case "4K S35[4096*2048][2:1]","4K S16[4096*2048][2:1]" :
        return 4.05
    case "4K S35[4096*2160][17:9]","4K S16[4096*2160][17:9]" :
        return 4.27
    case "3.3K S35[3328*2790][6:5]" :
        return 4.48
    case "4K S35[4096*2304]","3K S35[3072*3072][1:1]","4K S35[4096*2304][From 4608*2592]":
        return 4.55
    case "4K S35[4096*2636][From 3414*2198][2.39:1]" :
        return 5.2
    case "5K VV[5120*2160][2.4:1]","5K S35[5120*2160][2.4:1]" :
        return 5.33
    case "4.6K S35[4608*2592]" :
        return 5.76
    case "4.3K LF[4320*2880][3:2]" :
        return 6
    case "5K VV[4800*2700]","5K S35[4800*2700]" :
        return 6.25
    case "5K VV[5120*2560][2:1]","5K S35[5120*2560][2:1]" :
        return 6.32
    case "4.5K LF[4448*3096][3:2]","4.5K LF[4448*3096][OG]":
        return 6.64
    case "5K VV[5120*2700][17:9]","5K S35[5120*2700][17:9]" :
        return 6.67
    case "4.6K S35[4608*3164][OG]" :
        return 7
    case "5.1K 65mm[5120*2880]" :
        return 7.11
    case "6K VV[6144*2574][2.4:1]","6K S35[6144*2574][2.4:1]" :
        return 7.63
    case "6K VV[6144*2592][2.4:1]","6K S35[6144*2592][2.4:1]" :
        return 7.68
    case "6K VV[5760*3240]","6K S35[5760*3240]" :
        return 9
    case "6K VV[6144*3072][2:1]","6K S35[6144*3072][2:1]" :
        return 9.1
    case "6K VV[6144*3240][17:9]","6K S35[6144*3240][17:9]" :
        return 9.6
    case "6.5K 65mm[6560*3100][OG]" :
        return 9.8
    case "7K VV[7168*3002][2.4:1]","7K S35[7168*3002][2.4:1]" :
        return 10.37
    case "7K VV[6720*3780]","7K S35[6720*3780]" :
        return 12.25
    case "7K VV[7168*3584][2:1]","7K S35[7168*3584][2:1]" :
        return 12.39
    case "7K VV[7168*3780][17:9]","7K S35[7168*3780][17:9]" :
        return 13.06
    case "8K VV[8192*3456][2.4:1]","8K S35[8192*3456][2.4:1]" :
        return 13.65
    case "8K VV[7680*4320]","8K S35[7680*4320]" :
        return 16
    case "8K VV[8192*4096][2:1]","8K S35[8192*4096][2:1]" :
        return 16.18
    case "8K VV[8192*4320][17:9]","8K S35[8192*4320][17:9]" :
        return 17.06
    default:
        return 0.000000001
    }
}

//旧机型Prores编码码率乘积
func ProresCompensation(cameradata:CameraData) -> Double {
    switch cameradata.CameraName {
    case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF" :
        return 1.125
    case "ALEXA 35","ALEXA Mini LF":
        return 1
    default :
        return 1
    }
}



//ALEXA 35 ARRIRAW编码乘积
func ARRIRAWCompensation(cameradata:CameraData) -> Double {
    switch cameradata.CameraName {
    case "ALEXA 35" :
        return 1.075
    default :
        return 1
    }
}


//存储卡容量乘积
func MediaCapacity(cameradata:CameraData) -> Double {
    switch cameradata.Media {
    case "CFExpress TypeA 80GB" :
        return 80
    case "SxS Pro-X 120GB" :
        return 120
    case "CFast2.0 128GB","SxS Pro+ 128GB","CFExpress TypeB 128GB","SD V90 128GB","SD V60 128GB","SD V30 128GB" :
        return 128
    case "CFExpress TypeA 160GB" :
        return 160
    case "SxS Pro-X 240GB" :
        return 240
    case "CFast2.0 256GB","SxS Pro+ 256GB","AXS S24 256GB","CFExpress TypeB 256GB","SD V90 256GB","SD V60 256GB","SD V30 256GB" :
        return 256
    case "CFExpress TypeA 320GB" :
        return 320
    case "CFExpress TypeB 330GB" :
        return 330
    case "CFast2.0 512GB","XR Capture Drive 512GB","AXS S24 512GB","AXS S48 512GB","CFExpress TypeB 512GB","SD V90 512GB","[Output]SSD 512GB","SD V60 512GB","SD V30 512GB" :
        return 512
    case "CFExpress TypeA 640GB" :
        return 640
    case "CFExpress TypeB 660GB" :
        return 660
    case "CFExpress TypeA 960GB" :
        return 960
    case "SXR Capture Drive 1TB","Compact Drive 1TB","AXS S24 1TB","AXS S48 1TB","AXS S66 1TB","CFExpress TypeB 1TB","SD V90 1TB","[Output]SSD 1TB" :
        return 1000
    case "CFExpress TypeB 1.3TB" :
        return 1333
    case "CFExpress TypeA 1920GB" :
        return 1920
    case "SXR Capture Drive 2TB","Compact Drive 2TB","CFExpress TypeB 2TB","SD V90 2TB","[Output]SSD 2TB" :
        return 2000
    default :
        return 0
    }
}

//加入补偿的编码速度
func CodecSpeedCount(cameradata:CameraData) -> Double {
    switch cameradata.Codec {
    case "Prores 4444 XQ","Prores 4444","Prores 422 HQ","Prores 422","Prores 422LT" :
        return Codecspeed(cameradata:cameradata)*ProresCompensation(cameradata:cameradata)
    case "ARRIRAW" :
        return Codecspeed(cameradata:cameradata)*ARRIRAWCompensation(cameradata:cameradata)
    default :
        return Codecspeed(cameradata:cameradata)
    }
}

//帧率乘积
func RateSpeed(cameradata:CameraData) -> Double {
    switch cameradata.Rate {
    case "0.750" :
        return 0.75
    case "1.000" :
        return 1
    case "2.000" :
        return 2
    case "6.000" :
        return 6
    case "12.000" :
        return 12
    case "15.000" :
        return 15
    case "23.976","24.000" :
        return 24
    case "25.000" :
        return 25
    case "29.970","30.000" :
        return 30
    case "40.000" :
        return 40
    case "42.000" :
        return 42
    case "48.000":
        return 48
    case "50.000" :
        return 50
    case "59.940","60.000" :
        return 60
    case "72.000" :
        return 72
    case "75.000" :
        return 75
    case "80.000" :
        return 80
    case "84.000" :
        return 84
    case "90.000" :
        return 90
    case "96.000" :
        return 96
    case "100.000" :
        return 100
    case "120.000" :
        return 120
    case "126.000" :
        return 126
    case "137.000" :
        return 137
    case "140.000" :
        return 140
    case "144.000" :
        return 144
    case "150.000" :
        return 150
    case "160.000" :
        return 160
    case "168.000" :
        return 168
    case "192.000" :
        return 192
    case "200.000" :
        return 200
    case "202.000" :
        return 202
    case "240.000" :
        return 240
    case "250.000" :
        return 250
    case "253.000" :
        return 253
    case "300.000" :
        return 300
    case "320.000" :
        return 320
    case "337.000" :
        return 337
    case "400.000" :
        return 400
    case "480.000" :
        return 480
    case "505.000" :
        return 505
    case "600.000" :
        return 600
    case "1000.000" :
        return 1000
    case "ERROR" :
        return 24
    default :
        return 0
    }
}

//计算帧率乘积
func RateMultiplier(cameradata:CameraData) ->Double {
    return RateSpeed(cameradata:cameradata)/24
}

