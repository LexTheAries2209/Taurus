//
//  func_DjiMedia.swift
//  Taurus
//
//  Created by 吴坤城 on 12/20/23.
//

import Foundation

func DjiMedia(cameradata:CameraData) -> [String] {
    var DjiMedia = [""]
    if cameradata.CameraName == "Inspire 3" {
        DjiMedia = ["DJI PROSSD 1TB"]
    }
    return DjiMedia
}
