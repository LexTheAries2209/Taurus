//
//  Media.swift
//  Taurus
//
//  Created by 吴坤城 on 11/23/23.
//

import Foundation

//储存卡库
public let MediaName : [String:[String]] = [
    
    //ARRI
    "AMIRA" : ["CFast2.0 128GB","CFast2.0 256GB","CFast2.0 512GB"],
    "ALEXA Classic" : ["SxS Pro+ 128GB"],
    "ALEXA XT" : ["SxS Pro+ 128GB","CFast2.0 128GB","XR Capture Drive 512GB"],
    "ALEXA SXT" : ["SxS Pro+ 128GB","SxS Pro+ 256GB","CFast2.0 256GB","XR Capture Drive 512GB","SXR Capture Drive 1TB","SXR Capture Drive 2TB"],
    "ALEXA 35" : ["Compact Drive 1TB","Compact Drive 2TB"],
    "ALEXA Mini" : ["CFast2.0 128GB","CFast2.0 256GB","CFast2.0 512GB"],
    "ALEXA Mini LF" : ["Compact Drive 1TB","Compact Drive 2TB"],
    "ALEXA LF" : ["SxS Pro+ 256GB","SXR Capture Drive 1TB","SXR Capture Drive 2TB"],
    "ALEXA 65" : ["XR Capture Drive 512GB","SXR Capture Drive 1TB","SXR Capture Drive 2TB"],
    
    //RED
    "V-Raptor XL [X]" : ["CFExpress TypeB 128GB","CFExpress TypeB 256GB","CFExpress TypeB 330GB","CFExpress TypeB 512GB","CFExpress TypeB 660GB","CFExpress TypeB 1TB","CFExpress TypeB 1.3TB","CFExpress TypeB 2TB"],
    "V-Raptor [X]" : ["CFExpress TypeB 128GB","CFExpress TypeB 256GB","CFExpress TypeB 330GB","CFExpress TypeB 512GB","CFExpress TypeB 660GB","CFExpress TypeB 1TB","CFExpress TypeB 1.3TB","CFExpress TypeB 2TB"],
    "V-Raptor XL[8K VV]" : ["CFExpress TypeB 128GB","CFExpress TypeB 256GB","CFExpress TypeB 330GB","CFExpress TypeB 512GB","CFExpress TypeB 660GB","CFExpress TypeB 1TB","CFExpress TypeB 1.3TB","CFExpress TypeB 2TB"],
    "V-Raptor[8K VV]" : ["CFExpress TypeB 128GB","CFExpress TypeB 256GB","CFExpress TypeB 330GB","CFExpress TypeB 512GB","CFExpress TypeB 660GB","CFExpress TypeB 1TB","CFExpress TypeB 1.3TB","CFExpress TypeB 2TB"],
    "V-Raptor XL[8K S35]" : ["CFExpress TypeB 128GB","CFExpress TypeB 256GB","CFExpress TypeB 330GB","CFExpress TypeB 512GB","CFExpress TypeB 660GB","CFExpress TypeB 1TB","CFExpress TypeB 1.3TB","CFExpress TypeB 2TB"],
    "V-Raptor[8K S35]" : ["CFExpress TypeB 128GB","CFExpress TypeB 256GB","CFExpress TypeB 330GB","CFExpress TypeB 512GB","CFExpress TypeB 660GB","CFExpress TypeB 1TB","CFExpress TypeB 1.3TB","CFExpress TypeB 2TB"],
    "KEMODO-X" : ["CFExpress TypeB 128GB","CFExpress TypeB 256GB","CFExpress TypeB 330GB","CFExpress TypeB 512GB","CFExpress TypeB 660GB","CFExpress TypeB 1TB","CFExpress TypeB 1.3TB","CFExpress TypeB 2TB"],
    "KEMODO" : ["CFast2.0 128GB","CFast2.0 256GB","CFast2.0 512GB"],
    
    //Apple

    "iPhone 15 Pro MAX" : ["Built-in 256GB","Built-in 512GB","Built-in 1TB","[Output]SSD 512GB","[Output]SSD 1TB","[Output]SSD 2TB"],
    "iPhone 15 Pro" : ["Built-in 128GB","Built-in 256GB","Built-in 512GB","Built-in 1TB","[Output]SSD 512GB","[Output]SSD 1TB","[Output]SSD 2TB"],
    "iPhone 14 Pro MAX" : ["Built-in 128GB","Built-in 256GB","Built-in 512GB","Built-in 1TB"],
    "iPhone 14 Pro" : ["Built-in 128GB","Built-in 256GB","Built-in 512GB","Built-in 1TB"],
    
    //BMD
    "Blackmagic URSA Mini Pro 12K" : ["Dual CFast2.0 128GB","Dual CFast2.0 256GB","Dual CFast2.0 512GB","Dual CFast2.0 1TB","[Output]SSD 512GB","[Output]SSD 1TB","[Output]SSD 2TB","[Output]SSD 4TB"],
]

