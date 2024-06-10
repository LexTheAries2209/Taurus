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
        if cameradata.Codec.contains("ST") && (cameradata.Resolution.contains("4K") || cameradata.Resolution.contains("UHD")) {
            rates = ["23.980","24.000","25.000","29.970"]
        }
        else if cameradata.Codec.contains("RAW") {
            rates = ["23.980","24.000","25.000","29.970","50.000","59.940"]
        }
        else if cameradata.Resolution.contains("410mbps") {
            rates = ["23.980","24.000","25.000","29.970"]
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
