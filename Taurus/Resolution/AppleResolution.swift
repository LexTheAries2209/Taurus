//
//  AppleResolution.swift
//  Taurus
//
//  Created by 吴坤城 on 5/11/24.
//

import Foundation

func AppleResolution(cameradata:CameraData) -> [String] {
    if cameradata.BrandName != "Apple" {
        return ["无选项"]
    }
    
    if isAppleProResRAW(cameradata) {
        if isAppleIPhone17Pro(cameradata.CameraName) {
            return ["Open Gate[4224*3024]","4.2K[4224*2240][17:9]"]
        }
        return ["无选项"]
    }
    
    if isAppleVideoCodec(cameradata.Codec) {
        if isAppleIPhone17Pro(cameradata.CameraName) {
            return ["Open Gate[4224*3024]","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"]
        }
        return ["Open Gate[4032*3024]","4K[3840*2160]","1080p[1920*1080]","720p[1280*720]"]
    }
    
    return ["无选项"]
}

private func isAppleIPhone17Pro(_ cameraName: String) -> Bool {
    return cameraName == "iPhone 17 Pro MAX" || cameraName == "iPhone 17 Pro"
}

private func isAppleProResRAW(_ cameradata: CameraData) -> Bool {
    return cameradata.Codec == "ProRes RAW HQ" || cameradata.Codec == "ProRes RAW"
}

private func isAppleVideoCodec(_ codec: String) -> Bool {
    return codec == "ProRes 422 HQ" || codec == "ProRes 422" || codec == "ProRes 422 LT" || codec == "ProRes 422 Proxy" || codec == "H.265 (54 Mbps)" || codec == "H.264 (54 Mbps)"
}
