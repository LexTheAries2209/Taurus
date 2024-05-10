//
//  SonyMedia.swift
//  Taurus
//
//  Created by 吴坤城 on 5/10/24.
//

import Foundation

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
