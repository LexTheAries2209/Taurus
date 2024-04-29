//
//  func_Output.swift
//  Taurus
//
//  Created by 吴坤城 on 3/25/24.
//

import Foundation
import SwiftUI

func DataOutput(cameradata:CameraData) -> some View {
    VStack(alignment: .center) {
        if cameradata.BrandName == "SONY" && !cameradata.CameraName.contains("CineAlta"){
            Text("可录制时长[Min]：\(MediaCapacity(cameradata:cameradata)*2048/15/SonyCodecSpeed(cameradata:cameradata))")
            Text("数据码率[mbps]: \(SonyCodecSpeed(cameradata:cameradata))")
            Text("每小时数据占盘量[GB]：\(SonyCodecSpeed(cameradata:cameradata)*450/1024)")
        }
        else if cameradata.BrandName == "Canon" {
            Text("可录制时长[Min]：\(MediaCapacity(cameradata:cameradata)*2048/15/CanonCodecSpeed(cameradata:cameradata))")
            Text("数据码率[mbps]: \(CanonCodecSpeed(cameradata:cameradata))")
            Text("每小时数据占盘量[GB]：\(CanonCodecSpeed(cameradata:cameradata)*450/1024)")
        }
        else if cameradata.BrandName == "Panasonic" {
            Text("可录制时长[Min]：\(MediaCapacity(cameradata:cameradata)*2048/15/PanaCodecSpeed(cameradata:cameradata))")
            Text("数据码率[mbps]: \(PanaCodecSpeed(cameradata:cameradata))")
            Text("每小时数据占盘量[GB]：\(PanaCodecSpeed(cameradata:cameradata)*450/1024)")
        }
        else {
            Text("可录制时长[Min]：\(MediaCapacity(cameradata:cameradata)*2048/15/CodecSpeedCount(cameradata:cameradata)/ResolutionMultiplier(cameradata:cameradata)/RateMultiplier(cameradata:cameradata))")
            Text("数据码率[mbps]: \(CodecSpeedCount(cameradata:cameradata)*ResolutionMultiplier(cameradata:cameradata)*RateMultiplier(cameradata:cameradata))")
            Text("每小时数据占盘量[GB]：\(CodecSpeedCount(cameradata:cameradata)*ResolutionMultiplier(cameradata:cameradata)*RateMultiplier(cameradata:cameradata)*450/1024)")
            if cameradata.Codec == "ARRIRAW" {
                Text("每小时数据占盘量[GB][HDE]：\(Codecspeed(cameradata:cameradata)*ResolutionMultiplier(cameradata:cameradata)*RateMultiplier(cameradata:cameradata)*RateMultiplier(cameradata:cameradata)*270/1024)")
            }
        }
    }
    .padding([.leading,.trailing],30)
}
