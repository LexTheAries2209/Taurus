//
//  CanonCinemaMedia.swift
//  Taurus
//
//  Created by 吴坤城 on 6/9/24.
//

import Foundation

func CanonCinemaMedia(cameradata:CameraData) -> [String] {
    var CanonCinemaMedia = [""]
    let CodecSpeed = CanonCinemaCodecSpeed(cameradata: cameradata)
    
    if cameradata.CameraName == "CinemaEOS C70" {
        if CodecSpeed < 270 {
            CanonCinemaMedia = ["SD V30 128GB","SD V30 256GB","SD V30 512GB","SD V60 128GB","SD V60 256GB","SD V60 512GB","SD V90 128GB","SD V90 256GB","SD V90 512GB"]
        }
        else if CodecSpeed > 270 && CodecSpeed <= 480 {
            CanonCinemaMedia = ["SD V60 128GB","SD V60 256GB","SD V60 512GB","SD V90 128GB","SD V90 256GB","SD V90 512GB"]
        }
        else if CodecSpeed > 480 && CodecSpeed <= 720 {
            CanonCinemaMedia = ["SD V90 128GB","SD V90 256GB","SD V90 512GB"]
        }
    }
    
    else if cameradata.CameraName == "CinemaEOS R5C" {
        if CodecSpeed <= 270 {
            CanonCinemaMedia = ["SD V30 128GB","SD V30 256GB","SD V30 512GB","SD V60 128GB","SD V60 256GB","SD V60 512GB","SD V90 128GB","SD V90 256GB","SD V90 512GB","CFExpress TypeB 256GB","CFExpress TypeB 512GB","CFExpress TypeB 1TB","CFExpress TypeB 2TB"]
        }
        else if CodecSpeed > 270 && CodecSpeed <= 480 {
            CanonCinemaMedia = ["SD V60 128GB","SD V60 256GB","SD V60 512GB","SD V90 128GB","SD V90 256GB","SD V90 512GB","CFExpress TypeB 256GB","CFExpress TypeB 512GB","CFExpress TypeB 1TB","CFExpress TypeB 2TB"]
        }
        else if CodecSpeed > 480 && CodecSpeed <= 720 {
            CanonCinemaMedia = ["SD V90 128GB","SD V90 256GB","SD V90 512GB","CFExpress TypeB 256GB","CFExpress TypeB 512GB","CFExpress TypeB 1TB","CFExpress TypeB 2TB"]
        }
        else if CodecSpeed > 720 {
            CanonCinemaMedia = ["CFExpress TypeB 256GB","CFExpress TypeB 512GB","CFExpress TypeB 1TB","CFExpress TypeB 2TB"]
        }
    }
    
    else if cameradata.CameraName == "CinemaEOS C500 Mark2" || cameradata.CameraName == "CinemaEOS C300 Mark3" || cameradata.CameraName == "CinemaEOS C400" {
        CanonCinemaMedia = ["CFExpress TypeB 128GB","CFExpress TypeB 256GB","CFExpress TypeB 330GB","CFExpress TypeB 512GB","CFExpress TypeB 660GB","CFExpress TypeB 1TB","CFExpress TypeB 1.3TB","CFExpress TypeB 2TB"]
    }
    
    else {
        CanonCinemaMedia = ["无选项"]
    }
    
    return CanonCinemaMedia
}
