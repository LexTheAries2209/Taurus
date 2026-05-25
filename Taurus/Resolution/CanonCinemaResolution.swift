//
//  CanonCinemaResolution.swift
//  Taurus
//
//  Created by 吴坤城 on 6/6/24.
//

import Foundation

func CanonCinemaResolution(cameradata:CameraData) -> [String] {
    let resolutions = CanonCinemaRawResolution(cameradata: cameradata)
    return CanonCinemaMergedResolutions(cameradata: cameradata, resolutions: resolutions)
}

func CanonCinemaRawResolution(cameradata:CameraData) -> [String] {
    
    var resolutions: [String] = []
    
    if cameradata.BrandName == "Canon Cinema" {
        
        let key = cameradata.CameraName + "_" + cameradata.Codec
        let c50RawResolutions = ["7K FF[6960*4640][12bit RAW][OG]","7K FF[6960*3672][12bit RAW][17:9]","5K S35[5036*2656][12bit RAW]","2.5K S16[2524*1332][12bit RAW]"]
        let c50HEVCSIntraResolutions = ["7K FF[6912*4608][10bit 4:2:2][OG]"]
        let c50HEVCSLongGOPResolutions = ["7K FF[6912*4608][10bit 4:2:2][OG]","7K FF[6912*4608][10bit 4:2:0][OG]","DCI 4K Fine FF[10bit 4:2:2][From 7K]","UHD Fine FF[10bit 4:2:2][From 7K]","DCI 4K Fine FF[10bit 4:2:0][From 7K]","UHD Fine FF[10bit 4:2:0][From 7K]","DCI 4K FF[10bit 4:2:2]","UHD FF[10bit 4:2:2]","DCI 4K S35[10bit 4:2:2]","UHD S35[10bit 4:2:2]","DCI 4K FF[10bit 4:2:0]","UHD FF[10bit 4:2:0]","DCI 4K S35[10bit 4:2:0]","UHD S35[10bit 4:2:0]","DCI 2K FF[10bit 4:2:2][From 3.5K]","FHD FF[10bit 4:2:2][From 3.5K]","DCI 2K FF[10bit 4:2:2]","FHD FF[10bit 4:2:2]","DCI 2K FFcrop[10bit 4:2:2]","FHD FFcrop[10bit 4:2:2]","DCI 2K S35[10bit 4:2:2]","FHD S35[10bit 4:2:2]","DCI 2K S16[10bit 4:2:2]","FHD S16[10bit 4:2:2]","DCI 2K FF[10bit 4:2:0][From 3.5K]","FHD FF[10bit 4:2:0][From 3.5K]","DCI 2K FF[10bit 4:2:0]","FHD FF[10bit 4:2:0]","DCI 2K FFcrop[10bit 4:2:0]","FHD FFcrop[10bit 4:2:0]","DCI 2K S35[10bit 4:2:0]","FHD S35[10bit 4:2:0]","DCI 2K S16[10bit 4:2:0]","FHD S16[10bit 4:2:0]"]
        let c50AVCSIntra4KResolutions = ["DCI 4K Fine FF[10bit 4:2:2][From 7K]","UHD Fine FF[10bit 4:2:2][From 7K]","DCI 4K FF[10bit 4:2:2]","UHD FF[10bit 4:2:2]","DCI 4K S35[10bit 4:2:2]","UHD S35[10bit 4:2:2]"]
        let c50AVCSIntra2KResolutions = ["DCI 2K FF[10bit 4:2:2][From 3.5K]","FHD FF[10bit 4:2:2][From 3.5K]","DCI 2K FF[10bit 4:2:2]","FHD FF[10bit 4:2:2]","DCI 2K FFcrop[10bit 4:2:2]","FHD FFcrop[10bit 4:2:2]","DCI 2K S35[10bit 4:2:2]","FHD S35[10bit 4:2:2]","DCI 2K S16[10bit 4:2:2]","FHD S16[10bit 4:2:2]"]
        let c50AVCSLongGOPResolutions = ["DCI 4K Fine FF[10bit 4:2:2][From 7K]","UHD Fine FF[10bit 4:2:2][From 7K]","DCI 4K Fine FF[8bit 4:2:0][From 7K]","UHD Fine FF[8bit 4:2:0][From 7K]","DCI 4K FF[10bit 4:2:2]","UHD FF[10bit 4:2:2]","DCI 4K S35[10bit 4:2:2]","UHD S35[10bit 4:2:2]","DCI 4K FF[8bit 4:2:0]","UHD FF[8bit 4:2:0]","DCI 4K S35[8bit 4:2:0]","UHD S35[8bit 4:2:0]","DCI 2K FF[10bit 4:2:2][From 3.5K]","FHD FF[10bit 4:2:2][From 3.5K]","DCI 2K FF[10bit 4:2:2]","FHD FF[10bit 4:2:2]","DCI 2K FFcrop[10bit 4:2:2]","FHD FFcrop[10bit 4:2:2]","DCI 2K S35[10bit 4:2:2]","FHD S35[10bit 4:2:2]","DCI 2K S16[10bit 4:2:2]","FHD S16[10bit 4:2:2]","DCI 2K FF[8bit 4:2:0][From 3.5K]","FHD FF[8bit 4:2:0][From 3.5K]","DCI 2K FF[8bit 4:2:0]","FHD FF[8bit 4:2:0]","DCI 2K FFcrop[8bit 4:2:0]","FHD FFcrop[8bit 4:2:0]","DCI 2K S35[8bit 4:2:0]","FHD S35[8bit 4:2:0]","DCI 2K S16[8bit 4:2:0]","FHD S16[8bit 4:2:0]"]
        let c50XFAVCResolutions = ["DCI 4K Fine FF[10bit 4:2:2][From 7K]","UHD Fine FF[10bit 4:2:2][From 7K]","DCI 4K FF[10bit 4:2:2]","UHD FF[10bit 4:2:2]","DCI 4K S35[10bit 4:2:2]","UHD S35[10bit 4:2:2]","DCI 2K FF[10bit 4:2:2]","FHD FF[10bit 4:2:2]","DCI 2K FFcrop[10bit 4:2:2]","FHD FFcrop[10bit 4:2:2]","DCI 2K S35[10bit 4:2:2]","FHD S35[10bit 4:2:2]","DCI 2K S16[10bit 4:2:2]","FHD S16[10bit 4:2:2]"]
        
        let CanonCinemaResolutions: [String: [String]] = [
            "CinemaEOS C400_Cinema RAW Light HQ" : ["6K FF[6000*3164][12bit RAW][17:9]","4.3K S35[4368*2304][12bit RAW][17:9]","2K S16[2184*1152][12bit RAW][17:9]"],
            "CinemaEOS C400_Cinema RAW Light ST" : ["6K FF[6000*3164][12bit RAW][17:9]","4.3K S35[4368*2304][12bit RAW][17:9]","2K S16[2184*1152][12bit RAW][17:9]"],
            "CinemaEOS C400_Cinema RAW Light LT" : ["6K FF[6000*3164][12bit RAW][17:9]","4.3K S35[4368*2304][12bit RAW][17:9]","2K S16[2184*1152][12bit RAW][17:9]"],
            "CinemaEOS C400_XF-HEVC S LongGOP" : ["DCI 4K Fine FF[10bit 4:2:2][From 6K]","DCI 4K FF[10bit 4:2:2]","DCI 4K S35[10bit 4:2:2]","DCI 4K Fine FF[10bit 4:2:0][From 6K]","DCI 4K FF[10bit 4:2:0]","DCI 4K S35[10bit 4:2:0]","UHD Fine FF[10bit 4:2:2][From 6K]","UHD FF[10bit 4:2:2]","UHD S35[10bit 4:2:2]","UHD Fine FF[10bit 4:2:0][From 6K]","UHD FF[10bit 4:2:0]","UHD S35[10bit 4:2:0]","DCI 2K FF[10bit 4:2:2]","DCI 2K S35[10bit 4:2:2]","DCI 2K S16[10bit 4:2:2]","DCI 2K FF[10bit 4:2:0]","DCI 2K S35[10bit 4:2:0]","DCI 2K S16[10bit 4:2:0]","FHD FF[10bit 4:2:2]","FHD S35[10bit 4:2:2]","FHD S16[10bit 4:2:2]","FHD FF[10bit 4:2:0]","FHD S35[10bit 4:2:0]","FHD S16[10bit 4:2:0]"],
            "CinemaEOS C400_XF-AVC S Intra" : ["DCI 4K Fine FF[10bit 4:2:2][From 6K]","DCI 4K FF[10bit 4:2:2]","DCI 4K S35[10bit 4:2:2]","UHD Fine FF[10bit 4:2:2][From 6K]","UHD FF[10bit 4:2:2]","UHD S35[10bit 4:2:2]","DCI 2K FF[10bit 4:2:2]","DCI 2K S35[10bit 4:2:2]","DCI 2K S16[10bit 4:2:2]","FHD FF[10bit 4:2:2]","FHD S35[10bit 4:2:2]","FHD S16[10bit 4:2:2]"],
            "CinemaEOS C400_XF-AVC S LongGOP" : ["DCI 4K Fine FF[10bit 4:2:2][From 6K]","DCI 4K FF[10bit 4:2:2]","DCI 4K S35[10bit 4:2:2]","DCI 4K Fine FF[10bit 4:2:0][From 6K]","DCI 4K FF[10bit 4:2:0]","DCI 4K S35[10bit 4:2:0]","UHD Fine FF[10bit 4:2:2][From 6K]","UHD FF[10bit 4:2:2]","UHD S35[10bit 4:2:2]","UHD Fine FF[10bit 4:2:0][From 6K]","UHD FF[10bit 4:2:0]","UHD S35[10bit 4:2:0]","DCI 2K FF[10bit 4:2:2]","DCI 2K S35[10bit 4:2:2]","DCI 2K S16[10bit 4:2:2]","DCI 2K FF[10bit 4:2:0]","DCI 2K S35[10bit 4:2:0]","DCI 2K S16[10bit 4:2:0]","FHD FF[10bit 4:2:2]","FHD S35[10bit 4:2:2]","FHD S16[10bit 4:2:2]","FHD FF[10bit 4:2:0]","FHD S35[10bit 4:2:0]","FHD S16[10bit 4:2:0]"],
            "CinemaEOS C400_XF-AVC Intra" : ["DCI 4K Fine FF[10bit 4:2:2][From 6K]","DCI 4K FF[10bit 4:2:2]","DCI 4K S35[10bit 4:2:2]","UHD Fine FF[10bit 4:2:2][From 6K]","UHD FF[10bit 4:2:2]","UHD S35[10bit 4:2:2]","DCI 2K FF[10bit 4:2:2]","DCI 2K S35[10bit 4:2:2]","DCI 2K S16[10bit 4:2:2]","FHD FF[10bit 4:2:2]","FHD S35[10bit 4:2:2]","FHD S16[10bit 4:2:2]"],
            "CinemaEOS C400_XF-AVC LongGOP" : ["DCI 4K Fine FF[10bit 4:2:2][From 6K]","DCI 4K FF[10bit 4:2:2]","DCI 4K S35[10bit 4:2:2]","UHD Fine FF[10bit 4:2:2][From 6K]","UHD FF[10bit 4:2:2]","UHD S35[10bit 4:2:2]","DCI 2K FF[10bit 4:2:2]","DCI 2K S35[10bit 4:2:2]","DCI 2K S16[10bit 4:2:2]","FHD FF[10bit 4:2:2]","FHD S35[10bit 4:2:2]","FHD S16[10bit 4:2:2]"],
            
            "CinemaEOS C80_Cinema RAW Light ST" : ["4.3K S35[4368*2304][12bit RAW][17:9]"],
            "CinemaEOS C80_Cinema RAW Light LT" : ["6K FF[6000*3164][12bit RAW][17:9]","4.3K S35[4368*2304][12bit RAW][17:9]"],
            "CinemaEOS C80_XF-HEVC S LongGOP" : ["DCI 4K Fine FF[10bit 4:2:2][From 6K]","DCI 4K FF[10bit 4:2:2]","DCI 4K S35[10bit 4:2:2]","DCI 4K Fine FF[10bit 4:2:0][From 6K]","DCI 4K FF[10bit 4:2:0]","DCI 4K S35[10bit 4:2:0]","UHD Fine FF[10bit 4:2:2][From 6K]","UHD FF[10bit 4:2:2]","UHD S35[10bit 4:2:2]","UHD Fine FF[10bit 4:2:0][From 6K]","UHD FF[10bit 4:2:0]","UHD S35[10bit 4:2:0]","DCI 2K FF[10bit 4:2:2]","DCI 2K S35[10bit 4:2:2]","DCI 2K S16[10bit 4:2:2]","DCI 2K FF[10bit 4:2:0]","DCI 2K S35[10bit 4:2:0]","DCI 2K S16[10bit 4:2:0]","FHD FF[10bit 4:2:2]","FHD S35[10bit 4:2:2]","FHD S16[10bit 4:2:2]","FHD FF[10bit 4:2:0]","FHD S35[10bit 4:2:0]","FHD S16[10bit 4:2:0]"],
            "CinemaEOS C80_XF-AVC S Intra" : ["DCI 4K Fine FF[10bit 4:2:2][From 6K]","DCI 4K FF[10bit 4:2:2]","DCI 4K S35[10bit 4:2:2]","UHD Fine FF[10bit 4:2:2][From 6K]","UHD FF[10bit 4:2:2]","UHD S35[10bit 4:2:2]","DCI 2K FF[10bit 4:2:2]","DCI 2K S35[10bit 4:2:2]","DCI 2K S16[10bit 4:2:2]","FHD FF[10bit 4:2:2]","FHD S35[10bit 4:2:2]","FHD S16[10bit 4:2:2]"],
            "CinemaEOS C80_XF-AVC S LongGOP" : ["DCI 4K Fine FF[10bit 4:2:2][From 6K]","DCI 4K FF[10bit 4:2:2]","DCI 4K S35[10bit 4:2:2]","DCI 4K Fine FF[10bit 4:2:0][From 6K]","DCI 4K FF[10bit 4:2:0]","DCI 4K S35[10bit 4:2:0]","UHD Fine FF[10bit 4:2:2][From 6K]","UHD FF[10bit 4:2:2]","UHD S35[10bit 4:2:2]","UHD Fine FF[10bit 4:2:0][From 6K]","UHD FF[10bit 4:2:0]","UHD S35[10bit 4:2:0]","DCI 2K FF[10bit 4:2:2]","DCI 2K S35[10bit 4:2:2]","DCI 2K S16[10bit 4:2:2]","DCI 2K FF[10bit 4:2:0]","DCI 2K S35[10bit 4:2:0]","DCI 2K S16[10bit 4:2:0]","FHD FF[10bit 4:2:2]","FHD S35[10bit 4:2:2]","FHD S16[10bit 4:2:2]","FHD FF[10bit 4:2:0]","FHD S35[10bit 4:2:0]","FHD S16[10bit 4:2:0]"],
            "CinemaEOS C80_XF-AVC Intra" : ["DCI 4K Fine FF[10bit 4:2:2][From 6K]","DCI 4K FF[10bit 4:2:2]","DCI 4K S35[10bit 4:2:2]","UHD Fine FF[10bit 4:2:2][From 6K]","UHD FF[10bit 4:2:2]","UHD S35[10bit 4:2:2]","DCI 2K FF[10bit 4:2:2]","DCI 2K S35[10bit 4:2:2]","DCI 2K S16[10bit 4:2:2]","FHD FF[10bit 4:2:2]","FHD S35[10bit 4:2:2]","FHD S16[10bit 4:2:2]"],
            "CinemaEOS C80_XF-AVC LongGOP" : ["DCI 4K Fine FF[10bit 4:2:2][From 6K]","DCI 4K FF[10bit 4:2:2]","DCI 4K S35[10bit 4:2:2]","UHD Fine FF[10bit 4:2:2][From 6K]","UHD FF[10bit 4:2:2]","UHD S35[10bit 4:2:2]","DCI 2K FF[10bit 4:2:2]","DCI 2K S35[10bit 4:2:2]","DCI 2K S16[10bit 4:2:2]","FHD FF[10bit 4:2:2]","FHD S35[10bit 4:2:2]","FHD S16[10bit 4:2:2]"],
            
            "CinemaEOS C50_Cinema RAW Light HQ" : c50RawResolutions,
            "CinemaEOS C50_Cinema RAW Light ST" : c50RawResolutions,
            "CinemaEOS C50_Cinema RAW Light LT" : c50RawResolutions,
            "CinemaEOS C50_XF-HEVC S Intra HQ" : c50HEVCSIntraResolutions,
            "CinemaEOS C50_XF-HEVC S Intra ST" : c50HEVCSIntraResolutions,
            "CinemaEOS C50_XF-HEVC S Intra LT" : c50HEVCSIntraResolutions,
            "CinemaEOS C50_XF-HEVC S LongGOP" : c50HEVCSLongGOPResolutions,
            "CinemaEOS C50_XF-AVC S Intra HQ" : c50AVCSIntra4KResolutions,
            "CinemaEOS C50_XF-AVC S Intra ST" : c50AVCSIntra4KResolutions + c50AVCSIntra2KResolutions,
            "CinemaEOS C50_XF-AVC S Intra LT" : c50AVCSIntra4KResolutions,
            "CinemaEOS C50_XF-AVC S LongGOP" : c50AVCSLongGOPResolutions,
            "CinemaEOS C50_XF-AVC Intra" : c50XFAVCResolutions,
            "CinemaEOS C50_XF-AVC LongGOP" : c50XFAVCResolutions,
            
            "CinemaEOS C70_Cinema RAW Light HQ" : ["DCI 2K S16[12bit RAW]"],
            "CinemaEOS C70_Cinema RAW Light ST" : ["DCI 4K S35[12bit RAW]","DCI 2K S16[12bit RAW]"],
            "CinemaEOS C70_Cinema RAW Light LT" : ["DCI 4K S35[12bit RAW]","DCI 2K S16[12bit RAW]"],
            "CinemaEOS C70_XF-AVC Intra" : ["DCI 4K S35[10bit 4:2:2][410mbps]","DCI 4K S35[10bit 4:2:2]","UHD S35[10bit 4:2:2][410mbps]","UHD S35[10bit 4:2:2]","DCI 2K S35[10bit 4:2:2]","DCI 2K S16[10bit 4:2:2]","FHD S35[10bit 4:2:2]","FHD S16[10bit 4:2:2]"],
            "CinemaEOS C70_XF-AVC LongGOP" : ["DCI 4K S35[10bit 4:2:2]","UHD S35[10bit 4:2:2]","DCI 2K S35[10bit 4:2:2]","DCI 2K S16[10bit 4:2:2]","FHD S35[10bit 4:2:2]","FHD S16[10bit 4:2:2]","HD S35[10bit 4:2:2]","HD S16[10bit 4:2:2]"],
            //"CinemaEOS C70_HEVC LongGOP" : ["DCI 4K S35[10bit 4:2:2]","UHD S35[10bit 4:2:2]","DCI 2K S35[10bit 4:2:2]","DCI 2K S16[10bit 4:2:2]","FHD S35[10bit 4:2:2]","FHD S16[10bit 4:2:2]","HD S35[10bit 4:2:2]","HD S16[10bit 4:2:2]","DCI 4K S35[10bit 4:2:0]","UHD S35[10bit 4:2:2]","DCI 2K S35[10bit 4:2:0]","DCI 2K S16[10bit 4:2:0]","FHD S35[10bit 4:2:0]","FHD S16[10bit 4:2:0]","HD S35[10bit 4:2:0]","HD S16[10bit 4:2:2]"],
            //"CinemaEOS C70_AVC LongGOP" : ["DCI 4K S35[10bit 4:2:2]","UHD S35[10bit 4:2:2]","DCI 2K S35[10bit 4:2:2]","DCI 2K S16[10bit 4:2:2]","FHD S35[10bit 4:2:2]","FHD S16[10bit 4:2:2]","HD S35[10bit 4:2:2]","HD S16[10bit 4:2:2]"],
            
            "CinemaEOS R5C_Cinema RAW Light HQ" : ["6K S35[5952*3140][12bit RAW][17:9]","3K S16[2976*1570][12bit RAW][17:9]"],
            "CinemaEOS R5C_Cinema RAW Light ST" : ["8K FF[8192*4320][12bit RAW][17:9]","6K S35[5952*3140][12bit RAW][17:9]","3K S16[2976*1570][12bit RAW][17:9]"],
            "CinemaEOS R5C_Cinema RAW Light LT" : ["8K FF[8192*4320][12bit RAW][17:9]","6K S35[5952*3140][12bit RAW][17:9]","3K S16[2976*1570][12bit RAW][17:9]"],
            "CinemaEOS R5C_XF-AVC Intra" : ["DCI 4K FF[10bit 4:2:2]","DCI 4K S35[10bit 4:2:2]","UHD FF[10bit 4:2:2]","UHD S35[10bit 4:2:2]","DCI 2K FF[10bit 4:2:2]","DCI 2K S35[10bit 4:2:2]","DCI 2K S16[10bit 4:2:2]","FHD FF[10bit 4:2:2]","FHD S35[10bit 4:2:2]","FHD S16[10bit 4:2:2]"],
            "CinemaEOS R5C_XF-AVC LongGOP" : ["DCI 4K FF[10bit 4:2:2]","DCI 4K S35[10bit 4:2:2]","UHD FF[10bit 4:2:2]","UHD S35[10bit 4:2:2]","DCI 2K FF[10bit 4:2:2]","DCI 2K S35[10bit 4:2:2]","DCI 2K S16[10bit 4:2:2]","FHD FF[10bit 4:2:2]","FHD S35[10bit 4:2:2]","FHD S16[10bit 4:2:2]","HD FF[10bit 4:2:2]","HD S35[10bit 4:2:2]","HD S16[10bit 4:2:2]"],
            
            "CinemaEOS C500 Mark2_Cinema RAW Light" : ["6K FF[5952*3140][12bit RAW][17:9]","6K FF[5952*3140][10bit RAW][17:9]","4.2K FF[4192*3140][12bit RAW][4:3]","4.2K FF[4192*3140][10bit RAW][4:3]","3.8K FF[3768*3140][12bit RAW][6:5]","3.8K FF[3768*3140][10bit RAW][6:5]","4K S35[4096*2160][12bit RAW][17:9]","4K S35[4096*2160][10bit RAW][17:9]","2K S16[2048*1024][12bit RAW][17:9]","2K S16[2048*1024][10bit RAW][17:9]"],
            "CinemaEOS C500 Mark2_Cinema RAW Light HQ" : ["6K FF[5952*3140][12bit RAW][17:9]","4.2K FF[4192*3140][12bit RAW][4:3]","3.8K FF[3768*3140][12bit RAW][6:5]","4K S35[4096*2160][12bit RAW][17:9]","2K S16[2048*1024][12bit RAW][17:9]"],
            "CinemaEOS C500 Mark2_Cinema RAW Light ST" : ["6K FF[5952*3140][12bit RAW][17:9]","4.2K FF[4192*3140][12bit RAW][4:3]","3.8K FF[3768*3140][12bit RAW][6:5]","4K S35[4096*2160][12bit RAW][17:9]","2K S16[2048*1024][12bit RAW][17:9]"],
            "CinemaEOS C500 Mark2_Cinema RAW Light LT" : ["6K FF[5952*3140][12bit RAW][17:9]","4.2K FF[4192*3140][12bit RAW][4:3]","3.8K FF[3768*3140][12bit RAW][6:5]","4K S35[4096*2160][12bit RAW][17:9]","2K S16[2048*1024][12bit RAW][17:9]"],
            "CinemaEOS C500 Mark2_XF-AVC Intra" : ["DCI 4K FF[10bit 4:2:2]","DCI 4K S35[10bit 4:2:2]","UHD FF[10bit 4:2:2]","UHD S35[10bit 4:2:2]","DCI 2K FF[10bit 4:2:2]","DCI 2K S35[10bit 4:2:2]","DCI 2K S16[10bit 4:2:2]","FHD FF[10bit 4:2:2]","FHD S35[10bit 4:2:2]","FHD S16[10bit 4:2:2]"],
            "CinemaEOS C500 Mark2_XF-AVC LongGOP" : ["DCI 4K FF[10bit 4:2:2]","DCI 4K S35[10bit 4:2:2]","UHD FF[10bit 4:2:2]","UHD S35[10bit 4:2:2]","DCI 2K FF[10bit 4:2:2]","DCI 2K S35[10bit 4:2:2]","DCI 2K S16[10bit 4:2:2]","FHD FF[10bit 4:2:2]","FHD S35[10bit 4:2:2]","FHD S16[10bit 4:2:2]","HD FF[10bit 4:2:2]","HD S35[10bit 4:2:2]","HD S16[10bit 4:2:2]"],
            
            "CinemaEOS C300 Mark3_Cinema RAW Light" : ["DCI 4K S35[12bit RAW]","DCI 4K S35[10bit RAW]","DCI 2K S16[12bit RAW]","DCI 2K S16[10bit RAW]"],
            "CinemaEOS C300 Mark3_XF-AVC Intra" : ["DCI 4K S35[10bit 4:2:2]","UHD S35[10bit 4:2:2]","DCI 2K S35[10bit 4:2:2]","DCI 2K S16[10bit 4:2:2]","FHD S35[10bit 4:2:2]","FHD S16[10bit 4:2:2]"],
            "CinemaEOS C300 Mark3_XF-AVC LongGOP" : ["DCI 4K S35[10bit 4:2:2]","UHD S35[10bit 4:2:2]","DCI 2K S35[10bit 4:2:2]","DCI 2K S16[10bit 4:2:2]","FHD S35[10bit 4:2:2]","FHD S16[10bit 4:2:2]","HD S35[10bit 4:2:2]","HD S16[10bit 4:2:2]"],
            
        ]
        resolutions = CanonCinemaResolutions[key, default: ["无选项"]]
    }
    
    return resolutions
}

