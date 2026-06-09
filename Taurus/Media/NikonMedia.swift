//
//  NikonMedia.swift
//  Taurus
//
//  Created by Codex on 6/9/26.
//

import Foundation

func NikonMedia(cameradata:CameraData) -> [String] {
    switch cameradata.CameraName {
    case "ZR":
        return ["CFExpress TypeB 128GB","CFExpress TypeB 256GB","CFExpress TypeB 512GB","CFExpress TypeB 1TB","CFExpress TypeB 2TB","microSD V30 128GB","microSD V30 256GB","microSD V30 512GB","microSD V30 1TB"]
    case "Z9", "Z8", "Z 6III":
        return ["CFExpress TypeB 128GB","CFExpress TypeB 256GB","CFExpress TypeB 512GB","CFExpress TypeB 1TB","CFExpress TypeB 2TB"]
    default:
        return ["无选项"]
    }
}
