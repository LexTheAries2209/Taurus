//
//  AppleRate.swift
//  Taurus
//
//  Created by 吴坤城 on 5/10/24.
//

import Foundation

func AppleRate(cameradata:CameraData) -> [String] {
    var rates: [String] = []
    
    if cameradata.BrandName == "Apple" {
        if cameradata.Codec == "ProRes RAW HQ" || cameradata.Codec == "ProRes RAW" {
            if cameradata.Resolution == "Open Gate[4224*3024]" {
                rates = ["23.976","24.000","25.000","29.970","30.000","50.000","59.940","60.000"]
            }
            else if cameradata.Resolution == "4.2K[4224*2240][17:9]" {
                rates = ["23.976","24.000","25.000","29.970","30.000","50.000","59.940","60.000","100.000","119.880","120.000"]
            }
            else {
                rates = ["无选项"]
            }
        }
        else if cameradata.Codec.contains("ProRes") {
            if cameradata.Resolution.contains("Open Gate") {
                rates = ["23.976","24.000","25.000","29.970","30.000"]
            }
            else if cameradata.Resolution == "4K[3840*2160]" {
                if cameradata.Media.contains("[Output]") {
                    if cameradata.CameraName.contains("17") || cameradata.CameraName.contains("16") {
                        rates = ["23.976","24.000","25.000","29.970","30.000","50.000","59.940","60.000","100.000","119.880","120.000"]
                    }
                    else {
                        rates = ["23.976","24.000","25.000","29.970","30.000","50.000","59.940","60.000"]
                    }
                }
                else {
                    rates = ["23.976","24.000","25.000","29.970","30.000"]
                }
            }
            else if cameradata.Resolution == "1080p[1920*1080]" && cameradata.Media.contains("Built-in 128GB") {
                rates = ["23.976","24.000","25.000","29.970","30.000"]
            }
            else {
                rates = ["23.976","24.000","25.000","29.970","30.000","50.000","59.940","60.000"]
            }
        }
        else if cameradata.Resolution.contains("Open Gate") {
            rates = ["23.976","24.000","25.000","29.970","30.000"]
        }
        else if cameradata.Codec == "H.265 (54 Mbps)" || cameradata.Codec == "H.264 (54 Mbps)" {
            if cameradata.Resolution == "720p[1280*720]" {
                rates = ["23.976","24.000","25.000","29.970","30.000"]
            }
            else if cameradata.Resolution == "1080p[1920*1080]" {
                rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000","100.000","119.880","120.000","200.000","240.000"]
            }
            else if cameradata.Resolution == "4K[3840*2160]" {
                if cameradata.CameraName.contains("17") || cameradata.CameraName.contains("16") {
                    rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000","100.000","119.880","120.000"]
                }
                else {
                    rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000"]
                }
            }
            else {
                rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000","100.000","119.880","120.000"]
            }
        }
        else {
            rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000","100.000","119.880","120.000"]
        }
    }
    else {
        rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000","100.000","119.880","120.000"]
    }
    return rates
}
