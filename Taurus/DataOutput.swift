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
            Text("")
            Text("可录制时长[Min]:\(String(repeating: " ", count: 21))\(formatNumber(capacity * 2048 / 15 / sonySpeed))")
            Text("")
            Text("数据码率[mbps]：\(String(repeating: " ", count: 19))\(formatNumber(sonySpeed))")
            Text("")
            Text("数据码率[MBps]：\(String(repeating: " ", count: 19))\(formatNumber(sonySpeed / 8))")
            Text("")
            Text("每小时数据占盘量[GB]:\(String(repeating: " ", count: 12))\(formatNumber(sonySpeed * 450 / 1024))")
        }
        else if cameradata.BrandName == "Canon" {
            let canonSpeed = CanonCodecSpeed(cameradata: cameradata)
            Text("")
            Text("可录制时长[Min]:\(String(repeating: " ", count: 21))\(formatNumber(capacity * 2048 / 15 / canonSpeed))")
            Text("")
            Text("数据码率[mbps]：\(String(repeating: " ", count: 19))\(formatNumber(canonSpeed))")
            Text("")
            Text("数据码率[MBps]：\(String(repeating: " ", count: 19))\(formatNumber(canonSpeed / 8))")
            Text("")
            Text("每小时数据占盘量[GB]:\(String(repeating: " ", count: 12))\(formatNumber(canonSpeed * 450 / 1024))")
        }
        else if cameradata.BrandName == "Panasonic" {
            let panaSpeed = PanaCodecSpeed(cameradata: cameradata)
            Text("")
            Text("可录制时长[Min]:\(String(repeating: " ", count: 21))\(formatNumber(capacity * 2048 / 15 / panaSpeed))")
            Text("")
            Text("数据码率[mbps]：\(String(repeating: " ", count: 19))\(formatNumber(panaSpeed))")
            Text("")
            Text("数据码率[MBps]：\(String(repeating: " ", count: 19))\(formatNumber(panaSpeed / 8))")
            Text("")
            Text("每小时数据占盘量[GB]:\(String(repeating: " ", count: 12))\(formatNumber(panaSpeed * 450 / 1024))")
        }
        else if cameradata.BrandName == "Blackmagicdesign" {
            let BMDSpeed = BMDCodecSpeedmbps(cameradata:cameradata)
            Text("")
            Text("可录制时长[Min]:\(String(repeating: " ", count: 21))\(formatNumber(capacity * 2048 / 15 / BMDSpeed))")
            Text("")
            Text("数据码率[mbps]：\(String(repeating: " ", count: 19))\(formatNumber(BMDSpeed))")
            Text("")
            Text("数据码率[MBps]：\(String(repeating: " ", count: 19))\(formatNumber(BMDSpeed / 8))")
            Text("")
            Text("每小时数据占盘量[GB]:\(String(repeating: " ", count: 12))\(formatNumber(BMDSpeed * 450 / 1024))")
        }
        else if cameradata.BrandName == "Canon Cinema" {
            let CanonCinemaSpeed = CanonCinemaCodecSpeed(cameradata:cameradata)
            Text("")
            Text("可录制时长[Min]:\(String(repeating: " ", count: 21))\(formatNumber(capacity * 2048 / 15 / CanonCinemaSpeed))")
            Text("")
            Text("数据码率[mbps]：\(String(repeating: " ", count: 19))\(formatNumber(CanonCinemaSpeed))")
            Text("")
            Text("数据码率[MBps]：\(String(repeating: " ", count: 19))\(formatNumber(CanonCinemaSpeed / 8))")
            Text("")
            Text("每小时数据占盘量[GB]:\(String(repeating: " ", count: 12))\(formatNumber(CanonCinemaSpeed * 450 / 1024))")
        }
        else if cameradata.BrandName == "#General" {
            let GeneralSpeed = GeneralSpeed(cameradata:cameradata)
            Text("")
            Text("可录制时长[Min]:\(String(repeating: " ", count: 21))\(formatNumber(capacity * 2048 / 15 / GeneralSpeed))")
            Text("")
            Text("数据码率[mbps]：\(String(repeating: " ", count: 19))\(formatNumber(GeneralSpeed))")
            Text("")
            Text("数据码率[MBps]：\(String(repeating: " ", count: 19))\(formatNumber(GeneralSpeed / 8))")
            Text("")
            Text("每小时数据占盘量[GB]:\(String(repeating: " ", count: 12))\(formatNumber(GeneralSpeed * 450 / 1024))")
            if cameradata.Codec.contains("ARRIRAW") {
                Text("")
                Text("每小时数据占盘量[GB][HDE]:\(String(repeating: " ", count: 2))\(formatNumber(CodecSpeedCount(cameradata: cameradata) * resolutionMultiplier * rateMultiplier * rateMultiplier * 270 / 1024))")
            }
        }
        else {
            Text("")
            Text("可录制时长[Min]:\(String(repeating: " ", count: 21))\(formatNumber(capacity * 2048 / 15 / codecSpeed / resolutionMultiplier / rateMultiplier))")
            Text("")
            Text("数据码率[mbps]：\(String(repeating: " ", count: 19))\(formatNumber(codecSpeed * resolutionMultiplier * rateMultiplier))")
            Text("")
            Text("数据码率[MBps]：\(String(repeating: " ", count: 19))\(formatNumber(codecSpeed * resolutionMultiplier * rateMultiplier / 8))")
            Text("")
            Text("每小时数据占盘量[GB]:\(String(repeating: " ", count: 12))\(formatNumber(codecSpeed * resolutionMultiplier * rateMultiplier * 450 / 1024))")
            if cameradata.Codec == "ARRIRAW" {
                Text("")
                Text("每小时数据占盘量[GB][HDE]:\(String(repeating: " ", count: 2))\(formatNumber(CodecSpeedCount(cameradata: cameradata) * resolutionMultiplier * rateMultiplier * rateMultiplier * 270 / 1024))")
            }
        }
    }
    .padding([.leading, .trailing], 30)
}
