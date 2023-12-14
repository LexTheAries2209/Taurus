//
//  PanasonicCount.swift
//  Taurus
//
//  Created by 吴坤城 on 12/7/23.
//

import Foundation
import Combine

//松下机型码率计算区
func PanaCodecSpeed(cameradata:CameraData) -> Double {
    let PanaCodecName = cameradata.Codec + "_" + cameradata.Resolution
    switch PanaCodecName {
    case "" :
        return 1
    default :
        return 0.00000001
    }
}