//PanaMedia
func PanaMedia(cameradata:CameraData) -> [String] {
    var PanaMedia = [""]
    let CodecSpeed = PanaCodecSpeed(cameradata: cameradata)
    
    if cameradata.CameraName == "S5M2" || cameradata.CameraName == "S1H" {
        if CodecSpeed <= 200 {
            PanaMedia = ["SD V30 128GB","SD V30 256GB","SD V30 512GB","SD V60 128GB","SD V60 256GB","SD V60 512GB","SD V90 128GB","SD V90 256GB","SD V90 512GB"]
        }
        else if CodecSpeed > 200 && CodecSpeed <= 400 {
            PanaMedia = ["SD V60 128GB","SD V60 256GB","SD V60 512GB","SD V90 128GB","SD V90 256GB","SD V90 512GB"]
        }
        else if CodecSpeed > 400 && CodecSpeed <= 600 {
            PanaMedia = ["SD V90 128GB","SD V90 256GB","SD V90 512GB"]
        }
    }
    
    else if cameradata.CameraName == "S5M2X" {
        if (cameradata.Codec != "Prores 422 HQ" && cameradata.Codec != "Prores 422") || ((cameradata.Codec == "Prores 422 HQ" || cameradata.Codec == "Prores 422") && (cameradata.Resolution == "FHD[10bit 4:2:2][23.98p]" || cameradata.Resolution == "FHD[10bit 4:2:2][24p]" || cameradata.Resolution == "FHD[10bit 4:2:2][25p]" || cameradata.Resolution == "FHD[10bit 4:2:2][29.97p]" || cameradata.Resolution == "FHD[10bit 4:2:2][50p]" || cameradata.Resolution == "FHD[10bit 4:2:2][59.94p]")) {
            if CodecSpeed <= 200 {
                PanaMedia = ["SD V30 128GB","SD V30 256GB","SD V30 512GB","SD V60 128GB","SD V60 256GB","SD V60 512GB","SD V90 128GB","SD V90 256GB","SD V90 512GB","[Output]SSD 512GB","[Output]SSD 1TB","[Output]SSD 2TB"]
            }
            else if CodecSpeed > 200 && CodecSpeed <= 400 {
                PanaMedia = ["SD V60 128GB","SD V60 256GB","SD V60 512GB","SD V90 128GB","SD V90 256GB","SD V90 512GB","[Output]SSD 512GB","[Output]SSD 1TB","[Output]SSD 2TB"]
            }
            else if CodecSpeed > 400 && CodecSpeed <= 600 {
                PanaMedia = ["SD V90 128GB","SD V90 256GB","SD V90 512GB","[Output]SSD 512GB","[Output]SSD 1TB","[Output]SSD 2TB"]
            }
            else {
                PanaMedia = ["[Output]SSD 512GB","[Output]SSD 1TB","[Output]SSD 2TB"]
            }
        }
        else {
            PanaMedia = ["[Output]SSD 512GB","[Output]SSD 1TB","[Output]SSD 2TB"]
        }
    }
    
    else if cameradata.CameraName == "GH6" {
        if cameradata.Codec != "Prores 422 HQ" || cameradata.Codec != "Prores 422" {
            if CodecSpeed <= 200 {
                PanaMedia = ["SD V30 128GB","SD V30 256GB","SD V30 512GB","SD V60 128GB","SD V60 256GB","SD V60 512GB","SD V90 128GB","SD V90 256GB","SD V90 512GB","CFExpress TypeB 256GB","CFExpress TypeB 512GB","CFExpress TypeB 1TB","CFExpress TypeB 2TB","[Output]SSD 512GB","[Output]SSD 1TB","[Output]SSD 2TB"]
            }
            else if CodecSpeed > 200 && CodecSpeed <= 400 {
                PanaMedia = ["SD V60 128GB","SD V60 256GB","SD V60 512GB","SD V90 128GB","SD V90 256GB","SD V90 512GB","CFExpress TypeB 256GB","CFExpress TypeB 512GB","CFExpress TypeB 1TB","CFExpress TypeB 2TB","[Output]SSD 512GB","[Output]SSD 1TB","[Output]SSD 2TB"]
            }
            else if CodecSpeed > 400 && CodecSpeed <= 600 {
                PanaMedia = ["SD V90 128GB","SD V90 256GB","SD V90 512GB","CFExpress TypeB 256GB","CFExpress TypeB 512GB","CFExpress TypeB 1TB","CFExpress TypeB 2TB","[Output]SSD 512GB","[Output]SSD 1TB","[Output]SSD 2TB"]
            }
            else {
                PanaMedia = ["CFExpress TypeB 256GB","CFExpress TypeB 512GB","CFExpress TypeB 1TB","CFExpress TypeB 2TB","[Output]SSD 512GB","[Output]SSD 1TB","[Output]SSD 2TB"]
            }
        }
        else {
            PanaMedia = ["CFExpress TypeB 256GB","CFExpress TypeB 512GB","CFExpress TypeB 1TB","CFExpress TypeB 2TB","[Output]SSD 512GB","[Output]SSD 1TB","[Output]SSD 2TB"]
        }
    }
    
    else if cameradata.CameraName == "G9M2" {
        if CodecSpeed <= 200 {
            PanaMedia = ["SD V30 128GB","SD V30 256GB","SD V30 512GB","SD V60 128GB","SD V60 256GB","SD V60 512GB","SD V90 128GB","SD V90 256GB","SD V90 512GB","[Output]SSD 512GB","[Output]SSD 1TB","[Output]SSD 2TB"]
        }
        else if CodecSpeed > 200 && CodecSpeed <= 400 {
            PanaMedia = ["SD V60 128GB","SD V60 256GB","SD V60 512GB","SD V90 128GB","SD V90 256GB","SD V90 512GB","[Output]SSD 512GB","[Output]SSD 1TB","[Output]SSD 2TB"]
        }
        else if CodecSpeed > 400 && CodecSpeed <= 600 {
            PanaMedia = ["SD V90 128GB","SD V90 256GB","SD V90 512GB","[Output]SSD 512GB","[Output]SSD 1TB","[Output]SSD 2TB"]
        }
        else {
            PanaMedia = ["[Output]SSD 512GB","[Output]SSD 1TB","[Output]SSD 2TB"]
        }
    }
    
    return PanaMedia
}

