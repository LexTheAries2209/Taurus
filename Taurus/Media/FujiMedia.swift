//
//  FujiMedia.swift
//  Taurus
//
//  Created by Codex on 6/4/26.
//

import Foundation

func FujiMedia(cameradata:CameraData) -> [String] {
    let cfb = ["CFExpress TypeB 256GB","CFExpress TypeB 330GB","CFExpress TypeB 512GB","CFExpress TypeB 660GB","CFExpress TypeB 1TB","CFExpress TypeB 1.3TB","CFExpress TypeB 2TB"]
    let ssd = ["[Output]SSD 1TB","[Output]SSD 2TB","[Output]SSD 4TB"]
    
    switch cameradata.Codec {
    case "ProRes 422 HQ","ProRes 422","ProRes 422 LT" :
        return cfb + ssd
    case "H.265 ALL-I" :
        return cfb + ssd
    case "H.265 LongGOP" :
        return cfb + ssd
    default :
        return ["无选项"]
    }
}
