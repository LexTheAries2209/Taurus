//
//  ContentView.swift
//  Taurus
//
//  Created by 吴坤城 on 7/25/23.
//

import SwiftUI
import Foundation
import Combine

class CameraData: ObservableObject {
    
    @Published var BrandName = "请选择品牌"
    @Published var CameraName = "请选择机型"
    @Published var Codec = "请选择编码"
    @Published var Resolution = "请选择分辨率"
    @Published var Media = "请选择储存卡"
    @Published var Rate = "请选择帧率"
    @Published var Format = "请选择幅面"
}

struct ContentView: View {
    
    @StateObject var cameradata = CameraData()

    var body: some View {
        
        VStack {
            
            //主功能选择
            TabView {
                
                //数据计算器模块//
                VStack{
                    
                    Spacer()
                    
                    //重置按键
                    Button("重置") {
                        cameradata.BrandName = "请选择品牌"
                        cameradata.CameraName = "请选择机型"
                        cameradata.Codec = "请选择编码"
                        cameradata.Resolution = "请选择分辨率"
                        cameradata.Media = "请选择储存卡"
                        cameradata.Rate = "请选择帧率"
                        cameradata.Format = "请选择幅面"
                    }
                    
                    
                    Spacer()
                    
                    //选择器与计算功能
                    HStack{
                        
                        //选择器模块
                        VStack (spacing:10){
                            
                            
                            //品牌选择
                            Picker(selection: $cameradata.BrandName, label: Text("请选择品牌").frame(width: 100,alignment: .center)) {
                                ForEach(CameraModel.keys.sorted(),id:\.self) { brand in
                                    Text(brand).tag(brand)
                                }
                            }
                            
                            //机型选择
                            if let models = CameraModel[cameradata.BrandName] {
                                Picker(selection: $cameradata.CameraName, label: Text("请选择机型").frame(width: 100,alignment: .center)) {
                                    ForEach(models, id:\.self) { model in
                                        Text(model).tag(model)
                                    }
                                }
                            }
                            else {
                                Picker(selection: $cameradata.CameraName, label:Text("请选择机型").frame(width: 100,alignment: .center)) {
                                    Text("无选项")
                                }
                            }
                            
                            //编码选择
                            if let codec = CodecName[cameradata.CameraName] {
                                Picker(selection: $cameradata.Codec, label: Text("请选择编码").frame(width: 100,alignment: .center)) {
                                        ForEach(codec, id:\.self) { codecs in
                                            Text(codecs).tag(codecs)
                                        }
                                    }
                                }
                                else {
                                    Picker(selection: $cameradata.Codec, label:Text("请选择编码").frame(width: 100,alignment: .center)) {
                                        Text("无选项")
                                    }
                                }
                            
                            //幅面选择
                            if cameradata.BrandName == "Panasonic" {
                                if PanaFormat(cameradata: cameradata) != [""] {
                                    Picker(selection: $cameradata.Format, label: Text("请选择幅面").frame(width: 100,alignment: .center)) {
                                        ForEach(PanaFormat(cameradata: cameradata), id:\.self) { formats in
                                            Text(formats).tag(formats)
                                        }
                                    }
                                }
                                else {
                                    Picker(selection: $cameradata.Format, label:Text("请选择幅面").frame(width: 100,alignment: .center)) {
                                        Text("无选项")
                                    }
                                }
                            }
                            
                            //分辨率选择
                            @State var CodecAndCamera = cameradata.CameraName + "_" + cameradata.Codec
                            if cameradata.BrandName == "SONY" || cameradata.BrandName == "Canon" {
                                if let resolutions = ResolutionName[CodecAndCamera] {
                                    Picker(selection: $cameradata.Resolution, label: Text("请选择格式").frame(width: 100,alignment: .center)) {
                                        ForEach(resolutions,id:\.self) { resolution in
                                            Text(resolution).tag(resolution)
                                        }
                                    }
                                }
                                else {
                                    Picker(selection: $cameradata.Resolution, label:Text("请选择格式").frame(width: 100,alignment: .center)) {
                                        Text("无选项")
                                    }
                                }
                            }
                            else if cameradata.BrandName == "Panasonic" {
                                if PanaResolution(cameradata: cameradata) != [""] {
                                    Picker(selection: $cameradata.Resolution, label: Text("请选择格式").frame(width: 100,alignment: .center)) {
                                        ForEach(PanaResolution(cameradata: cameradata),id:\.self) { resolution in
                                            Text(resolution).tag(resolution)
                                        }
                                    }
                                }
                                else {
                                    Picker(selection: $cameradata.Resolution, label:Text("请选择格式").frame(width: 100,alignment: .center)) {
                                        Text("无选项")
                                    }
                                }
                            }
                            else if let resolutions = ResolutionName[CodecAndCamera] {
                                Picker(selection: $cameradata.Resolution, label: Text("请选择分辨率").frame(width: 100,alignment: .center)) {
                                    ForEach(resolutions,id:\.self) { resolution in
                                        Text(resolution).tag(resolution)
                                    }
                                }
                            }
                            else {
                                Picker(selection: $cameradata.Resolution, label:Text("请选择分辨率").frame(width: 100,alignment: .center)) {
                                    Text("无选项")
                                }
                            }
                            
                            //储存卡选择
                            if cameradata.BrandName == "Canon" {
                                if CanonMedia(cameradata: cameradata) != [""] {
                                    Picker(selection: $cameradata.Media, label: Text("请选择储存卡").frame(width: 100,alignment: .center)) {
                                        ForEach(CanonMedia(cameradata:cameradata),id:\.self) { media in
                                            Text(media).tag(media)
                                        }
                                    }
                                }
                                else {
                                    Picker(selection: $cameradata.Media, label:Text("请选择储存卡").frame(width: 100,alignment: .center)) {
                                        Text("无选项")
                                    }
                                }
                            }
                            
                            if cameradata.BrandName == "SONY" {
                                if SonyMedia(cameradata: cameradata) != [""] {
                                    Picker(selection: $cameradata.Media, label: Text("请选择储存卡").frame(width: 100,alignment: .center)) {
                                        ForEach(SonyMedia(cameradata:cameradata),id:\.self) { media in
                                            Text(media).tag(media)
                                        }
                                    }
                                }
                                else {
                                    Picker(selection: $cameradata.Media, label:Text("请选择储存卡").frame(width: 100,alignment: .center)) {
                                        Text("无选项")
                                    }
                                }
                            }
                            
                            if cameradata.BrandName == "Panasonic" {
                                if PanaMedia(cameradata: cameradata) != [""] {
                                    Picker(selection: $cameradata.Media, label: Text("请选择储存卡").frame(width: 100,alignment: .center)) {
                                        ForEach(PanaMedia(cameradata:cameradata),id:\.self) { media in
                                            Text(media).tag(media)
                                        }
                                    }
                                }
                                else {
                                    Picker(selection: $cameradata.Media, label:Text("请选择储存卡").frame(width: 100,alignment: .center)) {
                                        Text("无选项")
                                    }
                                }
                            }
                            
                            if cameradata.BrandName != "Canon" && cameradata.BrandName != "SONY" && cameradata.BrandName != "Panasonic" {
                                if let medias = MediaName[cameradata.CameraName] {
                                    Picker(selection: $cameradata.Media, label: Text("请选择储存卡").frame(width: 100,alignment: .center)) {
                                        ForEach(medias,id:\.self) { media in
                                            Text(media).tag(media)
                                        }
                                    }
                                }
                                else {
                                    Picker(selection: $cameradata.Media, label:Text("请选择储存卡").frame(width: 100,alignment: .center)) {
                                        Text("无选项")
                                    }
                                }
                            }
                            
                            //帧率选择
                            if cameradata.BrandName == "ARRI" || cameradata.BrandName == "RED" {
                                if cameradata.Media == "请选择储存卡" {
                                    Picker(selection: $cameradata.Rate, label:Text("请选择帧率").frame(width: 100,alignment: .center)) {
                                        Text("无选项")
                                    }
                                }
                                else {
                                    Picker(selection: $cameradata.Rate, label: Text("请选择帧率").frame(width: 100,alignment: .center)) {
                                        ForEach(availableRates(cameradata:cameradata),id:\.self) { rate in
                                            Text(rate).tag(rate)
                                        }
                                    }
                                }
                            }
                        }
                        .padding(.top, 20.0)
                        Spacer()
                        
                        
                        //计算数据输出区
                        VStack(alignment: .center){
                            if cameradata.BrandName == "SONY"{
                                Text("可录制时长[Min]：\(MediaCapacity(cameradata:cameradata)*7629.39453125/60/SonyCodecSpeed(cameradata:cameradata))")
                                Text("数据码率[mbps]: \(SonyCodecSpeed(cameradata:cameradata))")
                                Text("每小时数据占盘量[GB]：\(SonyCodecSpeed(cameradata:cameradata)*450/1024)")
                            }
                            else if cameradata.BrandName == "Canon" {
                                Text("可录制时长[Min]：\(MediaCapacity(cameradata:cameradata)*7629.39453125/60/CanonCodecSpeed(cameradata:cameradata))")
                                Text("数据码率[mbps]: \(CanonCodecSpeed(cameradata:cameradata))")
                                Text("每小时数据占盘量[GB]：\(CanonCodecSpeed(cameradata:cameradata)*450/1024)")
                            }
                            else if cameradata.BrandName == "Panasonic" {
                                Text("可录制时长[Min]：\(MediaCapacity(cameradata:cameradata)*7629.39453125/60/PanaCodecSpeed(cameradata:cameradata))")
                                Text("数据码率[mbps]: \(PanaCodecSpeed(cameradata:cameradata))")
                                Text("每小时数据占盘量[GB]：\(PanaCodecSpeed(cameradata:cameradata)*450/1024)")
                            }
                            else {
                                Text("可录制时长[Min]：\(MediaCapacity(cameradata:cameradata)*7629.39453125/60/CodecSpeedCount(cameradata:cameradata)/ResolutionMultiplier(cameradata:cameradata)/RateMultiplier(cameradata:cameradata))")
                                Text("数据码率[mbps]: \(CodecSpeedCount(cameradata:cameradata)*ResolutionMultiplier(cameradata:cameradata)*RateMultiplier(cameradata:cameradata))")
                                Text("每小时数据占盘量[GB]：\(CodecSpeedCount(cameradata:cameradata)*ResolutionMultiplier(cameradata:cameradata)*RateMultiplier(cameradata:cameradata)*450/1024)")
                                if cameradata.Codec == "ARRIRAW" {
                                    Text("每小时数据占盘量[GB][HDE]：\(Codecspeed(cameradata:cameradata)*ResolutionMultiplier(cameradata:cameradata)*RateMultiplier(cameradata:cameradata)*RateMultiplier(cameradata:cameradata)*270/1024)")
                            }
                            }
                        }
                        .padding([.leading,.trailing],30)
        
                    }
                    Spacer()
                    
                    //备注与说明区
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
                                        Text("1. 此版本[V1.1.7]仅包含《数据计算器》功能。根据画面内容，实际数据量可能与计算不同。")
                                            .font(.system(size: 10))
                                            .padding(.leading,10)
                                            .frame(maxWidth: .infinity,alignment:.leading)
                                        Text("2. 分辨率默认宽高比为16:9；DCI标准宽高比为17:9；FHD指分辨率1920x1080，UHD指分辨率3840x2160。")
                                            .font(.system(size: 10))
                                            .padding(.leading,10)
                                            .frame(maxWidth: .infinity,alignment:.leading)
                                        Text("3. 对于没有标出分辨率的情况：8K指分辨率7680x4320(8K UHD)，DCI 4K分辨率为4096x2160，DCI 8K分辨率为8192x4320。")
                                            .font(.system(size: 10))
                                            .padding(.leading,10)
                                            .frame(maxWidth: .infinity,alignment:.leading)
                                        Text("4. HDE为ARRI公司推出的压缩技术，用于ARRIRAW的无损压缩。REDCODE为RED公司推出的压缩RAW技术。")
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
                
                
                //主功能选择区
                    .tabItem {
                        Text("数据计算器")
                    }
                
//                //其他功能模块
//                Text("还没做出功能的阵列配置台")
//                    .tabItem {
//                        Text("阵列配置台")
//                    }
//
//                Text("还没做出功能的录制格式速查")
//                    .tabItem {
//                        Text("录制格式速查")
//                    }
//
//                Text("还没做出功能的像场覆盖图")
//                    .tabItem {
//                        Text("像场覆盖图")
//                    }
            }
            .frame(minWidth:800,minHeight: 425)
            .frame(maxWidth:800,maxHeight: 425)
            
        }
        .padding()
    }

    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
    
}
