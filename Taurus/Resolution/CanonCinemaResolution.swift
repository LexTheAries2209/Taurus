//
//  CanonCinemaResolution.swift
//  Taurus
//
//  Created by 吴坤城 on 6/6/24.
//

import Foundation

func CanonCinemaResolution(cameradata:CameraData) -> [String] {
    
    var resolutions: [String] = []
    
    if cameradata.BrandName == "Canon Cinema" {
        
        let key = cameradata.CameraName + "_" + cameradata.Codec
        
        let CanonCinemaResolutions: [String: [String]] = [
            "CinemaEOS C400_Cinema RAW Light HQ" : ["6K FF[6000*3164][17:9]","4.3K S35[4368*2304][17:9]","4K S35[4096*2160][17:9]","2K S16[2184*1152][17:9]"],
            "CinemaEOS C400_Cinema RAW Light ST" : ["6K FF[6000*3164][17:9]","4.3K S35[4368*2304][17:9]","4K S35[4096*2160][17:9]","2K S16[2184*1152][17:9]"],
            "CinemaEOS C400_Cinema RAW Light LT" : ["6K FF[6000*3164][17:9]","4.3K S35[4368*2304][17:9]","4K S35[4096*2160][17:9]","2K S16[2184*1152][17:9]"],
            "CinemaEOS C400_XF-HEVC S LongGOP" : ["DCI 4K FF[10bit 4:2:2][From 6K]","DCI 4K FF[10bit 4:2:2]","DCI 4K S35[10bit 4:2:2]","UHD FF[10bit 4:2:2][From 6K]","UHD FF[10bit 4:2:2]","UHD S35[10bit 4:2:2]","DCI 2K FF[10bit 4:2:2]","DCI 2K S35[10bit 4:2:2]","DCI 2K S16[10bit 4:2:2]","FHD FF[10bit 4:2:2]","FHD S35[10bit 4:2:2]","FHD S16[10bit 4:2:2]","DCI 4K FF[10bit 4:2:0][From 6K]","DCI 4K FF[10bit 4:2:0]","DCI 4K S35[10bit 4:2:0]","UHD FF[10bit 4:2:0][From 6K]","UHD FF[10bit 4:2:0]","UHD S35[10bit 4:2:0]","DCI 2K FF[10bit 4:2:0]","DCI 2K S35[10bit 4:2:0]","DCI 2K S16[10bit 4:2:0]","FHD FF[10bit 4:2:0]","FHD S35[10bit 4:2:0]","FHD S16[10bit 4:2:0]"],
            "CinemaEOS C400_XF-AVC S Intra" : ["DCI 4K FF[10bit 4:2:2][From 6K]","DCI 4K FF[10bit 4:2:2]","DCI 4K S35[10bit 4:2:2]","UHD FF[10bit 4:2:2][From 6K]","UHD FF[10bit 4:2:2]","UHD S35[10bit 4:2:2]","DCI 2K FF[10bit 4:2:2]","DCI 2K S35[10bit 4:2:2]","DCI 2K S16[10bit 4:2:2]","FHD FF[10bit 4:2:2]","FHD S35[10bit 4:2:2]","FHD S16[10bit 4:2:2]"],
            "CinemaEOS C400_XF-AVC S LongGOP" : ["DCI 4K FF[10bit 4:2:2][From 6K]","DCI 4K FF[10bit 4:2:2]","DCI 4K S35[10bit 4:2:2]","UHD FF[10bit 4:2:2][From 6K]","UHD FF[10bit 4:2:2]","UHD S35[10bit 4:2:2]","DCI 2K FF[10bit 4:2:2]","DCI 2K S35[10bit 4:2:2]","DCI 2K S16[10bit 4:2:2]","FHD FF[10bit 4:2:2]","FHD S35[10bit 4:2:2]","FHD S16[10bit 4:2:2]","DCI 4K FF[8bit 4:2:0][From 6K]","DCI 4K FF[8bit 4:2:0]","DCI 4K S35[8bit 4:2:0]","UHD FF[8bit 4:2:0][From 6K]","UHD FF[8bit 4:2:0]","UHD S35[8bit 4:2:0]","DCI 2K FF[8bit 4:2:0]","DCI 2K S35[8bit 4:2:0]","DCI 2K S16[8bit 4:2:0]","FHD FF[8bit 4:2:0]","FHD S35[8bit 4:2:0]","FHD S16[10bit 4:2:0]"],
            "CinemaEOS C400_XF-AVC Intra" : ["DCI 4K FF[10bit 4:2:2][From 6K]","DCI 4K FF[10bit 4:2:2]","DCI 4K S35[10bit 4:2:2]","UHD FF[10bit 4:2:2][From 6K]","UHD FF[10bit 4:2:2]","UHD S35[10bit 4:2:2]","DCI 2K FF[10bit 4:2:2]","DCI 2K S35[10bit 4:2:2]","DCI 2K S16[10bit 4:2:2]","FHD FF[10bit 4:2:2]","FHD S35[10bit 4:2:2]","FHD S16[10bit 4:2:2]"],
            "CinemaEOS C400_XF-AVC LongGOP" : ["DCI 4K FF[10bit 4:2:2][From 6K]","DCI 4K FF[10bit 4:2:2]","DCI 4K S35[10bit 4:2:2]","UHD FF[10bit 4:2:2][From 6K]","UHD FF[10bit 4:2:2]","UHD S35[10bit 4:2:2]","DCI 2K FF[10bit 4:2:2]","DCI 2K S35[10bit 4:2:2]","DCI 2K S16[10bit 4:2:2]","FHD FF[10bit 4:2:2]","FHD S35[10bit 4:2:2]","FHD S16[10bit 4:2:2]"],
            
            "CinemaEOS C70_Cinema RAW Light HQ" : ["DCI 2K S16[12bit RAW]"],
            "CinemaEOS C70_Cinema RAW Light ST" : ["DCI 4K S35[12bit RAW]","DCI 2K S16[12bit RAW]"],
            "CinemaEOS C70_Cinema RAW Light LT" : ["DCI 4K S35[12bit RAW]","DCI 2K S16[12bit RAW]"],
            "CinemaEOS C70_XF-AVC Intra" : ["DCI 4K S35[10bit 4:2:2][410mbps]","DCI 4K S35[10bit 4:2:2]","UHD S35[10bit 4:2:2][410mbps]","UHD S35[10bit 4:2:2]","DCI 2K S35[10bit 4:2:2]","DCI 2K S16[10bit 4:2:2]","FHD S35[10bit 4:2:2]","FHD S16[10bit 4:2:2]"],
            "CinemaEOS C70_XF-AVC LongGOP" : ["DCI 4K S35[10bit 4:2:2]","UHD S35[10bit 4:2:2]","DCI 2K S35[10bit 4:2:2]","DCI 2K S16[10bit 4:2:2]","FHD S35[10bit 4:2:2]","FHD S16[10bit 4:2:2]","HD S35[10bit 4:2:2]","HD S16[10bit 4:2:2]"],
            "CinemaEOS C70_HEVC LongGOP" : ["DCI 4K S35[10bit 4:2:2]","UHD S35[10bit 4:2:2]","DCI 2K S35[10bit 4:2:2]","DCI 2K S16[10bit 4:2:2]","FHD S35[10bit 4:2:2]","FHD S16[10bit 4:2:2]","HD S35[10bit 4:2:2]","HD S16[10bit 4:2:2]","DCI 4K S35[10bit 4:2:0]","UHD S35[10bit 4:2:2]","DCI 2K S35[10bit 4:2:0]","DCI 2K S16[10bit 4:2:0]","FHD S35[10bit 4:2:0]","FHD S16[10bit 4:2:0]","HD S35[10bit 4:2:0]","HD S16[10bit 4:2:2]"],
            "CinemaEOS C70_AVC LongGOP" : ["DCI 4K S35[10bit 4:2:2]","UHD S35[10bit 4:2:2]","DCI 2K S35[10bit 4:2:2]","DCI 2K S16[10bit 4:2:2]","FHD S35[10bit 4:2:2]","FHD S16[10bit 4:2:2]","HD S35[10bit 4:2:2]","HD S16[10bit 4:2:2]"],
            
        ]
        resolutions = CanonCinemaResolutions[key, default: ["无选项"]]
    }
    
    return resolutions
}
