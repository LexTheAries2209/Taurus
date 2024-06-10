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
                            if cameradata.BrandName == "ARRI" {
                                let resolutions = ARRIResolution(cameradata: cameradata)
                                Picker(selection: $cameradata.Resolution, label: Text("请选择分辨率").frame(width: 100, alignment: .center)) {
                                    ForEach(resolutions, id: \.self) { resolution in
                                        Text(resolution).tag(resolution)
                                    }
                                }
                            }
                            else if cameradata.BrandName == "RED" {
                                let resolutions = REDResolution(cameradata: cameradata)
                                Picker(selection: $cameradata.Resolution, label: Text("请选择分辨率").frame(width: 100, alignment: .center)) {
                                    ForEach(resolutions, id: \.self) { resolution in
                                        Text(resolution).tag(resolution)
                                    }
                                }
                            }
                            else if cameradata.BrandName == "Canon" {
                                let resolutions = CanonResolution(cameradata: cameradata)
                                Picker(selection: $cameradata.Resolution, label: Text("请选择格式").frame(width: 100, alignment: .center)) {
                                    ForEach(resolutions, id: \.self) { resolution in
                                        Text(resolution).tag(resolution)
                                    }
                                }
                            }
                            else if cameradata.BrandName == "Canon Cinema" {
                                let resolutions = CanonCinemaResolution(cameradata: cameradata)
                                Picker(selection: $cameradata.Resolution, label: Text("请选择分辨率").frame(width: 100, alignment: .center)) {
                                    ForEach(resolutions, id: \.self) { resolution in
                                        Text(resolution).tag(resolution)
                                    }
                                }
                            }
                            else if cameradata.BrandName == "Apple" {
                                let resolutions = AppleResolution(cameradata: cameradata)
                                Picker(selection: $cameradata.Resolution, label: Text("请选择格式").frame(width: 100, alignment: .center)) {
                                    ForEach(resolutions, id: \.self) { resolution in
                                        Text(resolution).tag(resolution)
                                    }
                                }
                            }
                            else if cameradata.BrandName == "Blackmagicdesign" {
                                let resolutions = BMDResolution(cameradata: cameradata)
                                Picker(selection: $cameradata.Resolution, label: Text("请选择格式").frame(width: 100, alignment: .center)) {
                                    ForEach(resolutions, id: \.self) { resolution in
                                        Text(resolution).tag(resolution)
                                    }
                                }
                            }
                            else if cameradata.BrandName == "SONY" && !cameradata.CameraName.contains("CineAlta") {
                                let resolutions = SonyResolution(cameradata: cameradata)
                                Picker(selection: $cameradata.Resolution, label: Text("请选择格式").frame(width: 100, alignment: .center)) {
                                    ForEach(resolutions, id: \.self) { resolution in
                                        Text(resolution).tag(resolution)
                                    }
                                }
                            }
                            else if cameradata.CameraName.contains("CineAlta") {
                                let resolutions = SonyResolution(cameradata: cameradata)
                                Picker(selection: $cameradata.Resolution, label: Text("请选择分辨率").frame(width: 100, alignment: .center)) {
                                    ForEach(resolutions, id: \.self) { resolution in
                                        Text(resolution).tag(resolution)
                                    }
                                }
                            }
                            else if cameradata.BrandName == "Panasonic" {
                                Picker(selection: $cameradata.Resolution, label: Text("请选择格式").frame(width: 100,alignment: .center)) {
                                    ForEach(PanaResolution(cameradata: cameradata),id:\.self) { resolution in
                                        Text(resolution).tag(resolution)
                                    }
                                }
                            }
                            
                            else if cameradata.BrandName == "DJI" {
                                if DjiResolution(cameradata: cameradata) != [""] {
                                    Picker(selection: $cameradata.Resolution, label: Text("请选择分辨率").frame(width: 100,alignment: .center)) {
                                        ForEach(DjiResolution(cameradata: cameradata),id:\.self) { resolution in
                                            Text(resolution).tag(resolution)
                                        }
                                    }
                                }
                                else {
                                    Picker(selection: $cameradata.Resolution, label:Text("请选择分辨率").frame(width: 100,alignment: .center)) {
                                        Text("无选项")
                                    }
                                }
                            }
                            else {
                                Picker(selection: $cameradata.Resolution, label:Text("请选择分辨率").frame(width: 100,alignment: .center)) {
                                    Text("无选项")
                                }
                            }
                            
                            // DJI帧率
                            if cameradata.BrandName == "DJI" {
                                if DjiRate(cameradata: cameradata) != [""] {
                                    Picker(selection: $cameradata.Rate, label: Text("请选择帧率").frame(width: 100,alignment: .center)) {
                                        ForEach(DjiRate(cameradata:cameradata),id:\.self) { rate in
                                            Text(rate).tag(rate)
                                        }
                                    }
                                }
                                else {
                                    Picker(selection: $cameradata.Rate, label:Text("请选择帧率").frame(width: 100,alignment: .center)) {
                                        Text("无选项")
                                    }
                                }
                            }
                            
                            //CineAlta帧率
                            if cameradata.CameraName.contains("CineAlta") {
                                if CinealtaRate(cameradata: cameradata) != [""] {
                                    Picker(selection: $cameradata.Rate, label: Text("请选择帧率").frame(width: 100,alignment: .center)) {
                                        ForEach(CinealtaRate(cameradata:cameradata),id:\.self) { rate in
                                            Text(rate).tag(rate)
                                        }
                                    }
                                }
                                else {
                                    Picker(selection: $cameradata.Rate, label:Text("请选择帧率").frame(width: 100,alignment: .center)) {
                                        Text("无选项")
                                    }
                                }
                            }
                            
                            //Canon Cinema帧率
                            if cameradata.BrandName == "Canon Cinema" {
                                if CanonCinemaRate(cameradata: cameradata) != [""] {
                                    Picker(selection: $cameradata.Rate, label: Text("请选择帧率").frame(width: 100,alignment: .center)) {
                                        ForEach(CanonCinemaRate(cameradata:cameradata),id:\.self) { rate in
                                            Text(rate).tag(rate)
                                        }
                                    }
                                }
                                else {
                                    Picker(selection: $cameradata.Rate, label:Text("请选择帧率").frame(width: 100,alignment: .center)) {
                                        Text("无选项")
                                    }
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
                            
                            if cameradata.BrandName == "DJI" {
                                if DjiMedia(cameradata: cameradata) != [""] {
                                    Picker(selection: $cameradata.Media, label: Text("请选择储存卡").frame(width: 100,alignment: .center)) {
                                        ForEach(DjiMedia(cameradata:cameradata),id:\.self) { media in
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
                            
                            if cameradata.BrandName == "Canon Cinema" {
                                if CanonCinemaMedia(cameradata: cameradata) != [""] {
                                    Picker(selection: $cameradata.Media, label: Text("请选择储存卡").frame(width: 100,alignment: .center)) {
                                        ForEach(CanonCinemaMedia(cameradata:cameradata),id:\.self) { media in
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
                            
                            if cameradata.BrandName != "Canon" && cameradata.BrandName != "SONY" && cameradata.BrandName != "Panasonic" && cameradata.BrandName != "DJI" && cameradata.BrandName != "Canon Cinema" {
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
                            
                            //ARRI帧率选择
                            if cameradata.BrandName == "ARRI" {
                                Picker(selection: $cameradata.Rate, label: Text("请选择帧率").frame(width: 100,alignment: .center)) {
                                    ForEach(ArriRates(cameradata:cameradata),id:\.self) { rate in
                                        Text(rate).tag(rate)
                                    }
                                }
                            }
                            
                            //BMD帧率选择
                            if cameradata.BrandName == "Blackmagicdesign" {
                                Picker(selection: $cameradata.Rate, label: Text("请选择帧率").frame(width: 100,alignment: .center)) {
                                    ForEach(BMDRate(cameradata:cameradata),id:\.self) { rate in
                                        Text(rate).tag(rate)
                                    }
                                }
                            }
                            
                            //Apple帧率选择
                            if cameradata.BrandName == "Apple" {
                                Picker(selection: $cameradata.Rate, label: Text("请选择帧率").frame(width: 100,alignment: .center)) {
                                    ForEach(AppleRate(cameradata:cameradata),id:\.self) { rate in
                                        Text(rate).tag(rate)
                                    }
                                }
                            }
                            
                            //RED帧率选择
                            if cameradata.BrandName == "RED" {
                                Picker(selection: $cameradata.Rate, label: Text("请选择帧率").frame(width: 100,alignment: .center)) {
                                    ForEach(DSMC3Rate(cameradata:cameradata),id:\.self) { rate in
                                        Text(rate).tag(rate)
                                    }
                                }
                            }
                        }
                        .padding(.top, 20.0)
                        Spacer()
                        
                        //计算数据输出
                        DataOutput(cameradata: cameradata)
                    }
                    Spacer()
                    
                    //备注与说明
                    Comments(cameradata: cameradata)
                }
                
                //主功能选择
                .tabItem {
                    Text("数据计算器")
                }
                
                //                其他功能模块
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
