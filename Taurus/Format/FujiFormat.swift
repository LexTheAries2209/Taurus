//
//  FujiFormat.swift
//  Taurus
//
//  Created by Codex on 6/4/26.
//

import Foundation

func FujiFormat(cameradata:CameraData) -> [String] {
    if cameradata.CameraName == "GFX ETERNA 55" {
        return ["GF","PREMISTA","35MM","ANAMORPHIC (35MM)","SUPER35"]
    }
    else {
        return [""]
    }
}
