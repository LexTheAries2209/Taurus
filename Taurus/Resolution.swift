//
//  Resolution.swift
//  Taurus
//
//  Created by 吴坤城 on 11/23/23.
//

import Foundation

//分辨率库
public let ResolutionName : [String:[String]] = [
    //default 16:9
    
    //Canon
    "EOS R3_RAW" : ["DCI 6K FF[12bit RAW][23.98p/24p]","DCI 6K FF[12bit RAW][25p/29.97p]","DCI 6K FF[12bit RAW][50p/59.94p]"],
    "EOS R3_RAW Light" : ["DCI 6K FF[12bit RAW][23.98p/24p]","DCI 6K FF[12bit RAW][25p/29.97p]","DCI 6K FF[12bit RAW][50p/59.94p]"],
    "EOS R3_ALL-I HEVC" : ["DCI 4K FF[10bit 4:2:2][23.98p/24p/25p/29.97p][From 6K]","DCI 4K FF[10bit 4:2:2][50p/59.94p][From 6K]","DCI 4K FF[10bit 4:2:2][100p/119.88p]","UHD FF[10bit 4:2:2][23.98p/25p/29.97p][From 5.6K]","UHD FF[10bit 4:2:2][50p/59.94p][From 5.6K]","UHD FF[10bit 4:2:2][100p/119.88p]","DCI 4K S35[10bit 4:2:2][23.98p/24p/25p/29.97p]","DCI 4K S35[10bit 4:2:2][50p/59.94p]","DCI 4K S35[10bit 4:2:2][100p/119.88p]","UHD S35[10bit 4:2:2][23.98p/25p/29.97p]","UHD S35[10bit 4:2:2][50p/59.94p]","UHD S35[10bit 4:2:2][100p/119.88p]","FHD FF[10bit 4:2:2][23.98p/25p/29.97p]","FHD FF[10bit 4:2:2][50p/59.94p]","FHD FF[10bit 4:2:2][100p/119.88p]","FHD FF[10bit 4:2:2][200p/239.76p]","FHD S35[10bit 4:2:2][23.98p/25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]","FHD S35[10bit 4:2:2][100p/119.88p]"],
    "EOS R3_ALL-I AVC" : ["DCI 4K FF[8bit 4:2:0][23.98p/24p/25p/29.97p][From 6K]","DCI 4K FF[8bit 4:2:0][50p/59.94p][From 6K]","DCI 4K FF[8bit 4:2:0][100p/119.88p]","UHD FF[8bit 4:2:0][23.98p/25p/29.97p][From 5.6K]","UHD FF[8bit 4:2:0][50p/59.94p][From 5.6K]","UHD FF[8bit 4:2:0][100p/119.88p]","DCI 4K S35[8bit 4:2:0][23.98p/24p/25p/29.97p]","DCI 4K S35[8bit 4:2:0][50p/59.94p]","DCI 4K S35[8bit 4:2:0][100p/119.88p]","UHD S35[8bit 4:2:0][23.98p/25p/29.97p]","UHD S35[8bit 4:2:0][50p/59.94p]","UHD S35[8bit 4:2:0][100p/119.88p]","FHD FF[8bit 4:2:0][23.98p/25p/29.97p]","FHD FF[8bit 4:2:0][50p/59.94p]","FHD FF[8bit 4:2:0][100p/119.88p]","FHD FF[8bit 4:2:0][200p/239.76p]","FHD S35[8bit 4:2:0][23.98p/25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]","FHD S35[8bit 4:2:0][100p/119.88p]"],
    "EOS R3_IPB HEVC" : ["DCI 4K FF[10bit 4:2:2][23.98p/24p/25p/29.97p][From 6K]","DCI 4K FF[10bit 4:2:2][50p/59.94p][From 6K]","UHD FF[10bit 4:2:2][23.98p/25p/29.97p][From 5.6K]","UHD FF[10bit 4:2:2][50p/59.94p][From 5.6K]","DCI 4K S35[10bit 4:2:2][23.98p/24p/25p/29.97p]","DCI 4K S35[10bit 4:2:2][50p/59.94p]","UHD S35[10bit 4:2:2][23.98p/25p/29.97p]","UHD S35[10bit 4:2:2][50p/59.94p]","FHD FF[10bit 4:2:2][23.98p/25p/29.97p]","FHD FF[10bit 4:2:2][50p/59.94p]","FHD S35[10bit 4:2:2][23.98p/25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]"],
    "EOS R3_IPB AVC" : ["DCI 4K FF[8bit 4:2:0][23.98p/24p/25p/29.97p][From 6K]","DCI 4K FF[8bit 4:2:0][50p/59.94p][From 6K]","UHD FF[8bit 4:2:0][23.98p/25p/29.97p][From 5.6K]","UHD FF[8bit 4:2:0][50p/59.94p][From 5.6K]","DCI 4K S35[8bit 4:2:0][23.98p/24p/25p/29.97p]","DCI 4K S35[8bit 4:2:0][50p/59.94p]","UHD S35[8bit 4:2:0][23.98p/25p/29.97p]","UHD S35[8bit 4:2:0][50p/59.94p]","FHD FF[8bit 4:2:0][23.98p/25p/29.97p]","FHD FF[8bit 4:2:0][50p/59.94p]","FHD S35[8bit 4:2:0][23.98p/25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]"],
    "EOS R3_IPB Light HEVC" : ["DCI 4K FF[10bit 4:2:2][23.98p/24p/25p/29.97p][From 6K]","DCI 4K FF[10bit 4:2:2][50p/59.94p][From 6K]","UHD FF[10bit 4:2:2][23.98p/25p/29.97p][From 5.6K]","UHD FF[10bit 4:2:2][50p/59.94p][From 5.6K]","DCI 4K S35[10bit 4:2:2][23.98p/24p/25p/29.97p]","DCI 4K S35[10bit 4:2:2][50p/59.94p]","UHD S35[10bit 4:2:2][23.98p/25p/29.97p]","UHD S35[10bit 4:2:2][50p/59.94p]","FHD FF[10bit 4:2:2][23.98p/25p/29.97p]","FHD FF[10bit 4:2:2][50p/59.94p]","FHD S35[10bit 4:2:2][23.98p/25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]"],
    "EOS R3_IPB Light AVC" : ["DCI 4K FF[8bit 4:2:0][23.98p/24p/25p/29.97p][From 6K]","DCI 4K FF[8bit 4:2:0][50p/59.94p][From 6K]","UHD FF[8bit 4:2:0][23.98p/25p/29.97p][From 5.6K]","UHD FF[8bit 4:2:0][50p/59.94p][From 5.6K]","DCI 4K S35[8bit 4:2:0][23.98p/24p/25p/29.97p]","DCI 4K S35[8bit 4:2:0][50p/59.94p]","UHD S35[8bit 4:2:0][23.98p/25p/29.97p]","UHD S35[8bit 4:2:0][50p/59.94p]","FHD FF[8bit 4:2:0][23.98p/25p/29.97p]","FHD FF[8bit 4:2:0][50p/59.94p]","FHD S35[8bit 4:2:0][23.98p/25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]"],
    
    "EOS R5_RAW" : ["DCI 8K FF[12bit RAW][23.98p/24p/25p/29.97p]"],
    "EOS R5_RAW Light" : ["DCI 8K FF[12bit RAW Light][23.98p/24p]","DCI 8K FF[12bit RAW Light][25/29.97p]"],
    "EOS R5_ALL-I HEVC" : ["DCI 8K FF[10bit 4:2:2][23.98p/24p/25p/29.97p]","DCI 8K FF[8bit 4:2:0][23.98p/24p/25p/29.97p]","8K FF[10bit 4:2:2][23.98p/25p/29.97p]","8K FF[8bit 4:2:0][23.98p/25p/29.97p]","DCI 4K FF[10bit 4:2:2][23.98p/24p/25p/29.97p][From 8.2K]","DCI 4K FF[10bit 4:2:2][50p/59.94p]","DCI 4K FF[10bit 4:2:2][100p/119.88p]","UHD FF[10bit 4:2:2][23.98p/25p/29.97p][From 7.7K]","UHD FF[10bit 4:2:2][50p/59.94p]","UHD FF[10bit 4:2:2][100p/119.88p]","DCI 4K S35[10bit 4:2:2][23.98p/24p/25p/29.97p][From 5.1K]","DCI 4K S35[10bit 4:2:2][50p/59.94p][From 5.1K]","UHD S35[10bit 4:2:2][23.98p/25p/29.97p][From 4.8K]","UHD S35[10bit 4:2:2][50p/59.94p][From 4.8K]","FHD FF[10bit 4:2:2][23.98p/25p/29.97p][From 4K]","FHD FF[10bit 4:2:2][50p/59.94p][From 4K]","FHD FF[10bit 4:2:2][100p/119.88p][From 4k]","FHD S35[10bit 4:2:2][23.98p/25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]"],
    "EOS R5_ALL-I AVC" : ["DCI 4K FF[8bit 4:2:0][23.98p/24p/25p/29.97p][From 8.2K]","DCI 4K FF[8bit 4:2:0][50p/59.94p]","DCI 4K FF[8bit 4:2:0][100p/119.88p]","UHD FF[8bit 4:2:0][23.98p/25p/29.97p][From 7.7K]","UHD FF[8bit 4:2:0][50p/59.94p]","UHD FF[8bit 4:2:0][100p/119.88p]","DCI 4K S35[8bit 4:2:0][23.98p/24p/25p/29.97p][From 5.1K]","DCI 4K S35[8bit 4:2:0][50p/59.94p][From 5.1K]","UHD S35[8bit 4:2:0][23.98p/25p/29.97p][From 4.8K]","UHD S35[8bit 4:2:0][50p/59.94p][From 4.8K]","FHD FF[8bit 4:2:0][23.98p/25p/29.97p][From 4K]","FHD FF[8bit 4:2:0][50p/59.94p][From 4K]","FHD FF[8bit 4:2:0][100p/119.88p][From 4k]","FHD S35[8bit 4:2:0][23.98p/25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]"],
    "EOS R5_IPB HEVC" : ["DCI 8K FF[10bit 4:2:2][23.98p/24p/25p/29.97p]","DCI 8K FF[8bit 4:2:0][23.98p/24p/25p/29.97p]","8K FF[10bit 4:2:2][23.98p/25p/29.97p]","8K FF[8bit 4:2:0][23.98p/25p/29.97p]","DCI 4K FF[10bit 4:2:2][23.98p/24p/25p/29.97p][From 8.2K]","DCI 4K FF[10bit 4:2:2][50p/59.94p]","UHD FF[10bit 4:2:2][23.98p/25p/29.97p][From 7.7K]","UHD FF[10bit 4:2:2][50p/59.94p]","DCI 4K S35[10bit 4:2:2][23.98p/24p/25p/29.97p][From 5.1K]","DCI 4K S35[10bit 4:2:2][50p/59.94p][From 5.1K]","UHD S35[10bit 4:2:2][23.98p/25p/29.97p][From 4.8K]","UHD S35[10bit 4:2:2][50p/59.94p][From 4.8K]","FHD FF[10bit 4:2:2][23.98p/25p/29.97p][From 4K]","FHD FF[10bit 4:2:2][50p/59.94p][From 4K]","FHD S35[10bit 4:2:2][23.98p/25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]"],
    "EOS R5_IPB AVC" : ["DCI 4K FF[8bit 4:2:0][23.98p/24p/25p/29.97p][From 8.2K]","DCI 4K FF[8bit 4:2:0][50p/59.94p]","UHD FF[8bit 4:2:0][23.98p/25p/29.97p][From 7.7K]","UHD FF[8bit 4:2:0][50p/59.94p]","DCI 4K S35[8bit 4:2:0][23.98p/24p/25p/29.97p][From 5.1K]","DCI 4K S35[8bit 4:2:0][50p/59.94p][From 5.1K]","UHD S35[8bit 4:2:0][23.98p/25p/29.97p][From 4.8K]","UHD S35[8bit 4:2:0][50p/59.94p][From 4.8K]","FHD FF[8bit 4:2:0][23.98p/25p/29.97p][From 4K]","FHD FF[8bit 4:2:0][50p/59.94p][From 4K]","FHD S35[8bit 4:2:0][23.98p/25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]"],
    "EOS R5_IPB Light HEVC" : ["DCI 8K FF[10bit 4:2:2][23.98p/24p/25p/29.97p]","DCI 8K FF[8bit 4:2:0][23.98p/24p/25p/29.97p]","8K FF[10bit 4:2:2][23.98p/25p/29.97p]","8K FF[8bit 4:2:0][23.98p/25p/29.97p]","DCI 4K FF[10bit 4:2:2][23.98p/24p/25p/29.97p][From 8.2K]","DCI 4K FF[10bit 4:2:2][50p/59.94p]","UHD FF[10bit 4:2:2][23.98p/25p/29.97p][From 7.7K]","UHD FF[10bit 4:2:2][50p/59.94p]","DCI 4K S35[10bit 4:2:2][23.98p/24p/25p/29.97p][From 5.1K]","DCI 4K S35[10bit 4:2:2][50p/59.94p][From 5.1K]","UHD S35[10bit 4:2:2][23.98p/25p/29.97p][From 4.8K]","UHD S35[10bit 4:2:2][50p/59.94p][From 4.8K]","FHD FF[10bit 4:2:2][25p/29.97p][From 4K]","FHD FF[10bit 4:2:2][50p/59.94p][From 4K]","FHD S35[10bit 4:2:2][25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]"],
    "EOS R5_IPB Light AVC" : ["DCI 4K FF[8bit 4:2:0][23.98p/24p/25p/29.97p][From 8.2K]","DCI 4K FF[8bit 4:2:0][50p/59.94p]","UHD FF[8bit 4:2:0][23.98p/25p/29.97p][From 7.7K]","UHD FF[8bit 4:2:0][50p/59.94p]","DCI 4K S35[8bit 4:2:0][23.98p/24p/25p/29.97p][From 5.1K]","DCI 4K S35[8bit 4:2:0][50p/59.94p][From 5.1K]","UHD S35[8bit 4:2:0][23.98p/25p/29.97p][From 4.8K]","UHD S35[8bit 4:2:0][50p/59.94p][From 4.8K]","FHD FF[8bit 4:2:0][25p/29.97p][From 4K]","FHD FF[8bit 4:2:0][50p/59.94p][From 4K]","FHD S35[8bit 4:2:0][25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]"],
    
    "EOS R6_IPB HEVC" : ["UHD FF[10bit 4:2:2][23.98p/25p/29.97p][From 5.1K]","UHD FF[10bit 4:2:2][50p/59.94p][From 5.1K]","UHD S35[10bit 4:2:2][23.98p/25p/29.97p][From 3.4K]","UHD S35[10bit 4:2:2][50p/59.94p][From 3.4K]","FHD FF[10bit 4:2:2][23.98p/25p/29.97p]","FHD FF[10bit 4:2:2][50p/59.94p]","FHD FF[10bit 4:2:2][100p/119.88p]","FHD S35[10bit 4:2:2][23.98p/25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]"],
    "EOS R6_IPB AVC" : ["UHD FF[8bit 4:2:0][23.98p/25p/29.97p][From 5.1K]","UHD FF[8bit 4:2:0][50p/59.94p][From 5.1K]","UHD S35[8bit 4:2:0][23.98p/25p/29.97p][From 3.4K]","UHD S35[8bit 4:2:0][50p/59.94p][From 3.4K]","FHD FF[8bit 4:2:0][23.98p/25p/29.97p]","FHD FF[8bit 4:2:0][50p/59.94p]","FHD FF[8bit 4:2:0][100p/119.88p]","FHD S35[8bit 4:2:0][23.98p/25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]"],
    "EOS R6_IPB Light HEVC" : ["UHD FF[10bit 4:2:2][23.98p/25p/29.97p][From 5.1K]","UHD FF[10bit 4:2:2][50p/59.94p][From 5.1K]","UHD S35[10bit 4:2:2][23.98p/25p/29.97p][From 3.4K]","UHD S35[10bit 4:2:2][50p/59.94p][From 3.4K]","FHD FF[10bit 4:2:2][25p/29.97p]","FHD FF[10bit 4:2:2][50p/59.94p]","FHD FF[10bit 4:2:2][100p/119.88p]","FHD S35[10bit 4:2:2][25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]"],
    "EOS R6_IPB Light AVC" : ["UHD FF[8bit 4:2:0][23.98p/25p/29.97p][From 5.1K]","UHD FF[8bit 4:2:0][50p/59.94p][From 5.1K]","UHD S35[8bit 4:2:0][23.98p/25p/29.97p][From 3.4K]","UHD S35[8bit 4:2:0][50p/59.94p][From 3.4K]","FHD FF[8bit 4:2:0][25p/29.97p]","FHD FF[8bit 4:2:0][50p/59.94p]","FHD FF[8bit 4:2:0][100p/119.88p]","FHD S35[8bit 4:2:0][25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]"],
    
    "EOS R6 Mark2_IPB HEVC" : ["UHD FF[10bit 4:2:2][23.98p/25p/29.97p][From 6K]","UHD FF[10bit 4:2:2][50p/59.94p][From 6K]","UHD S35[10bit 4:2:2][23.98p/25p/29.97p]","UHD S35[10bit 4:2:2][50p/59.94p]","FHD FF[10bit 4:2:2][23.98p/25p/29.97p]","FHD FF[10bit 4:2:2][50p/59.94p]","FHD FF[10bit 4:2:2][100p/119.88p]","FHD FF[10bit 4:2:2][150p/179.82p]","FHD S35[10bit 4:2:2][23.98p/25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]"],
    "EOS R6 Mark2_IPB AVC" : ["UHD FF[8bit 4:2:0][23.98p/25p/29.97p][From 6K]","UHD FF[8bit 4:2:0][50p/59.94p][From 6K]","UHD S35[8bit 4:2:0][23.98p/25p/29.97p]","UHD S35[8bit 4:2:0][50p/59.94p]","FHD FF[8bit 4:2:0][23.98p/25p/29.97p]","FHD FF[8bit 4:2:0][50p/59.94p]","FHD FF[8bit 4:2:0][100p/119.88p]","FHD FF[10bit 4:2:2][150p/179.82p]","FHD S35[8bit 4:2:0][23.98p/25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]"],
    "EOS R6 Mark2_IPB Light HEVC" : ["UHD FF[10bit 4:2:2][23.98p/25p/29.97p][From 6K]","UHD FF[10bit 4:2:2][50p/59.94p][From 6K]","UHD S35[10bit 4:2:2][23.98p/25p/29.97p]","UHD S35[10bit 4:2:2][50p/59.94p]","FHD FF[10bit 4:2:2][23.98p/25p/29.97p]","FHD FF[10bit 4:2:2][50p/59.94p]","FHD FF[10bit 4:2:2][100p/119.88p]","FHD FF[10bit 4:2:2][150p/179.82p]","FHD S35[10bit 4:2:2][23.98p/25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]"],
    "EOS R6 Mark2_IPB Light AVC" : ["UHD FF[8bit 4:2:0][23.98p/25p/29.97p][From 6K]","UHD FF[8bit 4:2:0][50p/59.94p][From 6K]","UHD S35[8bit 4:2:0][23.98p/25p/29.97p]","UHD S35[8bit 4:2:0][50p/59.94p]","FHD FF[8bit 4:2:0][23.98p/25p/29.97p]","FHD FF[8bit 4:2:0][50p/59.94p]","FHD FF[8bit 4:2:0][100p/119.88p]","FHD FF[10bit 4:2:2][150p/179.82p]","FHD S35[8bit 4:2:0][23.98p/25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]"],
    
    "EOS R8_IPB HEVC" : ["UHD FF[10bit 4:2:2][23.98p/25p/29.97p][From 6K]","UHD FF[10bit 4:2:2][50p/59.94p][From 6K]","UHD S35[10bit 4:2:2][23.98p/25p/29.97p]","UHD S35[10bit 4:2:2][50p/59.94p]","FHD FF[10bit 4:2:2][23.98p/25p/29.97p]","FHD FF[10bit 4:2:2][50p/59.94p]","FHD FF[10bit 4:2:2][100p/119.88p]","FHD FF[10bit 4:2:2][150p/179.82p]","FHD S35[10bit 4:2:2][23.98p/25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]"],
    "EOS R8_IPB AVC" : ["UHD FF[8bit 4:2:0][23.98p/25p/29.97p][From 6K]","UHD FF[8bit 4:2:0][50p/59.94p][From 6K]","UHD S35[8bit 4:2:0][23.98p/25p/29.97p]","UHD S35[8bit 4:2:0][50p/59.94p]","FHD FF[8bit 4:2:0][23.98p/25p/29.97p]","FHD FF[8bit 4:2:0][50p/59.94p]","FHD FF[8bit 4:2:0][100p/119.88p]","FHD FF[10bit 4:2:2][150p/179.82p]","FHD S35[8bit 4:2:0][23.98p/25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]"],
    "EOS R8_IPB Light HEVC" : ["UHD FF[10bit 4:2:2][23.98p/25p/29.97p][From 6K]","UHD FF[10bit 4:2:2][50p/59.94p][From 6K]","UHD S35[10bit 4:2:2][23.98p/25p/29.97p]","UHD S35[10bit 4:2:2][50p/59.94p]","FHD FF[10bit 4:2:2][23.98p/25p/29.97p]","FHD FF[10bit 4:2:2][50p/59.94p]","FHD FF[10bit 4:2:2][100p/119.88p]","FHD FF[10bit 4:2:2][150p/179.82p]","FHD S35[10bit 4:2:2][23.98p/25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]"],
    "EOS R8_IPB Light AVC" : ["UHD FF[8bit 4:2:0][23.98p/25p/29.97p][From 6K]","UHD FF[8bit 4:2:0][50p/59.94p][From 6K]","UHD S35[8bit 4:2:0][23.98p/25p/29.97p]","UHD S35[8bit 4:2:0][50p/59.94p]","FHD FF[8bit 4:2:0][23.98p/25p/29.97p]","FHD FF[8bit 4:2:0][50p/59.94p]","FHD FF[8bit 4:2:0][100p/119.88p]","FHD FF[10bit 4:2:2][150p/179.82p]","FHD S35[8bit 4:2:0][23.98p/25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]"],
    
    "EOS R7_IPB HEVC" : ["UHD S35[10bit 4:2:2][23.98p/25p/29.97p][From 7K]","UHD S35[10bit 4:2:2][50p/59.94p]","UHD S16[10bit 4:2:2][50p/59.94p]","FHD S35[10bit 4:2:2][23.98p/25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]","FHD S35[10bit 4:2:2][100p/119.88p]"],
    "EOS R7_IPB AVC" : ["UHD S35[8bit 4:2:0][23.98p/25p/29.97p][From 7K]","UHD S35[8bit 4:2:0][50p/59.94p]","UHD S16[8bit 4:2:0][50p/59.94p]","FHD S35[8bit 4:2:0][23.98p/25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]","FHD S35[8bit 4:2:0][100p/119.88p]"],
    "EOS R7_IPB Light HEVC" : ["UHD S35[10bit 4:2:2][23.98p/25p/29.97p][From 7K]","UHD S35[10bit 4:2:2][50p/59.94p]","UHD S16[10bit 4:2:2][50p/59.94p]","FHD S35[10bit 4:2:2][23.98p/25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]","FHD S35[10bit 4:2:2][100p/119.88p]"],
    "EOS R7_IPB Light AVC" : ["UHD S35[8bit 4:2:0][23.98p/25p/29.97p][From 7K]","UHD S35[8bit 4:2:0][50p/59.94p]","UHD S16[8bit 4:2:0][50p/59.94p]","FHD S35[8bit 4:2:0][23.98p/25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]","FHD S35[8bit 4:2:0][100p/119.88p]"],
    
    //SONY
    "CineAlta Venice 2[8K]_X-OCN XT" : ["8.6K FF[8640*5760][3:2]","8.6K FF[8640*4556][17:9]","8.2K FF[8192*4320][17:9]","8.2K FF[8192*3432][2.39:1]","8.1K FF[8100*4556][16:9]","7.6K FF[7680*4320][16:9]","5.8K S35[5792*5854][6:5 ANA]","5.8K S35[5792*4276][4:3 ANA]","5.8K S35[5792*3056][17:9]","5.5K S35[5480*2296][2.39:1]","5.4K S35[5434*3056][16:9]"],
    "CineAlta Venice 2[8K]_X-OCN ST" : ["8.6K FF[8640*5760][3:2]","8.6K FF[8640*4556][17:9]","8.2K FF[8192*4320][17:9]","8.2K FF[8192*3432][2.39:1]","8.1K FF[8100*4556][16:9]","7.6K FF[7680*4320][16:9]","5.8K S35[5792*5854][6:5 ANA]","5.8K S35[5792*4276][4:3 ANA]","5.8K S35[5792*3056][17:9]","5.5K S35[5480*2296][2.39:1]","5.4K S35[5434*3056][16:9]"],
    "CineAlta Venice 2[8K]_X-OCN LT" : ["8.6K FF[8640*5760][3:2]","8.6K FF[8640*4556][17:9]","8.2K FF[8192*4320][17:9]","8.2K FF[8192*3432][2.39:1]","8.1K FF[8100*4556][16:9]","7.6K FF[7680*4320][16:9]","5.8K S35[5792*5854][6:5 ANA]","5.8K S35[5792*4276][4:3 ANA]","5.8K S35[5792*3056][17:9]","5.5K S35[5480*2296][2.39:1]","5.4K S35[5434*3056][16:9]"],
    
    "CineAlta Venice 2[6K]_X-OCN XT" : ["6K FF[6048*4032][3:2]","6K FF[6054*3272][1.85:1]","6K FF[6054*3192][17:9]","6K FF[6054*2534][2.39:1]","5.7K FF[5674*3192][17:9]","4K S35[4096*3432][6:5 ANA]","4K S35[4096*3024][4:3 ANA]","4K S35[4096*2160][17:9]","4K S35[4096*1716][2.39:1]","3.8K S35[3840*2160][16:9]"],
    "CineAlta Venice 2[6K]_X-OCN ST" : ["6K FF[6048*4032][3:2]","6K FF[6054*3272][1.85:1]","6K FF[6054*3192][17:9]","6K FF[6054*2534][2.39:1]","5.7K FF[5674*3192][17:9]","4K S35[4096*3432][6:5 ANA]","4K S35[4096*3024][4:3 ANA]","4K S35[4096*2160][17:9]","4K S35[4096*1716][2.39:1]","3.8K S35[3840*2160][16:9]"],
    "CineAlta Venice 2[6K]_X-OCN LT" : ["6K FF[6048*4032][3:2]","6K FF[6054*3272][1.85:1]","6K FF[6054*3192][17:9]","6K FF[6054*2534][2.39:1]","5.7K FF[5674*3192][17:9]","4K S35[4096*3432][6:5 ANA]","4K S35[4096*3024][4:3 ANA]","4K S35[4096*2160][17:9]","4K S35[4096*1716][2.39:1]","3.8K S35[3840*2160][16:9]"],
    
    "CineAlta Venice_X-OCN XT" : ["6K FF[6048*4032][3:2]","6K FF[6054*3272][1.85:1]","6K FF[6054*3192][17:9]","6K FF[6054*2534][2.39:1]","5.7K FF[5674*3192][17:9]","4K S35[4096*3432][6:5 ANA]","4K S35[4096*3024][4:3 ANA]","4K S35[4096*2160][17:9]","4K S35[4096*1716][2.39:1]","3.8K S35[3840*2160][16:9]"],
    "CineAlta Venice_X-OCN ST" : ["6K FF[6048*4032][3:2]","6K FF[6054*3272][1.85:1]","6K FF[6054*3192][17:9]","6K FF[6054*2534][2.39:1]","5.7K FF[5674*3192][17:9]","4K S35[4096*3432][6:5 ANA]","4K S35[4096*3024][4:3 ANA]","4K S35[4096*2160][17:9]","4K S35[4096*1716][2.39:1]","3.8K S35[3840*2160][16:9]"],
    "CineAlta Venice_X-OCN LT" : ["6K FF[6048*4032][3:2]","6K FF[6054*3272][1.85:1]","6K FF[6054*3192][17:9]","6K FF[6054*2534][2.39:1]","5.7K FF[5674*3192][17:9]","4K S35[4096*3432][6:5 ANA]","4K S35[4096*3024][4:3 ANA]","4K S35[4096*2160][17:9]","4K S35[4096*1716][2.39:1]","3.8K S35[3840*2160][16:9]"],
    
    "CineAlta Burano_X-OCN LT" : ["8.6K FF[8632*4856][17:9]","8.6K FF[8632*4552][16:9]","6K FFcrop[6052*3404][17:9]","6K FFcrop[6052*3192][16:9]","5.8K S35[5760*3240][17:9]","5.8K S35[5760*3036][16:9]","4K S35crop[4096*2160][17:9]"],
    
    "FX 9_XAVC S-I DCI 4K" : ["DCI 4K FF[10bit 4:2:2][23.98p/24p]","DCI 4K FF[10bit 4:2:2][25p]","DCI 4K FF[10bit 4:2:2][50p]","DCI 4K FF[10bit 4:2:2][59.94p]"],
    "FX 9_XAVC S-I 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][25p]","UHD FF[10bit 4:2:2][29.97p]","UHD FF[10bit 4:2:2][50p]","UHD FF[10bit 4:2:2][59.94p]"],
    "FX 9_XAVC S-I HD" : ["FHD FF[10bit 4:2:2][23.98p]","FHD FF[10bit 4:2:2][25p]","FHD FF[10bit 4:2:2][29.97p]","FHD FF[10bit 4:2:2][50p]","FHD FF[10bit 4:2:2][59.94p]","FHD S35[10bit 4:2:2][23.98p]","FHD S35[10bit 4:2:2][25p]","FHD S35[10bit 4:2:2][29.97p]","FHD S35[10bit 4:2:2][50p]","FHD S35[10bit 4:2:2][59.94p]"],
    "FX 9_XAVC S 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][25p/29.97p]","UHD FF[10bit 4:2:2][50p/59.94p]"],
    "FX 9_XAVC S HD" : ["FHD FF[10bit 4:2:2][23.98p]","FHD FF[10bit 4:2:2][25p/29.97p]","FHD FF[10bit 4:2:2][50p/59.94p]","FHD S35[10bit 4:2:2][23.98p]","FHD S35[10bit 4:2:2][25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]"],
    "FX 9_MPEG-2 LongGOP" : ["FHD FF[10bit 4:2:2][23.98p/25p/29.97p]","FHD S35[10bit 4:2:2][23.98p/25p/29.97p]"],
    
    "FX 6_XAVC S-I DCI 4K" : ["DCI 4K FF[10bit 4:2:2][23.98p/24p]","DCI 4K FF[10bit 4:2:2][25p]","DCI 4K FF[10bit 4:2:2][50p]","DCI 4K FF[10bit 4:2:2][59.94p]"],
    "FX 6_XAVC S-I 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][25p]","UHD FF[10bit 4:2:2][29.97p]","UHD FF[10bit 4:2:2][50p]","UHD FF[10bit 4:2:2][59.94p]"],
    "FX 6_XAVC S-I HD" : ["FHD FF[10bit 4:2:2][23.98p]","FHD FF[10bit 4:2:2][25p]","FHD FF[10bit 4:2:2][29.97p]","FHD FF[10bit 4:2:2][50p]","FHD FF[10bit 4:2:2][59.94p]","FHD S35[10bit 4:2:2][23.98p]","FHD S35[10bit 4:2:2][25p]","FHD S35[10bit 4:2:2][29.97p]","FHD S35[10bit 4:2:2][50p]","FHD S35[10bit 4:2:2][59.94p]"],
    "FX 6_XAVC S 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][25p/29.97p]","UHD FF[10bit 4:2:2][50p/59.94p]"],
    "FX 6_XAVC S HD" : ["FHD FF[10bit 4:2:2][23.98p]","FHD FF[10bit 4:2:2][25p/29.97p]","FHD FF[10bit 4:2:2][50p/59.94p]","FHD S35[10bit 4:2:2][23.98p]","FHD S35[10bit 4:2:2][25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]"],
    
    "FX 3_XAVC S-I DCI 4K" : ["DCI 4K FF[10bit 4:2:2][23.98p/24p]","DCI 4K FF[10bit 4:2:2][25p]","DCI 4K FF[10bit 4:2:2][50p]","DCI 4K FF[10bit 4:2:2][59.94p]"],
    "FX 3_XAVC S-I 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][25p]","UHD FF[10bit 4:2:2][29.97p]","UHD FF[10bit 4:2:2][50p]","UHD FF[10bit 4:2:2][59.94p]"],
    "FX 3_XAVC S-I HD" : ["FHD FF[10bit 4:2:2][23.98p]","FHD FF[10bit 4:2:2][25p]","FHD FF[10bit 4:2:2][29.97p]","FHD FF[10bit 4:2:2][50p]","FHD FF[10bit 4:2:2][59.94p]","FHD S35[10bit 4:2:2][23.98p]","FHD S35[10bit 4:2:2][25p]","FHD S35[10bit 4:2:2][29.97p]","FHD S35[10bit 4:2:2][50p]","FHD S35[10bit 4:2:2][59.94p]"],
    "FX 3_XAVC HS 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][50p/59.94p]","UHD FF[10bit 4:2:2][100p/119.88p]","UHD FF[10bit 4:2:0][23.98p]","UHD FF[10bit 4:2:0][50p/59.94p]","UHD FF[10bit 4:2:0][100p/119.88p]"],
    "FX 3_XAVC S 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][25p/29.97p]","UHD FF[10bit 4:2:2][50p/59.94p]","UHD FF[10bit 4:2:2][100p/119.88p]","UHD FF[8bit 4:2:0][23.98p]","UHD FF[8bit 4:2:0][25p/29.97p]","UHD FF[8bit 4:2:0][50p/59.94p]","UHD FF[8bit 4:2:0][100p/119.88p]"],
    "FX 3_XAVC S HD" : ["FHD FF[10bit 4:2:2][23.98p]","FHD FF[10bit 4:2:2][25p/29.97p]","FHD FF[10bit 4:2:2][50p/59.94p]","FHD FF[8bit 4:2:0][23.98p]","FHD FF[8bit 4:2:0][25p/29.97p]","FHD FF[8bit 4:2:0][50p/59.94p]","FHD FF[8bit 4:2:0][100p/119.88p]","FHD S35[10bit 4:2:2][23.98p]","FHD S35[10bit 4:2:2][25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]","FHD S35[8bit 4:2:0][23.98p]","FHD S35[8bit 4:2:0][25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]","FHD S35[8bit 4:2:0][100p/119.88p]"],
    
    "FX 30_XAVC S-I DCI 4K" : ["DCI 4K S35[10bit 4:2:2][23.98p/24p]","DCI 4K S35[10bit 4:2:2][25p]","DCI 4K S35[10bit 4:2:2][29.97p]","DCI 4K S35[10bit 4:2:2][50p]","DCI 4K S35[10bit 4:2:2][59.94p]"],
    "FX 30_XAVC S-I 4K" : ["UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][25p]","UHD S35[10bit 4:2:2][29.97p]","UHD S35[10bit 4:2:2][50p]","UHD S35[10bit 4:2:2][59.94p]"],
    "FX 30_XAVC S-I HD" : ["FHD S35[10bit 4:2:2][23.98p]","FHD S35[10bit 4:2:2][25p]","FHD S35[10bit 4:2:2][29.97p]","FHD S35[10bit 4:2:2][50p]","FHD S35[10bit 4:2:2][59.94p]"],
    "FX 30_XAVC HS 4K" : ["UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][50p/59.94p]","UHD S35[10bit 4:2:2][100p/119.88p]","UHD S35[10bit 4:2:0][23.98p]","UHD S35[10bit 4:2:0][50p/59.94p]","UHD S35[10bit 4:2:0][100p/119.88p]"],
    "FX 30_XAVC S 4K" : ["UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][25p/29.97p]","UHD S35[10bit 4:2:2][50p/59.94p]","UHD S35[10bit 4:2:2][100p/119.88p]","UHD S35[8bit 4:2:0][23.98p]","UHD S35[8bit 4:2:0][25p/29.97p]","UHD S35[8bit 4:2:0][50p/59.94p]","UHD S35[8bit 4:2:0][100p/119.88p]"],
    "FX 30_XAVC S HD" : ["FHD S35[10bit 4:2:2][23.98p]","FHD S35[10bit 4:2:2][25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]","FHD S35[8bit 4:2:0][23.98p]","FHD S35[8bit 4:2:0][25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]","FHD S35[8bit 4:2:0][100p/119.88p]"],
    
    "Alpha 1_XAVC S-I 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][25p]","UHD FF[10bit 4:2:2][29.97p]","UHD FF[10bit 4:2:2][50p]","UHD FF[10bit 4:2:2][59.94p]","UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][25p]","UHD S35[10bit 4:2:2][29.97p]","UHD S35[10bit 4:2:2][50p]","UHD S35[10bit 4:2:2][59.94p]"],
    "Alpha 1_XAVC S-I HD" : ["FHD FF[10bit 4:2:2][23.98p]","FHD FF[10bit 4:2:2][25p]","FHD FF[10bit 4:2:2][29.97p]","FHD FF[10bit 4:2:2][50p]","FHD FF[10bit 4:2:2][59.94p]","FHD S35[10bit 4:2:2][23.98p]","FHD S35[10bit 4:2:2][25p]","FHD S35[10bit 4:2:2][29.97p]","FHD S35[10bit 4:2:2][50p]","FHD S35[10bit 4:2:2][59.94p]"],
    "Alpha 1_XAVC S 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][25p/29.97p]","UHD FF[10bit 4:2:2][50p/59.94p]","UHD FF[10bit 4:2:2][100p/119.88p]","UHD FF[8bit 4:2:0][23.98p]","UHD FF[8bit 4:2:0][25p/29.97p]","UHD FF[8bit 4:2:0][50p/59.94p]","UHD FF[8bit 4:2:0][100p/119.88p]","UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][25p/29.97p]","UHD S35[10bit 4:2:2][50p/59.94p]","UHD S35[8bit 4:2:0][23.98p]","UHD S35[8bit 4:2:0][25p/29.97p]","UHD S35[8bit 4:2:0][50p/59.94p]"],
    "Alpha 1_XAVC S HD" : ["FHD FF[10bit 4:2:2][23.98p]","FHD FF[10bit 4:2:2][25p/29.97p]","FHD FF[10bit 4:2:2][50p/59.94p]","FHD FF[8bit 4:2:0][23.98p]","FHD FF[8bit 4:2:0][25p/29.97p]","FHD FF[8bit 4:2:0][50p/59.94p]","FHD FF[8bit 4:2:0][100p/119.88p]","FHD S35[10bit 4:2:2][23.98p]","FHD S35[10bit 4:2:2][25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]","FHD S35[8bit 4:2:0][23.98p]","FHD S35[8bit 4:2:0][25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]","FHD S35[8bit 4:2:0][100p/119.88p]"],
    "Alpha 1_XAVC HS 8K" : ["8K FF[10bit 4:2:2][23.98p/25p/29.97p][From 8.6K]","8K FF[10bit 4:2:0][23.98p/25p/29.97p][From 8.6K]"],
    "Alpha 1_XAVC HS 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][50p/59.94p]","UHD FF[10bit 4:2:2][100p/119.88p]","UHD FF[10bit 4:2:0][23.98p]","UHD FF[10bit 4:2:0][50p/59.94p]","UHD FF[10bit 4:2:0][100p/119.88p]","UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][50p/59.94p]","UHD S35[10bit 4:2:0][23.98p]","UHD S35[10bit 4:2:0][50p/59.94p]"],
    
    "A9M3_XAVC S-I 4K" : ["UHD FF[10bit 4:2:2][23.98p][From 6K]","UHD FF[10bit 4:2:2][25p][From 6K]","UHD FF[10bit 4:2:2][29.97p][From 6K]","UHD FF[10bit 4:2:2][50p][From 6K]","UHD FF[10bit 4:2:2][59.94p][From 6K]","UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][25p]","UHD S35[10bit 4:2:2][29.97p]","UHD S35[10bit 4:2:2][50p]","UHD S35[10bit 4:2:2][59.94p]"],
    "A9M3_XAVC S-I HD" : ["FHD FF[10bit 4:2:2][23.98p]","FHD FF[10bit 4:2:2][25p]","FHD FF[10bit 4:2:2][29.97p]","FHD FF[10bit 4:2:2][50p]","FHD FF[10bit 4:2:2][59.94p]","FHD S35[10bit 4:2:2][23.98p]","FHD S35[10bit 4:2:2][25p]","FHD S35[10bit 4:2:2][29.97p]","FHD S35[10bit 4:2:2][50p]","FHD S35[10bit 4:2:2][59.94p]"],
    "A9M3_XAVC S 4K" : ["UHD FF[10bit 4:2:2][23.98p][From 6K]","UHD FF[10bit 4:2:2][25p/29.97p][From 6K]","UHD FF[10bit 4:2:2][50p/59.94p][From 6K]","UHD FF[10bit 4:2:2][100p/119.88p]","UHD FF[8bit 4:2:0][23.98p][From 6K]","UHD FF[8bit 4:2:0][25p/29.97p][From 6K]","UHD FF[8bit 4:2:0][50p/59.94p][From 6K]","UHD FF[8bit 4:2:0][100p/119.88p]","UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][25p/29.97p]","UHD S35[10bit 4:2:2][50p/59.94p]","UHD S35[8bit 4:2:0][23.98p]","UHD S35[8bit 4:2:0][25p/29.97p]","UHD S35[8bit 4:2:0][50p/59.94p]"],
    "A9M3_XAVC S HD" : ["FHD FF[10bit 4:2:2][23.98p]","FHD FF[10bit 4:2:2][25p/29.97p]","FHD FF[10bit 4:2:2][50p/59.94p]","FHD FF[8bit 4:2:0][23.98p]","FHD FF[8bit 4:2:0][25p/29.97p]","FHD FF[8bit 4:2:0][50p/59.94p]","FHD FF[8bit 4:2:0][100p/119.88p]","FHD S35[10bit 4:2:2][23.98p]","FHD S35[10bit 4:2:2][25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]","FHD S35[8bit 4:2:0][23.98p]","FHD S35[8bit 4:2:0][25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]","FHD S35[8bit 4:2:0][100p/119.88p]"],
    "A9M3_XAVC HS 4K" : ["UHD FF[10bit 4:2:2][23.98p][From 6K]","UHD FF[10bit 4:2:2][50p/59.94p][From 6K]","UHD FF[10bit 4:2:2][100p/119.88p]","UHD FF[10bit 4:2:0][23.98p][From 6K]","UHD FF[10bit 4:2:0][50p/59.94p][From 6K]","UHD FF[10bit 4:2:0][100p/119.88p]","UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][50p/59.94p]","UHD S35[10bit 4:2:0][23.98p]","UHD S35[10bit 4:2:0][50p/59.94p]"],
    
    "A7R5_XAVC S-I 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][25p]","UHD FF[10bit 4:2:2][29.97p]","UHD FF[10bit 4:2:2][50p]","UHD FF[10bit 4:2:2][59.94p]","UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][25p]","UHD S35[10bit 4:2:2][29.97p]"],
    "A7R5_XAVC S-I HD" : ["FHD FF[10bit 4:2:2][23.98p]","FHD FF[10bit 4:2:2][25p]","FHD FF[10bit 4:2:2][29.97p]","FHD FF[10bit 4:2:2][50p]","FHD FF[10bit 4:2:2][59.94p]","FHD S35[10bit 4:2:2][23.98p]","FHD S35[10bit 4:2:2][25p]","FHD S35[10bit 4:2:2][29.97p]","FHD S35[10bit 4:2:2][50p]","FHD S35[10bit 4:2:2][59.94p]"],
    "A7R5_XAVC S 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][25p/29.97p]","UHD FF[10bit 4:2:2][50p/59.94p]","UHD FF[8bit 4:2:0][23.98p]","UHD FF[8bit 4:2:0][25p/29.97p]","UHD FF[8bit 4:2:0][50p/59.94p]","UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][25p/29.97p]","UHD S35[8bit 4:2:0][23.98p]","UHD S35[8bit 4:2:0][25p/29.97p]"],
    "A7R5_XAVC S HD" : ["FHD FF[10bit 4:2:2][23.98p]","FHD FF[10bit 4:2:2][25p/29.97p]","FHD FF[10bit 4:2:2][50p/59.94p]","FHD FF[8bit 4:2:0][23.98p]","FHD FF[8bit 4:2:0][25p/29.97p]","FHD FF[8bit 4:2:0][50p/59.94p]","FHD FF[8bit 4:2:0][100p/119.88p]","FHD S35[10bit 4:2:2][23.98p]","FHD S35[10bit 4:2:2][25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]","FHD S35[8bit 4:2:0][23.98p]","FHD S35[8bit 4:2:0][25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]","FHD S35[8bit 4:2:0][100p/119.88p]"],
    "A7R5_XAVC HS 8K" : ["8K FF[10bit 4:2:0][23.98p/25p]"],
    "A7R5_XAVC HS 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][50p/59.94p]","UHD FF[10bit 4:2:0][23.98p]","UHD FF[10bit 4:2:0][50p/59.94p]","UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:0][23.98p]",],
    
    "A7S3_XAVC S-I DCI 4K" : ["DCI 4K FF[10bit 4:2:2][23.98p/24p]","DCI 4K FF[10bit 4:2:2][25p]","DCI 4K FF[10bit 4:2:2][50p]","DCI 4K FF[10bit 4:2:2][59.94p]"],
    "A7S3_XAVC S-I 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][25p]","UHD FF[10bit 4:2:2][29.97p]","UHD FF[10bit 4:2:2][50p]","UHD FF[10bit 4:2:2][59.94p]"],
    "A7S3_XAVC S-I HD" : ["FHD FF[10bit 4:2:2][23.98p]","FHD FF[10bit 4:2:2][25p]","FHD FF[10bit 4:2:2][29.97p]","FHD FF[10bit 4:2:2][50p]","FHD FF[10bit 4:2:2][59.94p]","FHD S35[10bit 4:2:2][23.98p]","FHD S35[10bit 4:2:2][25p]","FHD S35[10bit 4:2:2][29.97p]","FHD S35[10bit 4:2:2][50p]","FHD S35[10bit 4:2:2][59.94p]"],
    "A7S3_XAVC HS 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][50p/59.94p]","UHD FF[10bit 4:2:2][100p/119.88p]","UHD FF[10bit 4:2:0][23.98p]","UHD FF[10bit 4:2:0][50p/59.94p]","UHD FF[10bit 4:2:0][100p/119.88p]"],
    "A7S3_XAVC S 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][25p/29.97p]","UHD FF[10bit 4:2:2][50p/59.94p]","UHD FF[10bit 4:2:2][100p/119.88p]","UHD FF[8bit 4:2:0][23.98p]","UHD FF[8bit 4:2:0][25p/29.97p]","UHD FF[8bit 4:2:0][50p/59.94p]","UHD FF[8bit 4:2:0][100p/119.88p]"],
    "A7S3_XAVC S HD" : ["FHD FF[10bit 4:2:2][23.98p]","FHD FF[10bit 4:2:2][25p/29.97p]","FHD FF[10bit 4:2:2][50p/59.94p]","FHD FF[8bit 4:2:0][23.98p]","FHD FF[8bit 4:2:0][25p/29.97p]","FHD FF[8bit 4:2:0][50p/59.94p]","FHD FF[8bit 4:2:0][100p/119.88p]","FHD S35[10bit 4:2:2][23.98p]","FHD S35[10bit 4:2:2][25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]","FHD S35[8bit 4:2:0][23.98p]","FHD S35[8bit 4:2:0][25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]","FHD S35[8bit 4:2:0][100p/119.88p]"],
    
    "A7M4_XAVC S-I 4K" : ["UHD FF[10bit 4:2:2][23.98p][From 7K]","UHD FF[10bit 4:2:2][25p][From 7K]","UHD FF[10bit 4:2:2][29.97p][From 7K]","UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][25p]","UHD S35[10bit 4:2:2][29.97p]","UHD S35[10bit 4:2:2][50p]","UHD S35[10bit 4:2:2][59.94p]"],
    "A7M4_XAVC S-I HD" : ["FHD FF[10bit 4:2:2][23.98p]","FHD FF[10bit 4:2:2][25p]","FHD FF[10bit 4:2:2][29.97p]","FHD FF[10bit 4:2:2][50p]","FHD FF[10bit 4:2:2][59.94p]","FHD S35[10bit 4:2:2][23.98p]","FHD S35[10bit 4:2:2][25p]","FHD S35[10bit 4:2:2][29.97p]","FHD S35[10bit 4:2:2][50p]","FHD S35[10bit 4:2:2][59.94p]"],
    "A7M4_XAVC S 4K" : ["UHD FF[10bit 4:2:2][23.98p][From 7K]","UHD FF[10bit 4:2:2][25p/29.97p][From 7K]","UHD FF[8bit 4:2:0][23.98p][From 7K]","UHD FF[8bit 4:2:0][25p/29.97p][From 7K]","UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][25p/29.97p]","UHD S35[10bit 4:2:2][50p/59.94p]","UHD S35[8bit 4:2:0][23.98p]","UHD S35[8bit 4:2:0][25p/29.97p]","UHD S35[8bit 4:2:0][50p/59.94p]"],
    "A7M4_XAVC S HD" : ["FHD FF[10bit 4:2:2][23.98p]","FHD FF[10bit 4:2:2][25p/29.97p]","FHD FF[10bit 4:2:2][50p/59.94p]","FHD FF[8bit 4:2:0][23.98p]","FHD FF[8bit 4:2:0][25p/29.97p]","FHD FF[8bit 4:2:0][50p/59.94p]","FHD FF[8bit 4:2:0][100p/119.88p]","FHD S35[10bit 4:2:2][23.98p]","FHD S35[10bit 4:2:2][25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]","FHD S35[8bit 4:2:0][23.98p]","FHD S35[8bit 4:2:0][25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]","FHD S35[8bit 4:2:0][100p/119.88p]"],
    "A7M4_XAVC HS 4K" : ["UHD FF[10bit 4:2:2][23.98p][From 7K]","UHD FF[10bit 4:2:0][23.98p][From 7K]","UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][50p/59.94p]","UHD S35[10bit 4:2:0][23.98p]","UHD S35[10bit 4:2:0][50p/59.94p]"],
    
    "A7C2_XAVC S-I 4K" : ["UHD FF[10bit 4:2:2][23.98p][From 7K]","UHD FF[10bit 4:2:2][25p][From 7K]","UHD FF[10bit 4:2:2][29.97p][From 7K]","UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][25p]","UHD S35[10bit 4:2:2][29.97p]","UHD S35[10bit 4:2:2][50p]","UHD S35[10bit 4:2:2][59.94p]"],
    "A7C2_XAVC S-I HD" : ["FHD FF[10bit 4:2:2][23.98p]","FHD FF[10bit 4:2:2][25p]","FHD FF[10bit 4:2:2][29.97p]","FHD FF[10bit 4:2:2][50p]","FHD FF[10bit 4:2:2][59.94p]","FHD S35[10bit 4:2:2][23.98p]","FHD S35[10bit 4:2:2][25p]","FHD S35[10bit 4:2:2][29.97p]","FHD S35[10bit 4:2:2][50p]","FHD S35[10bit 4:2:2][59.94p]"],
    "A7C2_XAVC S 4K" : ["UHD FF[10bit 4:2:2][23.98p][From 7K]","UHD FF[10bit 4:2:2][25p/29.97p][From 7K]","UHD FF[8bit 4:2:0][23.98p][From 7K]","UHD FF[8bit 4:2:0][25p/29.97p][From 7K]","UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][25p/29.97p]","UHD S35[10bit 4:2:2][50p/59.94p]","UHD S35[8bit 4:2:0][23.98p]","UHD S35[8bit 4:2:0][25p/29.97p]","UHD S35[8bit 4:2:0][50p/59.94p]"],
    "A7C2_XAVC S HD" : ["FHD FF[10bit 4:2:2][23.98p]","FHD FF[10bit 4:2:2][25p/29.97p]","FHD FF[10bit 4:2:2][50p/59.94p]","FHD FF[8bit 4:2:0][23.98p]","FHD FF[8bit 4:2:0][25p/29.97p]","FHD FF[8bit 4:2:0][50p/59.94p]","FHD FF[8bit 4:2:0][100p/119.88p]","FHD S35[10bit 4:2:2][23.98p]","FHD S35[10bit 4:2:2][25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]","FHD S35[8bit 4:2:0][23.98p]","FHD S35[8bit 4:2:0][25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]","FHD S35[8bit 4:2:0][100p/119.88p]"],
    "A7C2_XAVC HS 4K" : ["UHD FF[10bit 4:2:2][23.98p][From 7K]","UHD FF[10bit 4:2:0][23.98p][From 7K]","UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][50p/59.94p]","UHD S35[10bit 4:2:0][23.98p]","UHD S35[10bit 4:2:0][50p/59.94p]"],
    
    "A7CR_XAVC S-I 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][25p]","UHD FF[10bit 4:2:2][29.97p]","UHD FF[10bit 4:2:2][50p]","UHD FF[10bit 4:2:2][59.94p]","UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][25p]","UHD S35[10bit 4:2:2][29.97p]"],
    "A7CR_XAVC S-I HD" : ["FHD FF[10bit 4:2:2][23.98p]","FHD FF[10bit 4:2:2][25p]","FHD FF[10bit 4:2:2][29.97p]","FHD FF[10bit 4:2:2][50p]","FHD FF[10bit 4:2:2][59.94p]","FHD S35[10bit 4:2:2][23.98p]","FHD S35[10bit 4:2:2][25p]","FHD S35[10bit 4:2:2][29.97p]","FHD S35[10bit 4:2:2][50p]","FHD S35[10bit 4:2:2][59.94p]"],
    "A7CR_XAVC S 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][25p/29.97p]","UHD FF[10bit 4:2:2][50p/59.94p]","UHD FF[8bit 4:2:0][23.98p]","UHD FF[8bit 4:2:0][25p/29.97p]","UHD FF[8bit 4:2:0][50p/59.94p]","UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][25p/29.97p]","UHD S35[8bit 4:2:0][23.98p]","UHD S35[8bit 4:2:0][25p/29.97p]"],
    "A7CR_XAVC S HD" : ["FHD FF[10bit 4:2:2][23.98p]","FHD FF[10bit 4:2:2][25p/29.97p]","FHD FF[10bit 4:2:2][50p/59.94p]","FHD FF[8bit 4:2:0][23.98p]","FHD FF[8bit 4:2:0][25p/29.97p]","FHD FF[8bit 4:2:0][50p/59.94p]","FHD FF[8bit 4:2:0][100p/119.88p]","FHD S35[10bit 4:2:2][23.98p]","FHD S35[10bit 4:2:2][25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]","FHD S35[8bit 4:2:0][23.98p]","FHD S35[8bit 4:2:0][25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]","FHD S35[8bit 4:2:0][100p/119.88p]"],
    "A7CR_XAVC HS 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][50p/59.94p]","UHD FF[10bit 4:2:0][23.98p]","UHD FF[10bit 4:2:0][50p/59.94p]","UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:0][23.98p]",],
    
    "A6700_XAVC S-I 4K" : ["UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][25p]","UHD S35[10bit 4:2:2][29.97p]","UHD S35[10bit 4:2:2][50p]","UHD S35[10bit 4:2:2][59.94p]"],
    "A6700_XAVC S-I HD" : ["FHD S35[10bit 4:2:2][23.98p]","FHD S35[10bit 4:2:2][25p]","FHD S35[10bit 4:2:2][29.97p]","FHD S35[10bit 4:2:2][50p]","FHD S35[10bit 4:2:2][59.94p]"],
    "A6700_XAVC HS 4K" : ["UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][50p/59.94p]","UHD S35[10bit 4:2:2][100p/119.88p]","UHD S35[10bit 4:2:0][23.98p]","UHD S35[10bit 4:2:0][50p/59.94p]","UHD S35[10bit 4:2:0][100p/119.88p]"],
    "A6700_XAVC S 4K" : ["UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][25p/29.97p]","UHD S35[10bit 4:2:2][50p/59.94p]","UHD S35[10bit 4:2:2][100p/119.88p]","UHD S35[8bit 4:2:0][23.98p]","UHD S35[8bit 4:2:0][25p/29.97p]","UHD S35[8bit 4:2:0][50p/59.94p]","UHD S35[8bit 4:2:0][100p/119.88p]"],
    "A6700_XAVC S HD" : ["FHD S35[10bit 4:2:2][23.98p]","FHD S35[10bit 4:2:2][25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]","FHD S35[8bit 4:2:0][23.98p]","FHD S35[8bit 4:2:0][25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]","FHD S35[8bit 4:2:0][100p/119.88p]"],
    
    "ZV-E1_XAVC S-I 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][25p]","UHD FF[10bit 4:2:2][29.97p]","UHD FF[10bit 4:2:2][50p]","UHD FF[10bit 4:2:2][59.94p]"],
    "ZV-E1_XAVC S-I HD" : ["FHD FF[10bit 4:2:2][23.98p]","FHD FF[10bit 4:2:2][25p]","FHD FF[10bit 4:2:2][29.97p]","FHD FF[10bit 4:2:2][50p]","FHD FF[10bit 4:2:2][59.94p]","FHD S35[10bit 4:2:2][23.98p]","FHD S35[10bit 4:2:2][25p]","FHD S35[10bit 4:2:2][29.97p]","FHD S35[10bit 4:2:2][50p]","FHD S35[10bit 4:2:2][59.94p]"],
    "ZV-E1_XAVC HS 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][50p/59.94p]","UHD FF[10bit 4:2:2][100p/119.88p]","UHD FF[10bit 4:2:0][23.98p]","UHD FF[10bit 4:2:0][50p/59.94p]","UHD FF[10bit 4:2:0][100p/119.88p]"],
    "ZV-E1_XAVC S 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][25p/29.97p]","UHD FF[10bit 4:2:2][50p/59.94p]","UHD FF[10bit 4:2:2][100p/119.88p]","UHD FF[8bit 4:2:0][23.98p]","UHD FF[8bit 4:2:0][25p/29.97p]","UHD FF[8bit 4:2:0][50p/59.94p]","UHD FF[8bit 4:2:0][100p/119.88p]"],
    "ZV-E1_XAVC S HD" : ["FHD FF[10bit 4:2:2][23.98p]","FHD FF[10bit 4:2:2][25p/29.97p]","FHD FF[10bit 4:2:2][50p/59.94p]","FHD FF[8bit 4:2:0][23.98p]","FHD FF[8bit 4:2:0][25p/29.97p]","FHD FF[8bit 4:2:0][50p/59.94p]","FHD FF[8bit 4:2:0][100p/119.88p]","FHD S35[10bit 4:2:2][23.98p]","FHD S35[10bit 4:2:2][25p/29.97p]","FHD S35[10bit 4:2:2][50p/59.94p]","FHD S35[8bit 4:2:0][23.98p]","FHD S35[8bit 4:2:0][25p/29.97p]","FHD S35[8bit 4:2:0][50p/59.94p]","FHD S35[8bit 4:2:0][100p/119.88p]"],
    
    //ARRI
    "AMIRA_ARRIRAW" : ["2.8K S35[2880*1620]"],
    "AMIRA_Prores 4444 XQ" : ["UHD S35[From 3200*1800]","3.2K S35[3200*1800]","2K S35[2048*1152][From 2868*1612]","FHD S35[From 2880*1620]","FHD S16[From 1600*900]"],
    "AMIRA_Prores 4444" : ["UHD S35[From 3200*1800]","3.2K S35[3200*1800]","2K S35[2048*1152][From 2868*1612]","FHD S35[From 2880*1620]","FHD S16[From 1600*900]"],
    "AMIRA_Prores 422 HQ" : ["UHD S35[From 3200*1800]","3.2K S35[3200*1800]","2K S35[2048*1152][From 2868*1612]","FHD S35[From 2880*1620]","FHD S16[From 1600*900]"],
    "AMIRA_Prores 422" : ["UHD S35[From 3200*1800]","3.2K S35[3200*1800]","2K S35[2048*1152][From 2868*1612]","FHD S35[From 2880*1620]","FHD S16[From 1600*900]"],
    "AMIRA_Prores 422 LT" : ["UHD S35[From 3200*1800]","3.2K S35[3200*1800]","2K S35[2048*1152][From 2868*1612]","FHD S35[From 2880*1620]","FHD S16[From 1600*900]"],
    "AMIRA_MPEG-2 HD 422" : ["FHD S35[From 2880*1620]"],
    
    "ALEXA Classic_Prores 4444" : ["2K S35[2048*1536][From 2868*2152][4:3]","2K S35[2048*1152][From 2868*1614]","FHD S35[From 2880*1620]"],
    "ALEXA Classic_Prores 422 HQ" : ["2K S35[2048*1536][From 2868*2152][4:3]","2K S35[2048*1152][From 2868*1614]","FHD S35[From 2880*1620]"],
    "ALEXA Classic_Prores 422" : ["2K S35[2048*1536][From 2868*2152][4:3]","2K S35[2048*1152][From 2868*1614]","FHD S35[From 2880*1620]"],
    
    "ALEXA XT_ARRIRAW" : ["3.4K S35[3424*2202][OG]","2.8K S35[2880*2160][4:3]","2.8K S35[2880*1620]","2.6K S35[2578*2160][6:5]"],
    "ALEXA XT_Prores 4444 XQ" : ["3.2K S35[3168*1782]","2K S35[2048*1536][From 2868*2152][4:3]","2K S35[2048*1152][From 2868*1614]","FHD S35[From 2880*1620]"],
    "ALEXA XT_Prores 4444" : ["3.2K S35[3168*1782]","2K S35[2048*1536][From 2868*2152][4:3]","2K S35[2048*1152][From 2868*1614]","FHD S35[From 2880*1620]"],
    "ALEXA XT_Prores 422 HQ" : ["3.2K S35[3168*1782]","2K S35[2048*1536][From 2868*2152][4:3]","2K S35[2048*1152][From 2868*1614]","FHD S35[From 2880*1620]"],
    "ALEXA XT_Prores 422" : ["3.2K S35[3168*1782]","2K S35[2048*1536][From 2868*2152][4:3]","2K S35[2048*1152][From 2868*1614]","FHD S35[From 2880*1620]"],
    
    "ALEXA SXT_ARRIRAW" : ["3.4K S35[3424*2202][OG]","3.2K S35[3168*1782]","2.8K S35[2880*2160][4:3]","2.8K S35[2880*1620]","2.6K S35[2578*2160][6:5]"],
    "ALEXA SXT_Prores 4444 XQ" : ["4K S35[4096*2636][From 3414*2198][2.39:1]","4K S35[4096*1716][From 2560*2146][6:5 ANA]","UHD S35[From 3200*1800]","3.4K S35[3424*2202][OG]","3.2K S35[3200*1800]","2.8K S35[2880*2160][4:3]","2K S35[2048*1152][From 2880*1620]","2K S35[2048*858][From 2560*2146][6:5 ANA]","FHD S35[From 2880*1620]"],
    "ALEXA SXT_Prores 4444" : ["4K S35[4096*2636][From 3414*2198][2.39:1]","4K S35[4096*1716][From 2560*2146][6:5 ANA]","UHD S35[From 3200*1800]","3.4K S35[3424*2202][OG]","3.2K S35[3200*1800]","2.8K S35[2880*2160][4:3]","2K S35[2048*1152][From 2880*1620]","2K S35[2048*858][From 2560*2146][6:5 ANA]","FHD S35[From 2880*1620]"],
    "ALEXA SXT_Prores 422 HQ" : ["4K S35[4096*2636][From 3414*2198][2.39:1]","4K S35[4096*1716][From 2560*2146][6:5 ANA]","UHD S35[From 3200*1800]","3.4K S35[3424*2202][OG]","3.2K S35[3200*1800]","2.8K S35[2880*2160][4:3]","2K S35[2048*1152][From 2880*1620]","2K S35[2048*858][From 2560*2146][6:5 ANA]","FHD S35[From 2880*1620]"],
    "ALEXA SXT_Prores 422" : ["4K S35[4096*2636][From 3414*2198][2.39:1]","4K S35[4096*1716][From 2560*2146][6:5 ANA]","UHD S35[From 3200*1800]","3.4K S35[3424*2202][OG]","3.2K S35[3200*1800]","2.8K S35[2880*2160][4:3]","2K S35[2048*1152][From 2880*1620]","2K S35[2048*858][From 2560*2146][6:5 ANA]","FHD S35[From 2880*1620]"],
    
    "ALEXA 35_ARRIRAW" :["4.6K S35[4608*3164][OG]","4.6K S35[4608*2592]","4K S35[4096*2304]","UHD S35","4K S35[4096*2048][2:1]","3.3K S35[3328*2790][6:5]","3K S35[3072*3072][1:1]"],
    "ALEXA 35_Prores 4444 XQ" :["4.6K S35[4608*3164][OG]","4K S35[4096*2304][From 4608*2592]","4K S35[4096*2304]","4K S35[4096*2048][2:1]","4K S35[4096*1716][From 3328*2790][6:5 ANA]","UHD S35[From 4096*2304]","UHD S35[From 2743*3086][8:9 ANA]","3.8K S35[3840*1920][From 3072*3072][1:1 ANA]","3.3K S35[3328*2790][6:5]","3K S35[3072*3072][1:1]","2K S35[2048*1152][From 4096*2304]","2K S16[2048*1152]","FHD S35[From 4096*2304]"],
    "ALEXA 35_Prores 4444" :["4.6K S35[4608*3164][OG]","4K S35[4096*2304][From 4608*2592]","4K S35[4096*2304]","4K S35[4096*2048][2:1]","4K S35[4096*1716][From 3328*2790][6:5 ANA]","UHD S35[From 4096*2304]","UHD S35[From 2743*3086][8:9 ANA]","3.8K S35[3840*1920][From 3072*3072][1:1 ANA]","3.3K S35[3328*2790][6:5]","3K S35[3072*3072][1:1]","2K S35[2048*1152][From 4096*2304]","2K S16[2048*1152]","FHD S35[From 4096*2304]"],
    "ALEXA 35_Prores 422 HQ" :["4.6K S35[4608*3164][OG]","4K S35[4096*2304][From 4608*2592]","4K S35[4096*2304]","4K S35[4096*2048][2:1]","4K S35[4096*1716][From 3328*2790][6:5 ANA]","UHD S35[From 4096*2304]","UHD S35[From 2743*3086][8:9 ANA]","3.8K S35[3840*1920][From 3072*3072][1:1 ANA]","3.3K S35[3328*2790][6:5]","3K S35[3072*3072][1:1]","2K S35[2048*1152][From 4096*2304]","2K S16[2048*1152]","FHD S35[From 4096*2304]"],
    
    "ALEXA Mini_ARRIRAW" : ["3.4K S35[3424*2202][OG]","2.8K S35[2880*2160][Cilp 3424*2202][4:3]","2.8K S35[2880*1620]"],
    "ALEXA Mini_Prores 4444 XQ" : ["UHD S35[From 3200*1800]","3.2K S35[3200*1800]","2.8K S35[2880*2160][4:3]","2K S35[2048*1152][From 2868*1612]","2K S35[2048*858][From 2560*2145][6:5 ANA]","FHD S35[From 2880*1620]","FHD S35[From 1920*2160][8:9 ANA]","FHD S16[From 1600*900]"],
    "ALEXA Mini_Prores 4444" : ["UHD S35[From 3200*1800]","3.2K S35[3200*1800]","2.8K S35[2880*2160][4:3]","2K S35[2048*1152][From 2868*1612]","2K S35[2048*858][From 2560*2145][6:5 ANA]","FHD S35[From 2880*1620]","FHD S35[From 1920*2160][8:9 ANA]","FHD S16[From 1600*900]"],
    "ALEXA Mini_Prores 422 HQ" : ["UHD S35[From 3200*1800]","3.2K S35[3200*1800]","2.8K S35[2880*2160][4:3]","2K S35[2048*1152][From 2868*1612]","2K S35[2048*858][From 2560*2145][6:5 ANA]","FHD S35[From 2880*1620]","FHD S35[From 1920*2160][8:9 ANA]","FHD S16[From 1600*900]"],
    "ALEXA Mini_Prores 422" : ["UHD S35[From 3200*1800]","3.2K S35[3200*1800]","2.8K S35[2880*2160][4:3]","2K S35[2048*1152][From 2868*1612]","2K S35[2048*858][From 2560*2145][6:5 ANA]","FHD S35[From 2880*1620]","FHD S35[From 1920*2160][8:9 ANA]","FHD S16[From 1600*900]"],
    "ALEXA Mini_Prores 422 LT" : ["UHD S35[From 3200*1800]","3.2K S35[3200*1800]","2.8K S35[2880*2160][4:3]","2K S35[2048*1152][From 2868*1612]","2K S35[2048*858][From 2560*2145][6:5 ANA]","FHD S35[From 2880*1620]","FHD S35[From 1920*2160][8:9 ANA]","FHD S16[From 1600*900]"],
    
    "ALEXA Mini LF_ARRIRAW" : ["4.5K LF[4448*3096][OG]","4.5K LF[4448*1856][2.39:1]","UHD LF","3.4K S35[3424*2202][1.55:1]","2.8K LF[2880*2880][1:1]"],
    "ALEXA Mini LF_Prores 4444 XQ" : ["4.5K LF[4448*3096][OG]","4.5K LF[4448*1856][2.39:1]","UHD LF[From 4320*2430]","UHD LF","3.2K S35[3200*1800]","2.8K LF[2880*2880][1:1]","2.8K S35[2880*2160][4:3]","2K LF[2048*1152][From UHD]","FHD LF[From 4320*2430]","FHD LF[From UHD]","FHD S35[From 2880*1620]"],
    "ALEXA Mini LF_Prores 4444" : ["4.5K LF[4448*3096][OG]","4.5K LF[4448*1856][2.39:1]","UHD LF[From 4320*2430]","UHD LF","3.2K S35[3200*1800]","2.8K LF[2880*2880][1:1]","2.8K S35[2880*2160][4:3]","2K LF[2048*1152][From UHD]","FHD LF[From 4320*2430]","FHD LF[From UHD]","FHD S35[From 2880*1620]"],
    "ALEXA Mini LF_Prores 422 HQ" : ["4.5K LF[4448*3096][OG]","4.5K LF[4448*1856][2.39:1]","UHD LF[From 4320*2430]","UHD LF","3.2K S35[3200*1800]","2.8K LF[2880*2880][1:1]","2.8K S35[2880*2160][4:3]","2K LF[2048*1152][From UHD]","FHD LF[From 4320*2430]","FHD LF[From UHD]","FHD S35[From 2880*1620]"],
    
    "ALEXA LF_ARRIRAW" : ["4.5K LF[4448*3096][OG]","4.5K LF[4448*1856][2.39:1]","UHD LF"],
    "ALEXA LF_Prores 4444 XQ" : ["4.5K LF[4448*3096][OG]","4.5K LF[4448*1856][2.39:1]","UHD LF","2K LF[2048*1152][From UHD]","FHD LF[From UHD]"],
    "ALEXA LF_Prores 4444" : ["4.5K LF[4448*3096][OG]","4.5K LF[4448*1856][2.39:1]","UHD LF","2K LF[2048*1152][From UHD]","FHD LF[From UHD]"],
    "ALEXA LF_Prores 422 HQ" : ["4.5K LF[4448*3096][OG]","4.5K LF[4448*1856][2.39:1]","UHD LF","2K LF[2048*1152][From UHD]","FHD LF[From UHD]"],
    "ALEXA LF_Prores 422" : ["4.5K LF[4448*3096][OG]","4.5K LF[4448*1856][2.39:1]","UHD LF","2K LF[2048*1152][From UHD]","FHD LF[From UHD]"],
    
    "ALEXA 65_ARRIRAW" : ["6.5K 65mm[6560*3100][OG]","5.1K 65mm[5120*2880]","4.3K LF[4320*2880][3:2]","4.5K LF[4448*3096][1.43:1]","UHD LF"],
    
    //RED
    "V-Raptor XL [X]_REDCODE HQ" : ["8K VV[8192*4320][17:9]","8K VV[8192*4096][2:1]","8K VV[8192*3456][2.4:1]","8K VV[7680*4320]","7K VV[7168*3780][17:9]","7K VV[7168*3584][2:1]","7K VV[7168*3002][2.4:1]","7K VV[6720*3780]","6K S35[6144*3240][17:9]","6K S35[6144*3072][2:1]","6K S35[6144*2592][2.4:1]","6K S35[5760*3240]","5K S35[5120*2700][17:9]","5K S35[5120*2560][2:1]","5K S35[5120*2160][2.4:1]","5K S35[4800*2700]","4K S35[4096*2160][17:9]","4K S35[4096*2048][2:1]","4K S35[4096*1728][2.4:1]","UHD S35","3K S16[3072*1620][17:9]","3K S16[3072*1536][2:1]","3K S16[3072*1296][2.4:1]","3K S16[2880*1620]","2K S16[2048*1080][17:9]","2K S16[2048*1024][2:1]","2K S16[2048*864][2.4:1]","FHD S16","4K S35[4096*512][8:1]"],
    "V-Raptor XL [X]_REDCODE MQ" : ["8K VV[8192*4320][17:9]","8K VV[8192*4096][2:1]","8K VV[8192*3456][2.4:1]","8K VV[7680*4320]","7K VV[7168*3780][17:9]","7K VV[7168*3584][2:1]","7K VV[7168*3002][2.4:1]","7K VV[6720*3780]","6K S35[6144*3240][17:9]","6K S35[6144*3072][2:1]","6K S35[6144*2592][2.4:1]","6K S35[5760*3240]","5K S35[5120*2700][17:9]","5K S35[5120*2560][2:1]","5K S35[5120*2160][2.4:1]","5K S35[4800*2700]","4K S35[4096*2160][17:9]","4K S35[4096*2048][2:1]","4K S35[4096*1728][2.4:1]","UHD S35","3K S16[3072*1620][17:9]","3K S16[3072*1536][2:1]","3K S16[3072*1296][2.4:1]","3K S16[2880*1620]","2K S16[2048*1080][17:9]","2K S16[2048*1024][2:1]","2K S16[2048*864][2.4:1]","FHD S16","4K S35[4096*512][8:1]"],
    "V-Raptor XL [X]_REDCODE LQ" : ["8K VV[8192*4320][17:9]","8K VV[8192*4096][2:1]","8K VV[8192*3456][2.4:1]","8K VV[7680*4320]","7K VV[7168*3780][17:9]","7K VV[7168*3584][2:1]","7K VV[7168*3002][2.4:1]","7K VV[6720*3780]","6K S35[6144*3240][17:9]","6K S35[6144*3072][2:1]","6K S35[6144*2592][2.4:1]","6K S35[5760*3240]","5K S35[5120*2700][17:9]","5K S35[5120*2560][2:1]","5K S35[5120*2160][2.4:1]","5K S35[4800*2700]","4K S35[4096*2160][17:9]","4K S35[4096*2048][2:1]","4K S35[4096*1728][2.4:1]","UHD S35","3K S16[3072*1620][17:9]","3K S16[3072*1536][2:1]","3K S16[3072*1296][2.4:1]","3K S16[2880*1620]","2K S16[2048*1080][17:9]","2K S16[2048*1024][2:1]","2K S16[2048*864][2.4:1]","FHD S16","4K S35[4096*512][8:1]"],
    "V-Raptor XL [X]_REDCODE ELQ" : ["8K VV[8192*4320][17:9]","8K VV[8192*4096][2:1]","8K VV[8192*3456][2.4:1]","8K VV[7680*4320]","7K VV[7168*3780][17:9]","7K VV[7168*3584][2:1]","7K VV[7168*3002][2.4:1]","7K VV[6720*3780]","6K S35[6144*3240][17:9]","6K S35[6144*3072][2:1]","6K S35[6144*2592][2.4:1]","6K S35[5760*3240]","5K S35[5120*2700][17:9]","5K S35[5120*2560][2:1]","5K S35[5120*2160][2.4:1]","5K S35[4800*2700]","4K S35[4096*2160][17:9]","4K S35[4096*2048][2:1]","4K S35[4096*1728][2.4:1]","UHD S35","3K S16[3072*1620][17:9]","3K S16[3072*1536][2:1]","3K S16[3072*1296][2.4:1]","3K S16[2880*1620]","2K S16[2048*1080][17:9]","2K S16[2048*1024][2:1]","2K S16[2048*864][2.4:1]","FHD S16","4K S35[4096*512][8:1]"],
    
    "V-Raptor [X]_REDCODE HQ" : ["8K VV[8192*4320][17:9]","8K VV[8192*4096][2:1]","8K VV[8192*3456][2.4:1]","8K VV[7680*4320]","7K VV[7168*3780][17:9]","7K VV[7168*3584][2:1]","7K VV[7168*3002][2.4:1]","7K VV[6720*3780]","6K S35[6144*3240][17:9]","6K S35[6144*3072][2:1]","6K S35[6144*2592][2.4:1]","6K S35[5760*3240]","5K S35[5120*2700][17:9]","5K S35[5120*2560][2:1]","5K S35[5120*2160][2.4:1]","5K S35[4800*2700]","4K S35[4096*2160][17:9]","4K S35[4096*2048][2:1]","4K S35[4096*1728][2.4:1]","UHD S35","3K S16[3072*1620][17:9]","3K S16[3072*1536][2:1]","3K S16[3072*1296][2.4:1]","3K S16[2880*1620]","2K S16[2048*1080][17:9]","2K S16[2048*1024][2:1]","2K S16[2048*864][2.4:1]","FHD S16","4K S35[4096*512][8:1]"],
    "V-Raptor [X]_REDCODE MQ" : ["8K VV[8192*4320][17:9]","8K VV[8192*4096][2:1]","8K VV[8192*3456][2.4:1]","8K VV[7680*4320]","7K VV[7168*3780][17:9]","7K VV[7168*3584][2:1]","7K VV[7168*3002][2.4:1]","7K VV[6720*3780]","6K S35[6144*3240][17:9]","6K S35[6144*3072][2:1]","6K S35[6144*2592][2.4:1]","6K S35[5760*3240]","5K S35[5120*2700][17:9]","5K S35[5120*2560][2:1]","5K S35[5120*2160][2.4:1]","5K S35[4800*2700]","4K S35[4096*2160][17:9]","4K S35[4096*2048][2:1]","4K S35[4096*1728][2.4:1]","UHD S35","3K S16[3072*1620][17:9]","3K S16[3072*1536][2:1]","3K S16[3072*1296][2.4:1]","3K S16[2880*1620]","2K S16[2048*1080][17:9]","2K S16[2048*1024][2:1]","2K S16[2048*864][2.4:1]","FHD S16","4K S35[4096*512][8:1]"],
    "V-Raptor [X]_REDCODE LQ" : ["8K VV[8192*4320][17:9]","8K VV[8192*4096][2:1]","8K VV[8192*3456][2.4:1]","8K VV[7680*4320]","7K VV[7168*3780][17:9]","7K VV[7168*3584][2:1]","7K VV[7168*3002][2.4:1]","7K VV[6720*3780]","6K S35[6144*3240][17:9]","6K S35[6144*3072][2:1]","6K S35[6144*2592][2.4:1]","6K S35[5760*3240]","5K S35[5120*2700][17:9]","5K S35[5120*2560][2:1]","5K S35[5120*2160][2.4:1]","5K S35[4800*2700]","4K S35[4096*2160][17:9]","4K S35[4096*2048][2:1]","4K S35[4096*1728][2.4:1]","UHD S35","3K S16[3072*1620][17:9]","3K S16[3072*1536][2:1]","3K S16[3072*1296][2.4:1]","3K S16[2880*1620]","2K S16[2048*1080][17:9]","2K S16[2048*1024][2:1]","2K S16[2048*864][2.4:1]","FHD S16","4K S35[4096*512][8:1]"],
    "V-Raptor [X]_REDCODE ELQ" : ["8K VV[8192*4320][17:9]","8K VV[8192*4096][2:1]","8K VV[8192*3456][2.4:1]","8K VV[7680*4320]","7K VV[7168*3780][17:9]","7K VV[7168*3584][2:1]","7K VV[7168*3002][2.4:1]","7K VV[6720*3780]","6K S35[6144*3240][17:9]","6K S35[6144*3072][2:1]","6K S35[6144*2592][2.4:1]","6K S35[5760*3240]","5K S35[5120*2700][17:9]","5K S35[5120*2560][2:1]","5K S35[5120*2160][2.4:1]","5K S35[4800*2700]","4K S35[4096*2160][17:9]","4K S35[4096*2048][2:1]","4K S35[4096*1728][2.4:1]","UHD S35","3K S16[3072*1620][17:9]","3K S16[3072*1536][2:1]","3K S16[3072*1296][2.4:1]","3K S16[2880*1620]","2K S16[2048*1080][17:9]","2K S16[2048*1024][2:1]","2K S16[2048*864][2.4:1]","FHD S16","4K S35[4096*512][8:1]"],
    
    "V-Raptor XL[8K VV]_REDCODE HQ" : ["8K VV[8192*4320][17:9]","8K VV[8192*4096][2:1]","8K VV[8192*3456][2.4:1]","8K VV[7680*4320]","7K VV[7168*3780][17:9]","7K VV[7168*3584][2:1]","7K VV[7168*3002][2.4:1]","7K VV[6720*3780]","6K S35[6144*3240][17:9]","6K S35[6144*3072][2:1]","6K S35[6144*2592][2.4:1]","6K S35[5760*3240]","5K S35[5120*2700][17:9]","5K S35[5120*2560][2:1]","5K S35[5120*2160][2.4:1]","5K S35[4800*2700]","4K S35[4096*2160][17:9]","4K S35[4096*2048][2:1]","4K S35[4096*1728][2.4:1]","UHD S35","3K S16[3072*1620][17:9]","3K S16[3072*1536][2:1]","3K S16[3072*1296][2.4:1]","3K S16[2880*1620]","2K S16[2048*1080][17:9]","2K S16[2048*1024][2:1]","2K S16[2048*864][2.4:1]","FHD S16","4K S35[4096*512][8:1]"],
    "V-Raptor XL[8K VV]_REDCODE MQ" : ["8K VV[8192*4320][17:9]","8K VV[8192*4096][2:1]","8K VV[8192*3456][2.4:1]","8K VV[7680*4320]","7K VV[7168*3780][17:9]","7K VV[7168*3584][2:1]","7K VV[7168*3002][2.4:1]","7K VV[6720*3780]","6K S35[6144*3240][17:9]","6K S35[6144*3072][2:1]","6K S35[6144*2592][2.4:1]","6K S35[5760*3240]","5K S35[5120*2700][17:9]","5K S35[5120*2560][2:1]","5K S35[5120*2160][2.4:1]","5K S35[4800*2700]","4K S35[4096*2160][17:9]","4K S35[4096*2048][2:1]","4K S35[4096*1728][2.4:1]","UHD S35","3K S16[3072*1620][17:9]","3K S16[3072*1536][2:1]","3K S16[3072*1296][2.4:1]","3K S16[2880*1620]","2K S16[2048*1080][17:9]","2K S16[2048*1024][2:1]","2K S16[2048*864][2.4:1]","FHD S16","4K S35[4096*512][8:1]"],
    "V-Raptor XL[8K VV]_REDCODE LQ" : ["8K VV[8192*4320][17:9]","8K VV[8192*4096][2:1]","8K VV[8192*3456][2.4:1]","8K VV[7680*4320]","7K VV[7168*3780][17:9]","7K VV[7168*3584][2:1]","7K VV[7168*3002][2.4:1]","7K VV[6720*3780]","6K S35[6144*3240][17:9]","6K S35[6144*3072][2:1]","6K S35[6144*2592][2.4:1]","6K S35[5760*3240]","5K S35[5120*2700][17:9]","5K S35[5120*2560][2:1]","5K S35[5120*2160][2.4:1]","5K S35[4800*2700]","4K S35[4096*2160][17:9]","4K S35[4096*2048][2:1]","4K S35[4096*1728][2.4:1]","UHD S35","3K S16[3072*1620][17:9]","3K S16[3072*1536][2:1]","3K S16[3072*1296][2.4:1]","3K S16[2880*1620]","2K S16[2048*1080][17:9]","2K S16[2048*1024][2:1]","2K S16[2048*864][2.4:1]","FHD S16","4K S35[4096*512][8:1]"],
    "V-Raptor XL[8K VV]_REDCODE ELQ" : ["8K VV[8192*4320][17:9]","8K VV[8192*4096][2:1]","8K VV[8192*3456][2.4:1]","8K VV[7680*4320]","7K VV[7168*3780][17:9]","7K VV[7168*3584][2:1]","7K VV[7168*3002][2.4:1]","7K VV[6720*3780]","6K S35[6144*3240][17:9]","6K S35[6144*3072][2:1]","6K S35[6144*2592][2.4:1]","6K S35[5760*3240]","5K S35[5120*2700][17:9]","5K S35[5120*2560][2:1]","5K S35[5120*2160][2.4:1]","5K S35[4800*2700]","4K S35[4096*2160][17:9]","4K S35[4096*2048][2:1]","4K S35[4096*1728][2.4:1]","UHD S35","3K S16[3072*1620][17:9]","3K S16[3072*1536][2:1]","3K S16[3072*1296][2.4:1]","3K S16[2880*1620]","2K S16[2048*1080][17:9]","2K S16[2048*1024][2:1]","2K S16[2048*864][2.4:1]","FHD S16","4K S35[4096*512][8:1]"],
    
    "V-Raptor[8K VV]_REDCODE HQ" : ["8K VV[8192*4320][17:9]","8K VV[8192*4096][2:1]","8K VV[8192*3456][2.4:1]","8K VV[7680*4320]","7K VV[7168*3780][17:9]","7K VV[7168*3584][2:1]","7K VV[7168*3002][2.4:1]","7K VV[6720*3780]","6K S35[6144*3240][17:9]","6K S35[6144*3072][2:1]","6K S35[6144*2592][2.4:1]","6K S35[5760*3240]","5K S35[5120*2700][17:9]","5K S35[5120*2560][2:1]","5K S35[5120*2160][2.4:1]","5K S35[4800*2700]","4K S35[4096*2160][17:9]","4K S35[4096*2048][2:1]","4K S35[4096*1728][2.4:1]","UHD S35","3K S16[3072*1620][17:9]","3K S16[3072*1536][2:1]","3K S16[3072*1296][2.4:1]","3K S16[2880*1620]","2K S16[2048*1080][17:9]","2K S16[2048*1024][2:1]","2K S16[2048*864][2.4:1]","FHD S16","4K S35[4096*512][8:1]"],
    "V-Raptor[8K VV]_REDCODE MQ" : ["8K VV[8192*4320][17:9]","8K VV[8192*4096][2:1]","8K VV[8192*3456][2.4:1]","8K VV[7680*4320]","7K VV[7168*3780][17:9]","7K VV[7168*3584][2:1]","7K VV[7168*3002][2.4:1]","7K VV[6720*3780]","6K S35[6144*3240][17:9]","6K S35[6144*3072][2:1]","6K S35[6144*2592][2.4:1]","6K S35[5760*3240]","5K S35[5120*2700][17:9]","5K S35[5120*2560][2:1]","5K S35[5120*2160][2.4:1]","5K S35[4800*2700]","4K S35[4096*2160][17:9]","4K S35[4096*2048][2:1]","4K S35[4096*1728][2.4:1]","UHD S35","3K S16[3072*1620][17:9]","3K S16[3072*1536][2:1]","3K S16[3072*1296][2.4:1]","3K S16[2880*1620]","2K S16[2048*1080][17:9]","2K S16[2048*1024][2:1]","2K S16[2048*864][2.4:1]","FHD S16","4K S35[4096*512][8:1]"],
    "V-Raptor[8K VV]_REDCODE LQ" : ["8K VV[8192*4320][17:9]","8K VV[8192*4096][2:1]","8K VV[8192*3456][2.4:1]","8K VV[7680*4320]","7K VV[7168*3780][17:9]","7K VV[7168*3584][2:1]","7K VV[7168*3002][2.4:1]","7K VV[6720*3780]","6K S35[6144*3240][17:9]","6K S35[6144*3072][2:1]","6K S35[6144*2592][2.4:1]","6K S35[5760*3240]","5K S35[5120*2700][17:9]","5K S35[5120*2560][2:1]","5K S35[5120*2160][2.4:1]","5K S35[4800*2700]","4K S35[4096*2160][17:9]","4K S35[4096*2048][2:1]","4K S35[4096*1728][2.4:1]","UHD S35","3K S16[3072*1620][17:9]","3K S16[3072*1536][2:1]","3K S16[3072*1296][2.4:1]","3K S16[2880*1620]","2K S16[2048*1080][17:9]","2K S16[2048*1024][2:1]","2K S16[2048*864][2.4:1]","FHD S16","4K S35[4096*512][8:1]"],
    "V-Raptor[8K VV]_REDCODE ELQ" : ["8K VV[8192*4320][17:9]","8K VV[8192*4096][2:1]","8K VV[8192*3456][2.4:1]","8K VV[7680*4320]","7K VV[7168*3780][17:9]","7K VV[7168*3584][2:1]","7K VV[7168*3002][2.4:1]","7K VV[6720*3780]","6K S35[6144*3240][17:9]","6K S35[6144*3072][2:1]","6K S35[6144*2592][2.4:1]","6K S35[5760*3240]","5K S35[5120*2700][17:9]","5K S35[5120*2560][2:1]","5K S35[5120*2160][2.4:1]","5K S35[4800*2700]","4K S35[4096*2160][17:9]","4K S35[4096*2048][2:1]","4K S35[4096*1728][2.4:1]","UHD S35","3K S16[3072*1620][17:9]","3K S16[3072*1536][2:1]","3K S16[3072*1296][2.4:1]","3K S16[2880*1620]","2K S16[2048*1080][17:9]","2K S16[2048*1024][2:1]","2K S16[2048*864][2.4:1]","FHD S16","4K S35[4096*512][8:1]"],
    
    "V-Raptor XL[8K S35]_REDCODE HQ" : ["8K S35[8192*4320][17:9]","8K S35[8192*4096][2:1]","8K S35[8192*3456][2.4:1]","8K S35[7680*4320]","7K S35[7168*3780][17:9]","7K S35[7168*3584][2:1]","7K S35[7168*3002][2.4:1]","7K S35[6720*3780]","6K S35[6144*3240][17:9]","6K S35[6144*3072][2:1]","6K S35[6144*2592][2.4:1]","6K S35[5760*3240]","5K S35[5120*2700][17:9]","5K S35[5120*2560][2:1]","5K S35[5120*2160][2.4:1]","5K S35[4800*2700]","4K S16[4096*2160][17:9]","4K S16[4096*2048][2:1]","4K S16[4096*1728][2.4:1]","UHD S16","3K S16[3072*1620][17:9]","3K S16[3072*1536][2:1]","3K S16[3072*1296][2.4:1]","3K S16[2880*1620]","2K S8[2048*1080][17:9]","2K S8[2048*1024][2:1]","2K S8[2048*864][2.4:1]","FHD S8"],
    "V-Raptor XL[8K S35]_REDCODE MQ" : ["8K S35[8192*4320][17:9]","8K S35[8192*4096][2:1]","8K S35[8192*3456][2.4:1]","8K S35[7680*4320]","7K S35[7168*3780][17:9]","7K S35[7168*3584][2:1]","7K S35[7168*3002][2.4:1]","7K S35[6720*3780]","6K S35[6144*3240][17:9]","6K S35[6144*3072][2:1]","6K S35[6144*2592][2.4:1]","6K S35[5760*3240]","5K S35[5120*2700][17:9]","5K S35[5120*2560][2:1]","5K S35[5120*2160][2.4:1]","5K S35[4800*2700]","4K S16[4096*2160][17:9]","4K S16[4096*2048][2:1]","4K S16[4096*1728][2.4:1]","UHD S16","3K S16[3072*1620][17:9]","3K S16[3072*1536][2:1]","3K S16[3072*1296][2.4:1]","3K S16[2880*1620]","2K S8[2048*1080][17:9]","2K S8[2048*1024][2:1]","2K S8[2048*864][2.4:1]","FHD S8"],
    "V-Raptor XL[8K S35]_REDCODE LQ" : ["8K S35[8192*4320][17:9]","8K S35[8192*4096][2:1]","8K S35[8192*3456][2.4:1]","8K S35[7680*4320]","7K S35[7168*3780][17:9]","7K S35[7168*3584][2:1]","7K S35[7168*3002][2.4:1]","7K S35[6720*3780]","6K S35[6144*3240][17:9]","6K S35[6144*3072][2:1]","6K S35[6144*2592][2.4:1]","6K S35[5760*3240]","5K S35[5120*2700][17:9]","5K S35[5120*2560][2:1]","5K S35[5120*2160][2.4:1]","5K S35[4800*2700]","4K S16[4096*2160][17:9]","4K S16[4096*2048][2:1]","4K S16[4096*1728][2.4:1]","UHD S16","3K S16[3072*1620][17:9]","3K S16[3072*1536][2:1]","3K S16[3072*1296][2.4:1]","3K S16[2880*1620]","2K S8[2048*1080][17:9]","2K S8[2048*1024][2:1]","2K S8[2048*864][2.4:1]","FHD S8"],
    "V-Raptor XL[8K S35]_REDCODE ELQ" : ["8K S35[8192*4320][17:9]","8K S35[8192*4096][2:1]","8K S35[8192*3456][2.4:1]","8K S35[7680*4320]","7K S35[7168*3780][17:9]","7K S35[7168*3584][2:1]","7K S35[7168*3002][2.4:1]","7K S35[6720*3780]","6K S35[6144*3240][17:9]","6K S35[6144*3072][2:1]","6K S35[6144*2592][2.4:1]","6K S35[5760*3240]","5K S35[5120*2700][17:9]","5K S35[5120*2560][2:1]","5K S35[5120*2160][2.4:1]","5K S35[4800*2700]","4K S16[4096*2160][17:9]","4K S16[4096*2048][2:1]","4K S16[4096*1728][2.4:1]","UHD S16","3K S16[3072*1620][17:9]","3K S16[3072*1536][2:1]","3K S16[3072*1296][2.4:1]","3K S16[2880*1620]","2K S8[2048*1080][17:9]","2K S8[2048*1024][2:1]","2K S8[2048*864][2.4:1]","FHD S8"],
    "V-Raptor[8K S35]_REDCODE HQ" : ["8K S35[8192*4320][17:9]","8K S35[8192*4096][2:1]","8K S35[8192*3456][2.4:1]","8K S35[7680*4320]","7K S35[7168*3780][17:9]","7K S35[7168*3584][2:1]","7K S35[7168*3002][2.4:1]","7K S35[6720*3780]","6K S35[6144*3240][17:9]","6K S35[6144*3072][2:1]","6K S35[6144*2592][2.4:1]","6K S35[5760*3240]","5K S35[5120*2700][17:9]","5K S35[5120*2560][2:1]","5K S35[5120*2160][2.4:1]","5K S35[4800*2700]","4K S16[4096*2160][17:9]","4K S16[4096*2048][2:1]","4K S16[4096*1728][2.4:1]","UHD S16","3K S16[3072*1620][17:9]","3K S16[3072*1536][2:1]","3K S16[3072*1296][2.4:1]","3K S16[2880*1620]","2K S8[2048*1080][17:9]","2K S8[2048*1024][2:1]","2K S8[2048*864][2.4:1]","FHD S8"],
    "V-Raptor[8K S35]_REDCODE MQ" : ["8K S35[8192*4320][17:9]","8K S35[8192*4096][2:1]","8K S35[8192*3456][2.4:1]","8K S35[7680*4320]","7K S35[7168*3780][17:9]","7K S35[7168*3584][2:1]","7K S35[7168*3002][2.4:1]","7K S35[6720*3780]","6K S35[6144*3240][17:9]","6K S35[6144*3072][2:1]","6K S35[6144*2592][2.4:1]","6K S35[5760*3240]","5K S35[5120*2700][17:9]","5K S35[5120*2560][2:1]","5K S35[5120*2160][2.4:1]","5K S35[4800*2700]","4K S16[4096*2160][17:9]","4K S16[4096*2048][2:1]","4K S16[4096*1728][2.4:1]","UHD S16","3K S16[3072*1620][17:9]","3K S16[3072*1536][2:1]","3K S16[3072*1296][2.4:1]","3K S16[2880*1620]","2K S8[2048*1080][17:9]","2K S8[2048*1024][2:1]","2K S8[2048*864][2.4:1]","FHD S8"],
    "V-Raptor[8K S35]_REDCODE LQ" : ["8K S35[8192*4320][17:9]","8K S35[8192*4096][2:1]","8K S35[8192*3456][2.4:1]","8K S35[7680*4320]","7K S35[7168*3780][17:9]","7K S35[7168*3584][2:1]","7K S35[7168*3002][2.4:1]","7K S35[6720*3780]","6K S35[6144*3240][17:9]","6K S35[6144*3072][2:1]","6K S35[6144*2592][2.4:1]","6K S35[5760*3240]","5K S35[5120*2700][17:9]","5K S35[5120*2560][2:1]","5K S35[5120*2160][2.4:1]","5K S35[4800*2700]","4K S16[4096*2160][17:9]","4K S16[4096*2048][2:1]","4K S16[4096*1728][2.4:1]","UHD S16","3K S16[3072*1620][17:9]","3K S16[3072*1536][2:1]","3K S16[3072*1296][2.4:1]","3K S16[2880*1620]","2K S8[2048*1080][17:9]","2K S8[2048*1024][2:1]","2K S8[2048*864][2.4:1]","FHD S8"],
    "V-Raptor[8K S35]_REDCODE ELQ" : ["8K S35[8192*4320][17:9]","8K S35[8192*4096][2:1]","8K S35[8192*3456][2.4:1]","8K S35[7680*4320]","7K S35[7168*3780][17:9]","7K S35[7168*3584][2:1]","7K S35[7168*3002][2.4:1]","7K S35[6720*3780]","6K S35[6144*3240][17:9]","6K S35[6144*3072][2:1]","6K S35[6144*2592][2.4:1]","6K S35[5760*3240]","5K S35[5120*2700][17:9]","5K S35[5120*2560][2:1]","5K S35[5120*2160][2.4:1]","5K S35[4800*2700]","4K S16[4096*2160][17:9]","4K S16[4096*2048][2:1]","4K S16[4096*1728][2.4:1]","UHD S16","3K S16[3072*1620][17:9]","3K S16[3072*1536][2:1]","3K S16[3072*1296][2.4:1]","3K S16[2880*1620]","2K S8[2048*1080][17:9]","2K S8[2048*1024][2:1]","2K S8[2048*864][2.4:1]","FHD S8"],
    
    "KEMODO-X_REDCODE HQ" : ["6K S35[6144*3240][17:9]","6K S35[6144*3072][2:1]","6K S35[6144*2592][2.4:1]","6K S35[5760*3240]","5K S35[5120*2700][17:9]","5K S35[4800*2700]","4K S35[4096*2160][17:9]","UHD S35","2K S16[2048*1080][17:9]"],
    "KEMODO-X_REDCODE MQ" : ["6K S35[6144*3240][17:9]","6K S35[6144*3072][2:1]","6K S35[6144*2592][2.4:1]","6K S35[5760*3240]","5K S35[5120*2700][17:9]","5K S35[4800*2700]","4K S35[4096*2160][17:9]","UHD S35","2K S16[2048*1080][17:9]"],
    "KEMODO-X_REDCODE LQ" : ["6K S35[6144*3240][17:9]","6K S35[6144*3072][2:1]","6K S35[6144*2592][2.4:1]","6K S35[5760*3240]","5K S35[5120*2700][17:9]","5K S35[4800*2700]","4K S35[4096*2160][17:9]","UHD S35","2K S16[2048*1080][17:9]"],
    "KEMODO-X_REDCODE ELQ" : ["6K S35[6144*3240][17:9]","6K S35[6144*3072][2:1]","6K S35[6144*2592][2.4:1]","6K S35[5760*3240]","5K S35[5120*2700][17:9]","5K S35[4800*2700]","4K S35[4096*2160][17:9]","UHD S35","2K S16[2048*1080][17:9]"],
    
    "KEMODO_REDCODE HQ" : ["6K S35[6144*3240][17:9]","6K S35[6144*3072][2:1]","6K S35[6144*2592][2.4:1]","6K S35[5760*3240]","5K S35[5120*2700][17:9]","4K S35[4096*2160][17:9]","UHD S35","2K S16[2048*1080][17:9]"],
    "KEMODO_REDCODE MQ" : ["6K S35[6144*3240][17:9]","6K S35[6144*3072][2:1]","6K S35[6144*2592][2.4:1]","6K S35[5760*3240]","5K S35[5120*2700][17:9]","4K S35[4096*2160][17:9]","UHD S35","2K S16[2048*1080][17:9]"],
    "KEMODO_REDCODE LQ" : ["6K S35[6144*3240][17:9]","6K S35[6144*3072][2:1]","6K S35[6144*2592][2.4:1]","6K S35[5760*3240]","5K S35[5120*2700][17:9]","4K S35[4096*2160][17:9]","UHD S35","2K S16[2048*1080][17:9]"],
    "KEMODO_REDCODE ELQ" : ["6K S35[6144*3240][17:9]","6K S35[6144*3072][2:1]","6K S35[6144*2592][2.4:1]","6K S35[5760*3240]","5K S35[5120*2700][17:9]","4K S35[4096*2160][17:9]","UHD S35","2K S16[2048*1080][17:9]"],
    
    //Apple

    "iPhone 15 Pro MAX_Prores 422 HQ" : ["UHD","FHD","HD"],
    "iPhone 15 Pro MAX_Prores 422" : ["UHD","FHD","HD"],
    "iPhone 15 Pro MAX_Prores 422 LT" : ["UHD","FHD","HD"],
    "iPhone 15 Pro MAX_Prores 422 Proxy" : ["UHD","FHD","HD"],
    "iPhone 15 Pro_Prores 422 HQ" : ["UHD","FHD","HD"],
    "iPhone 15 Pro_Prores 422" : ["UHD","FHD","HD"],
    "iPhone 15 Pro_Prores 422 LT" : ["UHD","FHD","HD"],
    "iPhone 15 Pro_Prores 422 Proxy" : ["UHD","FHD","HD"],
    "iPhone 14 Pro MAX_Prores 422 HQ" : ["UHD","FHD","HD"],
    "iPhone 14 Pro MAX_Prores 422" : ["UHD","FHD","HD"],
    "iPhone 14 Pro MAX_Prores 422 LT" : ["UHD","FHD","HD"],
    "iPhone 14 Pro MAX_Prores 422 Proxy" : ["UHD","FHD","HD"],
    "iPhone 14 Pro_Prores 422 HQ" : ["UHD","FHD","HD"],
    "iPhone 14 Pro_Prores 422" : ["UHD","FHD","HD"],
    "iPhone 14 Pro_Prores 422 LT" : ["UHD","FHD","HD"],
    "iPhone 14 Pro_Prores 422 Proxy" : ["UHD","FHD","HD"],
    
    //BMD
    "Blackmagic URSA Mini Pro 12K_Blackmagic RAW 5:1" : ["12K S35[12288*6480][17:9]","12K S35[11520*6480][16:9]","12K S35[12288*5112][2.4:1]","8K S35[8192*4320][17:9]","8K S35[7680*4320][16:9]","8K S35[8192*3408][2.4:1]","4K S35[4096*2160][17:9]","4K S35[3840*2160][16:9]","4K S35[4096*1704][2.4:1]","6K S16[6144*3240][17:9]","4K S16[4096*2160][17:9]"],
    "Blackmagic URSA Mini Pro 12K_Blackmagic RAW 8:1" : ["12K S35[12288*6480][17:9]","12K S35[11520*6480][16:9]","12K S35[12288*5112][2.4:1]","8K S35[8192*4320][17:9]","8K S35[7680*4320][16:9]","8K S35[8192*3408][2.4:1]","4K S35[4096*2160][17:9]","4K S35[3840*2160][16:9]","4K S35[4096*1704][2.4:1]","6K S16[6144*3240][17:9]","4K S16[4096*2160][17:9]"],
    "Blackmagic URSA Mini Pro 12K_Blackmagic RAW 12:1" : ["12K S35[12288*6480][17:9]","12K S35[11520*6480][16:9]","12K S35[12288*5112][2.4:1]","8K S35[8192*4320][17:9]","8K S35[7680*4320][16:9]","8K S35[8192*3408][2.4:1]","4K S35[4096*2160][17:9]","4K S35[3840*2160][16:9]","4K S35[4096*1704][2.4:1]","6K S16[6144*3240][17:9]","4K S16[4096*2160][17:9]"],
    "Blackmagic URSA Mini Pro 12K_Blackmagic RAW 18:1" : ["12K S35[12288*6480][17:9]","12K S35[11520*6480][16:9]","12K S35[12288*5112][2.4:1]","8K S35[8192*4320][17:9]","8K S35[7680*4320][16:9]","8K S35[8192*3408][2.4:1]","4K S35[4096*2160][17:9]","4K S35[3840*2160][16:9]","4K S35[4096*1704][2.4:1]","6K S16[6144*3240][17:9]","4K S16[4096*2160][17:9]"],
]

