//
//  KinefinityFormat.swift
//  Taurus
//
//  Created by Codex on 6/4/26.
//

import Foundation

func KinefinityFormat(cameradata:CameraData) -> [String] {
    let formats = KinefinityFormatOptions(cameradata: cameradata)
    return formats.isEmpty ? [""] : formats
}

private func KinefinityFormatOptions(cameradata:CameraData) -> [String] {
    let modes = KinefinityCodecRecordingModes(cameradata: cameradata)
    let orderedFormats = ["FF", "S35", "M43", "S16", "Pixel to Pixel"]
    
    return orderedFormats.filter { format in
        modes.contains { KinefinityMode($0, matchesFormat: format) }
    }
}
