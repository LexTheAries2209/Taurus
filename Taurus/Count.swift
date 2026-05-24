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
    case "ProRes 4444 XQ" :
        return 400
    case "CinemaDNG" :
        return 380
    case "ARRICORE","ARRICORE[Overdrive]" :
        return 300
    case "ProRes 4444" :
        return 264
    case "X-OCN XT" :
        return 226.15
    case "REDCODE HQ" :
        return 199.2
    case "ProRes RAW HQ" :
        return 190
    case "ProRes 422 HQ" :
        return 176
    case "X-OCN ST" :
        return 154.675
    case "ProRes RAW" :
        return 150
    case "REDCODE MQ" :
        return 140
    case "ProRes 422" :
        return 117.6
    case "REDCODE LQ" :
        return 87.5
    case "X-OCN LT" :
        return 91.165
    case "ProRes 422 LT" :
        return 81.2
    case "MPEG-2 HD 422" :
        return 66
    case "REDCODE ELQ" :
        return 54.2
    case "ProRes 422 Proxy" :
        return 36
    case "H.264(10bit 4:2:0)" :
        return 33
    default :
        return 0
    }
}

//分辨率乘积
func ResolutionMultiplier(cameradata:CameraData) -> Double {
    switch cameradata.Resolution {
    case "HD" :
        return 0.445
    case "720p[1280*720]" :
        return 0.445
    case "1080p[1920*1080]" :
        return 1
    case "Open Gate[4032*3024]" :
        return 5.878
    case "4K[3840*2160]" :
        return 4
    case "4.2K[4224*2240][17:9]" :
        return 4.562
    case "Open Gate[4224*3024]" :
        return 6.159
    case "2K S16[2048*864][2.4:1]","2K S8[2048*864][2.4:1]" :
        return 0.85
    case "FHD S35[From 2880*1620]","FHD S16[From 1600*900]","FHD S35[From 4096*2304]","FHD S35[From 1920*2160][8:9 ANA]","FHD LF[From 4320*2430]","FHD LF[From UHD]","FHD S16","FHD S8","FHD","2K FF[1920*1080][16:9]","2K S35[1920*1080][16:9]" :
        return 1
    case "2K S16[2048*1024][2:1]","2K S8[2048*1024][2:1]","4K S35[4096*512][8:1]" :
        return 1.01
    case "2K S16[2048*1080][17:9]","2K S8[2048*1080][17:9]","2K FF[2048*1080][17:9]" ,"2K S35[2048*1080][17:9]" :
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
    case "4K S35[4096*1704][2.4:1]" :
        return 3.366
    case "4K S35[4096*1716][From 2560*2146][6:5 ANA]","4K S35[4096*1716][From 3328*2790][6:5 ANA]","4K FF[4096*1712][2.39:1]","4K S35[4096*1712][2.39:1]","4K S35[4096*1716][2.39:1]" :
        return 3.39
    case "4K S35[4096*1728][2.4:1]","4K S16[4096*1728][2.4:1]" :
        return 3.41
    case "3.8K S35[3840*1920][From 3072*3072][1:1 ANA]" :
        return 3.56
    case "3.4K S35[3424*2202][OG]","3.4K S35[3424*2202][1.55:1]","2.8K S35[2880*2160][Clip 3424*2202][4:3]" :
        return 3.64
    case "2.8K LF[2880*2880][1:1]","UHD LF","UHD S35","UHD S35[From 3200*1800]","UHD S35[From 4096*2304]","UHD S35[From 2743*3086][8:9 ANA]","UHD LF[From 4320*2430]","4.5K LF[4448*1856][2.39:1]","UHD S16","4K FF[3840*2160][16:9]","4K S35[3840*2160][16:9]","3.8K S35[3840*2160][16:9]","UHD","4K FFcrop[3840*2160][16:9]" :
        return 4
    case "4K S35[4096*2048][2:1]","4K S16[4096*2048][2:1]" :
        return 4.05
    case "4K S35[4096*2160][17:9]","4K S16[4096*2160][17:9]","4K FF[4096*2160][17:9]","4K FFcrop[4096*2160][17:9]","4K S35crop[4096*2160][17:9]" :
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
    case "4K S35[4096*3024][4:3 ANA]" :
        return 5.97
    case "4.3K LF[4320*2880][3:2]" :
        return 6
    case "5.5K S35[5480*2296][2.39:1]" :
        return 6.06
    case "5K VV[4800*2700]","5K S35[4800*2700]" :
        return 6.25
    case "5K VV[5120*2560][2:1]","5K S35[5120*2560][2:1]" :
        return 6.32
    case "4.3K S35[4256*3192][4:3]" :
        return 6.55
    case "4.5K LF[4448*3096][1.43:1]","4.5K LF[4448*3096][OG]":
        return 6.64
    case "5K VV[5120*2700][17:9]","5K S35[5120*2700][17:9]" :
        return 6.67
    case "4K S35[4096*3432][6:5 ANA]" :
        return 6.78
    case "4.6K S35[4608*3164][OG]" :
        return 7
    case "5.1K 65mm[5120*2880]" :
        return 7.11
    case "6K FF[6008*2512][2.39:1]" :
        return 7.28
    case "6K FF[6054*2534][2.39:1]" :
        return 7.398
    case "5.5K S35[5248*2952][16:9]" :
        return 7.47
    case "6K VV[6144*2574][2.4:1]","6K S35[6144*2574][2.4:1]" :
        return 7.63
    case "6K VV[6144*2592][2.4:1]","6K S35[6144*2592][2.4:1]" :
        return 7.68
    case "5.5K S35[5568*2952][17:9]" :
        return 7.92
    case "5.4K S35[5434*3056][16:9]" :
        return 8
    case "6K FFcrop[5568*3136][16:9]" :
        return 8.41
    case "5.8K S35[5760*3036][16:9]" :
        return 8.433
    case "5.8K S35[5792*3056][17:9]" :
        return 8.536
    case "6K FF[5632*3168][16:9]" :
        return 8.6
    case "5.7K FF[5674*3192][17:9]" :
        return 8.734
    case "6K VV[5760*3240]","6K S35[5760*3240]","6K FFcrop[5952*3136][17:9]","5.8K S35[5760*3240][17:9]" :
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
    case "6K VV[6144*3240][17:9]","6K S35[6144*3240][17:9]","6K S16[6144*3240][17:9]" :
        return 9.6
    case "6.5K 65mm[6560*3100][OG]" :
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
    case "8K FF[8192*3424][2.39:1]","8.2K FF[8192*3432][2.39:1]" :
        return 13.52
    case "8K VV[8192*3456][2.4:1]","8K S35[8192*3456][2.4:1]" :
        return 13.65
    case "8K VV[7680*4320]","8K S35[7680*4320]","8K FF[7680*4320][16:9]","7.6K FF[7680*4320][16:9]","8K S35[7680*4320][16:9]" :
        return 16
    case "8K VV[8192*4096][2:1]","8K S35[8192*4096][2:1]" :
        return 16.18
    case "5.8K S35[5792*5854][6:5 ANA]" :
        return 16.35
    case "8K VV[8192*4320][17:9]","8K S35[8192*4320][17:9]","8K FF[8192*4320][17:9]","8.2K FF[8192*4320][17:9]" :
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
    default:
        return 0
    }
}

