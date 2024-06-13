//
//  DjiRate.swift
//  Taurus
//
//  Created by 吴坤城 on 5/10/24.
//

import Foundation

func DjiRate(cameradata:CameraData) -> [String] {
    var rates: [String] = []
    
    if cameradata.CameraName == "Ronin 4D[8K]" {
        if cameradata.Resolution == "4K FF[4096*2160][17:9]" {
            rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000","72.000","75.000","96.000","100.000","120.000"]
        }
        else if cameradata.Resolution == "8K FF[8192*4320][17:9]" && cameradata.Codec == "Prores 422 HQ" {
            rates = ["23.976","24.000","25.000","29.970","30.000"]
        }
        else if cameradata.Resolution == "8K FF[8192*4320][17:9]" || cameradata.Resolution == "5.5K S35[5568*2952][17:9]" || cameradata.Resolution == "4K S35[4096*2160][17:9]" {
            rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000"]
        }
        else if cameradata.Resolution == "8K FF[8192*3424][2.39:1]" && cameradata.Codec == "Prores RAW" {
            rates = ["72.000","75.000"]
        }
        else {
            rates = ["无选项"]
        }
    }
    else if cameradata.CameraName == "Ronin 4D[6K]" {
        if cameradata.Resolution == "6K FF[6008*3168][17:9]" || cameradata.Resolution == "4K FF[4096*2160][17:9]" {
            rates = ["23.976","24.000","25.000","29.970","30.000","48.000"]
        }
        else if cameradata.Resolution == "2K FF[2048*1080][17:9]" {
            rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000","72.000","75.000","96.000","100.000","120.000"]
        }
        else if cameradata.Resolution == "4K S35[4096*2160][17:9]" || cameradata.Resolution == "2K S35[2048*1080][17:9]" {
            rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000","72.000","75.000","96.000"]
        }
        else if cameradata.Resolution == "6K FFcrop[5952*3136][17:9]" || cameradata.Resolution == "4K FFcrop[4096*2160][17:9]" {
            rates = ["50.000"]
        }
        else if cameradata.Resolution == "4K FF[4096*1712][2.39:1]" || cameradata.Resolution == "4K S35[4096*1712][2.39:1]" {
            rates = ["100.000","120.000"]
        }
        else if cameradata.Resolution == "8K FF[8192*4320][17:9]" || cameradata.Resolution == "5.5K S35[5568*2952][17:9]" || cameradata.Resolution == "4K S35[8192*4320][17:9]" {
            rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000"]
        }
        else if cameradata.Resolution == "6K FF[6008*2512][2.39:1]" {
            rates = ["59.940","60.000"]
        }
        else {
            rates = ["无选项"]
        }
    }
    else if cameradata.CameraName == "Inspire 3" {
        if cameradata.Resolution == "8K FF[8192*4320][17:9]" || cameradata.Resolution == "8K FF[7680*4320][16:9]" || cameradata.Resolution == "8K FF[8192*3424][2.39:1]" {
            if cameradata.Codec == "CinemaDNG" {
                rates = ["23.976","24.000","25.000"]
            }
            else if cameradata.Codec == "Prores 422 HQ" {
                rates = ["23.976","24.000","25.000","29.970","30.000"]
            }
            else if cameradata.Codec == "Prores RAW" {
                if cameradata.Resolution != "8K FF[8192*3424][2.39:1]" {
                    rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000"]
                }
                else {
                    rates = ["72.000","75.000"]
                }
            }
            else {
                rates = ["无选项"]
            }
        }
        else if (cameradata.Resolution == "4K FF[4096*2160][17:9]" || cameradata.Resolution == "4K FF[3840*2160][16:9]") {
            if cameradata.Codec == "CinemaDNG" {
                rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000","72.000","75.000","96.000","100.000"]
            }
            else {
                rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000","72.000","75.000","96.000","100.000","119.88","120.000"]
            }
        }
        else if cameradata.Resolution == "4K S35[4096*2160][17:9]" || cameradata.Resolution == "4K S35[3840*2160][16:9]" {
            rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000"]
        }
        else if cameradata.Resolution == "5.5K S35[5248*2952]" || cameradata.Resolution == "5.5K S35[5568*2952][17:9]" {
            if cameradata.Codec == "CinemaDNG" {
                rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000"]
            }
            else {
                rates =  ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000"]
            }
        }
        else {
            rates = ["无选项"]
        }
    }
    else {
        rates = ["无选项"]
    }
    
    return rates
}
