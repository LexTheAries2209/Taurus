//
//  FujiResolution.swift
//  Taurus
//
//  Created by Codex on 6/4/26.
//

import Foundation

func FujiResolution(cameradata:CameraData) -> [String] {
    let dci8K = "8K[8192*4320][17:9]"
    let uhd8K = "8K UHD[7680*4320][16:9]"
    let anamorphic8K = "8K[8192*2968][2.76:1]"
    let anamorphic8K2_39 = "8K[8080*3380][2.39:1]"
    let six3K = "6.3K[6382*3590][16:9]"
    let cine5_8K = "5.8K[5824*2436][2.39:1]"
    let cine5_4K = "5.4K[5440*2868][17:9]"
    let four8K3_2 = "4.8K[4776*3184][3:2]"
    let four8K16_9 = "4.8K[4776*2688][16:9]"
    let anamorphic4_6K = "4.6K[4664*3380][1.38:1]"
    let anamorphic4K = "4K[4040*3380][6:5]"
    let dci4K = "DCI 4K[4096*2160][17:9]"
    let uhd4K = "4K UHD[3840*2160][16:9]"
    let openGate4K = "4K[3840*2880][OG]"
    let dci2K = "DCI 2K[2048*1080][17:9]"
    let fhd = "FHD[1920*1080][16:9]"
    
    if cameradata.CameraName != "GFX ETERNA 55" {
        return ["无选项"]
    }
    
    switch cameradata.Format {
    case "GF" :
        return [dci8K, uhd8K, cine5_8K, openGate4K, dci4K, uhd4K, dci2K, fhd]
    case "PREMISTA" :
        return [dci8K, uhd8K, cine5_4K, dci4K, uhd4K, dci2K, fhd]
    case "35MM" :
        return [dci8K, uhd8K, four8K3_2, four8K16_9, dci4K, uhd4K, dci2K, fhd]
    case "ANAMORPHIC (35MM)" :
        return [anamorphic8K, anamorphic8K2_39, anamorphic4_6K, anamorphic4K, dci8K, uhd8K, four8K3_2, four8K16_9, dci4K, uhd4K, dci2K, fhd]
    case "SUPER35" :
        return [six3K, dci4K, uhd4K, dci2K, fhd]
    default :
        return ["无选项"]
    }
}
