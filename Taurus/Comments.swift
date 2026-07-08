//
//  Comments.swift
//  Taurus
//
//  Created by 吴坤城 on 3/25/24.
//

import Foundation
import SwiftUI


func Comments(cameradata:CameraData) -> some View {
    ZStack {
        RoundedRectangle(cornerRadius: 5)
            .foregroundColor(Color.gray)
            .frame(maxHeight: 110)
        VStack (spacing: 1) {
            Text("版本说明与备注")
                .font(.title3)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity,alignment:.center)
            Text(" ")
                .font(.system(size: 1))
            Text("1. 此版本[V1.3.5]仅包含《数据计算器》功能。摄影机规格参数数据截止至2026.07.06。计算结果仅供参考，实际数据量可能与计算不同。")
                .font(.system(size: 10))
                .padding(.leading,10)
                .frame(maxWidth: .infinity,alignment:.leading)
            
            if cameradata.BrandName == "ARRI" {
                if cameradata.CameraName == "ALEXA 35 Xtreme" || cameradata.CameraName == "ALEXA 35 Live Xtreme" {
                    Text("2. 默认宽高比为16:9；FHD指分辨率1920x1080；UHD指分辨率3840x2160；部分录制规格根据机型不同可能需要额外激活授权。")
                        .font(.system(size: 10))
                        .padding(.leading,10)
                        .frame(maxWidth: .infinity,alignment:.leading)
                    Text("3. ARRIRAW为ARRI开发的12bit非线性RAW编码（对于ALEXA 35摄影机，为13bit）；HDE为ARRI公司开发的RAW压缩技术，用于ARRIRAW的无损压缩。")
                        .font(.system(size: 10))
                        .padding(.leading,10)
                        .frame(maxWidth: .infinity,alignment:.leading)
                    Text("4. ProRes为Apple开发的帧内压缩编码；ARRICORE为ARRI开发的13bit帧内压缩编码。")
                        .font(.system(size: 10))
                        .padding(.leading,10)
                        .frame(maxWidth: .infinity,alignment:.leading)
                }
                else {
                    Text("2. 默认宽高比为16:9；FHD指分辨率1920x1080；UHD指分辨率3840x2160；部分录制规格根据机型不同可能需要额外激活授权。")
                        .font(.system(size: 10))
                        .padding(.leading,10)
                        .frame(maxWidth: .infinity,alignment:.leading)
                    Text("3. ARRIRAW为ARRI开发的12bit非线性RAW编码（对于ALEXA 35摄影机，为13bit）；HDE为ARRI公司开发的RAW压缩技术，用于ARRIRAW的无损压缩。")
                        .font(.system(size: 10))
                        .padding(.leading,10)
                        .frame(maxWidth: .infinity,alignment:.leading)
                    Text("4. ProRes为Apple开发的10bit帧内压缩编码（对于ALEXA 35摄影机，为12bit）。")
                        .font(.system(size: 10))
                        .padding(.leading,10)
                        .frame(maxWidth: .infinity,alignment:.leading)
                }
            }
            else if cameradata.BrandName == "Apple" {
                Text("2. 默认宽高比为16:9；HD指分辨率1280x720；FHD指分辨率1920x1080；UHD指分辨率3840x2160。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("3. ProRes为Apple开发的帧内压缩编码；iPhone系列机型视频录制采用可变帧速率（VFR），实际帧速率可能与拍摄选择帧速率不同；仅有主摄支持120fps录制。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("4. 相机应用录制的ProRes规格为ProRes 422 HQ；根据机型不同，在内录ProRes视频时对分辨率与帧率有所限制，使用第三方录制软件以绕过限制。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
            }
            else if cameradata.BrandName == "Blackmagicdesign" {
                Text("2. FHD指分辨率1920x1080；UHD指分辨率3840x2160。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("3. Blackmagic RAW为Blackmagicdesign开发的12bit非线性压缩RAW编码，具有不同的压缩比；ProRes为Apple开发的帧内压缩编码。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("4. 在使用Dual CFast2.0存储卡时，摄影机将两帧画面分别存储在两张CFast2.0存储卡上，需要使用Blackmagicdesign公司推出的Davinci Resolve软件读取与编辑。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
            }
            else if cameradata.BrandName == "Canon" {
                Text("2. 默认宽高比为16:9；DCI标准的宽高比为17:9。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("3. DCI 4K指分辨率为4096x2160；DCI 2K指分辨率为2048x1080；FHD指分辨率1920x1080；UHD指分辨率3840x2160。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("4. 选项中的RAW编码为Canon开发的12bit非线性压缩RAW编码；ALL-I指帧内压缩；IPB指帧间压缩。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
            }
            else if cameradata.BrandName == "Canon Cinema" {
                Text("2. DCI 4K指分辨率为4096x2160；DCI 2K指分辨率为2048x1080；FHD指分辨率1920x1080；UHD指分辨率3840x2160。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("3. Cinema RAW Light编码为Canon开发的10bit/12bit非线性压缩RAW编码，具有不同的压缩比。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("4. XF-AVC为Canon基于H.264编码开发的录制编码；Intra指帧内压缩；LongGOP指帧间压缩。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
            }
            else if cameradata.BrandName == "DJI" {
                Text("2. DCI 4K指分辨率为4096x2160；DCI 2K指分辨率为2048x1080；FHD指分辨率1920x1080；UHD指分辨率3840x2160。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("3. ProRes RAW HQ为Apple开发的12bit非线性压缩RAW编码，部分机型可能需要激活授权；ProRes为Apple开发的帧内压缩编码；CinemaDNG为ADOBE开发的无损压缩RAW编码。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("4. DJI PROSSD为DJI开发的用于Ronin 4D与Inspire3机型的记录硬件，具有10Gbps速度，使用USB-C接口与机身连接。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
            }
            else if cameradata.BrandName == "Panasonic" {
                Text("2. 默认宽高比为16:9；DCI 4K指分辨率为4096x2160；DCI 2K指分辨率为2048x1080；FHD指分辨率1920x1080；UHD指分辨率3840x2160。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("3. ProRes RAW为Apple开发的12bit非线性压缩RAW编码；ProRes为Apple开发的帧内压缩编码；ALL-I指帧内压缩；IPB指帧间压缩；部分格式可能需要激活授权。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("4. 幅面选项中的Full Frame、APS-C、M43指该格式传感器使用宽度约为全画幅、APS-C画幅、Micro 4/3画幅大小。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
            }
            else if cameradata.BrandName == "RED" {
                Text("2. 默认宽高比为16:9；FHD指分辨率1920x1080；UHD指分辨率3840x2160。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("3. REDCODE为RED开发的16bit压缩RAW编码，具有不同的压缩比；ProRes为Apple开发的帧内压缩编码。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("4. VV画幅指VistaVision大小，17:9比例的大画幅。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
            }
            else if cameradata.BrandName == "SONY" {
                Text("2. 对于未表明分辨率的情况：8K指分辨率为7680x4320（8K UHD）；DCI 4K指分辨率为4096x2160；FHD指分辨率1920x1080；UHD指分辨率3840x2160。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("3. X-OCN为SONY开发的16bit压缩RAW编码，具有不同的压缩比；ALL-I指帧内压缩；IPB指帧间压缩。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("4. XAVC S、XAVC HS为SONY开发的分别基于H.264、H.265编码开发的帧间压缩格式；XAVC S-I为索尼开发的基于H264编码的帧间压缩格式。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
            }
            else if cameradata.BrandName == "Kinefinity" {
                Text("2. Kinefinity先按幅面过滤分辨率；FF、S35、M43、S16、Pixel to Pixel为Format选项，Pixel to Pixel表示官方Other/Crop裁切模式。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("3. Kinefinity分辨率标签按“大体分辨率[具体分辨率][比例/OG][From 8K/6K/4K]”标注；幅面不再重复显示在分辨率中。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("4. ProRes为Apple开发的帧内压缩编码；CinemaDNG仅显示KineOS 8.0支持的机内RAW(DNG)分辨率，并按12bit未压缩RAW像素量估算码率；VISTA的H.265按官方4K 25fps基准码率随像素和帧率换算。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("5. 帧率选项包含常用档位和该分辨率的最高帧率；KineMAG Nano SSD按1TB≈931GiB、2TB≈1862GiB计算，VISTA内置220GB SSD按约204.82GiB计算。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
            }
            else if cameradata.BrandName == "[General]" {
                Text("2. 选择Manual Codec和Manual Resolution模式来自定义编码速度和分辨率。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("3. ARRIRAW为ARRI开发的RAW编码；ProRes RAW为Apple开发的压缩RAW编码；ProRes为Apple开发的帧内压缩编码；HDE用于ARRIRAW的无损压缩。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("4. X-OCN为SONY开发的16bit压缩RAW编码，具有不同的压缩比；REDCODE为RED开发的16bit压缩RAW编码，具有不同的压缩比。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
            }
            else {
                Text("2. 默认宽高比为16:9，DCI标准的宽高比为17:9；HD指分辨率为1280x720；FHD指分辨率1920x1080；UHD指分辨率3840x2160。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("3. 对于未表明分辨率的情况：8K指分辨率为7680x4320（8K UHD）；DCI 4K指分辨率为4096x2160；DCI 2K指分辨率为2048x1080；")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("4. 数据来源于各大厂商官方网站与开发者收集，部分录制规格可能需要额外激活授权才可使用。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
            }
                Text("5. GitHub 仓库：**github.com/LexTheAries2209/Taurus**。代码、版本说明、发布包与问题反馈均在仓库维护，欢迎通过 Issue 或 Pull Request 参与改进。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
            Spacer()
        }
        .frame(maxHeight: 110)
        .padding([.top,.trailing],8)
    }
    .padding(.top, 31.0)
    .padding([.leading,.trailing,.bottom],10)
}
