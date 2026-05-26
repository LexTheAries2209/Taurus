//
//  CanonResolution.swift
//  Taurus
//
//  Created by 吴坤城 on 5/10/24.
//

import Foundation

func CanonResolution(cameradata:CameraData) -> [String] {
    let resolutions = CanonRawResolution(cameradata: cameradata)
    return CanonMergedResolutions(cameradata: cameradata, resolutions: resolutions)
}

func CanonRawResolution(cameradata:CameraData) -> [String] {
    
    var resolutions: [String] = []
    
    if cameradata.BrandName == "Canon" {
        
            let codec = CanonEffectiveCodec(cameradata: cameradata)
            var key = cameradata.CameraName + "_" + codec
            if cameradata.CameraName == "EOS R6 Mark3" {
                key = "EOS R6 V_" + codec
            }
            
            let CanonResolutions: [String: [String]] = [
                "EOS R1_RAW" : ["6K FF[6000*3164][12bit RAW][23.976p/24p][17:9]","6K FF[6000*3164][12bit RAW][25p][17:9]","6K FF[6000*3164][12bit RAW][29.97p][17:9]","6K FF[6000*3164][12bit RAW][50p/59.94p][17:9]"],
                "EOS R1_RAW Light" : ["6K FF[6000*3164][12bit RAW][23.976p/24p][17:9]","6K FF[6000*3164][12bit RAW][25p][17:9]","6K FF[6000*3164][12bit RAW][29.97p][17:9]","6K FF[6000*3164][12bit RAW][50p][17:9]","6K FF[6000*3164][12bit RAW][59.94p][17:9]"],
                "EOS R1_XF-HEVC S LongGOP FF" : ["4K Fine[10bit 4:2:2][23.976p/24p/25p/29.97p][From 6K]" ,"4K Fine[10bit 4:2:2][50p/59.94p][From 6K]" ,"4K Fine[10bit 4:2:0][23.976p/24p/25p/29.97p][From 6K]" ,"4K Fine[10bit 4:2:0][50p/59.94p][From 6K]" ,"4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","4K[10bit 4:2:2][50p/59.94p]","4K[10bit 4:2:2][100p/119.88p]","4K[10bit 4:2:0][23.976p/24p/25p/29.97p]","4K[10bit 4:2:0][50p/59.94p]","4K[10bit 4:2:0][100p/119.88p]","2K[10bit 4:2:2][23.976p/24p/25p/29.97p/50p/59.94p][From 4K]" ,"2K[10bit 4:2:0][23.976p/24p/25p/29.97p/50p/59.94p][From 4K]" ,"2K[10bit 4:2:2][23.976p/24p/25p/29.97p/50p/59.94p]","2K[10bit 4:2:2][100p/119.88p]","2K[10bit 4:2:2][200p/239.76p]","2K[10bit 4:2:0][23.976p/24p/25p/29.97p/50p/59.94p]","2K[10bit 4:2:0][100p/119.88p]","2K[10bit 4:2:0][200p/239.76p]"],
                "EOS R1_XF-HEVC S LongGOP S35" : ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","4K[10bit 4:2:2][50p/59.94p]","4K[10bit 4:2:2][100p/119.88p]","4K[10bit 4:2:0][23.976p/24p/25p/29.97p]","4K[10bit 4:2:0][50p/59.94p]","4K[10bit 4:2:0][100p/119.88p]","2K[10bit 4:2:2][23.976p/24p/25p/29.97p/50p/59.94p]","2K[10bit 4:2:2][100p/119.88p]","2K[10bit 4:2:0][23.976p/24p/25p/29.97p/50p/59.94p]","2K[10bit 4:2:0][100p/119.88p]"],
                "EOS R1_XF-AVC S Intra HQ FF" : ["4K Fine[10bit 4:2:2][23.976p/24p][From 6K]" ,"4K Fine[10bit 4:2:2][25p][From 6K]" ,"4K Fine[10bit 4:2:2][29.97p][From 6K]" ,"4K Fine[10bit 4:2:2][50p][From 6K]" ,"4K Fine[10bit 4:2:2][59.94p][From 6K]" ,"4K[10bit 4:2:2][23.976p/24p]","4K[10bit 4:2:2][25p]","4K[10bit 4:2:2][29.97p]","4K[10bit 4:2:2][50p]","4K[10bit 4:2:2][59.94p]"],
                "EOS R1_XF-AVC S Intra HQ S35" : ["4K[10bit 4:2:2][23.976p/24p]","4K[10bit 4:2:2][25p]","4K[10bit 4:2:2][29.97p]","4K[10bit 4:2:2][50p]","4K[10bit 4:2:2][59.94p]"],
                "EOS R1_XF-AVC S Intra ST FF" : ["4K Fine[10bit 4:2:2][23.976p/24p][From 6K]" ,"4K Fine[10bit 4:2:2][25p][From 6K]" ,"4K Fine[10bit 4:2:2][29.97p][From 6K]" ,"4K Fine[10bit 4:2:2][50p][From 6K]" ,"4K Fine[10bit 4:2:2][59.94p][From 6K]" ,"4K[10bit 4:2:2][23.976p/24p]","4K[10bit 4:2:2][25p]","4K[10bit 4:2:2][29.97p]","4K[10bit 4:2:2][50p]","4K[10bit 4:2:2][59.94p]","4K[10bit 4:2:2][100p]","4K[10bit 4:2:2][119.88p]","2K[10bit 4:2:2][23.976p/24p][From 4K]" ,"2K[10bit 4:2:2][25p][From 4K]" ,"2K[10bit 4:2:2][29.97p][From 4K]" ,"2K[10bit 4:2:2][50p][From 4K]" ,"2K[10bit 4:2:2][59.94p][From 4K]" ,"2K[10bit 4:2:2][23.976p/24p]","2K[10bit 4:2:2][25p]","2K[10bit 4:2:2][29.97p]","2K[10bit 4:2:2][50p]","2K[10bit 4:2:2][59.94p]","2K[10bit 4:2:2][100p]","2K[10bit 4:2:2][119.88p]","2K[10bit 4:2:2][200p]","2K[10bit 4:2:2][239.76p]"],
                "EOS R1_XF-AVC S Intra ST S35" : ["4K[10bit 4:2:2][23.976p/24p]","4K[10bit 4:2:2][25p]","4K[10bit 4:2:2][29.97p]","4K[10bit 4:2:2][50p]","4K[10bit 4:2:2][59.94p]","4K[10bit 4:2:2][100p]","4K[10bit 4:2:2][119.88p]","2K[10bit 4:2:2][23.976p/24p]","2K[10bit 4:2:2][25p]","2K[10bit 4:2:2][29.97p]","2K[10bit 4:2:2][50p]","2K[10bit 4:2:2][59.94p]","2K[10bit 4:2:2][100p]","2K[10bit 4:2:2][119.88p]"],
                "EOS R1_XF-AVC S Intra LT FF" : ["4K Fine[10bit 4:2:2][23.976p/24p][From 6K]" ,"4K Fine[10bit 4:2:2][25p][From 6K]" ,"4K Fine[10bit 4:2:2][29.97p][From 6K]" ,"4K Fine[10bit 4:2:2][50p][From 6K]" ,"4K Fine[10bit 4:2:2][59.94p][From 6K]" ,"4K[10bit 4:2:2][23.976p/24p]","4K[10bit 4:2:2][25p]","4K[10bit 4:2:2][29.97p]","4K[10bit 4:2:2][50p]","4K[10bit 4:2:2][59.94p]","4K[10bit 4:2:2][100p]","4K[10bit 4:2:2][119.88p]"],
                "EOS R1_XF-AVC S Intra LT S35" : ["4K[10bit 4:2:2][23.976p/24p]","4K[10bit 4:2:2][25p]","4K[10bit 4:2:2][29.97p]","4K[10bit 4:2:2][50p]","4K[10bit 4:2:2][59.94p]","4K[10bit 4:2:2][100p]","4K[10bit 4:2:2][119.88p]"],
                "EOS R1_XF-AVC S LongGOP FF" : ["4K Fine[10bit 4:2:2][23.976p/24p/25p/29.97p][From 6K]" ,"4K Fine[10bit 4:2:2][50p/59.94p][From 6K]" ,"4K Fine[8bit 4:2:0][23.976p/24p/25p/29.97p][From 6K]" ,"4K Fine[8bit 4:2:0][50p/59.94p][From 6K]" ,"4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","4K[10bit 4:2:2][50p/59.94p]","4K[10bit 4:2:2][100p/119.88p]","4K[8bit 4:2:0][23.976p/24p/25p/29.97p]","4K[8bit 4:2:0][50p/59.94p]","4K[8bit 4:2:0][100p/119.88p]","2K[10bit 4:2:2][23.976p/24p/25p/29.97p/50p/59.94p][From 4K]" ,"2K[8bit 4:2:0][23.976p/24p/25p/29.97p/50p/59.94p][From 4K]" ,"2K[10bit 4:2:2][23.976p/24p/25p/29.97p/50p/59.94p]","2K[10bit 4:2:2][100p/119.88p]","2K[10bit 4:2:2][200p/239.76p]","2K[8bit 4:2:0][23.976p/24p/25p/29.97p/50p/59.94p]","2K[8bit 4:2:0][100p/119.88p]","2K[8bit 4:2:0][200p/239.76p]"],
                "EOS R1_XF-AVC S LongGOP S35" : ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","4K[10bit 4:2:2][50p/59.94p]","4K[10bit 4:2:2][100p/119.88p]","4K[8bit 4:2:0][23.976p/24p/25p/29.97p]","4K[8bit 4:2:0][50p/59.94p]","4K[8bit 4:2:0][100p/119.88p]","2K[10bit 4:2:2][23.976p/24p/25p/29.97p/50p/59.94p]","2K[10bit 4:2:2][100p/119.88p]","2K[8bit 4:2:0][23.976p/24p/25p/29.97p/50p/59.94p]","2K[8bit 4:2:0][100p/119.88p]"],
                
                "EOS R3_RAW" : ["6K FF[6000*3164][12bit RAW][23.976p/24p][17:9]","6K FF[6000*3164][12bit RAW][25p/29.97p][17:9]","6K FF[6000*3164][12bit RAW][50p/59.94p][17:9]"],
                "EOS R3_RAW Light" : ["6K FF[6000*3164][12bit RAW][23.976p/24p][17:9]","6K FF[6000*3164][12bit RAW][25p/29.97p][17:9]","6K FF[6000*3164][12bit RAW][50p/59.94p][17:9]"],
                "EOS R3_ALL-I HEVC" : ["DCI 4K Fine FF[10bit 4:2:2][23.976p/24p/25p/29.97p][From 6K]" ,"DCI 4K Fine FF[10bit 4:2:2][50p/59.94p][From 6K]" ,"DCI 4K FF[10bit 4:2:2][100p/119.88p]","UHD Fine FF[10bit 4:2:2][23.976p/25p/29.97p][From 5.6K]" ,"UHD Fine FF[10bit 4:2:2][50p/59.94p][From 5.6K]" ,"UHD FF[10bit 4:2:2][100p/119.88p]","DCI 4K S35[10bit 4:2:2][23.976p/24p/25p/29.97p]","DCI 4K S35[10bit 4:2:2][50p/59.94p]","DCI 4K S35[10bit 4:2:2][100p/119.88p]","UHD S35[10bit 4:2:2][23.976p/25p/29.97p]","UHD S35[10bit 4:2:2][50p/59.94p]","UHD S35[10bit 4:2:2][100p/119.88p]","FHD FF[10bit 4:2:2][23.976p/25p/29.97p]","FHD FF[10bit 4:2:2][50p/59.94p]","FHD FF[10bit 4:2:2][100p/119.88p]","FHD FF[10bit 4:2:2][200p/239.76p]","FHD S35[10bit 4:2:2][23.976p/25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]","FHD S35[10bit 4:2:2][100p/119.88p]"],
                "EOS R3_ALL-I AVC" : ["DCI 4K Fine FF[8bit 4:2:0][23.976p/24p/25p/29.97p][From 6K]" ,"DCI 4K Fine FF[8bit 4:2:0][50p/59.94p][From 6K]" ,"DCI 4K FF[8bit 4:2:0][100p/119.88p]","UHD Fine FF[8bit 4:2:0][23.976p/25p/29.97p][From 5.6K]" ,"UHD Fine FF[8bit 4:2:0][50p/59.94p][From 5.6K]" ,"UHD FF[8bit 4:2:0][100p/119.88p]","DCI 4K S35[8bit 4:2:0][23.976p/24p/25p/29.97p]","DCI 4K S35[8bit 4:2:0][50p/59.94p]","DCI 4K S35[8bit 4:2:0][100p/119.88p]","UHD S35[8bit 4:2:0][23.976p/25p/29.97p]","UHD S35[8bit 4:2:0][50p/59.94p]","UHD S35[8bit 4:2:0][100p/119.88p]","FHD FF[8bit 4:2:0][23.976p/25p/29.97p]","FHD FF[8bit 4:2:0][50p/59.94p]","FHD FF[8bit 4:2:0][100p/119.88p]","FHD FF[8bit 4:2:0][200p/239.76p]","FHD S35[8bit 4:2:0][23.976p/25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]","FHD S35[8bit 4:2:0][100p/119.88p]"],
                "EOS R3_IPB HEVC" : ["DCI 4K Fine FF[10bit 4:2:2][23.976p/24p/25p/29.97p][From 6K]" ,"DCI 4K Fine FF[10bit 4:2:2][50p/59.94p][From 6K]" ,"UHD Fine FF[10bit 4:2:2][23.976p/25p/29.97p][From 5.6K]" ,"UHD Fine FF[10bit 4:2:2][50p/59.94p][From 5.6K]" ,"DCI 4K S35[10bit 4:2:2][23.976p/24p/25p/29.97p]","DCI 4K S35[10bit 4:2:2][50p/59.94p]","UHD S35[10bit 4:2:2][23.976p/25p/29.97p]","UHD S35[10bit 4:2:2][50p/59.94p]","FHD FF[10bit 4:2:2][23.976p/25p/29.97p]","FHD FF[10bit 4:2:2][50p/59.94p]","FHD S35[10bit 4:2:2][23.976p/25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]"],
                "EOS R3_IPB AVC" : ["DCI 4K Fine FF[8bit 4:2:0][23.976p/24p/25p/29.97p][From 6K]" ,"DCI 4K Fine FF[8bit 4:2:0][50p/59.94p][From 6K]" ,"UHD Fine FF[8bit 4:2:0][23.976p/25p/29.97p][From 5.6K]" ,"UHD Fine FF[8bit 4:2:0][50p/59.94p][From 5.6K]" ,"DCI 4K S35[8bit 4:2:0][23.976p/24p/25p/29.97p]","DCI 4K S35[8bit 4:2:0][50p/59.94p]","UHD S35[8bit 4:2:0][23.976p/25p/29.97p]","UHD S35[8bit 4:2:0][50p/59.94p]","FHD FF[8bit 4:2:0][23.976p/25p/29.97p]","FHD FF[8bit 4:2:0][50p/59.94p]","FHD S35[8bit 4:2:0][23.976p/25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]"],
                "EOS R3_IPB Light HEVC" : ["DCI 4K Fine FF[10bit 4:2:2][23.976p/24p/25p/29.97p][From 6K]" ,"DCI 4K Fine FF[10bit 4:2:2][50p/59.94p][From 6K]" ,"UHD Fine FF[10bit 4:2:2][23.976p/25p/29.97p][From 5.6K]" ,"UHD Fine FF[10bit 4:2:2][50p/59.94p][From 5.6K]" ,"DCI 4K S35[10bit 4:2:2][23.976p/24p/25p/29.97p]","DCI 4K S35[10bit 4:2:2][50p/59.94p]","UHD S35[10bit 4:2:2][23.976p/25p/29.97p]","UHD S35[10bit 4:2:2][50p/59.94p]","FHD FF[10bit 4:2:2][23.976p/25p/29.97p]","FHD FF[10bit 4:2:2][50p/59.94p]","FHD S35[10bit 4:2:2][23.976p/25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]"],
                "EOS R3_IPB Light AVC" : ["DCI 4K Fine FF[8bit 4:2:0][23.976p/24p/25p/29.97p][From 6K]" ,"DCI 4K Fine FF[8bit 4:2:0][50p/59.94p][From 6K]" ,"UHD Fine FF[8bit 4:2:0][23.976p/25p/29.97p][From 5.6K]" ,"UHD Fine FF[8bit 4:2:0][50p/59.94p][From 5.6K]" ,"DCI 4K S35[8bit 4:2:0][23.976p/24p/25p/29.97p]","DCI 4K S35[8bit 4:2:0][50p/59.94p]","UHD S35[8bit 4:2:0][23.976p/25p/29.97p]","UHD S35[8bit 4:2:0][50p/59.94p]","FHD FF[8bit 4:2:0][23.976p/25p/29.97p]","FHD FF[8bit 4:2:0][50p/59.94p]","FHD S35[8bit 4:2:0][23.976p/25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]"],
                
                "EOS R5 Mark2_RAW" : ["8K FF[8192*4320][12bit RAW][23.976p/24p/25p/29.97p][17:9]","DCI 4K FF[12bit SRAW][23.976p/24p]","DCI 4K FF[12bit SRAW][25p]","DCI 4K FF[12bit SRAW][29.97p]","DCI 4K FF[12bit SRAW][50p]","DCI 4K FF[12bit SRAW][59.94p]"],
                "EOS R5 Mark2_RAW Light" : ["8K FF[8192*4320][12bit RAW Light][23.976p/24p][17:9]","8K FF[8192*4320][12bit RAW Light][25p][17:9]","8K FF[8192*4320][12bit RAW Light][29.97p][17:9]","8K FF[8192*4320][12bit RAW Light][50p/59.94p][17:9]","DCI 4K FF[12bit SRAW][23.976p/24p]","DCI 4K FF[12bit SRAW][25p]","DCI 4K FF[12bit SRAW][29.97p]","DCI 4K FF[12bit SRAW][50p]","DCI 4K FF[12bit SRAW][59.94p]",],
                "EOS R5 Mark2_XF-HEVC S Intra HQ FF" : ["8K[10bit 4:2:2][23.976p/24p]"],
                "EOS R5 Mark2_XF-HEVC S Intra ST FF" : ["8K[10bit 4:2:2][23.976p/24p]","8K[10bit 4:2:2][25p]","8K[10bit 4:2:2][29.97p]"],
                "EOS R5 Mark2_XF-HEVC S Intra LT FF" : ["8K[10bit 4:2:2][23.976p/24p]","8K[10bit 4:2:2][25p]","8K[10bit 4:2:2][29.97p]"],
                "EOS R5 Mark2_XF-HEVC S LongGOP FF" : ["8K[10bit 4:2:2][23.976p/24p/25p/29.97p]","8K[10bit 4:2:0][23.976p/24p/25p/29.97p]","4K Fine[10bit 4:2:2][23.976p/24p/25p/29.97p][From 8K]" ,"4K Fine[10bit 4:2:0][23.976p/24p/25p/29.97p][From 8K]" ,"4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","4K[10bit 4:2:2][50p/59.94p]","4K[10bit 4:2:2][100p/119.88p]","4K[10bit 4:2:0][23.976p/24p/25p/29.97p]","4K[10bit 4:2:0][50p/59.94p]","4K[10bit 4:2:0][100p/119.88p]","2K[10bit 4:2:2][23.976p/24p/25p/29.97p/50p/59.94p][From 4K]" ,"2K[10bit 4:2:0][23.976p/24p/25p/29.97p/50p/59.94p][From 4K]" ,"2K[10bit 4:2:2][23.976p/24p/25p/29.97p/50p/59.94p]","2K[10bit 4:2:2][100p/119.88p]","2K[10bit 4:2:2][200p/239.76p]","2K[10bit 4:2:0][23.976p/24p/25p/29.97p/50p/59.94p]","2K[10bit 4:2:0][100p/119.88p]","2K[10bit 4:2:0][200p/239.76p]"],
                "EOS R5 Mark2_XF-HEVC S LongGOP S35" : ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","4K[10bit 4:2:2][50p/59.94p]","4K[10bit 4:2:0][23.976p/24p/25p/29.97p]","4K[10bit 4:2:0][50p/59.94p]","2K[10bit 4:2:2][23.976p/24p/25p/29.97p/50p/59.94p]","2K[10bit 4:2:2][100p/119.88p]","2K[10bit 4:2:0][23.976p/24p/25p/29.97p/50p/59.94p]","2K[10bit 4:2:0][100p/119.88p]"],
                "EOS R5 Mark2_XF-AVC S Intra HQ FF" : ["4K Fine[10bit 4:2:2][23.976p/24p][From 8K]" ,"4K Fine[10bit 4:2:2][25p][From 8K]" ,"4K Fine[10bit 4:2:2][29.97p][From 8K]" ,"4K[10bit 4:2:2][23.976p/24p]","4K[10bit 4:2:2][25p]","4K[10bit 4:2:2][29.97p]","4K[10bit 4:2:2][50p]","4K[10bit 4:2:2][59.94p]"],
                "EOS R5 Mark2_XF-AVC S Intra HQ S35" : ["4K[10bit 4:2:2][23.976p/24p]","4K[10bit 4:2:2][25p]","4K[10bit 4:2:2][29.97p]","4K[10bit 4:2:2][50p]","4K[10bit 4:2:2][59.94p]"],
                "EOS R5 Mark2_XF-AVC S Intra ST FF" : ["4K Fine[10bit 4:2:2][23.976p/24p][From 8K]" ,"4K Fine[10bit 4:2:2][25p][From 8K]" ,"4K Fine[10bit 4:2:2][29.97p][From 8K]" ,"4K[10bit 4:2:2][23.976p/24p]","4K[10bit 4:2:2][25p]","4K[10bit 4:2:2][29.97p]","4K[10bit 4:2:2][50p]","4K[10bit 4:2:2][59.94p]","4K[10bit 4:2:2][100p]","4K[10bit 4:2:2][119.88p]","2K[10bit 4:2:2][23.976p/24p][From 4K]" ,"2K[10bit 4:2:2][25p][From 4K]" ,"2K[10bit 4:2:2][29.97p][From 4K]" ,"2K[10bit 4:2:2][50p][From 4K]" ,"2K[10bit 4:2:2][59.94p][From 4K]" ,"2K[10bit 4:2:2][23.976p/24p]","2K[10bit 4:2:2][25p]","2K[10bit 4:2:2][29.97p]","2K[10bit 4:2:2][50p]","2K[10bit 4:2:2][59.94p]","2K[10bit 4:2:2][100p]","2K[10bit 4:2:2][119.88p]","2K[10bit 4:2:2][200p]","2K[10bit 4:2:2][239.76p]"],
                "EOS R5 Mark2_XF-AVC S Intra ST S35" : ["4K[10bit 4:2:2][23.976p/24p]","4K[10bit 4:2:2][25p]","4K[10bit 4:2:2][29.97p]","4K[10bit 4:2:2][50p]","4K[10bit 4:2:2][59.94p]","2K[10bit 4:2:2][23.976p/24p]","2K[10bit 4:2:2][25p]","2K[10bit 4:2:2][29.97p]","2K[10bit 4:2:2][50p]","2K[10bit 4:2:2][59.94p]","2K[10bit 4:2:2][100p]","2K[10bit 4:2:2][119.88p]"],
                "EOS R5 Mark2_XF-AVC S Intra LT FF" : ["4K Fine[10bit 4:2:2][23.976p/24p][From 8K]" ,"4K Fine[10bit 4:2:2][25p][From 8K]" ,"4K Fine[10bit 4:2:2][29.97p][From 8K]" ,"4K[10bit 4:2:2][23.976p/24p]","4K[10bit 4:2:2][25p]","4K[10bit 4:2:2][29.97p]","4K[10bit 4:2:2][50p]","4K[10bit 4:2:2][59.94p]","4K[10bit 4:2:2][100p]","4K[10bit 4:2:2][119.88p]"],
                "EOS R5 Mark2_XF-AVC S Intra LT S35" : ["4K[10bit 4:2:2][23.976p/24p]","4K[10bit 4:2:2][25p]","4K[10bit 4:2:2][29.97p]","4K[10bit 4:2:2][50p]","4K[10bit 4:2:2][59.94p]"],
                "EOS R5 Mark2_XF-AVC S LongGOP FF" : ["4K Fine[10bit 4:2:2][23.976p/24p/25p/29.97p][From 8K]" ,"4K Fine[8bit 4:2:0][23.976p/24p/25p/29.97p][From 8K]" ,"4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","4K[10bit 4:2:2][50p/59.94p]","4K[10bit 4:2:2][100p/119.88p]","4K[8bit 4:2:0][23.976p/24p/25p/29.97p]","4K[8bit 4:2:0][50p/59.94p]","4K[8bit 4:2:0][100p/119.88p]","2K[10bit 4:2:2][23.976p/24p/25p/29.97p/50p/59.94p][From 4K]" ,"2K[8bit 4:2:0][23.976p/24p/25p/29.97p/50p/59.94p][From 4K]" ,"2K[10bit 4:2:2][23.976p/24p/25p/29.97p/50p/59.94p]","2K[10bit 4:2:2][100p/119.88p]","2K[10bit 4:2:2][200p/239.76p]","2K[8bit 4:2:0][23.976p/24p/25p/29.97p/50p/59.94p]","2K[8bit 4:2:0][100p/119.88p]","2K[8bit 4:2:0][200p/239.76p]"],
                "EOS R5 Mark2_XF-AVC S LongGOP S35" : ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","4K[10bit 4:2:2][50p/59.94p]","4K[8bit 4:2:0][23.976p/24p/25p/29.97p]","4K[8bit 4:2:0][50p/59.94p]","2K[10bit 4:2:2][23.976p/24p/25p/29.97p/50p/59.94p]","2K[10bit 4:2:2][100p/119.88p]","2K[8bit 4:2:0][23.976p/24p/25p/29.97p/50p/59.94p]","2K[8bit 4:2:0][100p/119.88p]"],
                
                "EOS R5_RAW" : ["8K FF[8192*4320][12bit RAW][23.976p/24p/25p/29.97p][17:9]"],
                "EOS R5_RAW Light" : ["8K FF[8192*4320][12bit RAW Light][23.976p/24p][17:9]","8K FF[8192*4320][12bit RAW Light][25/29.97p][17:9]"],
                "EOS R5_ALL-I HEVC" : ["8K FF[8192*4320][10bit 4:2:2][23.976p/24p/25p/29.97p][17:9]","8K FF[8192*4320][8bit 4:2:0][23.976p/24p/25p/29.97p][17:9]","8K FF[10bit 4:2:2][23.976p/25p/29.97p]","8K FF[8bit 4:2:0][23.976p/25p/29.97p]","DCI 4K Fine FF[10bit 4:2:2][23.976p/24p/25p/29.97p][From 8.2K]" ,"DCI 4K FF[10bit 4:2:2][50p/59.94p]","DCI 4K FF[10bit 4:2:2][100p/119.88p]","UHD Fine FF[10bit 4:2:2][23.976p/25p/29.97p][From 7.7K]" ,"UHD FF[10bit 4:2:2][50p/59.94p]","UHD FF[10bit 4:2:2][100p/119.88p]","DCI 4K Fine S35[10bit 4:2:2][23.976p/24p/25p/29.97p][From 5.1K]" ,"DCI 4K Fine S35[10bit 4:2:2][50p/59.94p][From 5.1K]" ,"UHD Fine S35[10bit 4:2:2][23.976p/25p/29.97p][From 4.8K]" ,"UHD Fine S35[10bit 4:2:2][50p/59.94p][From 4.8K]" ,"FHD FF[10bit 4:2:2][23.976p/25p/29.97p][From 4K]" ,"FHD FF[10bit 4:2:2][50p/59.94p][From 4K]" ,"FHD FF[10bit 4:2:2][100p/119.88p][From 4k]" ,"FHD S35[10bit 4:2:2][23.976p/25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]"],
                "EOS R5_ALL-I AVC" : ["DCI 4K Fine FF[8bit 4:2:0][23.976p/24p/25p/29.97p][From 8.2K]" ,"DCI 4K FF[8bit 4:2:0][50p/59.94p]","DCI 4K FF[8bit 4:2:0][100p/119.88p]","UHD Fine FF[8bit 4:2:0][23.976p/25p/29.97p][From 7.7K]" ,"UHD FF[8bit 4:2:0][50p/59.94p]","UHD FF[8bit 4:2:0][100p/119.88p]","DCI 4K Fine S35[8bit 4:2:0][23.976p/24p/25p/29.97p][From 5.1K]" ,"DCI 4K Fine S35[8bit 4:2:0][50p/59.94p][From 5.1K]" ,"UHD Fine S35[8bit 4:2:0][23.976p/25p/29.97p][From 4.8K]" ,"UHD Fine S35[8bit 4:2:0][50p/59.94p][From 4.8K]" ,"FHD FF[8bit 4:2:0][23.976p/25p/29.97p][From 4K]" ,"FHD FF[8bit 4:2:0][50p/59.94p][From 4K]" ,"FHD FF[8bit 4:2:0][100p/119.88p][From 4k]" ,"FHD S35[8bit 4:2:0][23.976p/25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]"],
                "EOS R5_IPB HEVC" : ["8K FF[8192*4320][10bit 4:2:2][23.976p/24p/25p/29.97p][17:9]","8K FF[8192*4320][8bit 4:2:0][23.976p/24p/25p/29.97p][17:9]","8K FF[10bit 4:2:2][23.976p/25p/29.97p]","8K FF[8bit 4:2:0][23.976p/25p/29.97p]","DCI 4K Fine FF[10bit 4:2:2][23.976p/24p/25p/29.97p][From 8.2K]" ,"DCI 4K FF[10bit 4:2:2][50p/59.94p]","UHD Fine FF[10bit 4:2:2][23.976p/25p/29.97p][From 7.7K]" ,"UHD FF[10bit 4:2:2][50p/59.94p]","DCI 4K Fine S35[10bit 4:2:2][23.976p/24p/25p/29.97p][From 5.1K]" ,"DCI 4K Fine S35[10bit 4:2:2][50p/59.94p][From 5.1K]" ,"UHD Fine S35[10bit 4:2:2][23.976p/25p/29.97p][From 4.8K]" ,"UHD Fine S35[10bit 4:2:2][50p/59.94p][From 4.8K]" ,"FHD FF[10bit 4:2:2][23.976p/25p/29.97p][From 4K]" ,"FHD FF[10bit 4:2:2][50p/59.94p][From 4K]" ,"FHD S35[10bit 4:2:2][23.976p/25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]"],
                "EOS R5_IPB AVC" : ["DCI 4K Fine FF[8bit 4:2:0][23.976p/24p/25p/29.97p][From 8.2K]" ,"DCI 4K FF[8bit 4:2:0][50p/59.94p]","UHD Fine FF[8bit 4:2:0][23.976p/25p/29.97p][From 7.7K]" ,"UHD FF[8bit 4:2:0][50p/59.94p]","DCI 4K Fine S35[8bit 4:2:0][23.976p/24p/25p/29.97p][From 5.1K]" ,"DCI 4K Fine S35[8bit 4:2:0][50p/59.94p][From 5.1K]" ,"UHD Fine S35[8bit 4:2:0][23.976p/25p/29.97p][From 4.8K]" ,"UHD Fine S35[8bit 4:2:0][50p/59.94p][From 4.8K]" ,"FHD FF[8bit 4:2:0][23.976p/25p/29.97p][From 4K]" ,"FHD FF[8bit 4:2:0][50p/59.94p][From 4K]" ,"FHD S35[8bit 4:2:0][23.976p/25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]"],
                "EOS R5_IPB Light HEVC" : ["8K FF[8192*4320][10bit 4:2:2][23.976p/24p/25p/29.97p][17:9]","8K FF[8192*4320][8bit 4:2:0][23.976p/24p/25p/29.97p][17:9]","8K FF[10bit 4:2:2][23.976p/25p/29.97p]","8K FF[8bit 4:2:0][23.976p/25p/29.97p]","DCI 4K Fine FF[10bit 4:2:2][23.976p/24p/25p/29.97p][From 8.2K]" ,"DCI 4K FF[10bit 4:2:2][50p/59.94p]","UHD Fine FF[10bit 4:2:2][23.976p/25p/29.97p][From 7.7K]" ,"UHD FF[10bit 4:2:2][50p/59.94p]","DCI 4K Fine S35[10bit 4:2:2][23.976p/24p/25p/29.97p][From 5.1K]" ,"DCI 4K Fine S35[10bit 4:2:2][50p/59.94p][From 5.1K]" ,"UHD Fine S35[10bit 4:2:2][23.976p/25p/29.97p][From 4.8K]" ,"UHD Fine S35[10bit 4:2:2][50p/59.94p][From 4.8K]" ,"FHD FF[10bit 4:2:2][25p/29.97p][From 4K]" ,"FHD FF[10bit 4:2:2][50p/59.94p][From 4K]" ,"FHD S35[10bit 4:2:2][25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]"],
                "EOS R5_IPB Light AVC" : ["DCI 4K Fine FF[8bit 4:2:0][23.976p/24p/25p/29.97p][From 8.2K]" ,"DCI 4K FF[8bit 4:2:0][50p/59.94p]","UHD Fine FF[8bit 4:2:0][23.976p/25p/29.97p][From 7.7K]" ,"UHD FF[8bit 4:2:0][50p/59.94p]","DCI 4K Fine S35[8bit 4:2:0][23.976p/24p/25p/29.97p][From 5.1K]" ,"DCI 4K Fine S35[8bit 4:2:0][50p/59.94p][From 5.1K]" ,"UHD Fine S35[8bit 4:2:0][23.976p/25p/29.97p][From 4.8K]" ,"UHD Fine S35[8bit 4:2:0][50p/59.94p][From 4.8K]" ,"FHD FF[8bit 4:2:0][25p/29.97p][From 4K]" ,"FHD FF[8bit 4:2:0][50p/59.94p][From 4K]" ,"FHD S35[8bit 4:2:0][25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]"],

                "EOS R6 V_RAW" : ["7K FF[6960*4640][12bit RAW][23.976p/24p/25p/29.97p][OG]","7K FF[6960*3672][12bit RAW][23.976p/24p][17:9]","7K FF[6960*3672][12bit RAW][25p][17:9]","7K FF[6960*3672][12bit RAW][29.97p][17:9]"],
                "EOS R6 V_RAW Light" : ["7K FF[6960*4640][12bit RAW Light][23.976p/24p][OG]","7K FF[6960*4640][12bit RAW Light][25p][OG]","7K FF[6960*4640][12bit RAW Light][29.97p][OG]","7K FF[6960*3672][12bit RAW Light][23.976p/24p][17:9]","7K FF[6960*3672][12bit RAW Light][25p][17:9]","7K FF[6960*3672][12bit RAW Light][29.97p][17:9]","7K FF[6960*3672][12bit RAW Light][50p][17:9]","7K FF[6960*3672][12bit RAW Light][59.94p][17:9]"],
                "EOS R6 V_XF-HEVC S Intra HQ FF" : ["7K FF[6912*4608][10bit 4:2:2][23.976p/24p][OG]"],
                "EOS R6 V_XF-HEVC S Intra ST FF" : ["7K FF[6912*4608][10bit 4:2:2][23.976p/24p][OG]","7K FF[6912*4608][10bit 4:2:2][25p][OG]","7K FF[6912*4608][10bit 4:2:2][29.97p][OG]"],
                "EOS R6 V_XF-HEVC S Intra LT FF" : ["7K FF[6912*4608][10bit 4:2:2][23.976p/24p][OG]","7K FF[6912*4608][10bit 4:2:2][25p][OG]","7K FF[6912*4608][10bit 4:2:2][29.97p][OG]"],
                "EOS R6 V_XF-HEVC S LongGOP FF" : ["7K FF[6912*4608][10bit 4:2:2][23.976p/24p/25p/29.97p][OG]","7K FF[6912*4608][10bit 4:2:0][23.976p/24p/25p/29.97p][OG]","4K Fine FF[10bit 4:2:2][23.976p/24p/25p/29.97p][From 7K]" ,"4K Fine FF[10bit 4:2:2][50p/59.94p][From 7K]" ,"4K Fine FF[10bit 4:2:0][23.976p/24p/25p/29.97p][From 7K]" ,"4K Fine FF[10bit 4:2:0][50p/59.94p][From 7K]" ,"4K FF[10bit 4:2:2][23.976p/24p/25p/29.97p]","4K FF[10bit 4:2:2][50p/59.94p]","4K FF[10bit 4:2:2][100p/119.88p]","4K FF[10bit 4:2:0][23.976p/24p/25p/29.97p]","4K FF[10bit 4:2:0][50p/59.94p]","4K FF[10bit 4:2:0][100p/119.88p]","2K FF[10bit 4:2:2][23.976p/24p/25p/29.97p/50p/59.94p][From 3.5K]" ,"2K FF[10bit 4:2:2][100p/119.88p]","2K FFcrop[10bit 4:2:2][150p/179.82p]","2K FF[10bit 4:2:0][23.976p/24p/25p/29.97p/50p/59.94p][From 3.5K]" ,"2K FF[10bit 4:2:0][100p/119.88p]","2K FFcrop[10bit 4:2:0][150p/179.82p]"],
                "EOS R6 V_XF-HEVC S LongGOP S35" : ["4K S35[10bit 4:2:2][23.976p/24p/25p/29.97p]","4K S35[10bit 4:2:2][50p/59.94p]","4K S35[10bit 4:2:0][23.976p/24p/25p/29.97p]","4K S35[10bit 4:2:0][50p/59.94p]","2K S35[10bit 4:2:2][23.976p/24p/25p/29.97p/50p/59.94p]","2K S35[10bit 4:2:2][100p/119.88p]","2K S35[10bit 4:2:0][23.976p/24p/25p/29.97p/50p/59.94p]","2K S35[10bit 4:2:0][100p/119.88p]"],
                "EOS R6 V_XF-AVC S Intra HQ FF" : ["4K Fine FF[10bit 4:2:2][23.976p/24p][From 7K]" ,"4K Fine FF[10bit 4:2:2][25p][From 7K]" ,"4K Fine FF[10bit 4:2:2][29.97p][From 7K]" ,"4K Fine FF[10bit 4:2:2][50p][From 7K]" ,"4K Fine FF[10bit 4:2:2][59.94p][From 7K]" ,"4K FF[10bit 4:2:2][23.976p/24p]","4K FF[10bit 4:2:2][25p]","4K FF[10bit 4:2:2][29.97p]","4K FF[10bit 4:2:2][50p]","4K FF[10bit 4:2:2][59.94p]"],
                "EOS R6 V_XF-AVC S Intra ST FF" : ["4K Fine FF[10bit 4:2:2][23.976p/24p][From 7K]" ,"4K Fine FF[10bit 4:2:2][25p][From 7K]" ,"4K Fine FF[10bit 4:2:2][29.97p][From 7K]" ,"4K Fine FF[10bit 4:2:2][50p][From 7K]" ,"4K Fine FF[10bit 4:2:2][59.94p][From 7K]" ,"4K FF[10bit 4:2:2][23.976p/24p]","4K FF[10bit 4:2:2][25p]","4K FF[10bit 4:2:2][29.97p]","4K FF[10bit 4:2:2][50p]","4K FF[10bit 4:2:2][59.94p]","4K FF[10bit 4:2:2][100p]","4K FF[10bit 4:2:2][119.88p]","2K FF[10bit 4:2:2][23.976p/24p][From 3.5K]" ,"2K FF[10bit 4:2:2][25p][From 3.5K]" ,"2K FF[10bit 4:2:2][29.97p][From 3.5K]" ,"2K FF[10bit 4:2:2][50p][From 3.5K]" ,"2K FF[10bit 4:2:2][59.94p][From 3.5K]" ,"2K FF[10bit 4:2:2][100p]","2K FF[10bit 4:2:2][119.88p]","2K FFcrop[10bit 4:2:2][150p]","2K FFcrop[10bit 4:2:2][179.82p]"],
                "EOS R6 V_XF-AVC S Intra LT FF" : ["4K Fine FF[10bit 4:2:2][23.976p/24p][From 7K]" ,"4K Fine FF[10bit 4:2:2][25p][From 7K]" ,"4K Fine FF[10bit 4:2:2][29.97p][From 7K]" ,"4K Fine FF[10bit 4:2:2][50p][From 7K]" ,"4K Fine FF[10bit 4:2:2][59.94p][From 7K]" ,"4K FF[10bit 4:2:2][23.976p/24p]","4K FF[10bit 4:2:2][25p]","4K FF[10bit 4:2:2][29.97p]","4K FF[10bit 4:2:2][50p]","4K FF[10bit 4:2:2][59.94p]","4K FF[10bit 4:2:2][100p]","4K FF[10bit 4:2:2][119.88p]"],
                "EOS R6 V_XF-AVC S LongGOP FF" : ["4K Fine FF[10bit 4:2:2][23.976p/24p/25p/29.97p][From 7K]" ,"4K Fine FF[10bit 4:2:2][50p/59.94p][From 7K]" ,"4K Fine FF[8bit 4:2:0][23.976p/24p/25p/29.97p][From 7K]" ,"4K Fine FF[8bit 4:2:0][50p/59.94p][From 7K]" ,"4K FF[10bit 4:2:2][23.976p/24p/25p/29.97p]","4K FF[10bit 4:2:2][50p/59.94p]","4K FF[10bit 4:2:2][100p/119.88p]","4K FF[8bit 4:2:0][23.976p/24p/25p/29.97p]","4K FF[8bit 4:2:0][50p/59.94p]","4K FF[8bit 4:2:0][100p/119.88p]","2K FF[10bit 4:2:2][23.976p/24p/25p/29.97p/50p/59.94p][From 3.5K]" ,"2K FF[10bit 4:2:2][100p/119.88p]","2K FFcrop[10bit 4:2:2][150p/179.82p]","2K FF[8bit 4:2:0][23.976p/24p/25p/29.97p/50p/59.94p][From 3.5K]" ,"2K FF[8bit 4:2:0][100p/119.88p]","2K FFcrop[8bit 4:2:0][150p/179.82p]"],
                "EOS R6 V_XF-AVC S LongGOP S35" : ["4K S35[10bit 4:2:2][23.976p/24p/25p/29.97p]","4K S35[10bit 4:2:2][50p/59.94p]","4K S35[8bit 4:2:0][23.976p/24p/25p/29.97p]","4K S35[8bit 4:2:0][50p/59.94p]","2K S35[10bit 4:2:2][23.976p/24p/25p/29.97p/50p/59.94p]","2K S35[10bit 4:2:2][100p/119.88p]","2K S35[8bit 4:2:0][23.976p/24p/25p/29.97p/50p/59.94p]","2K S35[8bit 4:2:0][100p/119.88p]"],
                
                "EOS R6_IPB HEVC" : ["UHD Fine FF[10bit 4:2:2][23.976p/25p/29.97p][From 5.1K]" ,"UHD Fine FF[10bit 4:2:2][50p/59.94p][From 5.1K]" ,"UHD Fine S35[10bit 4:2:2][23.976p/25p/29.97p][From 3.4K]" ,"UHD Fine S35[10bit 4:2:2][50p/59.94p][From 3.4K]" ,"FHD FF[10bit 4:2:2][23.976p/25p/29.97p]","FHD FF[10bit 4:2:2][50p/59.94p]","FHD FF[10bit 4:2:2][100p/119.88p]","FHD S35[10bit 4:2:2][23.976p/25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]"],
                "EOS R6_IPB AVC" : ["UHD Fine FF[8bit 4:2:0][23.976p/25p/29.97p][From 5.1K]" ,"UHD Fine FF[8bit 4:2:0][50p/59.94p][From 5.1K]" ,"UHD Fine S35[8bit 4:2:0][23.976p/25p/29.97p][From 3.4K]" ,"UHD Fine S35[8bit 4:2:0][50p/59.94p][From 3.4K]" ,"FHD FF[8bit 4:2:0][23.976p/25p/29.97p]","FHD FF[8bit 4:2:0][50p/59.94p]","FHD FF[8bit 4:2:0][100p/119.88p]","FHD S35[8bit 4:2:0][23.976p/25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]"],
                "EOS R6_IPB Light HEVC" : ["UHD Fine FF[10bit 4:2:2][23.976p/25p/29.97p][From 5.1K]" ,"UHD Fine FF[10bit 4:2:2][50p/59.94p][From 5.1K]" ,"UHD Fine S35[10bit 4:2:2][23.976p/25p/29.97p][From 3.4K]" ,"UHD Fine S35[10bit 4:2:2][50p/59.94p][From 3.4K]" ,"FHD FF[10bit 4:2:2][25p/29.97p]","FHD FF[10bit 4:2:2][50p/59.94p]","FHD FF[10bit 4:2:2][100p/119.88p]","FHD S35[10bit 4:2:2][25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]"],
                "EOS R6_IPB Light AVC" : ["UHD Fine FF[8bit 4:2:0][23.976p/25p/29.97p][From 5.1K]" ,"UHD Fine FF[8bit 4:2:0][50p/59.94p][From 5.1K]" ,"UHD Fine S35[8bit 4:2:0][23.976p/25p/29.97p][From 3.4K]" ,"UHD Fine S35[8bit 4:2:0][50p/59.94p][From 3.4K]" ,"FHD FF[8bit 4:2:0][25p/29.97p]","FHD FF[8bit 4:2:0][50p/59.94p]","FHD FF[8bit 4:2:0][100p/119.88p]","FHD S35[8bit 4:2:0][25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]"],
                
                "EOS R6 Mark2_IPB HEVC" : ["UHD Fine FF[10bit 4:2:2][23.976p/25p/29.97p][From 6K]" ,"UHD Fine FF[10bit 4:2:2][50p/59.94p][From 6K]" ,"UHD S35[10bit 4:2:2][23.976p/25p/29.97p]","UHD S35[10bit 4:2:2][50p/59.94p]","FHD FF[10bit 4:2:2][23.976p/25p/29.97p]","FHD FF[10bit 4:2:2][50p/59.94p]","FHD FF[10bit 4:2:2][100p/119.88p]","FHD FF[10bit 4:2:2][150p/179.82p]","FHD S35[10bit 4:2:2][23.976p/25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]"],
                "EOS R6 Mark2_IPB AVC" : ["UHD Fine FF[8bit 4:2:0][23.976p/25p/29.97p][From 6K]" ,"UHD Fine FF[8bit 4:2:0][50p/59.94p][From 6K]" ,"UHD S35[8bit 4:2:0][23.976p/25p/29.97p]","UHD S35[8bit 4:2:0][50p/59.94p]","FHD FF[8bit 4:2:0][23.976p/25p/29.97p]","FHD FF[8bit 4:2:0][50p/59.94p]","FHD FF[8bit 4:2:0][100p/119.88p]","FHD FF[10bit 4:2:2][150p/179.82p]","FHD S35[8bit 4:2:0][23.976p/25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]"],
                "EOS R6 Mark2_IPB Light HEVC" : ["UHD Fine FF[10bit 4:2:2][23.976p/25p/29.97p][From 6K]" ,"UHD Fine FF[10bit 4:2:2][50p/59.94p][From 6K]" ,"UHD S35[10bit 4:2:2][23.976p/25p/29.97p]","UHD S35[10bit 4:2:2][50p/59.94p]","FHD FF[10bit 4:2:2][23.976p/25p/29.97p]","FHD FF[10bit 4:2:2][50p/59.94p]","FHD FF[10bit 4:2:2][100p/119.88p]","FHD FF[10bit 4:2:2][150p/179.82p]","FHD S35[10bit 4:2:2][23.976p/25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]"],
                "EOS R6 Mark2_IPB Light AVC" : ["UHD Fine FF[8bit 4:2:0][23.976p/25p/29.97p][From 6K]" ,"UHD Fine FF[8bit 4:2:0][50p/59.94p][From 6K]" ,"UHD S35[8bit 4:2:0][23.976p/25p/29.97p]","UHD S35[8bit 4:2:0][50p/59.94p]","FHD FF[8bit 4:2:0][23.976p/25p/29.97p]","FHD FF[8bit 4:2:0][50p/59.94p]","FHD FF[8bit 4:2:0][100p/119.88p]","FHD FF[10bit 4:2:2][150p/179.82p]","FHD S35[8bit 4:2:0][23.976p/25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]"],
                
                "EOS R8_IPB HEVC" : ["UHD Fine FF[10bit 4:2:2][23.976p/25p/29.97p][From 6K]" ,"UHD Fine FF[10bit 4:2:2][50p/59.94p][From 6K]" ,"UHD S35[10bit 4:2:2][23.976p/25p/29.97p]","UHD S35[10bit 4:2:2][50p/59.94p]","FHD FF[10bit 4:2:2][23.976p/25p/29.97p]","FHD FF[10bit 4:2:2][50p/59.94p]","FHD FF[10bit 4:2:2][100p/119.88p]","FHD FF[10bit 4:2:2][150p/179.82p]","FHD S35[10bit 4:2:2][23.976p/25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]"],
                "EOS R8_IPB AVC" : ["UHD Fine FF[8bit 4:2:0][23.976p/25p/29.97p][From 6K]" ,"UHD Fine FF[8bit 4:2:0][50p/59.94p][From 6K]" ,"UHD S35[8bit 4:2:0][23.976p/25p/29.97p]","UHD S35[8bit 4:2:0][50p/59.94p]","FHD FF[8bit 4:2:0][23.976p/25p/29.97p]","FHD FF[8bit 4:2:0][50p/59.94p]","FHD FF[8bit 4:2:0][100p/119.88p]","FHD FF[10bit 4:2:2][150p/179.82p]","FHD S35[8bit 4:2:0][23.976p/25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]"],
                "EOS R8_IPB Light HEVC" : ["UHD Fine FF[10bit 4:2:2][23.976p/25p/29.97p][From 6K]" ,"UHD Fine FF[10bit 4:2:2][50p/59.94p][From 6K]" ,"UHD S35[10bit 4:2:2][23.976p/25p/29.97p]","UHD S35[10bit 4:2:2][50p/59.94p]","FHD FF[10bit 4:2:2][23.976p/25p/29.97p]","FHD FF[10bit 4:2:2][50p/59.94p]","FHD FF[10bit 4:2:2][100p/119.88p]","FHD FF[10bit 4:2:2][150p/179.82p]","FHD S35[10bit 4:2:2][23.976p/25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]"],
                "EOS R8_IPB Light AVC" : ["UHD Fine FF[8bit 4:2:0][23.976p/25p/29.97p][From 6K]" ,"UHD Fine FF[8bit 4:2:0][50p/59.94p][From 6K]" ,"UHD S35[8bit 4:2:0][23.976p/25p/29.97p]","UHD S35[8bit 4:2:0][50p/59.94p]","FHD FF[8bit 4:2:0][23.976p/25p/29.97p]","FHD FF[8bit 4:2:0][50p/59.94p]","FHD FF[8bit 4:2:0][100p/119.88p]","FHD FF[10bit 4:2:2][150p/179.82p]","FHD S35[8bit 4:2:0][23.976p/25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]"],
                
                "EOS R7_IPB HEVC" : ["UHD Fine S35[10bit 4:2:2][23.976p/25p/29.97p][From 7K]" ,"UHD S35[10bit 4:2:2][50p/59.94p]","UHD S16[10bit 4:2:2][50p/59.94p]","FHD S35[10bit 4:2:2][23.976p/25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]","FHD S35[10bit 4:2:2][100p/119.88p]"],
                "EOS R7_IPB AVC" : ["UHD Fine S35[8bit 4:2:0][23.976p/25p/29.97p][From 7K]" ,"UHD S35[8bit 4:2:0][50p/59.94p]","UHD S16[8bit 4:2:0][50p/59.94p]","FHD S35[8bit 4:2:0][23.976p/25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]","FHD S35[8bit 4:2:0][100p/119.88p]"],
                "EOS R7_IPB Light HEVC" : ["UHD Fine S35[10bit 4:2:2][23.976p/25p/29.97p][From 7K]" ,"UHD S35[10bit 4:2:2][50p/59.94p]","UHD S16[10bit 4:2:2][50p/59.94p]","FHD S35[10bit 4:2:2][23.976p/25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]","FHD S35[10bit 4:2:2][100p/119.88p]"],
                "EOS R7_IPB Light AVC" : ["UHD Fine S35[8bit 4:2:0][23.976p/25p/29.97p][From 7K]" ,"UHD S35[8bit 4:2:0][50p/59.94p]","UHD S16[8bit 4:2:0][50p/59.94p]","FHD S35[8bit 4:2:0][23.976p/25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]","FHD S35[8bit 4:2:0][100p/119.88p]"],
            ]
            resolutions = CanonResolutions[key, default: ["无选项"]]
        }

        return resolutions
    }

