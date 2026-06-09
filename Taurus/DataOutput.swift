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
        let GeneralSpeed = GeneralSpeed(cameradata: cameradata)
        
        if cameradata.BrandName == "SONY" && !cameradata.CameraName.contains("CineAlta") {
            let sonySpeed = SonyCodecSpeed(cameradata: cameradata)
            Text("")
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("可录制时长[Min]:")
                    Text("数据码率[mbps]:")
                    Text("数据码率[MBps]:")
                    Text("每小时数据占盘量[GB]:")
                }
                .padding(.trailing, 100)
                VStack(alignment: .trailing, spacing: 10) {
                    Text("\(formatNumber(capacity * 2048 / 15 / sonySpeed))")
                    Text("\(formatNumber(sonySpeed))")
                    Text("\(formatNumber(sonySpeed / 8))")
                    Text("\(formatNumber(sonySpeed * 450 / 1024))")
                }
            }
        }
        else if cameradata.BrandName == "Canon" {
            let canonSpeed = CanonCodecSpeed(cameradata: cameradata)
            Text("")
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("可录制时长[Min]:")
                    Text("数据码率[mbps]:")
                    Text("数据码率[MBps]:")
                    Text("每小时数据占盘量[GB]:")
                }
                .padding(.trailing, 100)
                VStack(alignment: .trailing, spacing: 10) {
                    Text("\(formatNumber(capacity * 2048 / 15 / canonSpeed))")
                    Text("\(formatNumber(canonSpeed))")
                    Text("\(formatNumber(canonSpeed / 8))")
                    Text("\(formatNumber(canonSpeed * 450 / 1024))")
                }
            }
        }
        else if cameradata.BrandName == "Panasonic" {
            let panaSpeed = PanaCodecSpeed(cameradata: cameradata)
            Text("")
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("可录制时长[Min]:")
                    Text("数据码率[mbps]:")
                    Text("数据码率[MBps]:")
                    Text("每小时数据占盘量[GB]:")
                }
                .padding(.trailing, 100)
                VStack(alignment: .trailing, spacing: 10) {
                    Text("\(formatNumber(capacity * 2048 / 15 / panaSpeed))")
                    Text("\(formatNumber(panaSpeed))")
                    Text("\(formatNumber(panaSpeed / 8))")
                    Text("\(formatNumber(panaSpeed * 450 / 1024))")
                }
            }
        }
        else if cameradata.BrandName == "Fujifilm" {
            let fujiSpeed = FujiCodecSpeed(cameradata: cameradata)
            Text("")
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("可录制时长[Min]:")
                    Text("数据码率[mbps]:")
                    Text("数据码率[MBps]:")
                    Text("每小时数据占盘量[GB]:")
                }
                .padding(.trailing, 100)
                VStack(alignment: .trailing, spacing: 10) {
                    Text("\(formatNumber(capacity * 2048 / 15 / fujiSpeed))")
                    Text("\(formatNumber(fujiSpeed))")
                    Text("\(formatNumber(fujiSpeed / 8))")
                    Text("\(formatNumber(fujiSpeed * 450 / 1024))")
                }
            }
        }
        else if cameradata.BrandName == "Blackmagicdesign" {
            let BMDSpeed = BMDCodecSpeedmbps(cameradata: cameradata)
            Text("")
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("可录制时长[Min]:")
                    Text("数据码率[mbps]:")
                    Text("数据码率[MBps]:")
                    Text("每小时数据占盘量[GB]:")
                }
                .padding(.trailing, 100)
                VStack(alignment: .trailing, spacing: 10) {
                    Text("\(formatNumber(capacity * 2048 / 15 / BMDSpeed))")
                    Text("\(formatNumber(BMDSpeed))")
                    Text("\(formatNumber(BMDSpeed / 8))")
                    Text("\(formatNumber(BMDSpeed * 450 / 1024))")
                }
            }
        }
        else if cameradata.BrandName == "Canon Cinema" {
            let CanonCinemaSpeed = CanonCinemaCodecSpeed(cameradata: cameradata)
            Text("")
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("可录制时长[Min]:")
                    Text("数据码率[mbps]:")
                    Text("数据码率[MBps]:")
                    Text("每小时数据占盘量[GB]:")
                }
                .padding(.trailing, 100)
                VStack(alignment: .trailing, spacing: 10) {
                    Text("\(formatNumber(capacity * 2048 / 15 / CanonCinemaSpeed))")
                    Text("\(formatNumber(CanonCinemaSpeed))")
                    Text("\(formatNumber(CanonCinemaSpeed / 8))")
                    Text("\(formatNumber(CanonCinemaSpeed * 450 / 1024))")
                }
            }
        }
        else if cameradata.BrandName == "Kinefinity" {
            let kinefinitySpeed = KinefinityCodecSpeed(cameradata: cameradata)
            Text("")
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("可录制时长[Min]:")
                    Text("数据码率[mbps]:")
                    Text("数据码率[MBps]:")
                    Text("每小时数据占盘量[GB]:")
                }
                .padding(.trailing, 100)
                VStack(alignment: .trailing, spacing: 10) {
                    Text("\(formatNumber(capacity * 2048 / 15 / kinefinitySpeed))")
                    Text("\(formatNumber(kinefinitySpeed))")
                    Text("\(formatNumber(kinefinitySpeed / 8))")
                    Text("\(formatNumber(kinefinitySpeed * 450 / 1024))")
                }
            }
        }
        else if cameradata.BrandName == "Nikon" {
            let nikonSpeed = NikonCodecSpeed(cameradata: cameradata)
            Text("")
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("可录制时长[Min]:")
                    Text("数据码率[mbps]:")
                    Text("数据码率[MBps]:")
                    Text("每小时数据占盘量[GB]:")
                }
                .padding(.trailing, 100)
                VStack(alignment: .trailing, spacing: 10) {
                    Text("\(formatNumber(capacity * 2048 / 15 / nikonSpeed))")
                    Text("\(formatNumber(nikonSpeed))")
                    Text("\(formatNumber(nikonSpeed / 8))")
                    Text("\(formatNumber(nikonSpeed * 450 / 1024))")
                }
            }
        }
        else if cameradata.BrandName == "[General]" {
                if cameradata.Codec.contains("ARRIRAW") {
                    Text("")
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("可录制时长[Min]:")
                            Text("数据码率[mbps]:")
                            Text("数据码率[MBps]:")
                            Text("每小时数据占盘量[GB]:")
                            Text("每小时数据占盘量[GB][HDE]:")
                        }
                        .padding(.trailing, 60)
                        VStack(alignment: .trailing, spacing: 10) {
                            Text("\(formatNumber(capacity * 2048 / 15 / GeneralSpeed))")
                            Text("\(formatNumber(GeneralSpeed))")
                            Text("\(formatNumber(GeneralSpeed / 8))")
                            Text("\(formatNumber(GeneralSpeed * 450 / 1024))")
                            Text("\(formatNumber(GeneralSpeed * 270 / 1024))")
                        }
                    }
                }
                else {
                    Text("")
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("可录制时长[Min]:")
                            Text("数据码率[mbps]:")
                            Text("数据码率[MBps]:")
                            Text("每小时数据占盘量[GB]:")
                        }
                        .padding(.trailing, 100)
                        VStack(alignment: .trailing, spacing: 10) {
                            Text("\(formatNumber(capacity * 2048 / 15 / GeneralSpeed))")
                            Text("\(formatNumber(GeneralSpeed))")
                            Text("\(formatNumber(GeneralSpeed / 8))")
                            Text("\(formatNumber(GeneralSpeed * 450 / 1024))")
                        }
                    }
                }
            }
        else {
            if cameradata.Codec.contains("ARRIRAW") {
                Text("")
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("可录制时长[Min]:")
                        Text("数据码率[mbps]:")
                        Text("数据码率[MBps]:")
                        Text("每小时数据占盘量[GB]:")
                        Text("每小时数据占盘量[GB][HDE]:")
                    }
                    .padding(.trailing, 60)
                    VStack(alignment: .trailing, spacing: 10) {
                        Text("\(formatNumber(capacity * 2048 / 15 / codecSpeed / resolutionMultiplier / rateMultiplier))")
                        Text("\(formatNumber(codecSpeed * resolutionMultiplier * rateMultiplier))")
                        Text("\(formatNumber(codecSpeed * resolutionMultiplier * rateMultiplier / 8))")
                        Text("\(formatNumber(codecSpeed * resolutionMultiplier * rateMultiplier * 450 / 1024))")
                        Text("\(formatNumber(codecSpeed * resolutionMultiplier * rateMultiplier * 270 / 1024))")
                    }
                }
            }
            else {Text("")
                HStack(alignment: .top) {
                    if cameradata.Media.contains("Capture Drive") && cameradata.Codec.contains("ProRes") {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("可录制时长[Min]:")
                            Text("数据码率[mbps]:")
                            Text("数据码率[MBps]:")
                            Text("每小时数据占盘量[GB]:")
                        }
                        .padding(.trailing, 100)
                        VStack(alignment: .trailing, spacing: 10) {
                            Text("\(formatNumber(capacity * 2048 / 15 / codecSpeed / resolutionMultiplier / rateMultiplier / 2))")
                            Text("\(formatNumber(codecSpeed * resolutionMultiplier * rateMultiplier))")
                            Text("\(formatNumber(codecSpeed * resolutionMultiplier * rateMultiplier / 8))")
                            Text("\(formatNumber(codecSpeed * resolutionMultiplier * rateMultiplier * 450 / 1024))")
                        }
                    }
                    else {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("可录制时长[Min]:")
                            Text("数据码率[mbps]:")
                            Text("数据码率[MBps]:")
                            Text("每小时数据占盘量[GB]:")
                        }
                        .padding(.trailing, 100)
                        VStack(alignment: .trailing, spacing: 10) {
                            Text("\(formatNumber(capacity * 2048 / 15 / codecSpeed / resolutionMultiplier / rateMultiplier))")
                            Text("\(formatNumber(codecSpeed * resolutionMultiplier * rateMultiplier))")
                            Text("\(formatNumber(codecSpeed * resolutionMultiplier * rateMultiplier / 8))")
                            Text("\(formatNumber(codecSpeed * resolutionMultiplier * rateMultiplier * 450 / 1024))")
                        }
                    }
                }
            }
        }
    }
    .padding([.leading, .trailing], 30)
}
