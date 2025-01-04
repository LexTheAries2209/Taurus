//
//  AppleResolution.swift
//  Taurus
//
//  Created by 吴坤城 on 5/11/24.
//

import Foundation

func AppleResolution(cameradata:CameraData) -> [String] {
    
    var resolutions: [String] = []
    
    if cameradata.BrandName == "Apple" {
        
            let key = cameradata.CameraName + "_" + cameradata.Codec
            
            let AppleResolutions: [String: [String]] = [
                "iPhone 16 Pro MAX_ProRes 422 HQ" : ["UHD","FHD","HD"],
                "iPhone 16 Pro MAX_ProRes 422" : ["UHD","FHD","HD"],
                "iPhone 16 Pro MAX_ProRes 422 LT" : ["UHD","FHD","HD"],
                "iPhone 16 Pro MAX_ProRes 422 Proxy" : ["UHD","FHD","HD"],
                "iPhone 16 Pro_ProRes 422 HQ" : ["UHD","FHD","HD"],
                "iPhone 16 Pro_ProRes 422" : ["UHD","FHD","HD"],
                "iPhone 16 Pro_ProRes 422 LT" : ["UHD","FHD","HD"],
                "iPhone 16 Pro_ProRes 422 Proxy" : ["UHD","FHD","HD"],
                "iPhone 15 Pro MAX_ProRes 422 HQ" : ["UHD","FHD","HD"],
                "iPhone 15 Pro MAX_ProRes 422" : ["UHD","FHD","HD"],
                "iPhone 15 Pro MAX_ProRes 422 LT" : ["UHD","FHD","HD"],
                "iPhone 15 Pro MAX_ProRes 422 Proxy" : ["UHD","FHD","HD"],
                "iPhone 15 Pro_ProRes 422 HQ" : ["UHD","FHD","HD"],
                "iPhone 15 Pro_ProRes 422" : ["UHD","FHD","HD"],
                "iPhone 15 Pro_ProRes 422 LT" : ["UHD","FHD","HD"],
                "iPhone 15 Pro_ProRes 422 Proxy" : ["UHD","FHD","HD"],
                "iPhone 14 Pro MAX_ProRes 422 HQ" : ["UHD","FHD","HD"],
                "iPhone 14 Pro MAX_ProRes 422" : ["UHD","FHD","HD"],
                "iPhone 14 Pro MAX_ProRes 422 LT" : ["UHD","FHD","HD"],
                "iPhone 14 Pro MAX_ProRes 422 Proxy" : ["UHD","FHD","HD"],
                "iPhone 14 Pro_ProRes 422 HQ" : ["UHD","FHD","HD"],
                "iPhone 14 Pro_ProRes 422" : ["UHD","FHD","HD"],
                "iPhone 14 Pro_ProRes 422 LT" : ["UHD","FHD","HD"],
                "iPhone 14 Pro_ProRes 422 Proxy" : ["UHD","FHD","HD"],
            ]
            resolutions = AppleResolutions[key, default: ["无选项"]]
        }

        return resolutions
    }
