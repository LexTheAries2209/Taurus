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
                "iPhone 17 Pro MAX_ProRes RAW" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 17 Pro MAX_ProRes 422 HQ" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 17 Pro MAX_ProRes 422" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 17 Pro MAX_ProRes 422 LT" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 17 Pro MAX_ProRes 422 Proxy" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 17 Pro MAX_H.265" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 17 Pro MAX_H.264" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 17 Pro_ProRes RAW" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 17 Pro_ProRes 422 HQ" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 17 Pro_ProRes 422" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 17 Pro_ProRes 422 LT" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 17 Pro_ProRes 422 Proxy" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 17 Pro_H.265" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 17 Pro_H.264" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 16 Pro MAX_ProRes 422 HQ" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 16 Pro MAX_ProRes 422" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 16 Pro MAX_ProRes 422 LT" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 16 Pro MAX_ProRes 422 Proxy" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 16 Pro MAX_H.265" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 16 Pro MAX_H.264" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 16 Pro_ProRes 422 HQ" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 16 Pro_ProRes 422" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 16 Pro_ProRes 422 LT" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 16 Pro_ProRes 422 Proxy" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 16 Pro_H.265" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 16 Pro_H.264" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 15 Pro MAX_ProRes 422 HQ" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 15 Pro MAX_ProRes 422" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 15 Pro MAX_ProRes 422 LT" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 15 Pro MAX_ProRes 422 Proxy" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 15 Pro MAX_H.265" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 15 Pro MAX_H.264" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 15 Pro_ProRes 422 HQ" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 15 Pro_ProRes 422" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 15 Pro_ProRes 422 LT" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 15 Pro_ProRes 422 Proxy" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 15 Pro_H.265" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 15 Pro_H.264" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 14 Pro MAX_ProRes 422 HQ" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 14 Pro MAX_ProRes 422" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 14 Pro MAX_ProRes 422 LT" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 14 Pro MAX_ProRes 422 Proxy" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 14 Pro MAX_H.265" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 14 Pro MAX_H.264" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 14 Pro_ProRes 422 HQ" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 14 Pro_ProRes 422" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 14 Pro_ProRes 422 LT" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 14 Pro_ProRes 422 Proxy" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 14 Pro_H.265" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
                "iPhone 14 Pro_H.264" : ["Open Gate","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"],
            ]
            resolutions = AppleResolutions[key, default: ["无选项"]]
        }

        return resolutions
    }
