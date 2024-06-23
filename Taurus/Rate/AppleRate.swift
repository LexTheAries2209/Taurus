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
        rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000"]
    }
    return rates
}
