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
            Text("1. 此版本[V1.2.8]仅包含《数据计算器》功能。摄影集规格参数数据截止至2024.6.23。计算结果仅供参考，实际数据量可能与计算不同。")
                .font(.system(size: 10))
                .padding(.leading,10)
                .frame(maxWidth: .infinity,alignment:.leading)
            
            if cameradata.BrandName == "ARRI" {
                Text("2. 默认宽高比为16:9；FHD指分辨率1920x1080；UHD指分辨率3840x2160。部分录制规格根据机型不同可能需要额外激活授权。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("3. ARRIRAW为ARRI开发的12bit非线性RAW编码（对于ALEXA 35摄影机，为13bit）。HDE为ARRI公司开发的RAW压缩技术，用于ARRIRAW的无损压缩。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("4. Prores为Apple开发的帧内压缩编码；对于ALEXA 35摄影机，Prores编码色彩深度均为12bit。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
            }
            else if cameradata.BrandName == "Apple" {
                Text("2. 默认宽高比为16:9；HD指分辨率1280x720；FHD指分辨率1920x1080；UHD指分辨率3840x2160。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("3. Prores为Apple开发的帧内压缩编码。iPhone系列机型视频录制采用可变帧速率（VFR），实际帧速率可能与拍摄选择帧速率不同。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("4. 相机应用录制的Prores规格为Prores 422 HQ；根据机型不同，在内录Prores视频时对分辨率与帧率有所限制，使用第三方录制软件以绕过限制。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
            }
            else if cameradata.BrandName == "Blackmagicdesign" {
                Text("2. FHD指分辨率1920x1080，UHD指分辨率3840x2160。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("3. Blackmagic RAW为Blackmagicdesign开发的12bit非线性压缩RAW编码，具有不同的压缩比；Prores为Apple开发的帧内压缩编码。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("4. 在使用Dual CFast2.0存储卡时，摄影机将两帧画面分别存储在两张CFast2.0存储卡上，需要使用Blackmagicdesign公司推出的Davinci Resolve软件读取与编辑。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
            }
            else if cameradata.BrandName == "Canon" {
                Text("2. 默认宽高比为16:9，DCI标准的宽高比为17:9。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("3. DCI 4K指分辨率为4096x2160，DCI 2K指分辨率为2048x1080；FHD指分辨率1920x1080；UHD指分辨率3840x2160。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("4. 选项中的RAW编码为Canon开发的12bit非线性压缩RAW编码；ALL-I指帧内压缩；IPB指帧间压缩。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
            }
            else if cameradata.BrandName == "Canon Cinema" {
                Text("2. DCI 4K指分辨率为4096x2160，DCI 2K指分辨率为2048x1080；FHD指分辨率1920x1080；UHD指分辨率3840x2160。")
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
                Text("2. DCI 4K指分辨率为4096x2160，DCI 2K指分辨率为2048x1080；FHD指分辨率1920x1080；UHD指分辨率3840x2160。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("3. Prores RAW HQ为Apple开发的12bit非线性压缩RAW编码，部分机型可能需要激活授权；Prores为Apple开发的帧内压缩编码；CinemaDNG为ADOBE开发的无损压缩RAW编码。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("4. DJI PROSSD为DJI开发的用于Ronin 4D与Inspire3机型的记录硬件，具有10Gbps速度，使用USB-C接口与机身连接。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
            }
            else if cameradata.BrandName == "Panasonic" {
                Text("2. 默认宽高比为16:9，DCI 4K指分辨率为4096x2160；DCI 2K指分辨率为2048x1080；FHD指分辨率1920x1080；UHD指分辨率3840x2160。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("3. Prores RAW为Apple开发的12bit非线性压缩RAW编码；Prores为Apple开发的帧内压缩编码；ALL-I指帧内压缩；IPB指帧间压缩。部分格式可能需要激活授权。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("4. 幅面选项中的Full Frame、APS-C、M43指该格式传感器使用宽度约为全画幅、APS-C画幅、Micro 4/3画幅大小。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
            }
            else if cameradata.BrandName == "RED" {
                Text("2. 默认宽高比为16:9，FHD指分辨率1920x1080；UHD指分辨率3840x2160。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("3. REDCODE为RED开发的16bit压缩RAW编码，具有不同的压缩比；Prores为Apple开发的帧内压缩编码。")
                    .font(.system(size: 10))
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("4. VV画幅指VistaVision画幅。")
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
                Text("5. 特别鸣谢 徐理航 对于此程序的代码设计支持。特别鸣谢 郑昊 对于此程序的图标设计支持。Taurus软件作者 吴坤城 ，合作或联系可加微信：15814854313 。")
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

