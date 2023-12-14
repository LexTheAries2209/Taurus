//
//  func_PanaMedia.swift
//  Taurus
//
//  Created by 吴坤城 on 12/14/23.
//

import Foundation

func PanaMedia(cameradata:CameraData) -> [String] {
    var PanaMedia = [""]
    let CodecSpeed = PanaCodecSpeed(cameradata: cameradata)
    
    if cameradata.CameraName == "S5M2" {
        if CodecSpeed <= 200 {
            PanaMedia = ["SD V30 128GB","SD V30 256GB","SD V30 512GB","SD V60 128GB","SD V60 256GB","SD V60 512GB","SD V90 128GB","SD V90 256GB","SD V90 512GB"]
        }
        if CodecSpeed > 200 && CodecSpeed <= 400 {
            PanaMedia = ["SD V60 128GB","SD V60 256GB","SD V60 512GB","SD V90 128GB","SD V90 256GB","SD V90 512GB"]
        }
        if CodecSpeed > 400 && CodecSpeed <= 600 {
            PanaMedia = ["SD V90 128GB","SD V90 256GB","SD V90 512GB"]
        }
    }
    else if cameradata.CameraName == "S5M2X" {
        if cameradata.Codec != "Prores 422 HQ" && cameradata.Codec != "Prores 422" {
            if CodecSpeed <= 200 {
                PanaMedia = ["SD V30 128GB","SD V30 256GB","SD V30 512GB","SD V60 128GB","SD V60 256GB","SD V60 512GB","SD V90 128GB","SD V90 256GB","SD V90 512GB","[Output]SSD 512GB","[Output]SSD 1TB","[Output]SSD 2TB"]
            }
            if CodecSpeed > 200 && CodecSpeed <= 400 {
                PanaMedia = ["SD V60 128GB","SD V60 256GB","SD V60 512GB","SD V90 128GB","SD V90 256GB","SD V90 512GB"]
            }
            if CodecSpeed > 400 && CodecSpeed <= 600 {
                PanaMedia = ["SD V90 128GB","SD V90 256GB","SD V90 512GB"]
            }
        }
        else {
            PanaMedia = ["[Output]SSD 512GB","[Output]SSD 1TB","[Output]SSD 2TB"]
        }
    }
    return PanaMedia
}
