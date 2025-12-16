//
//  func_xbit.swift
//  Taurus
//
//  Created by 吴坤城 on 12/13/23.
//

import Foundation

//将机型编号、编码编号、分辨率编号、储存卡编号合成为十位码
func Xbit(cameradata:CameraData) -> String {
    
    let cameraNumber = CameraNumber(cameradata: cameradata)
    let codecNumber = CodecNumber(cameradata: cameradata)
    let resolutionNumber = ResolutionNumber(cameradata: cameradata)
    let mediaNumber = MediaNumber(cameradata: cameradata)
    
    let cameraString = String(cameraNumber)
    let codecString = String(codecNumber)
    let resolutionString = String(resolutionNumber)
    let mediaString = String(mediaNumber)
    
    return cameraString + codecString + resolutionString + mediaString
}

//机型三位编号
func CameraNumber(cameradata:CameraData) -> Int {
    switch cameradata.CameraName {
    case "AMIRA" :
        return 200
    case "ALEXA Classic" :
        return 201
    case "ALEXA XT" :
        return 202
    case "ALEXA SXT" :
        return 203
    case "ALEXA Mini" :
        return 204
    case "ALEXA LF" :
        return 205
    case "ALEXA Mini LF" :
        return 206
    case "ALEXA 65" :
        return 207
    case "ALEXA 35" :
        return 208
    default :
        return 999
    }
}

//编码两位编号
func CodecNumber(cameradata:CameraData) -> Int {
    switch cameradata.Codec {
    case "ARRIRAW" :
        return 10
    case "ProRes 4444 XQ" :
        return 20
    case "ProRes 4444" :
        return 21
    case "ProRes 422 HQ" :
        return 22
    case "ProRes 422" :
        return 23
    case "ProRes 422 LT" :
        return 24
    case "REDCODE 1:3" :
        return 30
    case "MPEG-2 HD 422" :
        return 80
    default :
        return 99
    }
}

//分辨率三位编号
func ResolutionNumber(cameradata:CameraData) -> Int {
    switch cameradata.Resolution {
    case "FHD S35[From 2880*1620]" :
        return 100
    case "FHD S16[From 1600*900]" :
        return 101
    case "FHD S35[From 4096*2304]" :
        return 102
    case "FHD S35[From 1920*2160][8:9 ANA]" :
        return 103
    case "FHD LF[From 4320*2430]" :
        return 104
    case "FHD LF[From UHD]" :
        return 105
    case "2K S35[2048*1152][From 2868*1614]" :
        return 106
    case "2K S35[2048*1152][From 2868*1612]" :
        return 107
    case "2K S35[2048*1152][From 4096*2304]" :
        return 108
    case "2K LF[2048*1152][From UHD]" :
        return 109
    case "2K S16[2048*1152]" :
        return 110
    case "2K S35[2048*1152][From 2880*1620]" :
        return 111
    case "2K S35[2048*858][From 2560*2146][6:5 ANA]" :
        return 112
    case "2K S35[2048*858][From 2560*2145][6:5 ANA]" :
        return 113
    case "2K S35[2048*1536][From 2868*2152][4:3]" :
        return 114
    case "2.6K S35[2578*2160][6:5]" :
        return 115
    case "2.8K S35[2880*1620]" :
        return 116
    case "2.8K S35[2880*2160][4:3]" :
        return 117
    case "2.8K LF[2880*2880][1:1]" :
        return 118
    case "3K S35[3072*3072][1:1]" :
        return 119
    case "3.2K S35[3168*1782]" :
        return 120
    case "3.2K S35[3200*1800]" :
        return 121
    case "3.3K S35[3328*2790][6:5]" :
        return 122
    case "3.4K S35[3424*2202][OG]","2.8K S35[2880*2160][Clip 3424*2202][4:3]" :
        return 123
    case "3.4K S35[3424*2202][1.55:1]" :
        return 124
    case "3.8K S35[3840*1920][From 3072*3072][1:1 ANA]" :
        return 125
    case "4K S35[4096*1716][From 2560*2146][6:5 ANA]" :
        return 126
    case "4K S35[4096*1716][From 3328*2790][6:5 ANA]" :
        return 127
    case "UHD LF" :
        return 128
    case "UHD S35" :
        return 129
    case "UHD S35[From 3200*1800]" :
        return 130
    case "UHD S35[From 4096*2304]" :
        return 131
    case "UHD S35[From 2743*3086][8:9 ANA]" :
        return 132
    case "UHD LF[From 4320*2430]" :
        return 133
    case "4K S35[4096*2048][2:1]" :
        return 134
    case "4K S35[4096*2304]" :
        return 135
    case "4K S35[4096*2304][From 4608*2592]" :
        return 136
    case "4K Cine S35[4096*2636][From 3414*2198][1.55:1]" :
        return 137
    case "4.3K LF[4320*2880][3:2]" :
        return 138
    case "4.5K LF[4448*1856][2.39:1]" :
        return 139
    case "4.5K LF[4448*3096][1.43:1]" :
        return 140
    case "4.5K LF[4448*3096][OG]" :
        return 141
    case "4.6K S35[4608*2592]" :
        return 142
    case "4.6K S35[4608*3164][OG]" :
        return 143
    case "5.1K 65mm[5120*2880]" :
        return 144
    case "6.5K 65mm[6560*3100][OG]" :
        return 145
    default :
        return 999
    }
}

//储存卡三位编号
func MediaNumber(cameradata:CameraData) -> Int {
    switch cameradata.Media {
    case "CFast2.0 128GB" :
        return 10
    case "CFast2.0 256GB" :
        return 11
    case "CFast2.0 512GB" :
        return 12
    case "SxS Pro+ 128GB" :
        return 20
    case "SxS Pro+ 256GB" :
        return 21
    case "XR Capture Drive 512GB" :
        return 30
    case "SXR Capture Drive 1TB" :
        return 31
    case "SXR Capture Drive 2TB" :
        return 32
    case "Compact Drive 1TB" :
        return 33
    case "Compact Drive 2TB" :
        return 34
    default :
        return 99
    }
}