//DjiResolution
func DjiResolution(cameradata:CameraData) -> [String] {
    var DjiResolution = [""]
    if cameradata.CameraName == "Ronin 4D[8K]" {
        if cameradata.Codec == "Prores RAW" {
            DjiResolution = ["8K FF[8192*4320][17:9]","8K FF[8192*3424][2.39:1]","5.5K S35[5568*2952][17:9]","4K FF[4096*2160][17:9]"]
        }
        else if cameradata.Codec == "Prores 422 HQ" {
            DjiResolution = ["8K FF[8192*4320][17:9]","4K FF[4096*2160][17:9]","4K S35[4096*2160][17:9]"]
        }
        else if cameradata.Codec == "H.264(10bit 4:2:0)" {
            DjiResolution = ["4K FF[4096*2160][17:9]","4K S35[4096*2160][17:9]"]
        }
    }
    else if cameradata.CameraName == "Ronin 4D[6K]" {
        if cameradata.Codec == "Prores RAW" {
            DjiResolution = ["6K FF[6008*3168][17:9]","6K FFcrop[5952*3136][17:9]","6K FF[6008*2512][2.39:1]","4K S35[4096*2160][17:9]","4K S35[4096*1712][2.39:1]"]
        }
        else if cameradata.Codec == "Prores 4444 XQ" {
            DjiResolution = ["6K FF[6008*3168][17:9]","6K FFcrop[5952*3136][17:9]","6K FF[6008*2512][2.39:1]","4K S35[4096*2160][17:9]","4K S35[4096*1712][2.39:1]"]
        }
        else if cameradata.Codec == "Prores 422 HQ" {
            DjiResolution = ["6K FF[6008*3168][17:9]","6K FFcrop[5952*3136][17:9]","6K FF[6008*2512][2.39:1]","4K FF[4096*2160][17:9]","4K FFcrop[4096*2160][17:9]","4K FF[4096*1712][2.39:1]","4K S35[4096*2160][17:9]","4K S35[4096*1712][2.39:1]","2K FF[2048*1080][17:9]","2K S35[2048*1080][17:9]"]
        }
        else if cameradata.Codec == "Prores 422 LT" {
            DjiResolution = ["6K FF[6008*3168][17:9]","6K FFcrop[5952*3136][17:9]","6K FF[6008*2512][2.39:1]","4K FF[4096*2160][17:9]","4K FFcrop[4096*2160][17:9]","4K FF[4096*1712][2.39:1]","4K S35[4096*2160][17:9]","4K S35[4096*1712][2.39:1]","2K FF[2048*1080][17:9]","2K S35[2048*1080][17:9]"]
        }
        else if cameradata.Codec == "H.264(10bit 4:2:0)" {
            DjiResolution = ["4K FF[4096*2160][17:9]","4K FFcrop[4096*2160][17:9]","4K FF[4096*1712][2.39:1]","4K S35[4096*2160][17:9]","4K S35[4096*1712][2.39:1]","2K FF[2048*1080][17:9]","2K S35[2048*1080][17:9]"]
        }
    }
    else if cameradata.CameraName == "Inspire 3" {
        if cameradata.Codec == "CinemaDNG" {
            DjiResolution = ["8K FF[8192*4320][17:9]","8K FF[8192*3424][2.39:1]","5.5K S35[5568*2952][17:9]","5.5K S35[5248*2952][16:9]","4K FF[4096*2160][17:9]","4K FF[3840*2160][16:9]"]
        }
        else if cameradata.Codec == "Prores RAW" {
            DjiResolution = ["8K FF[8192*4320][17:9]","8K FF[7680*4320][16:9]","8K FF[8192*3424][2.39:1]","5.5K S35[5568*2952][17:9]","5.5K S35[5248*2952][16:9]","4K FF[4096*2160][17:9]","4K FF[3840*2160][16:9]"]
        }
        else if cameradata.Codec == "Prores 422 HQ" {
            DjiResolution = ["8K FF[8192*4320][17:9]","8K FF[7680*4320][16:9]","4K FF[4096*2160][17:9]","4K FF[3840*2160][16:9]","4K S35[4096*2160][17:9]","4K S35[3840*2160][16:9]"]
        }
        else if cameradata.Codec == "H.264(10bit 4:2:0)" {
            DjiResolution = ["4K FF[4096*2160][17:9]","4K FF[3840*2160][16:9]","4K S35[4096*2160][17:9]","4K S35[3840*2160][16:9]"]
        }
    }
    
    return DjiResolution
}

