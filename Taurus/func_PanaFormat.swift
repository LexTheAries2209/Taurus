//
//  func_PanaFormat.swift
//  Taurus
//
//  Created by 吴坤城 on 12/13/23.
//

import Foundation

func PanaFormat(cameradata:CameraData) -> [String] {
    var PanaFormat = [""]
    switch cameradata.CameraName {
    case "S5M2X" :
        PanaFormat = ["Full Frame","APS-C","Pixel to Pixel"]
    case "S5M2" :
        PanaFormat = ["Full Frame","APS-C","Pixel to Pixel"]
    case "S1H" :
        PanaFormat = ["Full Frame","APS-C","Pixel to Pixel"]
    case "GH6" :
        PanaFormat = ["M43","Pixel to Pixel"]
    case "G9M2" :
        PanaFormat = ["M43","Pixel to Pixel"]
    default :
        PanaFormat = [""]
        
    }
    return PanaFormat
}