private struct CanonResolutionMergeInfo {
    let family: String
    let format: String
    let crop: String
    let color: String
    let fpsComponents: [String]
    let fpsKey: String
    let sourceKey: String
    let displayFrom: String
    let isFine: Bool
}

private let canonResolutionFrameRateOrder = [
    "23.976p", "24p", "25p", "29.97p",
    "50p", "59.94p", "100p", "119.88p",
    "150p", "179.82p", "200p", "239.76p"
]

private func CanonMergedResolutions(cameradata: CameraData, resolutions: [String]) -> [String] {
    let mergeContext = CanonResolutionMergeContext(resolutions: resolutions)
    let groups = CanonResolutionMergeGroups(resolutions: resolutions)
    let codec = CanonEffectiveCodec(cameradata: cameradata)
    var emittedKeys = Set<String>()
    var mergedResolutions: [String] = []
    
    for resolution in resolutions {
        guard let key = CanonResolutionMergeKey(resolution: resolution),
              let group = groups[key],
              group.count > 1,
              CanonResolutionHasMergeableFormats(resolutions: group),
              CanonMergedResolutionSpeed(codec: codec, resolutions: group) != 0 else {
            mergedResolutions.append(resolution)
            continue
        }
        
        if !emittedKeys.contains(key) {
            mergedResolutions.append(CanonMergedResolutionLabel(resolutions: group, context: mergeContext))
            emittedKeys.insert(key)
        }
    }
    
    return mergedResolutions
}