//SonyMedia
func SonyMedia(cameradata:CameraData) -> [String] {
    var SonyMedia = [""]
    let CodecSpeed = CodecSpeedCount(cameradata:cameradata)*ResolutionMultiplier(cameradata:cameradata)*RateMultiplier(cameradata:cameradata)
    
    if cameradata.CameraName == "A7S3" || cameradata.CameraName == "FX 3" || cameradata.CameraName == "FX 30" || cameradata.CameraName == "Alpha 1" || cameradata.CameraName == "A9M3" {
        if cameradata.Codec == "XAVC S HD" {
            SonyMedia = ["SD V30 128GB","SD V30 256GB","SD V30 512GB","SD V60 128GB","SD V60 256GB","SD V60 512GB","SD V90 128GB","SD V90 256GB","SD V90 512GB","CFExpress TypeA 80GB","CFExpress TypeA 160GB","CFExpress TypeA 320GB","CFExpress TypeA 640GB","CFExpress TypeA 960GB","CFExpress TypeA 1920GB"]
        }
        else if cameradata.Codec == "XAVC HS 4K" || cameradata.Codec == "XAVC S 4K" {
            SonyMedia = ["SD V60 128GB","SD V60 256GB","SD V60 512GB","SD V90 128GB","SD V90 256GB","SD V90 512GB","CFExpress TypeA 80GB","CFExpress TypeA 160GB","CFExpress TypeA 320GB","CFExpress TypeA 640GB","CFExpress TypeA 960GB","CFExpress TypeA 1920GB"]
        }
        else {
            SonyMedia = ["SD V90 128GB","SD V90 256GB","SD V90 512GB","CFExpress TypeA 80GB","CFExpress TypeA 160GB","CFExpress TypeA 320GB","CFExpress TypeA 640GB","CFExpress TypeA 960GB","CFExpress TypeA 1920GB"]
        }
    }
    
    else if cameradata.CameraName == "A7M4" || cameradata.CameraName == "A7R5" {
        if cameradata.Codec == "XAVC HS 4K" || cameradata.Codec == "XAVC S 4K" || cameradata.Codec == "XAVC S HD" {
            SonyMedia = ["SD V30 128GB","SD V30 256GB","SD V30 512GB","SD V60 128GB","SD V60 256GB","SD V60 512GB","SD V90 128GB","SD V90 256GB","SD V90 512GB","CFExpress TypeA 80GB","CFExpress TypeA 160GB","CFExpress TypeA 320GB","CFExpress TypeA 640GB","CFExpress TypeA 960GB","CFExpress TypeA 1920GB"]
        }
        else if cameradata.Codec == "XAVC HS 8K" {
            SonyMedia = ["SD V60 128GB","SD V60 256GB","SD V60 512GB","SD V90 128GB","SD V90 256GB","SD V90 512GB","CFExpress TypeA 80GB","CFExpress TypeA 160GB","CFExpress TypeA 320GB","CFExpress TypeA 640GB","CFExpress TypeA 960GB","CFExpress TypeA 1920GB"]
        }
        else {
            SonyMedia = ["SD V90 128GB","SD V90 256GB","SD V90 512GB","CFExpress TypeA 80GB","CFExpress TypeA 160GB","CFExpress TypeA 320GB","CFExpress TypeA 640GB","CFExpress TypeA 960GB","CFExpress TypeA 1920GB"]
        }
    }
    
    else if cameradata.CameraName == "A7C2" || cameradata.CameraName == "A7CR" || cameradata.CameraName == "ZV-E1" {
        if cameradata.Codec == "XAVC HS 4K" || cameradata.Codec == "XAVC S 4K" || cameradata.Codec == "XAVC S HD" {
            SonyMedia = ["SD V30 128GB","SD V30 256GB","SD V30 512GB","SD V60 128GB","SD V60 256GB","SD V60 512GB","SD V90 128GB","SD V90 256GB","SD V90 512GB"]
        }
        else {
            SonyMedia = ["SD V90 128GB","SD V90 256GB","SD V90 512GB"]
        }
    }
    
    else if cameradata.CameraName == "A6700" {
        if cameradata.Codec == "XAVC S HD" {
            SonyMedia = ["SD V30 128GB","SD V30 256GB","SD V30 512GB","SD V60 128GB","SD V60 256GB","SD V60 512GB","SD V90 128GB","SD V90 256GB","SD V90 512GB"]
        }
        else if cameradata.Codec == "XAVC HS 4K" || cameradata.Codec == "XAVC S 4K" {
            SonyMedia = ["SD V60 128GB","SD V60 256GB","SD V60 512GB","SD V90 128GB","SD V90 256GB","SD V90 512GB"]
        }
        else {
            SonyMedia = ["SD V90 128GB","SD V90 256GB","SD V90 512GB"]
        }
    }
    
    else if cameradata.CameraName == "FX 6" {
        SonyMedia = ["CFExpress TypeA 80GB","CFExpress TypeA 160GB","CFExpress TypeA 320GB","CFExpress TypeA 640GB","CFExpress TypeA 960GB","CFExpress TypeA 1920GB"]
    }
    
    else if cameradata.CameraName == "FX 9" {
        SonyMedia = ["XQD 120GB","XQD 128GB","XQD 240GB","XQD 256GB"]
    }
    
    else if cameradata.CameraName == "CineAlta Burano" {
        SonyMedia = ["CFExpress TypeB 128GB","CFExpress TypeB 256GB","CFExpress TypeB 330GB","CFExpress TypeB 512GB","CFExpress TypeB 660GB","CFExpress TypeB 1TB","CFExpress TypeB 1.3TB","CFExpress TypeB 2TB"]
    }
    
    else if cameradata.CameraName == "CineAlta Venice 2[8K]" || cameradata.CameraName == "CineAlta Venice 2[6K]" || cameradata.CameraName == "CineAlta Venice" {
        if CodecSpeed <= 2550 {
            SonyMedia = ["AXS S24 256GB","AXS S24 512GB","AXS S24 1TB","AXS S48 512GB","AXS S48 1TB","AXS S66 1TB"]
        }
        else if CodecSpeed > 2550 && CodecSpeed <= 5000 {
            SonyMedia = ["AXS S48 512GB","AXS S48 1TB","AXS S66 1TB"]
        }
        else if CodecSpeed > 5000 {
            SonyMedia = ["AXS S66 1TB"]
        }
    }
    
//    else if cameradata.CameraName == "CineAlta Venice"  {
//        SonyMedia = ["SxS Pro+ 128GB","SxS Pro+ 256GB","SxS Pro-X 120GB","SxS Pro-X 240GB","AXS S24 256GB","AXS S24 512GB","AXS S24 1TB","AXS S48 512GB","AXS S48 1TB","AXS S66 1TB","XQD 120GB","XQD 128GB","XQD 240GB","XQD 256GB"]
//    }
    
    else {
        SonyMedia = [""]
    }
    return SonyMedia
}

