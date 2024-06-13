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
    else {
        DjiMedia = ["无选项"]
    }
    return DjiMedia
}