func CanonMergedResolutionSpeed(cameradata: CameraData) -> Double {
    let rawResolutions = CanonRawResolution(cameradata: cameradata)
    let mergeContext = CanonResolutionMergeContext(resolutions: rawResolutions)
    let groups = CanonResolutionMergeGroups(resolutions: rawResolutions)
    let codec = CanonEffectiveCodec(cameradata: cameradata)
    
    for group in groups.values where group.count > 1 && CanonResolutionHasMergeableFormats(resolutions: group) {
        let speed = CanonMergedResolutionSpeed(codec: codec, resolutions: group)
        if speed != 0 && CanonMergedResolutionLabel(resolutions: group, context: mergeContext) == cameradata.Resolution {
            return speed
        }
    }
    
    return 0
}

private struct CanonResolutionMergeContext {
    let cropCountsByFamily: [String: Int]
    
    init(resolutions: [String]) {
        var cropsByFamily: [String: Set<String>] = [:]
        for resolution in resolutions {
            guard let info = CanonParsedResolutionMergeInfo(resolution: resolution) else {
                continue
            }
            cropsByFamily[info.family, default: []].insert(info.crop)
        }
        cropCountsByFamily = cropsByFamily.mapValues { $0.count }
    }
    
    func shouldShowCrop(for info: CanonResolutionMergeInfo) -> Bool {
        return !info.crop.isEmpty && (cropCountsByFamily[info.family] ?? 0) > 1
    }
}

