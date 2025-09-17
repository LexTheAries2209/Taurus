//
//  AppleRate.swift
//  Taurus
//
//  Created by 吴坤城 on 5/10/24.
//

import Foundation

func AppleRate(cameradata:CameraData) -> [String] {
    var rates: [String] = []
    
    if cameradata.BrandName == "Apple" && (cameradata.CameraName.contains("16") || cameradata.CameraName.contains("17")) {
        rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000","100.000","119.880","120.000"]
    }
    else {
        rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000"]
    }
    return rates
}
