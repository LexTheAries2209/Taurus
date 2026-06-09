//
//  PanaMedia.swift
//  Taurus
//
//  Created by 吴坤城 on 5/10/24.
//

import Foundation

func PanaMedia(cameradata:CameraData) -> [String] {
    var PanaMedia = [""]
    let CodecSpeed = PanaCodecSpeed(cameradata: cameradata)

    if cameradata.CameraName == "EVA1" {
        if CodecSpeed <= 150 {
            PanaMedia = ["SD V30 128GB","SD V30 256GB","SD V30 512GB","SD V60 128GB","SD V60 256GB","SD V60 512GB","SD V90 128GB","SD V90 256GB","SD V90 512GB"]
        }
        else if CodecSpeed <= 400 {
            PanaMedia = ["SD V60 128GB","SD V60 256GB","SD V60 512GB","SD V90 128GB","SD V90 256GB","SD V90 512GB"]
        }
    }

    else if cameradata.CameraName == "S1R2" || cameradata.CameraName == "S1M2" || cameradata.CameraName == "S1M2E" {
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
    
    else if cameradata.CameraName == "S5M2" || cameradata.CameraName == "S1H" || cameradata.CameraName == "S9" {
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
        if (cameradata.Codec != "ProRes 422 HQ" && cameradata.Codec != "ProRes 422") || ((cameradata.Codec == "ProRes 422 HQ" || cameradata.Codec == "ProRes 422") && (cameradata.Resolution == "FHD[10bit 4:2:2][23.976p]" || cameradata.Resolution == "FHD[10bit 4:2:2][24p]" || cameradata.Resolution == "FHD[10bit 4:2:2][25p]" || cameradata.Resolution == "FHD[10bit 4:2:2][29.97p]" || cameradata.Resolution == "FHD[10bit 4:2:2][50p]" || cameradata.Resolution == "FHD[10bit 4:2:2][59.94p]")) {
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
    
    else if cameradata.CameraName.contains("GH") {
        if cameradata.Codec != "ProRes 422 HQ" || cameradata.Codec != "ProRes 422" {
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
    
    else {
        PanaMedia = ["无选项"]
    }
    
    return PanaMedia
}