private func CanonResolutionMergeGroups(resolutions: [String]) -> [String: [String]] {
    var groups: [String: [String]] = [:]
    
    for resolution in resolutions {
        guard let key = CanonResolutionMergeKey(resolution: resolution) else {
            continue
        }
        groups[key, default: []].append(resolution)
    }
    
    return groups
}

private func CanonResolutionMergeKey(resolution: String) -> String? {
    guard let info = CanonParsedResolutionMergeInfo(resolution: resolution) else {
        return nil
    }
    return [info.family, info.crop, info.color, info.sourceKey, info.fpsKey].joined(separator: "_")
}

private func CanonParsedResolutionMergeInfo(resolution: String) -> CanonResolutionMergeInfo? {
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
    
    let bracketValues = CanonResolutionBracketValues(resolution)
    guard let color = bracketValues.first(where: { $0.contains("bit") || $0.contains("RAW") || $0.contains("SRAW") }),
          let fps = bracketValues.first(where: { $0.contains("p") }) else {
        return nil
    }
    
    let fpsComponents = CanonResolutionFPSComponents(fps)
    guard !fpsComponents.isEmpty else {
        return nil
    }
    
    let from = bracketValues.first(where: { $0.hasPrefix("From ") }) ?? ""
    let isFine = family == "4K" && !from.isEmpty && (explicitFine || ["DCI", "UHD"].contains(format))
    let keyComponents = fpsComponents.filter { $0 != "24p" }
    let fpsKey = (keyComponents.isEmpty ? fpsComponents : keyComponents).joined(separator: "/")
    
    return CanonResolutionMergeInfo(
        family: family,
        format: format,
        crop: crop,
        color: color,
        fpsComponents: fpsComponents,
        fpsKey: fpsKey,
        sourceKey: isFine ? "Fine" : from,
        displayFrom: from,
        isFine: isFine
    )
}

