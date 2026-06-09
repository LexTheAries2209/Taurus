//
//  DjiMedia.swift
//  Taurus
//
//  Created by 吴坤城 on 6/9/24.
//

import Foundation

func DjiMedia(cameradata:CameraData) -> [String] {
    var DjiMedia = [""]
    if cameradata.CameraName == "Inspire 3" {
        DjiMedia = ["DJI PROSSD 1TB"]
    }
    else if cameradata.CameraName == "Ronin 4D[8K]" || cameradata.CameraName == "Ronin 4D[6K]" {
        if cameradata.Codec == "ProRes 4444 XQ" || cameradata.Codec == "ProRes RAW HQ" || cameradata.Codec == "ProRes RAW" {
            DjiMedia = ["DJI PROSSD 1TB"]
        }
        else if (cameradata.Codec == "ProRes 422 HQ" || cameradata.Codec == "ProRes 422 LT") && (cameradata.Resolution.contains("4K") || cameradata.Resolution.contains("2K")) && !(cameradata.Rate == "72.000" || cameradata.Rate == "75.000" || cameradata.Rate == "96.000" || cameradata.Rate == "100.000" || cameradata.Rate == "120.000") {
            DjiMedia = ["DJI PROSSD 1TB","[Output]SSD 512GB","[Output]SSD 1TB","[Output]SSD 2TB","CFExpress TypeB 256GB","CFExpress TypeB 512GB","CFExpress TypeB 1TB","CFExpress TypeB 2TB"]
        }
        else if ((cameradata.Codec == "ProRes 422 HQ" || cameradata.Codec == "ProRes 422 LT" || cameradata.Codec == "H.264(10bit 4:2:0)") && (cameradata.Resolution.contains("4K") || cameradata.Resolution.contains("2K"))) || ((cameradata.Resolution.contains("6K")) && (cameradata.Rate == "23.976" || cameradata.Rate == "24.000" || cameradata.Rate == "25.000" || cameradata.Rate == "29.970" || cameradata.Rate == "30.000")) {
            DjiMedia = ["DJI PROSSD 1TB","CFExpress TypeB 256GB","CFExpress TypeB 512GB","CFExpress TypeB 1TB","CFExpress TypeB 2TB"]
        }
        else {
            DjiMedia = ["DJI PROSSD 1TB"]
        }
    }
    else if cameradata.CameraName == "Pocket 3" {
        DjiMedia = ["microSD V30 128GB","microSD V30 256GB","microSD V30 512GB","microSD V30 1TB"]
    }
    else if cameradata.CameraName == "Pocket 4" || cameradata.CameraName == "Pocket 4p" {
        DjiMedia = ["Built-in 107GB","microSD V30 128GB","microSD V30 256GB","microSD V30 512GB","microSD V30 1TB"]
    }
    else {
        DjiMedia = ["无选项"]
    }
    return DjiMedia
}
