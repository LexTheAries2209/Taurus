//
//  func_Output.swift
//  Taurus
//
//  Created by 吴坤城 on 3/25/24.
//

import Foundation
import SwiftUI

// 辅助函数，用于格式化浮点数
func formatNumber(_ number: Double) -> String {
    if number.isNaN || number.isInfinite {
        return "0.00"
    } else {
        return String(format: "%.2f", number)
    }
}

//用于数据输出
func DataOutput(cameradata: CameraData) -> some View {
    VStack(alignment: .leading) {
        let capacity = MediaCapacity(cameradata: cameradata)
        let codecSpeed = CodecSpeedCount(cameradata: cameradata)
        let resolutionMultiplier = ResolutionMultiplier(cameradata: cameradata)
        let rateMultiplier = RateMultiplier(cameradata: cameradata)
        
        if cameradata.BrandName == "SONY" && !cameradata.CameraName.contains("CineAlta") {
            let sonySpeed = SonyCodecSpeed(cameradata: cameradata)
            Text("可录制时长[Min]:\(String(repeating: " ", count: 21))\(formatNumber(capacity * 2048 / 15 / sonySpeed))")
            Text("数据码率[mbps]：\(String(repeating: " ", count: 19))\(formatNumber(sonySpeed))")
            Text("每小时数据占盘量[GB]:\(String(repeating: " ", count: 11))\(formatNumber(sonySpeed * 450 / 1024))")
        }
        else if cameradata.BrandName == "Canon" {
            let canonSpeed = CanonCodecSpeed(cameradata: cameradata)
            Text("可录制时长[Min]:\(String(repeating: " ", count: 21))\(formatNumber(capacity * 2048 / 15 / canonSpeed))")
            Text("数据码率[mbps]：\(String(repeating: " ", count: 19))\(formatNumber(canonSpeed))")
            Text("每小时数据占盘量[GB]:\(String(repeating: " ", count: 11))\(formatNumber(canonSpeed * 450 / 1024))")
        }
        else if cameradata.BrandName == "Panasonic" {
            let panaSpeed = PanaCodecSpeed(cameradata: cameradata)
            Text("可录制时长[Min]:\(String(repeating: " ", count: 21))\(formatNumber(capacity * 2048 / 15 / panaSpeed))")
            Text("数据码率[mbps]：\(String(repeating: " ", count: 19))\(formatNumber(panaSpeed))")
            Text("每小时数据占盘量[GB]:\(String(repeating: " ", count: 11))\(formatNumber(panaSpeed * 450 / 1024))")
        }
        else {
            Text("可录制时长[Min]:\(String(repeating: " ", count: 21))\(formatNumber(capacity * 2048 / 15 / codecSpeed / resolutionMultiplier / rateMultiplier))")
            Text("数据码率[mbps]：\(String(repeating: " ", count: 19))\(formatNumber(codecSpeed * resolutionMultiplier * rateMultiplier))")
            Text("每小时数据占盘量[GB]:\(String(repeating: " ", count: 11))\(formatNumber(codecSpeed * resolutionMultiplier * rateMultiplier * 450 / 1024))")
            if cameradata.Codec == "ARRIRAW" {
                Text("每小时数据占盘量[GB][HDE]:\(String(repeating: " ", count: 1))\(formatNumber(CodecSpeedCount(cameradata: cameradata) * resolutionMultiplier * rateMultiplier * rateMultiplier * 270 / 1024))")
            }
        }
    }
    .padding([.leading, .trailing], 30)
}