//CanonMedia
func CanonMedia(cameradata:CameraData) -> [String] {
    var CanonMedia = [""]
    let CodecSpeed = CanonCodecSpeed(cameradata: cameradata)
    
    if cameradata.CameraName == "EOS R5" || cameradata.CameraName == "EOS R3" || cameradata.CameraName == "EOS R5C" {
        if CodecSpeed <= 270 {
            CanonMedia = ["SD V30 128GB","SD V30 256GB","SD V30 512GB","SD V60 128GB","SD V60 256GB","SD V60 512GB","SD V90 128GB","SD V90 256GB","SD V90 512GB","CFExpress TypeB 256GB","CFExpress TypeB 512GB","CFExpress TypeB 1TB","CFExpress TypeB 2TB"]
        }
        else if CodecSpeed > 270 && CodecSpeed <= 480 {
            CanonMedia = ["SD V60 128GB","SD V60 256GB","SD V60 512GB","SD V90 128GB","SD V90 256GB","SD V90 512GB","CFExpress TypeB 256GB","CFExpress TypeB 512GB","CFExpress TypeB 1TB","CFExpress TypeB 2TB"]
        }
        else if CodecSpeed > 480 && CodecSpeed <= 720 {
            CanonMedia = ["SD V90 128GB","SD V90 256GB","SD V90 512GB","CFExpress TypeB 256GB","CFExpress TypeB 512GB","CFExpress TypeB 1TB","CFExpress TypeB 2TB"]
        }
        else if CodecSpeed > 720 {
            CanonMedia = ["CFExpress TypeB 256GB","CFExpress TypeB 512GB","CFExpress TypeB 1TB","CFExpress TypeB 2TB"]
        }
    }
    
    else if cameradata.CameraName == "EOS R6 Mark2" || cameradata.CameraName == "EOS R8" || cameradata.CameraName == "EOS R7" || cameradata.CameraName == "EOS R6" || cameradata.CameraName == "CinemaEOS C70" {
        if CodecSpeed < 270 {
            CanonMedia = ["SD V30 128GB","SD V30 256GB","SD V30 512GB","SD V60 128GB","SD V60 256GB","SD V60 512GB","SD V90 128GB","SD V90 256GB","SD V90 512GB"]
        }
        else if CodecSpeed > 270 && CodecSpeed <= 480 {
            CanonMedia = ["SD V60 128GB","SD V60 256GB","SD V60 512GB","SD V90 128GB","SD V90 256GB","SD V90 512GB"]
        }
        else if CodecSpeed > 480 && CodecSpeed <= 720 {
            CanonMedia = ["SD V90 128GB","SD V90 256GB","SD V90 512GB"]
        }
    }
    
    else if cameradata.CameraName == "CinemaEOS C500 Mark2" || cameradata.CameraName == "CinemaEOS C300 Mark3" {
        CanonMedia = ["CFExpress TypeB 128GB","CFExpress TypeB 256GB","CFExpress TypeB 330GB","CFExpress TypeB 512GB","CFExpress TypeB 660GB","CFExpress TypeB 1TB","CFExpress TypeB 1.3TB","CFExpress TypeB 2TB"]
    }
    
    else {
        CanonMedia = [""]
    }
    return CanonMedia
}

