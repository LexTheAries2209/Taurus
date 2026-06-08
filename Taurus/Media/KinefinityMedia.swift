//
//  KinefinityMedia.swift
//  Taurus
//
//  Created by Codex on 6/4/26.
//

import Foundation

func KinefinityMedia(cameradata:CameraData) -> [String] {
    switch cameradata.CameraName {
    case "VISTA":
        return ["Built-in 220GB SSD", "CFExpress TypeB 128GB", "CFExpress TypeB 256GB", "CFExpress TypeB 512GB", "CFExpress TypeB 1TB", "CFExpress TypeB 2TB"]
    case "MAVO Edge 8K", "MAVO Edge 6K", "MAVO Mark2 LF", "MAVO Mark2 S35":
        return ["KineMAG Nano SSD 1TB", "KineMAG Nano SSD 2TB"]
    default:
        return ["无选项"]
    }
}
