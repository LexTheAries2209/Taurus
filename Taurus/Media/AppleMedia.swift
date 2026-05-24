//
//  AppleMedia.swift
//  Taurus
//
//  Created by Codex on 5/25/26.
//

import Foundation

func AppleMedia(cameradata: CameraData) -> [String] {
    let media = MediaName[cameradata.CameraName] ?? ["无选项"]
    
    if isAppleExternalOnly(cameradata: cameradata) {
        return AppleOutputMedia(from: media)
    }
    
    if isAppleProResInternal128GBLimited(cameradata: cameradata) {
        let filteredMedia = media.filter { !$0.contains("Built-in 128GB") }
        return filteredMedia.isEmpty ? ["无选项"] : filteredMedia
    }
    
    return media
}

private func AppleOutputMedia(from media: [String]) -> [String] {
    let outputMedia = media.filter { $0.contains("[Output]") }
    return outputMedia.isEmpty ? ["无选项"] : outputMedia
}

private func isAppleExternalOnly(cameradata: CameraData) -> Bool {
    if cameradata.Codec == "ProRes RAW HQ" || cameradata.Codec == "ProRes RAW" {
        return true
    }
    
    if isAppleProResCodec(cameradata.Codec) && isAppleHighFrameRate(cameradata.Rate) {
        return true
    }
    
    return false
}

private func isAppleProResInternal128GBLimited(cameradata: CameraData) -> Bool {
    if !isAppleProResCodec(cameradata.Codec) {
        return false
    }
    
    if isAppleHighFrameRate(cameradata.Rate) {
        return true
    }
    
    return cameradata.Resolution != "1080p[1920*1080]" && cameradata.Resolution != "720p[1280*720]"
}

private func isAppleProResCodec(_ codec: String) -> Bool {
    return codec == "ProRes 422 HQ" || codec == "ProRes 422" || codec == "ProRes 422 LT" || codec == "ProRes 422 Proxy"
}

private func isAppleHighFrameRate(_ rate: String) -> Bool {
    return rate == "48.000" || rate == "50.000" || rate == "59.940" || rate == "60.000" || rate == "100.000" || rate == "119.880" || rate == "120.000"
}