private func CanonResolutionBracketValues(_ resolution: String) -> [String] {
    return resolution
        .split(separator: "[")
        .dropFirst()
        .compactMap { part in
            part.split(separator: "]").first.map(String.init)
        }
}

private func CanonResolutionFPSComponents(_ fps: String) -> [String] {
    return fps
        .split(separator: "/")
        .map { CanonNormalizedFPSComponent(String($0)) }
        .filter { !$0.isEmpty }
}

private func CanonNormalizedFPSComponent(_ component: String) -> String {
    let trimmed = component.trimmingCharacters(in: .whitespacesAndNewlines)
    if trimmed.isEmpty {
        return ""
    }
    return trimmed.hasSuffix("p") ? trimmed : trimmed + "p"
}

private func CanonResolutionHasMergeableFormats(resolutions: [String]) -> Bool {
    let formats = Set(resolutions.compactMap { CanonParsedResolutionMergeInfo(resolution: $0)?.format })
    return formats.count > 1
}

private func CanonMergedResolutionLabel(resolutions: [String], context: CanonResolutionMergeContext) -> String {
    let infos = resolutions.compactMap { CanonParsedResolutionMergeInfo(resolution: $0) }
    guard let firstInfo = infos.first else {
        return resolutions.first ?? ""
    }
    
    var fpsSet = Set<String>()
    for info in infos {
        for fps in info.fpsComponents {
            fpsSet.insert(fps)
        }
    }
    
    var orderedFPS = canonResolutionFrameRateOrder.filter { fpsSet.contains($0) }
    let extraFPS = fpsSet.subtracting(Set(canonResolutionFrameRateOrder)).sorted()
    orderedFPS.append(contentsOf: extraFPS)
    
    let crop = context.shouldShowCrop(for: firstInfo) ? " \(firstInfo.crop)" : ""
    if firstInfo.isFine {
        let displayFrom = infos.first(where: { $0.format == "DCI" && !$0.displayFrom.isEmpty })?.displayFrom ?? firstInfo.displayFrom
        return "\(firstInfo.family) Fine\(crop)[\(firstInfo.color)][\(orderedFPS.joined(separator: "/"))][\(displayFrom)]"
    }
    return "\(firstInfo.family)\(crop)[\(firstInfo.color)][\(orderedFPS.joined(separator: "/"))]"
}