//存储卡容量乘积
func MediaCapacity(cameradata:CameraData) -> Double {
    switch cameradata.Media {
    case "SxS Pro 32GB","32GB" :
        return 29.792
    case "64GB","SxS Pro 64GB","SxS Pro+ 64GB" :
        return 59.584
    case "CFExpress TypeA 80GB","80GB" :
        return 74.48
    case "SxS Pro-X 120GB","XQD 120GB","120GB":
        return 111.6
    case "CFast2.0 128GB","SxS Pro+ 128GB","CFExpress TypeB 128GB","SD V90 128GB","SD V60 128GB","SD V30 128GB","Built-in 128GB","XQD 128GB","128GB" :
        return 119.168
    case "CFExpress TypeA 160GB","160GB" :
        return 148.96
    case "SxS Pro-X 240GB","XQD 240GB","240GB" :
        return 223.44
    case "CFast2.0 256GB","SxS Pro+ 256GB","AXS S24 256GB","CFExpress TypeB 256GB","SD V90 256GB","SD V60 256GB","SD V30 256GB","Built-in 256GB","Dual CFast2.0 128GB","XQD 256GB","256GB" :
        return 238.336
    case "CFExpress TypeA 320GB","320GB" :
        return 297.92
    case "CFExpress TypeB 330GB","330GB" :
        return 307.23
    case "CFast2.0 512GB","XR Capture Drive 512GB","AXS S24 512GB","AXS S48 512GB","CFExpress TypeB 512GB","SD V90 512GB","[Output]SSD 512GB","SD V60 512GB","SD V30 512GB","Built-in 512GB","Dual CFast2.0 256GB","512GB" :
        return 476.672
    case "CFExpress TypeA 640GB","640GB" :
        return 585.840
    case "CFExpress TypeB 660GB","660GB" :
        return 614.46
    case "CFExpress TypeA 960GB","960GB" :
        return 893.76
    case "SXR Capture Drive 1TB","Compact Drive 1TB","AXS S24 1TB","AXS S48 1TB","AXS S66 1TB","CFExpress TypeB 1TB","SD V90 1TB","[Output]SSD 1TB","DJI PROSSD 1TB","Built-in 1TB","CFast2.0 1TB","Dual CFast2.0 512GB","1TB","Compact Drive Express 1TB","KineMAG Nano SSD 1TB" :
        return 931
    case "CFExpress TypeB 1.3TB","1.3TB" :
        return 1241.023
    case "CFExpress TypeA 1920GB","1.92TB" :
        return 1787.52
    case "SXR Capture Drive 2TB","Compact Drive 2TB","CFExpress TypeB 2TB","SD V90 2TB","[Output]SSD 2TB","Dual CFast2.0 1TB","2TB","KineMAG Nano SSD 2TB","Built-in 2TB" :
        return 1862
    case "[Output]SSD 4TB","4TB" :
        return 3724
    case "8TB","Blackmagic Media Module 8TB" :
        return 7448
    case "16TB","Blackmagic Media Module 16TB" :
        return 14896
    default :
        return 0
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
    case "16.000" :
        return 16
    case "20.000" :
        return 20
    case "23.976","24.000" :
        return 24
    case "25.000" :
        return 25
    case "29.970","30.000" :
        return 30
    case "35.000" :
        return 35
    case "40.000" :
        return 40
    case "42.000" :
        return 42
    case "45.000" :
        return 45
    case "48.000","47.950","47.952":
        return 48
    case "50.000" :
        return 50
    case "55.000" :
        return 55
    case "59.940","60.000" :
        return 60
    case "63.000" :
        return 63
    case "65.000" :
        return 65
    case "66.000" :
        return 66
    case "70.000" :
        return 70
    case "72.000" :
        return 72
    case "75.000" :
        return 75
    case "80.000" :
        return 80
    case "84.000" :
        return 84
    case "85.000" :
        return 85
    case "87.000" :
        return 87
    case "88.000" :
        return 88
    case "90.000" :
        return 90
    case "96.000" :
        return 96
    case "100.000" :
        return 100
    case "105.000" :
        return 105
    case "110.000" :
        return 110
    case "119.880","120.000" :
        return 120
    case "126.000" :
        return 126
    case "130.000" :
        return 130
    case "135.000" :
        return 135
    case "137.000" :
        return 137
    case "140.000" :
        return 140
    case "144.000" :
        return 144
    case "145.000" :
        return 145
    case "150.000" :
        return 150
    case "160.000" :
        return 160
    case "165.000" :
        return 165
    case "168.000" :
        return 168
    case "170.000" :
        return 170
    case "175.000" :
        return 175
    case "180.000" :
        return 180
    case "190.000" :
        return 190
    case "192.000" :
        return 192
    case "200.000" :
        return 200
    case "202.000" :
        return 202
    case "210.000" :
        return 210
    case "224.000" :
        return 224
    case "240.000","239.760" :
        return 240
    case "250.000" :
        return 250
    case "253.000" :
        return 253
    case "260.000" :
        return 260
    case "300.000" :
        return 300
    case "320.000" :
        return 320
    case "330.000" :
        return 330
    case "337.000" :
        return 337
    case "400.000" :
        return 400
    case "480.000","479.520" :
        return 480
    case "500.000" :
        return 500
    case "505.000" :
        return 505
    case "590.000" :
        return 590
    case "600.000" :
        return 600
    case "660.000" :
        return 660
    case "800.000" :
        return 800
    case "1000.000" :
        return 1000
    case "1200.000" :
        return 1200
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

//加入补偿的编码速度
func CodecSpeedCount(cameradata:CameraData) -> Double {
    if cameradata.BrandName == "Apple" {
        let multiplier = ResolutionMultiplier(cameradata: cameradata) * RateMultiplier(cameradata: cameradata)
        if multiplier == 0 {
            return 0
        }
        return AppleCodecSpeed(cameradata: cameradata) / multiplier
    }
    
    if cameradata.BrandName == "DJI" {
        let multiplier = ResolutionMultiplier(cameradata: cameradata) * RateMultiplier(cameradata: cameradata)
        if multiplier == 0 {
            return 0
        }
        return DjiCodecSpeed(cameradata: cameradata) / multiplier
    }
    
    switch cameradata.Codec {
    case "ProRes 4444 XQ","ProRes 4444","ProRes 422 HQ","ProRes 422","ProRes 422LT" :
        return Codecspeed(cameradata:cameradata)*ProResCompensation(cameradata:cameradata)
    case "ARRIRAW" :
        return Codecspeed(cameradata:cameradata)*ARRIRAWCompensation(cameradata:cameradata)
    default :
        return Codecspeed(cameradata:cameradata)
    }
}

//旧机型ProRes编码码率乘积
func ProResCompensation(cameradata:CameraData) -> Double {
    switch cameradata.CameraName {
    case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF" :
        return 1.125
    case "ALEXA 35","ALEXA 35 Xtreme","ALEXA 35 Live":
        return 1.225
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

// DJI official recording tables list data rate in MB/s; Taurus calculates with Mbps.
func DjiCodecSpeed(cameradata: CameraData) -> Double {
    return DjiCodecSpeedMBps(cameradata: cameradata) * 8
}

private func DjiCodecSpeedMBps(cameradata: CameraData) -> Double {
    if cameradata.CameraName == "Ronin 4D[8K]" {
        return Dji8KCodecSpeedMBps(cameradata: cameradata)
    }
    else if cameradata.CameraName == "Ronin 4D[6K]" {
        return Dji6KCodecSpeedMBps(cameradata: cameradata)
    }
    else if cameradata.CameraName == "Inspire 3" {
        return DjiInspire3CodecSpeedMBps(cameradata: cameradata)
    }
    else {
        return 0
    }
}

private func Dji8KCodecSpeedMBps(cameradata: CameraData) -> Double {
    switch cameradata.Codec {
    case "ProRes RAW HQ":
        if DjiCountIs8KFullFrame(cameradata.Resolution) {
            return DjiRateValue(cameradata.Rate, ["23.976": 405, "24.000": 405, "25.000": 422])
        }
        else if DjiCountIs5_5KS35(cameradata.Resolution) {
            return DjiRateValue(cameradata.Rate, ["23.976": 188, "24.000": 188, "25.000": 196, "29.970": 235, "30.000": 235, "48.000": 377, "50.000": 392])
        }
        else if DjiCountIs4KFullFrame(cameradata.Resolution) {
            return DjiRateValue(cameradata.Rate, ["23.976": 101, "24.000": 101, "25.000": 105, "29.970": 126, "30.000": 127, "48.000": 203, "50.000": 211, "59.940": 253, "60.000": 253, "72.000": 304, "75.000": 316, "96.000": 405, "100.000": 422])
        }
    case "ProRes RAW":
        if DjiCountIs8KFullFrame(cameradata.Resolution) {
            return DjiRateValue(cameradata.Rate, ["29.970": 253, "30.000": 253, "48.000": 405, "50.000": 422, "59.940": 506, "60.000": 506])
        }
        else if cameradata.Resolution == "8K FF[8192*3424][2.39:1]" {
            return DjiRateValue(cameradata.Rate, ["72.000": 482, "75.000": 502])
        }
        else if DjiCountIs5_5KS35(cameradata.Resolution) {
            return DjiRateValue(cameradata.Rate, ["59.940": 235, "60.000": 235])
        }
        else if DjiCountIs4KFullFrame(cameradata.Resolution) {
            return DjiRateValue(cameradata.Rate, ["120.000": 253])
        }
    case "ProRes 422 HQ":
        if DjiCountIs8KFullFrame(cameradata.Resolution) {
            return DjiRateValue(cameradata.Rate, ["23.976": 359, "24.000": 360, "25.000": 375, "29.970": 449, "30.000": 450])
        }
        else if DjiCountIs4KFullFrame(cameradata.Resolution) {
            return DjiRateValue(cameradata.Rate, ["23.976": 90, "24.000": 90, "25.000": 94, "29.970": 112, "30.000": 112, "48.000": 180, "50.000": 187, "59.940": 225, "60.000": 225, "72.000": 270, "75.000": 281, "96.000": 360, "100.000": 375, "120.000": 450])
        }
        else if DjiCountIs4KS35(cameradata.Resolution) {
            return DjiRateValue(cameradata.Rate, ["23.976": 90, "24.000": 90, "25.000": 94, "29.970": 112, "30.000": 112, "48.000": 180, "50.000": 187, "59.940": 225, "60.000": 225])
        }
    case "H.264(10bit 4:2:0)":
        if DjiCountIs4KFullFrame(cameradata.Resolution) {
            return DjiRateValue(cameradata.Rate, ["23.976": 18, "24.000": 18, "25.000": 18, "29.970": 18, "30.000": 18, "48.000": 25, "50.000": 25, "59.940": 25, "60.000": 25, "72.000": 36, "75.000": 36, "96.000": 36, "100.000": 36, "120.000": 36])
        }
        else if DjiCountIs4KS35(cameradata.Resolution) {
            return DjiRateValue(cameradata.Rate, ["23.976": 18, "24.000": 18, "25.000": 18, "29.970": 18, "30.000": 18, "48.000": 25, "50.000": 25, "59.940": 25, "60.000": 25])
        }
    default:
        return 0
    }
    
    return 0
}

private func Dji6KCodecSpeedMBps(cameradata: CameraData) -> Double {
    switch cameradata.Codec {
    case "ProRes RAW HQ":
        if DjiCountIs6KFullFrame(cameradata.Resolution) {
            return DjiRateValue(cameradata.Rate, ["23.976": 218, "24.000": 218, "25.000": 227, "29.970": 272, "30.000": 272, "48.000": 436, "50.000": 445])
        }
        else if DjiCountIs4KS35(cameradata.Resolution) {
            return DjiRateValue(cameradata.Rate, ["23.976": 101, "24.000": 101, "25.000": 105, "29.970": 126, "30.000": 127, "48.000": 203, "50.000": 211, "59.940": 253, "60.000": 253, "72.000": 304, "75.000": 316, "96.000": 405])
        }
    case "ProRes RAW":
        if DjiCountIs6KFullFrame(cameradata.Resolution) {
            return DjiRateValue(cameradata.Rate, ["59.940": 431, "60.000": 432])
        }
        else if DjiCountIs4KS35(cameradata.Resolution) {
            return DjiRateValue(cameradata.Rate, ["100.000": 334, "120.000": 401])
        }
    case "ProRes 4444 XQ":
        if DjiCountIs6KFullFrame(cameradata.Resolution) {
            return DjiRateValue(cameradata.Rate, ["23.976": 435, "24.000": 435, "25.000": 453, "29.970": 543, "30.000": 544, "48.000": 870, "50.000": 890, "59.940": 863, "60.000": 864])
        }
        else if DjiCountIs4KS35(cameradata.Resolution) {
            return DjiRateValue(cameradata.Rate, ["23.976": 202, "24.000": 202, "25.000": 211, "29.970": 253, "30.000": 253, "48.000": 405, "50.000": 421, "59.940": 505, "60.000": 506, "72.000": 607, "75.000": 632, "96.000": 809, "100.000": 668, "120.000": 802])
        }
    case "ProRes 422 HQ":
        if DjiCountIs6KFullFrame(cameradata.Resolution) {
            return DjiRateValue(cameradata.Rate, ["23.976": 193, "24.000": 193, "25.000": 202, "29.970": 242, "30.000": 242, "48.000": 387, "50.000": 395, "59.940": 383, "60.000": 384])
        }
        else if DjiCountIs4KFullFrame(cameradata.Resolution) {
            return DjiRateValue(cameradata.Rate, ["23.976": 90, "24.000": 90, "25.000": 94, "29.970": 112, "30.000": 112, "48.000": 180, "50.000": 188, "59.940": 178, "60.000": 178])
        }
        else if DjiCountIs4KS35(cameradata.Resolution) {
            return DjiRateValue(cameradata.Rate, ["23.976": 90, "24.000": 90, "25.000": 94, "29.970": 112, "30.000": 112, "48.000": 180, "50.000": 187, "59.940": 225, "60.000": 225, "72.000": 270, "75.000": 281, "96.000": 360, "100.000": 297, "120.000": 356])
        }
        else if DjiCountIs2KFullFrame(cameradata.Resolution) {
            return DjiRateValue(cameradata.Rate, ["23.976": 24, "24.000": 24, "25.000": 25, "29.970": 30, "30.000": 30, "48.000": 48, "50.000": 50, "59.940": 60, "60.000": 60, "72.000": 72, "75.000": 75, "96.000": 96, "100.000": 100, "120.000": 120])
        }
        else if DjiCountIs2KS35(cameradata.Resolution) {
            return DjiRateValue(cameradata.Rate, ["23.976": 24, "24.000": 24, "25.000": 25, "29.970": 30, "30.000": 30, "48.000": 48, "50.000": 50, "59.940": 60, "60.000": 60, "72.000": 72, "75.000": 75, "96.000": 96])
        }
    case "ProRes 422 LT":
        if DjiCountIs6KFullFrame(cameradata.Resolution) {
            return DjiRateValue(cameradata.Rate, ["23.976": 90, "24.000": 90, "25.000": 94, "29.970": 112, "30.000": 112, "48.000": 180, "50.000": 183, "59.940": 186, "60.000": 186])
        }
        else if DjiCountIs4KFullFrame(cameradata.Resolution) {
            return DjiRateValue(cameradata.Rate, ["23.976": 42, "24.000": 42, "25.000": 43, "29.970": 52, "30.000": 52, "48.000": 83, "50.000": 87, "59.940": 83, "60.000": 83])
        }
        else if DjiCountIs4KS35(cameradata.Resolution) {
            return DjiRateValue(cameradata.Rate, ["23.976": 42, "24.000": 42, "25.000": 43, "29.970": 52, "30.000": 52, "48.000": 83, "50.000": 87, "59.940": 104, "60.000": 104, "72.000": 125, "75.000": 130, "96.000": 167, "100.000": 139, "120.000": 167])
        }
        else if DjiCountIs2KFullFrame(cameradata.Resolution) {
            return DjiRateValue(cameradata.Rate, ["23.976": 11, "24.000": 11, "25.000": 12, "29.970": 14, "30.000": 14, "48.000": 22, "50.000": 23, "59.940": 28, "60.000": 28, "72.000": 33, "75.000": 35, "96.000": 44, "100.000": 46, "120.000": 55])
        }
        else if DjiCountIs2KS35(cameradata.Resolution) {
            return DjiRateValue(cameradata.Rate, ["23.976": 11, "24.000": 11, "25.000": 12, "29.970": 14, "30.000": 14, "48.000": 22, "50.000": 23, "59.940": 28, "60.000": 28, "72.000": 33, "75.000": 35, "96.000": 44])
        }
    case "H.264(10bit 4:2:0)":
        if DjiCountIs4KFullFrame(cameradata.Resolution) {
            return DjiRateValue(cameradata.Rate, ["23.976": 18, "24.000": 18, "25.000": 18, "29.970": 18, "30.000": 18, "48.000": 25, "50.000": 25, "59.940": 25, "60.000": 25])
        }
        else if DjiCountIs4KS35(cameradata.Resolution) {
            return DjiRateValue(cameradata.Rate, ["23.976": 18, "24.000": 18, "25.000": 18, "29.970": 18, "30.000": 18, "48.000": 25, "50.000": 25, "59.940": 25, "60.000": 25, "72.000": 36, "75.000": 36, "96.000": 36, "100.000": 36, "120.000": 36])
        }
        else if DjiCountIs2KFullFrame(cameradata.Resolution) {
            return DjiRateValue(cameradata.Rate, ["23.976": 7, "24.000": 7, "25.000": 7, "29.970": 7, "30.000": 7, "48.000": 11, "50.000": 11, "59.940": 11, "60.000": 11, "72.000": 18, "75.000": 18, "96.000": 18, "100.000": 18, "120.000": 18])
        }
        else if DjiCountIs2KS35(cameradata.Resolution) {
            return DjiRateValue(cameradata.Rate, ["23.976": 7, "24.000": 7, "25.000": 7, "29.970": 7, "30.000": 7, "48.000": 11, "50.000": 11, "59.940": 11, "60.000": 11, "72.000": 18, "75.000": 18, "96.000": 18])
        }
    default:
        return 0
    }
    
    return 0
}

private func DjiInspire3CodecSpeedMBps(cameradata: CameraData) -> Double {
    switch cameradata.Codec {
    case "CinemaDNG":
        if cameradata.Resolution == "8K FF[8192*4320][17:9]" {
            return DjiRateValue(cameradata.Rate, ["23.976": 810, "24.000": 810, "25.000": 844])
        }
        else if cameradata.Resolution == "8K FF[7680*4320][16:9]" {
            return DjiRateValue(cameradata.Rate, ["23.976": 759, "24.000": 759, "25.000": 791])
        }
        else if cameradata.Resolution == "4K FF[4096*2160][17:9]" {
            return DjiRateValue(cameradata.Rate, ["23.976": 202, "24.000": 202, "25.000": 211, "29.970": 253, "30.000": 253, "48.000": 405, "50.000": 422, "59.940": 506, "60.000": 506, "72.000": 607, "75.000": 632, "96.000": 810, "100.000": 844])
        }
        else if cameradata.Resolution == "4K FF[3840*2160][16:9]" {
            return DjiRateValue(cameradata.Rate, ["23.976": 190, "24.000": 190, "25.000": 197, "29.970": 237, "30.000": 237, "48.000": 381, "50.000": 396, "59.940": 475, "60.000": 475, "72.000": 569, "75.000": 832, "96.000": 759, "100.000": 791])
        }
        else if cameradata.Resolution == "5.5K S35[5568*2952][17:9]" {
            return DjiRateValue(cameradata.Rate, ["23.976": 376, "24.000": 376, "25.000": 392, "29.970": 470, "30.000": 470, "48.000": 752, "50.000": 784])
        }
        else if cameradata.Resolution == "5.5K S35[5248*2952][16:9]" {
            return DjiRateValue(cameradata.Rate, ["23.976": 355, "24.000": 355, "25.000": 369, "29.970": 443, "30.000": 443, "48.000": 710, "50.000": 739])
        }
    case "ProRes RAW HQ":
        if cameradata.Resolution == "8K FF[8192*4320][17:9]" {
            return DjiRateValue(cameradata.Rate, ["23.976": 405, "24.000": 405, "25.000": 422])
        }
        else if cameradata.Resolution == "8K FF[7680*4320][16:9]" {
            return DjiRateValue(cameradata.Rate, ["23.976": 380, "24.000": 380, "25.000": 396])
        }
        else if cameradata.Resolution == "4K FF[4096*2160][17:9]" {
            return DjiRateValue(cameradata.Rate, ["23.976": 101, "24.000": 101, "25.000": 106, "29.970": 127, "30.000": 127, "48.000": 202, "50.000": 211, "59.940": 300, "60.000": 253, "72.000": 304, "75.000": 317, "96.000": 405, "100.000": 422])
        }
        else if cameradata.Resolution == "4K FF[3840*2160][16:9]" {
            return DjiRateValue(cameradata.Rate, ["23.976": 95, "24.000": 95, "25.000": 99, "29.970": 118, "30.000": 118, "48.000": 190, "50.000": 197, "59.940": 237, "60.000": 237, "72.000": 285, "75.000": 297, "96.000": 380, "100.000": 396])
        }
        else if cameradata.Resolution == "5.5K S35[5568*2952][17:9]" {
            return DjiRateValue(cameradata.Rate, ["23.976": 189, "24.000": 189, "25.000": 196, "29.970": 236, "30.000": 236, "48.000": 377, "50.000": 393])
        }
        else if cameradata.Resolution == "5.5K S35[5248*2952][16:9]" {
            return DjiRateValue(cameradata.Rate, ["23.976": 177, "24.000": 177, "25.000": 185, "29.970": 221, "30.000": 221, "48.000": 355, "50.000": 369])
        }
    case "ProRes RAW":
        if cameradata.Resolution == "8K FF[8192*4320][17:9]" {
            return DjiRateValue(cameradata.Rate, ["29.970": 253, "30.000": 253, "48.000": 405, "50.000": 422, "59.940": 506, "60.000": 506])
        }
        else if cameradata.Resolution == "8K FF[7680*4320][16:9]" {
            return DjiRateValue(cameradata.Rate, ["29.970": 237, "30.000": 237, "48.000": 380, "50.000": 396, "59.940": 475, "60.000": 475])
        }
        else if cameradata.Resolution == "8K FF[8192*3424][2.39:1]" {
            return DjiRateValue(cameradata.Rate, ["72.000": 482, "75.000": 502])
        }
        else if cameradata.Resolution == "4K FF[4096*2160][17:9]" {
            return DjiRateValue(cameradata.Rate, ["119.880": 253, "120.000": 253])
        }
        else if cameradata.Resolution == "4K FF[3840*2160][16:9]" {
            return DjiRateValue(cameradata.Rate, ["119.880": 237, "120.000": 237])
        }
        else if cameradata.Resolution == "5.5K S35[5568*2952][17:9]" {
            return DjiRateValue(cameradata.Rate, ["59.940": 471, "60.000": 471])
        }
        else if cameradata.Resolution == "5.5K S35[5248*2952][16:9]" {
            return DjiRateValue(cameradata.Rate, ["59.940": 443, "60.000": 443])
        }
    case "ProRes 422 HQ":
        if cameradata.Resolution == "8K FF[8192*4320][17:9]" {
            return DjiRateValue(cameradata.Rate, ["23.976": 360, "24.000": 360, "25.000": 375, "29.970": 449, "30.000": 449])
        }
        else if cameradata.Resolution == "8K FF[7680*4320][16:9]" {
            return DjiRateValue(cameradata.Rate, ["23.976": 336, "24.000": 336, "25.000": 378, "29.970": 422, "30.000": 422])
        }
        else if cameradata.Resolution == "4K FF[4096*2160][17:9]" {
            return DjiRateValue(cameradata.Rate, ["23.976": 90, "24.000": 90, "25.000": 93, "29.970": 113, "30.000": 113, "48.000": 180, "50.000": 188, "59.940": 225, "60.000": 225, "72.000": 270, "75.000": 281, "96.000": 360, "100.000": 375, "119.880": 449, "120.000": 449])
        }
        else if cameradata.Resolution == "4K FF[3840*2160][16:9]" {
            return DjiRateValue(cameradata.Rate, ["23.976": 84, "24.000": 84, "25.000": 88, "29.970": 106, "30.000": 106, "48.000": 169, "50.000": 175, "59.940": 211, "60.000": 211, "72.000": 253, "75.000": 253, "96.000": 338, "100.000": 352, "119.880": 422, "120.000": 422])
        }
        else if cameradata.Resolution == "4K S35[4096*2160][17:9]" {
            return DjiRateValue(cameradata.Rate, ["23.976": 90, "24.000": 90, "25.000": 93, "29.970": 113, "30.000": 113, "48.000": 180, "50.000": 188, "59.940": 225, "60.000": 225])
        }
        else if cameradata.Resolution == "4K S35[3840*2160][16:9]" {
            return DjiRateValue(cameradata.Rate, ["23.976": 84, "24.000": 84, "25.000": 88, "29.970": 106, "30.000": 106, "48.000": 169, "50.000": 175, "59.940": 211, "60.000": 211])
        }
    case "H.264(10bit 4:2:0)":
        if DjiCountIs4KFullFrame(cameradata.Resolution) {
            return DjiRateValue(cameradata.Rate, ["23.976": 18, "24.000": 18, "25.000": 18, "29.970": 18, "30.000": 18, "48.000": 25, "50.000": 25, "59.940": 25, "60.000": 25, "72.000": 36, "75.000": 36, "96.000": 36, "100.000": 36, "119.880": 36, "120.000": 36])
        }
        else if DjiCountIs4KS35(cameradata.Resolution) {
            return DjiRateValue(cameradata.Rate, ["23.976": 18, "24.000": 18, "25.000": 18, "29.970": 18, "30.000": 18, "48.000": 25, "50.000": 25, "59.940": 25, "60.000": 25])
        }
    default:
        return 0
    }
    
    return 0
}

private func DjiRateValue(_ rate: String, _ values: [String: Double]) -> Double {
    return values[rate] ?? 0
}

private func AppleCodecSpeed(cameradata: CameraData) -> Double {
    if cameradata.Codec == "H.265 (54 Mbps)" || cameradata.Codec == "H.264 (54 Mbps)" {
        return 54
    }
    
    return Codecspeed(cameradata: cameradata) * ResolutionMultiplier(cameradata: cameradata) * RateMultiplier(cameradata: cameradata)
}

private func DjiCountIs8KFullFrame(_ resolution: String) -> Bool {
    return resolution == "8K FF[8192*4320][17:9]" || resolution == "8K FF[7680*4320][16:9]"
}

private func DjiCountIs5_5KS35(_ resolution: String) -> Bool {
    return resolution == "5.5K S35[5568*2952][17:9]" || resolution == "5.5K S35[5248*2952][16:9]"
}

private func DjiCountIs6KFullFrame(_ resolution: String) -> Bool {
    return resolution.contains("6K FF")
}

private func DjiCountIs4KFullFrame(_ resolution: String) -> Bool {
    return resolution.contains("4K FF")
}

private func DjiCountIs4KS35(_ resolution: String) -> Bool {
    return resolution.contains("4K S35")
}

private func DjiCountIs2KFullFrame(_ resolution: String) -> Bool {
    return resolution.contains("2K FF")
}

private func DjiCountIs2KS35(_ resolution: String) -> Bool {
    return resolution.contains("2K S35")
}
