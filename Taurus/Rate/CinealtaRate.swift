//
//  SonyRate.swift
//  Taurus
//
//  Created by 吴坤城 on 5/10/24.
//

import Foundation

func CinealtaRate(cameradata:CameraData) -> [String] {
    var rates: [String] = []
    
    //CineAlta
        if cameradata.CameraName == "CineAlta Burano" {
            if cameradata.Resolution == "8.6K FF[8632*4856][17:9]"{
                rates = ["23.980","24.000","25.000","29.970"]
            }
            else if cameradata.Resolution == "8.6K FF[8632*4552][16:9]" {
                rates = ["23.980","25.000","29.970"]
            }
            else if cameradata.Resolution == "6K FFcrop[6052*3404][17:9]" || cameradata.Resolution == "5.8K S35[5760*3240][17:9]" {
                rates = ["23.980","24.000","25.000","29.970","50.000","59.940"]
            }
            else if cameradata.Resolution == "4K S35crop[4096*2160][17:9]" {
                rates = ["23.980","24.000","25.000","29.970","50.000","59.940","100.000","120.000"]
            }
            else if cameradata.Resolution == "6K FFcrop[6052*3192][16:9]" || cameradata.Resolution == "5.8K S35[5760*3036][16:9]" {
                rates = ["23.980","25.000","29.970","50.000","59.940"]
            }
            else {
                rates = [""]
            }
        }
        else if cameradata.CameraName == "CineAlta Venice 2[8K]" {
            if cameradata.Codec == "X-OCN XT" {
                if cameradata.Resolution == "8.6K FF[8640*4556][17:9]" || cameradata.Resolution == "8.1K FF[8100*4556][16:9]" || cameradata.Resolution == "8.2K FF[8192*4320][17:9]" || cameradata.Resolution == "7.6K FF[7680*4320][16:9]" {
                    rates = ["23.980","24.000","25.000","29.970","30.000"]
                }
                else if cameradata.Resolution == "8.2K FF[8192*3432][2.39:1]" {
                    rates = ["23.980","24.000","25.000","29.970","30.000","47.950","48.000","50.000"]
                }
                else if cameradata.Resolution == "5.8K S35[5792*3056][17:9]" || cameradata.Resolution == "5.4K S35[5434*3056][16:9]" {
                    rates = ["23.980","24.000","25.000","29.970","30.000","47.950","48.000","50.000","59.940","60.000","66.000","72.000","75.000"]
                }
                else if cameradata.Resolution == "5.5K S35[5480*2296][2.39:1]" {
                    rates = ["23.980","24.000","25.000","29.970","30.000","47.950","48.000","50.000","59.940","60.000","66.000","72.000","75.000","88.000","90.000","96.000","100.000","110.000"]
                }
                else if cameradata.Resolution == "8.6K FF[8640*5760][3:2]" {
                    rates = ["23.980","24.000","25.000","29.970"]
                }
                else if cameradata.Resolution == "5.8K S35[5792*5854][6:5 ANA]" {
                    rates = ["23.980","24.000","25.000","29.970","30.000","47.950","48.000"]
                }
                else if cameradata.Resolution == "5.8K S35[5792*4276][4:3 ANA]" {
                    rates = ["23.980","24.000","25.000","29.970","30.000","47.950","48.000","50.000","59.940","60.000"]
                }
                else {
                    rates = [""]
                }
            }
            else if cameradata.Codec == "X-OCN ST" || cameradata.Codec == "X-OCN LT" {
                if cameradata.Resolution == "8.6K FF[8640*4556][17:9]" || cameradata.Resolution == "8.1K FF[8100*4556][16:9]" {
                    rates = ["23.980","24.000","25.000","29.970","30.000","47.950","48.000"]
                }
                else if cameradata.Resolution == "8.2K FF[8192*4320][17:9]" || cameradata.Resolution == "7.6K FF[7680*4320][16:9]" {
                    rates = ["23.980","24.000","25.000","29.970","30.000","47.950","48.000","50.000","59.940","60.000"]
                }
                else if cameradata.Resolution == "8.2K FF[8192*3432][2.39:1]" {
                    rates = ["23.980","24.000","25.000","29.970","30.000","47.950","48.000","50.000","59.940","60.000","66.000","72.000"]
                }
                else if cameradata.Resolution == "5.8K S35[5792*3056][17:9]" || cameradata.Resolution == "5.4K S35[5434*3056][16:9]" {
                    rates = ["23.980","24.000","25.000","29.970","30.000","47.950","48.000","50.000","59.940","60.000","66.000","72.000","75.000","88.000","90.000"]
                }
                else if cameradata.Resolution == "5.5K S35[5480*2296][2.39:1]" {
                    rates = ["23.980","24.000","25.000","29.970","30.000","47.950","48.000","50.000","59.940","60.000","66.000","72.000","75.000","88.000","90.000","96.000","100.000","110.000","120.000"]
                }
                else if cameradata.Resolution == "8.6K FF[8640*5760][3:2]" {
                    rates = ["23.980","24.000","25.000","29.970"]
                }
                else if cameradata.Resolution == "5.8K S35[5792*5854][6:5 ANA]" {
                    rates = ["23.980","24.000","25.000","29.970","30.000","47.950","48.000"]
                }
                else if cameradata.Resolution == "5.8K S35[5792*4276][4:3 ANA]" {
                    rates = ["23.980","24.000","25.000","29.970","30.000","47.950","48.000","50.000","59.940","60.000"]
                }
                else {
                    rates = [""]
                }
            }
            else {
                rates = [""]
            }
        }
        else if cameradata.CameraName == "CineAlta Venice 2[6K]" || cameradata.CameraName == "CineAlta Venice" {
            if cameradata.Resolution == "6K FF[6048*4032][3:2]" {
                rates = ["23.980","24.000","25.000","29.970","30.000","47.950","48.000","50.000","59.940","60.000"]
            }
            else if cameradata.Resolution == "6K FF[6054*3272][1.85:1]" || cameradata.Resolution == "6K FF[6054*3192][17:9]" || cameradata.Resolution == "5.7K FF[5674*3192][17:9]" || cameradata.Resolution == "4K S35[4096*3432][6:5 ANA]" {
                rates = ["23.980","24.000","25.000","29.970","30.000","47.950","48.000","50.000","59.940","60.000","66.000","72.000"]
            }
            else if cameradata.Resolution == "4K S35[4096*3024][4:3 ANA]" {
                rates = ["23.980","24.000","25.000","29.970","30.000","47.950","48.000","50.000","59.940","60.000","66.000","72.000","75.000"]
            }
            else if cameradata.Resolution == "6K FF[6054*2534][2.39:1]" {
                rates = ["23.980","24.000","25.000","29.970","30.000","47.950","48.000","50.000","59.940","60.000","66.000","72.000","75.000","88.000","90.000"]
            }
            else if cameradata.Resolution == "4K S35[4096*2160][17:9]" || cameradata.Resolution == "3.8K S35[3840*2160][16:9]" {
                rates = ["23.980","24.000","25.000","29.970","30.000","47.950","48.000","50.000","59.940","60.000","66.000","72.000","75.000","88.000","90.000","96.000","100.000","110.000"]
            }
            else if cameradata.Resolution == "4K S35[4096*1716][2.39:1]" {
                rates = ["23.980","24.000","25.000","29.970","30.000","47.950","48.000","50.000","59.940","60.000","66.000","72.000","75.000","88.000","90.000","96.000","100.000","110.000","120.000"]
            }
            else {
                rates = [""]
            }
        }
    else {
        rates = [""]
    }
    
    return rates
}