//DjiMedia
func DjiMedia(cameradata:CameraData) -> [String] {
    var DjiMedia = [""]
    if cameradata.CameraName == "Inspire 3" {
        DjiMedia = ["DJI PROSSD 1TB"]
    }
    else if cameradata.CameraName == "Ronin 4D[8K]" || cameradata.CameraName == "Ronin 4D[6K]" {
        if cameradata.Codec == "Prores 4444 XQ" || cameradata.Codec == "Prores RAW" {
            DjiMedia = ["DJI PROSSD 1TB"]
        }
        else if (cameradata.Codec == "Prores 422 HQ" || cameradata.Codec == "Prores 422 LT") && (cameradata.Resolution == "4K FF[4096*2160][17:9]" || cameradata.Resolution == "4K FFcrop[4096*2160][17:9]" || cameradata.Resolution == "4K S35[4096*2160][17:9]" || cameradata.Resolution == "2K FF[2048*1080][17:9]" || cameradata.Resolution == "2K S35[2048*1080][17:9]") && (cameradata.Rate != "72.000" && cameradata.Rate != "75.000" && cameradata.Rate != "96.000" || cameradata.Rate != "100.000" && cameradata.Rate != "120.000") {
            DjiMedia = ["DJI PROSSD 1TB","[Output]SSD 512GB","[Output]SSD 1TB","[Output]SSD 2TB","CFExpress TypeB 256GB","CFExpress TypeB 512GB","CFExpress TypeB 1TB","CFExpress TypeB 2TB"]
        }
        else if ((cameradata.Codec == "Prores 422 HQ" || cameradata.Codec == "Prores 422 LT" || cameradata.Codec == "H.264(10bit 4:2:0)") && (cameradata.Resolution == "4K FF[4096*2160][17:9]" || cameradata.Resolution == "4K FFcrop[4096*2160][17:9]" || cameradata.Resolution == "4K S35[4096*2160][17:9]" || cameradata.Resolution == "2K FF[2048*1080][17:9]" || cameradata.Resolution == "2K S35[2048*1080][17:9]")) || ((cameradata.Resolution == "6K FF[6008*3168][17:9]") && (cameradata.Rate == "23.976" || cameradata.Rate == "24.000" || cameradata.Rate == "25.000" || cameradata.Rate == "29.970" || cameradata.Rate == "30.000")) {
            DjiMedia = ["DJI PROSSD 1TB","CFExpress TypeB 256GB","CFExpress TypeB 512GB","CFExpress TypeB 1TB","CFExpress TypeB 2TB"]
        }
        else {
            DjiMedia = ["DJI PROSSD 1TB"]
        }
    }
    return DjiMedia
}
