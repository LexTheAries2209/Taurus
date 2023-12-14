//
//  func_SonyMedia.swift
//  Taurus
//
//  Created by 吴坤城 on 12/14/23.
//

import Foundation

func SonyMedia(cameradata:CameraData) -> [String] {
    var SonyMedia = [""]
    let CodecSpeed = SonyCodecSpeed(cameradata: cameradata)
    if cameradata.CameraName == "Alpha 1" || cameradata.CameraName == "A9M3" || cameradata.CameraName == "A7M4" || cameradata.CameraName == "A7S3" || cameradata.CameraName == "FX 3" || cameradata.CameraName == "FX 30" || cameradata.CameraName == "A7R5" {
        if CodecSpeed <= 270 {
            SonyMedia = ["SD V30 128GB","SD V30 256GB","SD V30 512GB","SD V60 128GB","SD V60 256GB","SD V60 512GB","SD V90 128GB","SD V90 256GB","SD V90 512GB","CFExpress TypeA 80GB","CFExpress TypeA 160GB","CFExpress TypeA 320GB","CFExpress TypeA 640GB","CFExpress TypeA 960GB","CFExpress TypeA 1920GB"]
        }
        else if CodecSpeed > 270 && CodecSpeed <= 480 {
            SonyMedia = ["SD V60 128GB","SD V60 256GB","SD V60 512GB","SD V90 128GB","SD V90 256GB","SD V90 512GB","CFExpress TypeA 80GB","CFExpress TypeA 160GB","CFExpress TypeA 320GB","CFExpress TypeA 640GB","CFExpress TypeA 960GB","CFExpress TypeA 1920GB"]
        }
        else if CodecSpeed > 480 && CodecSpeed <= 720 {
            SonyMedia = ["SD V90 128GB","SD V90 256GB","SD V90 512GB","CFExpress TypeA 80GB","CFExpress TypeA 160GB","CFExpress TypeA 320GB","CFExpress TypeA 640GB","CFExpress TypeA 960GB","CFExpress TypeA 1920GB"]
        }
        else if CodecSpeed > 720 {
            SonyMedia = ["CFExpress TypeA 80GB","CFExpress TypeA 160GB","CFExpress TypeA 320GB","CFExpress TypeA 640GB","CFExpress TypeA 960GB","CFExpress TypeA 1920GB"]
        }
    }
    else if cameradata.CameraName == "A7C2" || cameradata.CameraName == "A7CR" {
        if CodecSpeed <= 270 {
            SonyMedia = ["SD V30 128GB","SD V30 256GB","SD V30 512GB","SD V60 128GB","SD V60 256GB","SD V60 512GB","SD V90 128GB","SD V90 256GB","SD V90 512GB"]
        }
        else if CodecSpeed > 270 && CodecSpeed <= 480 {
            SonyMedia = ["SD V60 128GB","SD V60 256GB","SD V60 512GB","SD V90 128GB","SD V90 256GB","SD V90 512GB"]
        }
        else if CodecSpeed > 480 && CodecSpeed <= 720 {
            SonyMedia = ["SD V90 128GB","SD V90 256GB","SD V90 512GB"]
        }
    }
    else if cameradata.CameraName == "FX 6" {
            SonyMedia = ["CFExpress TypeA 80GB","CFExpress TypeA 160GB","CFExpress TypeA 320GB","CFExpress TypeA 640GB","CFExpress TypeA 960GB","CFExpress TypeA 1920GB"]
    }
    else if cameradata.CameraName == "FX 9" {
            SonyMedia = ["XQD 120GB","XQD 128GB","XQD 240GB","XQD 256GB"]
    }
    else if cameradata.CameraName == "Cinealta Burano" {
            SonyMedia = ["CFExpress TypeB 128GB","CFExpress TypeB 256GB","CFExpress TypeB 330GB","CFExpress TypeB 512GB","CFExpress TypeB 660GB","CFExpress TypeB 1TB","CFExpress TypeB 1.3TB","CFExpress TypeB 2TB"]
    }
    else if cameradata.CameraName == "Cinealta Venice 2[8K]" || cameradata.CameraName == "Cinealta Venice 2[6K]" {
            SonyMedia = ["AXS S24 256GB","AXS S24 512GB","AXS S24 1TB","AXS S48 512GB","AXS S48 1TB","AXS S66 1TB"]
    }
    else if cameradata.CameraName == "Cinealta Venice"  {
            SonyMedia = ["SxS Pro+ 128GB","SxS Pro+ 256GB","SxS Pro-X 120GB","SxS Pro-X 240GB","AXS S24 256GB","AXS S24 512GB","AXS S24 1TB","AXS S48 512GB","AXS S48 1TB","AXS S66 1TB","XQD 120GB","XQD 128GB","XQD 240GB","XQD 256GB"]
    }
    else {
        SonyMedia = [""]
    }
    return SonyMedia
}
