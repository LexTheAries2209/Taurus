//
//  DjiResolution.swift
//  Taurus
//
//  Created by 吴坤城 on 5/10/24.
//

import Foundation

func DjiResolution(cameradata:CameraData) -> [String] {
    var DjiResolution = [""]
    if cameradata.CameraName == "Ronin 4D[8K]" {
        if cameradata.Codec == "Prores RAW HQ" {
            DjiResolution = ["8K FF[8192*4320][17:9]","8K FF[8192*3424][2.39:1]","5.5K S35[5568*2952][17:9]","4K FF[4096*2160][17:9]"]
        }
        else if cameradata.Codec == "Prores 422 HQ" {
            DjiResolution = ["8K FF[8192*4320][17:9]","4K FF[4096*2160][17:9]","4K S35[4096*2160][17:9]"]
        }
        else if cameradata.Codec == "H.264(10bit 4:2:0)" {
            DjiResolution = ["4K FF[4096*2160][17:9]","4K S35[4096*2160][17:9]"]
        }
    }
    else if cameradata.CameraName == "Ronin 4D[6K]" {
        if cameradata.Codec == "Prores RAW HQ" {
            DjiResolution = ["6K FF[6008*3168][17:9]","6K FFcrop[5952*3136][17:9]","6K FF[6008*2512][2.39:1]","4K S35[4096*2160][17:9]","4K S35[4096*1712][2.39:1]"]
        }
        else if cameradata.Codec == "Prores 4444 XQ" {
            DjiResolution = ["6K FF[6008*3168][17:9]","6K FFcrop[5952*3136][17:9]","6K FF[6008*2512][2.39:1]","4K S35[4096*2160][17:9]","4K S35[4096*1712][2.39:1]"]
        }
        else if cameradata.Codec == "Prores 422 HQ" {
            DjiResolution = ["6K FF[6008*3168][17:9]","6K FFcrop[5952*3136][17:9]","6K FF[6008*2512][2.39:1]","4K FF[4096*2160][17:9]","4K FFcrop[4096*2160][17:9]","4K FF[4096*1712][2.39:1]","4K S35[4096*2160][17:9]","4K S35[4096*1712][2.39:1]","2K FF[2048*1080][17:9]","2K S35[2048*1080][17:9]"]
        }
        else if cameradata.Codec == "Prores 422 LT" {
            DjiResolution = ["6K FF[6008*3168][17:9]","6K FFcrop[5952*3136][17:9]","6K FF[6008*2512][2.39:1]","4K FF[4096*2160][17:9]","4K FFcrop[4096*2160][17:9]","4K FF[4096*1712][2.39:1]","4K S35[4096*2160][17:9]","4K S35[4096*1712][2.39:1]","2K FF[2048*1080][17:9]","2K S35[2048*1080][17:9]"]
        }
        else if cameradata.Codec == "H.264(10bit 4:2:0)" {
            DjiResolution = ["4K FF[4096*2160][17:9]","4K FFcrop[4096*2160][17:9]","4K FF[4096*1712][2.39:1]","4K S35[4096*2160][17:9]","4K S35[4096*1712][2.39:1]","2K FF[2048*1080][17:9]","2K S35[2048*1080][17:9]"]
        }
    }
    else if cameradata.CameraName == "Inspire 3" {
        if cameradata.Codec == "CinemaDNG" {
            DjiResolution = ["8K FF[8192*4320][17:9]","8K FF[8192*3424][2.39:1]","5.5K S35[5568*2952][17:9]","5.5K S35[5248*2952][16:9]","4K FF[4096*2160][17:9]","4K FF[3840*2160][16:9]"]
        }
        else if cameradata.Codec == "Prores RAW HQ" {
            DjiResolution = ["8K FF[8192*4320][17:9]","8K FF[7680*4320][16:9]","8K FF[8192*3424][2.39:1]","5.5K S35[5568*2952][17:9]","5.5K S35[5248*2952][16:9]","4K FF[4096*2160][17:9]","4K FF[3840*2160][16:9]"]
        }
        else if cameradata.Codec == "Prores 422 HQ" {
            DjiResolution = ["8K FF[8192*4320][17:9]","8K FF[7680*4320][16:9]","4K FF[4096*2160][17:9]","4K FF[3840*2160][16:9]","4K S35[4096*2160][17:9]","4K S35[3840*2160][16:9]"]
        }
        else if cameradata.Codec == "H.264(10bit 4:2:0)" {
            DjiResolution = ["4K FF[4096*2160][17:9]","4K FF[3840*2160][16:9]","4K S35[4096*2160][17:9]","4K S35[3840*2160][16:9]"]
        }
    }
    
    return DjiResolution
}