private struct CanonCinemaResolutionMergeInfo {
    let family: String
    let format: String
    let crop: String
    let color: String
    let tags: [String]
    let sourceKey: String
    let displayFrom: String
    let isFine: Bool
}

private func CanonCinemaMergedResolutions(cameradata: CameraData, resolutions: [String]) -> [String] {
    let groups = CanonCinemaResolutionMergeGroups(resolutions: resolutions)
    var emittedKeys = Set<String>()
    var mergedResolutions: [String] = []
    
    for resolution in resolutions {
        guard let key = CanonCinemaResolutionMergeKey(resolution: resolution),
              let group = groups[key],
              group.count > 1,
              CanonCinemaResolutionHasMergeableFormats(resolutions: group),
              CanonCinemaMergedResolutionSpeedsMatch(cameradata: cameradata, resolutions: group) else {
            mergedResolutions.append(resolution)
            continue
        }
        
        if !emittedKeys.contains(key) {
            mergedResolutions.append(CanonCinemaMergedResolutionLabel(resolutions: group))
            emittedKeys.insert(key)
        }
    }
    
    return mergedResolutions
}

private func CanonCinemaResolutionMergeGroups(resolutions: [String]) -> [String: [String]] {
    var groups: [String: [String]] = [:]
    
    for resolution in resolutions {
        guard let key = CanonCinemaResolutionMergeKey(resolution: resolution) else {
            continue
        }
        groups[key, default: []].append(resolution)
    }
    
    return groups
}