private func CanonMergedResolutionSpeed(codec: String, resolutions: [String]) -> Double {
    let speeds = Set(resolutions.map { CanonCodecSpeedValue(codec: codec, resolution: $0) })
    if speeds.count == 1, let speed = speeds.first, speed != 0 {
        return speed
    }
    return 0
}

private let canonCodecLevelValues = ["HQ", "ST", "LT"]

func CanonCodecLevelOptions(cameradata: CameraData) -> [String] {
    return CanonCodecNeedsLevel(cameradata: cameradata) ? canonCodecLevelValues : []
}

func CanonEffectiveCodec(cameradata: CameraData) -> String {
    guard CanonCodecNeedsLevel(cameradata: cameradata) else {
        return cameradata.Codec
    }

    guard canonCodecLevelValues.contains(cameradata.CanonCodecLevel) else {
        return ""
    }

    return CanonCodecWithLevel(codec: cameradata.Codec, level: cameradata.CanonCodecLevel)
}

private func CanonCodecNeedsLevel(cameradata: CameraData) -> Bool {
    return cameradata.BrandName == "Canon" && CanonCodecNeedsLevel(codec: cameradata.Codec)
}

private func CanonCodecNeedsLevel(codec: String) -> Bool {
    if codec.contains(" Intra HQ ") || codec.contains(" Intra ST ") || codec.contains(" Intra LT ") {
        return false
    }

    return codec.hasPrefix("XF-HEVC S Intra ") || codec.hasPrefix("XF-AVC S Intra ")
}

private func CanonCodecWithLevel(codec: String, level: String) -> String {
    if codec.hasPrefix("XF-HEVC S Intra ") {
        return codec.replacingOccurrences(of: "XF-HEVC S Intra ", with: "XF-HEVC S Intra \(level) ")
    }

    if codec.hasPrefix("XF-AVC S Intra ") {
        return codec.replacingOccurrences(of: "XF-AVC S Intra ", with: "XF-AVC S Intra \(level) ")
    }

    return codec
}
