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
            Text("1. 此版本[V1.2.6]仅包含《数据计算器》功能。计算结果仅供参考，实际数据量可能与计算不同。")
                .font(.system(size: 10))
                .padding(.leading,10)
                .frame(maxWidth: .infinity,alignment:.leading)
            Text("2. 默认宽高比为16:9；DCI标准的宽高比为17:9；FHD指分辨率1920x1080，UHD指分辨率3840x2160。")
                .font(.system(size: 10))
                .padding(.leading,10)
                .frame(maxWidth: .infinity,alignment:.leading)
            Text("3. 对于没有标出分辨率的情况：8K指分辨率7680x4320(8K UHD)，DCI 4K分辨率为4096x2160，DCI 8K分辨率为8192x4320。")
                .font(.system(size: 10))
                .padding(.leading,10)
                .frame(maxWidth: .infinity,alignment:.leading)
            Text("4. HDE为ARRI公司推出的RAW压缩技术，用于ARRIRAW的无损压缩。REDCODE为RED公司推出的压缩RAW编码。PRORES为Apple公司开发的帧内压缩编码。")
                .font(.system(size: 10))
                .padding(.leading,10)
                .frame(maxWidth: .infinity,alignment:.leading)
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