private func CanonCinemaResolutionMergeKey(resolution: String) -> String? {
    guard let info = CanonCinemaParsedResolutionMergeInfo(resolution: resolution) else {
        return nil
    }
    return [info.family, info.crop, info.color, info.tags.joined(separator: "/"), info.sourceKey].joined(separator: "_")
}

private func CanonCinemaParsedResolutionMergeInfo(resolution: String) -> CanonCinemaResolutionMergeInfo? {
    let prefix = resolution.components(separatedBy: "[").first?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
    let prefixParts = prefix.split(separator: " ").map(String.init)
    guard let firstPart = prefixParts.first else {
        return nil
    }
    
    let family: String
    let format: String
    let cropParts: ArraySlice<String>
    if firstPart == "DCI", prefixParts.count > 1, ["8K", "4K", "2K"].contains(prefixParts[1]) {
        family = prefixParts[1]
        format = "DCI"
        cropParts = prefixParts.dropFirst(2)
    } else if firstPart == "UHD" {
        family = "4K"
        format = "UHD"
        cropParts = prefixParts.dropFirst()
    } else if firstPart == "FHD" {
        family = "2K"
        format = "FHD"
        cropParts = prefixParts.dropFirst()
    } else if ["8K", "4K", "2K"].contains(firstPart) {
        family = firstPart
        format = firstPart
        cropParts = prefixParts.dropFirst()
    } else {
        return nil
    }
    let explicitFine = cropParts.first == "Fine"
    let crop = cropParts.drop(while: { $0 == "Fine" }).joined(separator: " ")
    
    let bracketValues = CanonCinemaResolutionBracketValues(resolution)
    guard let color = bracketValues.first(where: { $0.contains("bit") || $0.contains("RAW") }) else {
        return nil
    }
    
    let from = bracketValues.first(where: { $0.hasPrefix("From ") }) ?? ""
    let tags = bracketValues.filter { value in
        value != color &&
        value != from &&
        !value.contains("*") &&
        !CanonCinemaResolutionIsAspectRatio(value)
    }
    let isFine = family == "4K" && !from.isEmpty && (explicitFine || ["DCI", "UHD"].contains(format))
    
    return CanonCinemaResolutionMergeInfo(
        family: family,
        format: format,
        crop: crop,
        color: color,
        tags: tags,
        sourceKey: isFine ? "Fine" : from,
        displayFrom: from,
        isFine: isFine
    )
}