//PanaResolution
func PanaResolution(cameradata:CameraData) -> [String] {
    var PanaResolution = [""]
    if cameradata.CameraName == "S1H" {
        if cameradata.Codec == "HEVC LongGOP" {
            switch cameradata.Format {
            case "Full Frame" :
                PanaResolution = ["6K 3:2[5952*3968][10bit 4:2:0][23.98p/24p]","5.9K[5888*3312][10bit 4:2:0][23.98p/24p/25p/29.97p]","5.4K 3:2[5376*3584][10bit 4:2:0][25p/29.97p]","FHD[10bit 4:2:0][47.95p/48p]","FHD[10bit 4:2:0][100p/119.88p]"]
            case "APS-C" :
                PanaResolution = ["DCI 4K[10bit 4:2:0][47.95p/48p/50p/59.94p]","UHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","3.3K 4:3[3328*2496][10bit 4:2:0][47.95p/48p/50p]","FHD[10bit 4:2:0][47.95p/48p]","FHD[10bit 4:2:0][100p/119.88p]"]
            case "Pixel to Pixel" :
                PanaResolution = ["DCI 4K[10bit 4:2:0][47.95p/48p/50p/59.94p]","UHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","3.3K 4:3[3328*2496][10bit 4:2:0][47.95p/48p/50p]","FHD[10bit 4:2:0][47.95p/48p]"]
            default :
                PanaResolution = [""]
            }
        }
        if cameradata.Codec == "AVC ALL-I" {
            switch cameradata.Format {
            case "Full Frame" :
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][50p/59.94p]"]
            case "APS-C" :
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][50p/59.94p]"]
            case "Pixel to Pixel" :
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][50p/59.94p]"]
            default :
                PanaResolution = [""]
            }
        }
        if cameradata.Codec == "AVC LongGOP" {
            switch cameradata.Format {
            case "Full Frame" :
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][50p/59.94p]"]
            case "APS-C" :
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][50p/59.94p]"]
            case "Pixel to Pixel" :
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][50p/59.94p]"]
            default :
                PanaResolution = [""]
            }
        }
    }
    
    else if cameradata.CameraName == "S5M2" || cameradata.CameraName == "S5M2X"{
        if cameradata.Codec == "Prores 422 HQ" || cameradata.Codec == "Prores 422"{
            switch cameradata.Format {
            case "Full Frame" :
                PanaResolution = ["DCI 5.8K[5776*3056][10bit 4:2:2][23.98p]","DCI 5.8K[5776*3056][10bit 4:2:2][24p]","DCI 5.8K[5776*3056][10bit 4:2:2][25p]","DCI 5.8K[5776*3056][10bit 4:2:2][29.97p]","DCI 4K[10bit 4:2:2][23.98p]","DCI 4K[10bit 4:2:2][24p]","DCI 4K[10bit 4:2:2][25p]","DCI 4K[10bit 4:2:2][29.97p]","FHD[10bit 4:2:2][23.98p]","FHD[10bit 4:2:2][24p]","FHD[10bit 4:2:2][25p]","FHD[10bit 4:2:2][29.97p]","FHD[10bit 4:2:2][50p]","FHD[10bit 4:2:2][59.94p]"]
            case "APS-C" :
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p]","DCI 4K[10bit 4:2:2][24p]","DCI 4K[10bit 4:2:2][25p]","DCI 4K[10bit 4:2:2][29.97p]","DCI 4K[10bit 4:2:2][50p]","DCI 4K[10bit 4:2:2][59.94p]","3.3K 4:3[3328*2496][10bit 4:2:2][23.98p]","3.3K 4:3[3328*2496][10bit 4:2:2][24p]","3.3K 4:3[3328*2496][10bit 4:2:2][25p]","3.3K 4:3[3328*2496][10bit 4:2:2][29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][50p]","FHD[10bit 4:2:2][24p]","FHD[10bit 4:2:2][25p]","FHD[10bit 4:2:2][29.97p]","FHD[10bit 4:2:2][50p]","FHD[10bit 4:2:2][59.94p]"]
            case "Pixel to Pixel" :
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p]","DCI 4K[10bit 4:2:2][24p]","DCI 4K[10bit 4:2:2][25p]","DCI 4K[10bit 4:2:2][29.97p]","DCI 4K[10bit 4:2:2][50p]","DCI 4K[10bit 4:2:2][59.94p]","3.3K 4:3[3328*2496][10bit 4:2:2][23.98p]","3.3K 4:3[3328*2496][10bit 4:2:2][24p]","3.3K 4:3[3328*2496][10bit 4:2:2][25p]","3.3K 4:3[3328*2496][10bit 4:2:2][29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][50p]","FHD[10bit 4:2:2][24p]","FHD[10bit 4:2:2][25p]","FHD[10bit 4:2:2][29.97p]","FHD[10bit 4:2:2][50p]","FHD[10bit 4:2:2][59.94p]"]
            default :
                PanaResolution = [""]
            }
        }
        if cameradata.Codec == "HEVC LongGOP" {
            switch cameradata.Format {
            case "Full Frame" :
                PanaResolution = ["6K 3:2[5952*3968][10bit 4:2:0][23.98p/24p/25p/29.97p]","DCI 6K[5952*3136][10bit 4:2:0][23.98p/24p/25p/29.97p]","5.9K[5888*3312][10bit 4:2:0][23.98p/24p/25p/29.97p]","DCI 4K[10bit 4:2:0][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:0][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:0][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:0][100p/119.88p]"]
            case "APS-C" :
                PanaResolution = ["DCI 4K[10bit 4:2:0][23.98p/24p/25p/29.97p]","DCI 4K[10bit 4:2:0]47.95p/48p/50p/59.94p]","UHD[10bit 4:2:0][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","3.3K 4:3[3328*2496][10bit 4:2:0][23.98p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:0][47.95p/48p/50p]","FHD[10bit 4:2:0][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:0][100p/119.88p]"]
            case "Pixel to Pixel" :
                PanaResolution = ["DCI 4K[10bit 4:2:0][23.98p/24p/25p/29.97p]","DCI 4K[10bit 4:2:0][47.95p/48p/50p/59.94p]","UHD[10bit 4:2:0][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","3.3K 4:3[3328*2496][10bit 4:2:0][23.98p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:0][47.95p/48p/50p]","FHD[10bit 4:2:0][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:0][47.95p/48p/50p/59.94p]"]
            default :
                PanaResolution = [""]
            }
        }
        if cameradata.Codec == "AVC ALL-I" {
            switch cameradata.Format {
            case "Full Frame" :
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p]"]
            case "APS-C" :
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p/24p/25p/29.97p]","DCI 4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","DCI 4K[10bit 4:2:2][47.95p/48p/50p/59.94p][Light]","UHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","UHD[10bit 4:2:2][47.95p/48p/50p/59.94p][Light]","3.3K 4:3[3328*2496][10bit 4:2:2][23.98p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][47.95p/48p/50p]","3.3K 4:3[3328*2496][10bit 4:2:2][47.95p/48p/50p][Light]","FHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p]"]
            case "Pixel to Pixel" :
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p/24p/25p/29.97p]","DCI 4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","DCI 4K[10bit 4:2:2][47.95p/48p/50p/59.94p][Light]","UHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","UHD[10bit 4:2:2][47.95p/48p/50p/59.94p][Light]","3.3K 4:3[3328*2496][10bit 4:2:2][23.98p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][47.95p/48p/50p]","3.3K 4:3[3328*2496][10bit 4:2:2][47.95p/48p/50p][Light]","FHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]"]
            default :
                PanaResolution = [""]
            }
        }
        if cameradata.Codec == "AVC LongGOP" {
            switch cameradata.Format {
            case "Full Frame" :
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p]"]
            case "APS-C" :
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p/24p/25p/29.97p]","DCI 4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","UHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","3.3K 4:3[3328*2496][10bit 4:2:2][23.98p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][47.95p/48p/50p]","FHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p]"]
            case "Pixel to Pixel" :
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p/24p/25p/29.97p]","DCI 4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","UHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","3.3K 4:3[3328*2496][10bit 4:2:2][23.98p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][47.95p/48p/50p]","FHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]"]
            default :
                PanaResolution = [""]
            }
        }
    }
    
    else if cameradata.CameraName == "GH6" || cameradata.CameraName == "G9M2" {
        if cameradata.Codec == "Prores 422 HQ" || cameradata.Codec == "Prores 422" {
            if cameradata.Format == "M43" {
                PanaResolution = ["DCI 5.7K[5728*3024][10bit 4:2:2][23.98p]","DCI 5.7K[5728*3024][10bit 4:2:2][24p]","DCI 5.7K[5728*3024][10bit 4:2:2][25p]","DCI 5.7K[5728*3024][10bit 4:2:2][29.97p]","DCI 4K[10bit 4:2:2][23.98p]","DCI 4K[10bit 4:2:2][24p]","DCI 4K[10bit 4:2:2][25p]","DCI 4K[10bit 4:2:2][29.97p]","DCI 4K[10bit 4:2:2][50p]","DCI 4K[10bit 4:2:2][59.94p]","FHD[10bit 4:2:2][23.98p]","FHD[10bit 4:2:2][24p]","FHD[10bit 4:2:2][25p]","FHD[10bit 4:2:2][29.97p]","FHD[10bit 4:2:2][50p]","FHD[10bit 4:2:2][59.94p]"]
            }
            else {
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p]","DCI 4K[10bit 4:2:2][24p]","DCI 4K[10bit 4:2:2][25p]","DCI 4K[10bit 4:2:2][29.97p]","DCI 4K[10bit 4:2:2][50p]","DCI 4K[10bit 4:2:2][59.94p]","FHD[10bit 4:2:2][23.98p]","FHD[10bit 4:2:2][24p]","FHD[10bit 4:2:2][25p]","FHD[10bit 4:2:2][29.97p]","FHD[10bit 4:2:2][50p]","FHD[10bit 4:2:2][59.94p]"]
            }
        }
        if cameradata.Codec == "HEVC LongGOP" {
            if cameradata.Format == "M43" {
                PanaResolution = ["5.8K 4:3[5760*4320][10bit 4:2:0][23.98p/24p/25p/29.97p]","DCI 5.7K[5728*3024][10bit 4:2:0][23.98p/24p/25p/29.97p]","DCI 5.7K[5728*3024][10bit 4:2:0][47.95p/48p/50p/59.94p]","DCI 4K[10bit 4:2:0][23.98p/24p/25p/29.97p]","DCI 4K[10bit 4:2:0][47.95p/48p/50p/59.94p]","DCI 4K[10bit 4:2:0][100p/119.88p]","UHD[10bit 4:2:0][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","UHD[10bit 4:2:0][100p/119.88p]","FHD[10bit 4:2:0][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:0][100p/119.88p]","FHD[10bit 4:2:0][200p/239.76p]"]
            }
            else {
                PanaResolution = ["4.4K 4:3[4352*3264][10bit 4:2:0][47.95p/48p/50p/59.94p]","DCI 4K[10bit 4:2:0][23.98p/24p/25p/29.97p]","DCI 4K[10bit 4:2:0][47.95p/48p/50p/59.94p]","DCI 4K[10bit 4:2:0][100p/119.88p]","UHD[10bit 4:2:0][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","UHD[10bit 4:2:0][100p/119.88p]","FHD[10bit 4:2:0][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:0][100p/119.88p]"]
            }
        }
        if cameradata.Codec == "AVC ALL-I" {
            if cameradata.Format == "M43" {
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p/24p/25p/29.97p]","DCI 4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","DCI 4K[10bit 4:2:2][47.95p/48p/50p/59.94p][Light]","UHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","UHD[10bit 4:2:2][47.95p/48p/50p/59.94p][Light]","FHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p]","FHD[10bit 4:2:2][200p/239.76p]"]
            }
            else {
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p/24p/25p/29.97p]","DCI 4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","DCI 4K[10bit 4:2:2][47.95p/48p/50p/59.94p][Light]","UHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","UHD[10bit 4:2:2][47.95p/48p/50p/59.94p][Light]","FHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p]"]
            }
        }
        if cameradata.Codec == "AVC LongGOP" {
            if cameradata.Format == "M43" {
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p/24p/25p/29.97p]","DCI 4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","UHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","UHD[10bit 4:2:2][100p/119.88p]","FHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p]","FHD[10bit 4:2:2][200p/239.76p]"]
            }
            else {
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p/24p/25p/29.97p]","DCI 4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","UHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","UHD[10bit 4:2:2][100p/119.88p]","FHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p]"]
            }
        }
    }
    return PanaResolution
}
