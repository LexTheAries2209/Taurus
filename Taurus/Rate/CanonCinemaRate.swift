//
//  CanonCinemaRate.swift
//  Taurus
//
//  Created by 吴坤城 on 6/9/24.
//

import Foundation

func CanonCinemaRate(cameradata:CameraData) -> [String] {
    var rates: [String] = []
    
    if cameradata.CameraName.contains("C70") {
        if cameradata.Codec.contains("ST") && cameradata.Resolution.contains("4K") {
            rates = ["23.980","24.000","25.000","29.970"]
        }
        else if cameradata.Resolution.contains("410mbps") {
            rates = ["23.980","24.000","25.000","29.970"]
        }
        else if cameradata.Resolution == "HD S35[10bit 4:2:2]" || cameradata.Resolution == "HD S16[10bit 4:2:2]" {
            rates = ["50.000","59.940"]
        }
        else {
            rates = ["23.980","24.000","25.000","29.970","50.000","59.940"]
        }
        
    }
    
    else if cameradata.CameraName.contains("R5C") {
        if (cameradata.Codec.contains("ST") && cameradata.Resolution.contains("8K")) || (cameradata.Codec.contains("HQ") && cameradata.Resolution.contains("6K")) {
            rates = ["23.980","24.000","25.000","29.970"]
        }
        else if cameradata.Resolution == "HD FF[10bit 4:2:2]" || cameradata.Resolution == "HD S35[10bit 4:2:2]" || cameradata.Resolution == "HD S16[10bit 4:2:2]" {
            rates = ["50.000","59.940"]
        }
        else {
            rates = ["23.980","24.000","25.000","29.970","50.000","59.940"]
        }
    }
    
    else if cameradata.CameraName.contains("C500 Mark2") {
        if cameradata.Codec == "Cinema RAW Light" && cameradata.Resolution.contains("10bit") {
            rates = ["50.000","59.940"]
        }
        else if cameradata.Codec == "Cinema RAW Light" && cameradata.Resolution.contains("12bit") {
            rates = ["23.980","24.000","25.000","29.970"]
        }
        else if cameradata.Codec.contains("HQ") && cameradata.Resolution.contains("FF")  {
            rates = ["23.980","24.000","25.000","29.970"]
        }
        else if cameradata.Resolution == "HD FF[10bit 4:2:2]" || cameradata.Resolution == "HD S35[10bit 4:2:2]" || cameradata.Resolution == "HD S16[10bit 4:2:2]" {
            rates = ["50.000","59.940"]
        }
        else {
            rates = ["23.980","24.000","25.000","29.970","50.000","59.940"]
        }
    }
    
    else if cameradata.CameraName.contains("C300 Mark3") {
        if cameradata.Codec == "Cinema RAW Light" && cameradata.Resolution.contains("10bit") {
            rates = ["50.000","59.940"]
        }
        else if cameradata.Codec == "Cinema RAW Light" && cameradata.Resolution.contains("12bit") {
            rates = ["23.980","24.000","25.000","29.970"]
        }
        else if cameradata.Resolution == "HD FF[10bit 4:2:2]" || cameradata.Resolution == "HD S35[10bit 4:2:2]" || cameradata.Resolution == "HD S16[10bit 4:2:2]" {
            rates = ["50.000","59.940"]
        }
        else {
            rates = ["23.980","24.000","25.000","29.970","50.000","59.940"]
        }
    }
    
    else  {
        rates = [""]
    }
    return rates
}