private func CanonCinemaResolutionBracketValues(_ resolution: String) -> [String] {
    return resolution
        .split(separator: "[")
        .dropFirst()
        .compactMap { part in
            part.split(separator: "]").first.map(String.init)
        }
}

private func CanonCinemaResolutionIsAspectRatio(_ value: String) -> Bool {
    let parts = value.split(separator: ":")
    return parts.count == 2 && parts.allSatisfy { part in
        return Int(part) != nil
    }
}

private func CanonCinemaResolutionHasMergeableFormats(resolutions: [String]) -> Bool {
    let formats = Set(resolutions.compactMap { CanonCinemaParsedResolutionMergeInfo(resolution: $0)?.format })
    return formats.count > 1
}

private func CanonCinemaMergedResolutionLabel(resolutions: [String]) -> String {
    let infos = resolutions.compactMap { CanonCinemaParsedResolutionMergeInfo(resolution: $0) }
    guard let firstInfo = infos.first else {
        return resolutions.first ?? ""
    }
    
    let crop = firstInfo.crop.isEmpty ? "" : " \(firstInfo.crop)"
    let tags = firstInfo.tags.map { "[\($0)]" }.joined()
    
    if firstInfo.isFine {
        let displayFrom = infos.first(where: { $0.format == "DCI" && !$0.displayFrom.isEmpty })?.displayFrom ?? firstInfo.displayFrom
        return "\(firstInfo.family) Fine\(crop)[\(firstInfo.color)]\(tags)[\(displayFrom)]"
    }
    return "\(firstInfo.family)\(crop)[\(firstInfo.color)]\(tags)"
}

