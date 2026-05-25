//
//  CanonCinemaRate.swift
//  Taurus
//
//  Created by 吴坤城 on 6/9/24.
//

import Foundation

private let canonCinemaC50NormalRates = ["23.976","24.000","25.000","29.970","50.000","59.940"]
private let canonCinemaC50Normal30Rates = ["23.976","24.000","25.000","29.970"]
private let canonCinemaC50Normal60And120Rates = ["23.976","24.000","25.000","29.970","50.000","59.940","100.000","119.880"]
private let canonCinemaC50S16Rates = ["23.976","24.000","25.000","29.970","50.000","59.940","100.000","119.880","150.000"]

func CanonCinemaRate(cameradata:CameraData) -> [String] {
    var rates: [String] = []
    
    if cameradata.CameraName == "CinemaEOS C50" {
        if cameradata.Codec.contains("Cinema RAW Light") {
            if cameradata.Resolution.contains("7K FF[6960*4640]") {
                rates = canonCinemaC50Normal30Rates
            }
            else if cameradata.Resolution.contains("2.5K S16") {
                rates = canonCinemaC50S16Rates
            }
            else {
                rates = canonCinemaC50NormalRates
            }
        }
        else if cameradata.Codec == "XF-HEVC S Intra HQ" {
            rates = ["23.976","24.000"]
        }
        else if cameradata.Codec == "XF-HEVC S Intra ST" || cameradata.Codec == "XF-HEVC S Intra LT" || cameradata.Resolution.contains("7K FF[6912*4608]") {
            rates = canonCinemaC50Normal30Rates
        }
        else if cameradata.Resolution.contains("FFcrop") {
            rates = ["150.000","179.820"]
        }
        else if cameradata.Resolution.contains("S16") {
            rates = canonCinemaC50S16Rates
        }
        else if cameradata.Resolution.contains("S35") || cameradata.Resolution.contains("From 7K") || cameradata.Resolution.contains("From 3.5K") {
            rates = canonCinemaC50NormalRates
        }
        else if cameradata.Codec == "XF-AVC S Intra HQ" {
            rates = canonCinemaC50NormalRates
        }
        else if cameradata.Resolution.contains("4K") || cameradata.Resolution.contains("2K") || cameradata.Resolution.contains("FHD") {
            rates = canonCinemaC50Normal60And120Rates
        }
        else {
            rates = canonCinemaC50NormalRates
        }
    }
    
    else if cameradata.CameraName.contains("C70") {
        if cameradata.Codec.contains("ST") && cameradata.Resolution.contains("4K") {
            rates = ["23.976","24.000","25.000","29.970"]
        }
        else if cameradata.Resolution.contains("410mbps") {
            rates = ["23.976","24.000","25.000","29.970"]
        }
        else if cameradata.Resolution == "HD S35[10bit 4:2:2]" || cameradata.Resolution == "HD S16[10bit 4:2:2]" {
            rates = ["50.000","59.940"]
        }
        else {
            rates = ["23.976","24.000","25.000","29.970","50.000","59.940"]
        }
        
    }
    
    else if cameradata.CameraName.contains("R5C") {
        if (cameradata.Codec.contains("ST") && cameradata.Resolution.contains("8K")) || (cameradata.Codec.contains("HQ") && cameradata.Resolution.contains("6K")) {
            rates = ["23.976","24.000","25.000","29.970"]
        }
        else if cameradata.Resolution == "HD FF[10bit 4:2:2]" || cameradata.Resolution == "HD S35[10bit 4:2:2]" || cameradata.Resolution == "HD S16[10bit 4:2:2]" {
            rates = ["50.000","59.940"]
        }
        else {
            rates = ["23.976","24.000","25.000","29.970","50.000","59.940"]
        }
    }
    
    else if cameradata.CameraName.contains("C500 Mark2") {
        if cameradata.Codec == "Cinema RAW Light" && cameradata.Resolution.contains("10bit") {
            rates = ["50.000","59.940"]
        }
        else if cameradata.Codec == "Cinema RAW Light" && cameradata.Resolution.contains("12bit") {
            rates = ["23.976","24.000","25.000","29.970"]
        }
        else if cameradata.Codec.contains("HQ") && cameradata.Resolution.contains("FF")  {
            rates = ["23.976","24.000","25.000","29.970"]
        }
        else if cameradata.Resolution == "HD FF[10bit 4:2:2]" || cameradata.Resolution == "HD S35[10bit 4:2:2]" || cameradata.Resolution == "HD S16[10bit 4:2:2]" {
            rates = ["50.000","59.940"]
        }
        else {
            rates = ["23.976","24.000","25.000","29.970","50.000","59.940"]
        }
    }
    
    else if cameradata.CameraName.contains("C300 Mark3") {
        if cameradata.Codec == "Cinema RAW Light" && cameradata.Resolution.contains("10bit") {
            rates = ["50.000","59.940"]
        }
        else if cameradata.Codec == "Cinema RAW Light" && cameradata.Resolution.contains("12bit") {
            rates = ["23.976","24.000","25.000","29.970"]
        }
        else if cameradata.Resolution == "HD FF[10bit 4:2:2]" || cameradata.Resolution == "HD S35[10bit 4:2:2]" || cameradata.Resolution == "HD S16[10bit 4:2:2]" {
            rates = ["50.000","59.940"]
        }
        else {
            rates = ["23.976","24.000","25.000","29.970","50.000","59.940"]
        }
    }
    
    else if cameradata.CameraName.contains("C400") {
        if cameradata.Codec.contains("HQ") && cameradata.Resolution.contains("6K") {
            rates = ["23.976","24.000","25.000","29.970"]
        }
        else {
            rates = ["23.976","24.000","25.000","29.970","50.000","59.940"]
        }
    }
    
    else if cameradata.CameraName.contains("C80") {
        if cameradata.Codec.contains("RAW") && (cameradata.Resolution.contains("6K") || cameradata.Codec.contains("ST")) {
            rates = ["23.976","24.000","25.000","29.970"]
        }
        else {
            rates = ["23.976","24.000","25.000","29.970","50.000","59.940"]
        }
    }
    
    else  {
        rates = ["无选项"]
    }
    return rates
}
