//
//  ContentView.swift
//  Taurus
//
//  Created by 吴坤城 on 7/25/23.
//

import SwiftUI

class Vars: ObservableObject {
    
    @Published var BrandName: String = "请选择品牌"
    @Published var CameraName: String = "请选择机型"
    @Published var Codec: String = "请选择编码"
    @Published var Resolution: String = "请选择分辨率"
    @Published var Media: String = "请选择储存卡"
    @Published var Rate: String = "请选择帧率"
}

struct ContentView: View {

    @StateObject var vars = Vars()

    var body: some View {
        
        VStack {
            
            //主功能选择
            TabView {
                
                //数据计算器模块//
                VStack{
                    
                    Spacer()
                    
                    //重置按键
                    Button("重置") {
                        vars.BrandName = "请选择品牌"
                        vars.CameraName = "请选择机型"
                        vars.Codec = "请选择编码"
                        vars.Resolution = "请选择分辨率"
                        vars.Media = "请选择储存卡"
                        vars.Rate = "请选择帧率"
                    }
                    
                    
                    Spacer()
                    
                    //选择器与计算功能
                    HStack{
                        
                        //选择器模块
                        VStack (spacing:10){
                            
                            
                            //品牌选择
                            Picker(selection: $vars.BrandName, label: Text("请选择品牌").frame(width: 100,alignment: .center)) {
                                ForEach(CameraModel.keys.sorted(),id:\.self) { brand in
                                    Text(brand).tag(brand)
                                }
                            }
                            
                            //机型选择
                            if let models = CameraModel[vars.BrandName] {
                                Picker(selection: $vars.CameraName, label: Text("请选择机型").frame(width: 100,alignment: .center)) {
                                    ForEach(models, id:\.self) { model in
                                        Text(model).tag(model)
                                    }
                                }
                            }
                            else {
                                Picker(selection: $vars.CameraName, label:Text("请选择机型").frame(width: 100,alignment: .center)) {
                                    Text("无选项")
                                }
                            }
                            
                            //编码选择
                           
                            if let codec = CodecName[vars.CameraName] {
                                Picker(selection: $vars.Codec, label: Text("请选择编码").frame(width: 100,alignment: .center)) {
                                        ForEach(codec, id:\.self) { codecs in
                                            Text(codecs).tag(codecs)
                                        }
                                    }
                                }
                                else {
                                    Picker(selection: $vars.Codec, label:Text("请选择编码").frame(width: 100,alignment: .center)) {
                                        Text("无选项")
                                    }
                                }
                            
                            
                            
                            //分辨率选择
                            @State var CodecAndCamera = vars.CameraName + "_" + vars.Codec
                            if vars.BrandName == "SONY" || vars.BrandName == "Canon" {
                                if let resolutions = ResolutionName[CodecAndCamera] {
                                    Picker(selection: $vars.Resolution, label: Text("请选择格式").frame(width: 100,alignment: .center)) {
                                        ForEach(resolutions,id:\.self) { resolution in
                                            Text(resolution).tag(resolution)
                                        }
                                    }
                                }
                                else {
                                    Picker(selection: $vars.Resolution, label:Text("请选择格式").frame(width: 100,alignment: .center)) {
                                        Text("无选项")
                                    }
                                }
                            }
                            else if let resolutions = ResolutionName[CodecAndCamera] {
                                Picker(selection: $vars.Resolution, label: Text("请选择分辨率").frame(width: 100,alignment: .center)) {
                                    ForEach(resolutions,id:\.self) { resolution in
                                        Text(resolution).tag(resolution)
                                    }
                                }
                            }
                            else {
                                Picker(selection: $vars.Resolution, label:Text("请选择分辨率").frame(width: 100,alignment: .center)) {
                                    Text("无选项")
                                }
                            }
                            
                            //储存卡选择
                            if let medias = MediaName[vars.CameraName] {
                                Picker(selection: $vars.Media, label: Text("请选择储存卡").frame(width: 100,alignment: .center)) {
                                    ForEach(medias,id:\.self) { media in
                                        Text(media).tag(media)
                                    }
                                }
                            }
                            else {
                                Picker(selection: $vars.Media, label:Text("请选择储存卡").frame(width: 100,alignment: .center)) {
                                    Text("无选项")
                                }
                            }
                            
                            //帧率选择
                            if vars.BrandName == "ARRI" || vars.BrandName == "RED" {
                                if vars.Media == "请选择储存卡" {
                                    Picker(selection: $vars.Rate, label:Text("请选择帧率").frame(width: 100,alignment: .center)) {
                                        Text("无选项")
                                    }
                                }
                                else {
                                    Picker(selection: $vars.Rate, label: Text("请选择帧率").frame(width: 100,alignment: .center)) {
                                        ForEach(availableRates(vars:vars),id:\.self) { rate in
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
                            if vars.BrandName == "SONY"{
                                Text("可录制时长[Min]：\(MediaCapacity*7629.39453125/60/SonyCodecSpeed)")
                                Text("数据码率[mbps]: \(SonyCodecSpeed)")
                                Text("每小时数据占盘量[GB]：\(SonyCodecSpeed*450/1024)")
                            }
                            else if vars.BrandName == "Canon" {
                                Text("可录制时长[Min]：\(MediaCapacity*7629.39453125/60/CanonCodecSpeed)")
                                Text("数据码率[mbps]: \(CanonCodecSpeed)")
                                Text("每小时数据占盘量[GB]：\(CanonCodecSpeed*450/1024)")
                            }
                            else if vars.BrandName == "Panasonic" {
                                Text("可录制时长[Min]：\(MediaCapacity*7629.39453125/60/PanaCodecSpeed)")
                                Text("数据码率[mbps]: \(PanaCodecSpeed)")
                                Text("每小时数据占盘量[GB]：\(PanaCodecSpeed*450/1024)")
                            }
                            else {
                                Text("可录制时长[Min]：\(MediaCapacity*7629.39453125/60/CodecSpeedCount/ResolutionMultiplier/RateMultiplier)")
                                Text("数据码率[mbps]: \(CodecSpeedCount*ResolutionMultiplier*RateMultiplier)")
                                Text("每小时数据占盘量[GB]：\(CodecSpeedCount*ResolutionMultiplier*RateMultiplier*450/1024)")
                                if vars.Codec == "ARRIRAW" {
                                Text("每小时数据占盘量[GB][HDE]：\(CodecSpeed*ResolutionMultiplier*RateMultiplier*RateMultiplier*270/1024)")
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
                                        Text("1. 此版本[V1.1.6]仅包含《数据计算器》功能。根据画面内容，实际数据量可能与计算不同。")
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
                                        Text("4. HDE为ARRI公司推出的压缩技术，用于ARRIRAW的无损压缩。REDCODE为RED公司推出的压缩RAW技术。对于ALEXA 35摄影机，Prores编码位深均为12Bit。")
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
