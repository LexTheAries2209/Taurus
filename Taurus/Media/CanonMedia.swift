//
//  CanonMedia.swift
//  Taurus
//
//  Created by 吴坤城 on 5/10/24.
//

import Foundation

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