private func CanonCinemaMergedResolutionSpeedsMatch(cameradata: CameraData, resolutions: [String]) -> Bool {
    let rates = CanonCinemaMergeRates(cameradata: cameradata, resolutions: resolutions)
    if rates.isEmpty {
        return false
    }
    
    for rate in rates {
        let speeds = Set(resolutions.map { resolution in
            return CanonCinemaCodecSpeed(cameradata: CanonCinemaMergeCameraData(
                base: cameradata,
                resolution: resolution,
                rate: rate
            ))
        })
        if speeds.count != 1 || speeds.contains(0) {
            return false
        }
    }
    
    return true
}

private func CanonCinemaMergeRates(cameradata: CameraData, resolutions: [String]) -> [String] {
    var rates = Set<String>()
    
    for resolution in resolutions {
        let rateData = CanonCinemaMergeCameraData(base: cameradata, resolution: resolution, rate: cameradata.Rate)
        for rate in CanonCinemaRate(cameradata: rateData) where rate != "无选项" {
            rates.insert(rate)
        }
    }
    
    return rates.sorted()
}

private func CanonCinemaMergeCameraData(base: CameraData, resolution: String, rate: String) -> CameraData {
    let data = CameraData()
    data.BrandName = base.BrandName
    data.CameraName = base.CameraName
    data.Codec = base.Codec
    data.Resolution = resolution
    data.Rate = rate
    return data
}
