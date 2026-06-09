//
//  NikonCount.swift
//  Taurus
//
//  Created by Codex on 6/9/26.
//

import Foundation

func NikonCodecSpeed(cameradata:CameraData) -> Double {
    return NikonRecordingModes(cameradata: cameradata).first(where: { $0.resolution == cameradata.Resolution })?.mbps ?? 0
}
