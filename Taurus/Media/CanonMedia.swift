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
    
    if cameradata.CameraName == "EOS R5" || cameradata.CameraName == "EOS R3" || cameradata.CameraName == "EOS R5C" || cameradata.CameraName == "EOS R5 Mark2" {
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
    
    else if cameradata.CameraName == "EOS R6 Mark2" || cameradata.CameraName == "EOS R8" || cameradata.CameraName == "EOS R7" || cameradata.CameraName == "EOS R6" {
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
    
    else if cameradata.CameraName == "CinemaEOS C500 Mark2" || cameradata.CameraName == "CinemaEOS C300 Mark3" || cameradata.CameraName == "CinemaEOS C400" || cameradata.CameraName == "EOS R1" {
        CanonMedia = ["CFExpress TypeB 128GB","CFExpress TypeB 256GB","CFExpress TypeB 330GB","CFExpress TypeB 512GB","CFExpress TypeB 660GB","CFExpress TypeB 1TB","CFExpress TypeB 1.3TB","CFExpress TypeB 2TB"]
    }
    
    else {
        CanonMedia = ["无选项"]
    }
    return CanonMedia
}
