//
//  FujiRate.swift
//  Taurus
//
//  Created by Codex on 6/4/26.
//

import Foundation

func FujiRate(cameradata:CameraData) -> [String] {
    let p24 = ["23.976","24.000"]
    let p30 = p24 + ["25.000","29.970"]
    let p48 = p30 + ["47.950","48.000"]
    let p60 = p48 + ["50.000","59.940"]
    let p120 = p60 + ["100.000","119.880"]
    
    switch (cameradata.Format, cameradata.Resolution) {
    case ("GF", "8K[8192*4320][17:9]"),
         ("PREMISTA", "8K[8192*4320][17:9]"),
         ("35MM", "8K[8192*4320][17:9]"),
         ("35MM", "4.8K[4776*3184][3:2]"),
         ("ANAMORPHIC (35MM)", "8K[8192*2968][2.76:1]"),
         ("ANAMORPHIC (35MM)", "8K[8080*3380][2.39:1]"),
         ("ANAMORPHIC (35MM)", "4.6K[4664*3380][1.38:1]"),
         ("ANAMORPHIC (35MM)", "4K[4040*3380][6:5]"),
         ("ANAMORPHIC (35MM)", "4.8K[4776*3184][3:2]") :
        return p24
    case ("GF", "8K UHD[7680*4320][16:9]"),
         ("GF", "5.8K[5824*2436][2.39:1]"),
         ("PREMISTA", "8K UHD[7680*4320][16:9]"),
         ("PREMISTA", "5.4K[5440*2868][17:9]"),
         ("35MM", "8K UHD[7680*4320][16:9]"),
         ("35MM", "4.8K[4776*2688][16:9]"),
         ("35MM", "4K UHD[3840*2160][16:9]"),
         ("35MM", "DCI 4K[4096*2160][17:9]"),
         ("ANAMORPHIC (35MM)", "8K UHD[7680*4320][16:9]"),
         ("ANAMORPHIC (35MM)", "8K[8192*4320][17:9]"),
         ("ANAMORPHIC (35MM)", "4.8K[4776*2688][16:9]"),
         ("ANAMORPHIC (35MM)", "4K UHD[3840*2160][16:9]"),
         ("ANAMORPHIC (35MM)", "DCI 4K[4096*2160][17:9]"),
         ("SUPER35", "6.3K[6382*3590][16:9]"),
         ("SUPER35", "4K UHD[3840*2160][16:9]"),
         ("SUPER35", "DCI 4K[4096*2160][17:9]") :
        return p30
    case ("GF", "4K[3840*2880][OG]") :
        return p48
    case ("GF", "DCI 4K[4096*2160][17:9]"),
         ("GF", "4K UHD[3840*2160][16:9]"),
         ("PREMISTA", "DCI 4K[4096*2160][17:9]"),
         ("PREMISTA", "4K UHD[3840*2160][16:9]"),
         ("35MM", "FHD[1920*1080][16:9]"),
         ("35MM", "DCI 2K[2048*1080][17:9]"),
         ("ANAMORPHIC (35MM)", "FHD[1920*1080][16:9]"),
         ("ANAMORPHIC (35MM)", "DCI 2K[2048*1080][17:9]"),
         ("SUPER35", "FHD[1920*1080][16:9]"),
         ("SUPER35", "DCI 2K[2048*1080][17:9]") :
        return p60
    case ("GF", "FHD[1920*1080][16:9]"),
         ("GF", "DCI 2K[2048*1080][17:9]"),
         ("PREMISTA", "FHD[1920*1080][16:9]"),
         ("PREMISTA", "DCI 2K[2048*1080][17:9]") :
        return p120
    default :
        return ["无选项"]
    }
}
