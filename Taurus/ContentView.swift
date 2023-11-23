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
                        
                        //编码乘积
                        var CodecSpeed: Double {
                            switch vars.Codec {
                            case "ARRIRAW" :
                                return 600
                            case "Prores 4444 XQ" :
                                return 400
                            case "Prores 4444" :
                                return 264
                            case "Prores 422 HQ" :
                                return 176
                            case "Prores 422" :
                                return 117.6
                            case "Prores 422 LT" :
                                return 81.2
                            case "MPEG-2 HD 422" :
                                return 66
                            default :
                                return 0.00001
                            }
                        }
                        
                        //分辨率乘积
                        var ResolutionMultiplier: Double {
                            switch vars.Resolution {
                          case "FHD S35[From 2880*1620]","FHD S16[From 1600*900]","FHD S35[From 4096*2304]","FHD S35[From 1920*2160][8:9 ANA]","FHD LF[From 4320*2430]","FHD LF[From UHD]" :
                              return 1
                          case "2K S35[2048*1152][From 2868*1614]","2K S35[2048*1152][From 2868*1612]","2K S35[2048*1152][From 4096*2304]","2K LF[2048*1152][From UHD]","2K S16[2048*1152]","2K S35[2048*1152][From 2880*1620]":
                              return 1.14
                          case "2K S35[2048*858][From 2560*2146][6:5 ANA]","2K S35[2048*858][From 2560*2145][6:5 ANA]" :
                              return 0.85
                          case "2K S35[2048*1536][From 2868*2152][4:3]" :
                              return 1.5
                          case "2.8K S35[2880*1620]" :
                              return 2.25
                          case "2.6K S35[2578*2160][6:5]" :
                              return 2.69
                          case "3.2K S35[3168*1782]" :
                              return 2.72
                          case "3.2K S35[3200*1800]" :
                              return 2.77
                          case "2.8K S35[2880*2160][4:3]":
                              return 3
                          case "4K S35[4096*1716][From 2560*2146][6:5 ANA]","4K S35[4096*1716][From 3328*2790][6:5 ANA]" :
                              return 3.39
                          case "3.8K S35[3840*1920][From 3072*3072][1:1 ANA]" :
                              return 3.56
                          case "3.4K S35[3424*2202][OG]","3.4K S35[3424*2202][3:2]" :
                              return 3.64
                          case "2.8K LF[2880*2880][1:1]","UHD LF","UHD S35","UHD S35[From 3200*1800]","UHD S35[From 4096*2304]","UHD S35[From 2743*3086][8:9 ANA]","UHD LF[From 4320*2430]","4.5K LF[4448*1856][2.39:1]":
                              return 4
                          case "4K S35[4096*2048][2:1]":
                              return 4.05
                          case "3.3K S35[3328*2790][6:5]" :
                              return 4.48
                          case "4K S35[4096*2304]","3K S35[3072*3072][1:1]","4K S35[4096*2304][From 4608*2592]":
                              return 4.55
                          case "4K S35[4096*2636][From 3414*2198][2.39:1]" :
                              return 5.2
                          case "4.6K S35[4608*2592]" :
                              return 5.76
                          case "4.3K LF[4320*2880][3:2]" :
                              return 6
                          case "4.5K LF[4448*3096][3:2]","4.5K LF[4448*3096][OG]":
                              return 6.64
                          case "4.6K S35[4608*3164][OG]" :
                              return 7
                          case "5.1K 65mm[5120*2880]" :
                              return 7.11
                          case "6.5K 65mm[6560*3100][OG]" :
                              return 9.8
                          default:
                              return 0.00001
                          }
                        }
                    
                        //旧机型Prores编码码率乘积
                        var ProresCompensation: Double {
                            switch vars.CameraName {
                            case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF" :
                                return 1.125
                            case "ALEXA 35","ALEXA Mini LF":
                                return 1
                            default :
                                return 1
                            }
                        }
                        
                        //ALEXA 35 ARRIRAW编码乘积
                        var ARRIRAWCompensation: Double {
                            switch vars.CameraName {
                            case "ALEXA 35" :
                                return 1.075
                            default :
                                return 1
                            }
                        }
                        
                        //索尼机型码率计算区
                        @State var SonyCodecName: String = vars.Codec + "_" + vars.Resolution
                        var SonyCodecSpeed: Double {
                            switch SonyCodecName {
                            case "XAVC S HD_FHD FF[10bit 4:2:2][23.98p]","XAVC S HD_FHD FF[8bit 4:2:0][23.98p]","XAVC S HD_FHD FF[10bit 4:2:2][25p/29.97p]","XAVC S HD_FHD FF[8bit 4:2:0][25p/29.97p]","XAVC S HD_FHD FF[10bit 4:2:2][50p/59.94p]","XAVC S HD_FHD FF[8bit 4:2:0][50p/59.94p]","XAVC S HD_FHD S35[10bit 4:2:2][23.98p]","XAVC S HD_FHD S35[8bit 4:2:0][23.98p]","XAVC S HD_FHD S35[10bit 4:2:2][25p/29.97p]","XAVC S HD_FHD S35[8bit 4:2:0][25p/29.97p]","XAVC S HD_FHD S35[10bit 4:2:2][50p/59.94p]","XAVC S HD_FHD S35[8bit 4:2:0][50p/59.94p]","MPEG-2 LongGOP_FHD FF[10bit 4:2:2][23.98p/25p/29.97p]","MPEG-2 LongGOP_FHD S35[10bit 4:2:2][23.98p/25p/29.97p]" :
                                return 50
                            case "XAVC S HD_FHD FF[8bit 4:2:0][100p/119.88p]","XAVC S HD_FHD S35[8bit 4:2:0][100p/119.88p]" :
                                return 60
                            case "XAVC S-I HD_FHD FF[10bit 4:2:2][23.98p]","XAVC S-I HD_FHD S35[10bit 4:2:2][23.98p]" :
                                return 89
                            case "XAVC S-I HD_FHD FF[10bit 4:2:2][25p]","XAVC S-I HD_FHD S35[10bit 4:2:2][25p]" :
                                return 93
                            case "XAVC HS 4K_UHD FF[10bit 4:2:2][23.98p]","XAVC HS 4K_UHD FF[10bit 4:2:0][23.98p]","XAVC S 4K_UHD FF[10bit 4:2:2][23.98p]","XAVC S 4K_UHD FF[8bit 4:2:0][23.98p]","XAVC S 4K_UHD FF[8bit 4:2:0][25p/29.97p]","XAVC HS 4K_UHD S35[10bit 4:2:2][23.98p]","XAVC HS 4K_UHD S35[10bit 4:2:0][23.98p]","XAVC S 4K_UHD S35[10bit 4:2:2][23.98p]","XAVC S 4K_UHD S35[8bit 4:2:0][23.98p]","XAVC S 4K_UHD S35[8bit 4:2:0][25p/29.97p]","XAVC HS 4K_UHD FF[10bit 4:2:2][23.98p][From 6K]","XAVC HS 4K_UHD FF[10bit 4:2:0][23.98p][From 6K]","XAVC HS 4K_UHD FF[10bit 4:2:2][23.98p][From 7K]","XAVC HS 4K_UHD FF[10bit 4:2:0][23.98p][From 7K]","XAVC S 4K_UHD FF[10bit 4:2:2][23.98p][From 6K]","XAVC S 4K_UHD FF[8bit 4:2:0][23.98p][From 6K]","XAVC S 4K_UHD FF[10bit 4:2:2][23.98p][From 7K]","XAVC S 4K_UHD FF[8bit 4:2:0][23.98p][From 7K]","XAVC S 4K_UHD FF[8bit 4:2:0][25p/29.97p][From 6K]","XAVC S 4K_UHD FF[8bit 4:2:0][25p/29.97p][From 7K]" :
                                return 100
                            case "XAVC S-I HD_FHD FF[10bit 4:2:2][29.97p]","XAVC S-I HD_FHD S35[10bit 4:2:2][29.97p]" :
                                return 111
                            case "XAVC S 4K_UHD FF[10bit 4:2:2][25p/29.97p]","XAVC S 4K_UHD S35[10bit 4:2:2][25p/29.97p]","XAVC S 4K_UHD FF[10bit 4:2:2][25p/29.97p][From 6K]","XAVC S 4K_UHD FF[10bit 4:2:2][25p/29.97p][From 7K]" :
                                return 140
                            case "XAVC HS 4K_UHD FF[10bit 4:2:0][50p/59.94p]","XAVC S 4K_UHD FF[8bit 4:2:0][50p/59.94p]","XAVC HS 4K_UHD S35[10bit 4:2:0][50p/59.94p]","XAVC S 4K_UHD S35[8bit 4:2:0][50p/59.94p]","XAVC HS 4K_UHD FF[10bit 4:2:0][50p/59.94p][From 6K]","XAVC S 4K_UHD FF[8bit 4:2:0][50p/59.94p][From 6K]" :
                                return 150
                            case "XAVC S-I HD_FHD FF[10bit 4:2:2][50p]","XAVC S-I HD_FHD S35[10bit 4:2:2][50p]" :
                                return 185
                            case "XAVC HS 4K_UHD FF[10bit 4:2:2][50p/59.94p]","XAVC HS 4K_UHD FF[10bit 4:2:0][100p/119.88p]","XAVC S 4K_UHD FF[10bit 4:2:2][50p/59.94p]","XAVC S 4K_UHD FF[8bit 4:2:0][100p/119.88p]","XAVC HS 4K_UHD S35[10bit 4:2:2][50p/59.94p]","XAVC HS 4K_UHD S35[10bit 4:2:0][100p/119.88p]","XAVC S 4K_UHD S35[10bit 4:2:2][50p/59.94p]","XAVC S 4K_UHD S35[8bit 4:2:0][100p/119.88p]","XAVC HS 4K_UHD FF[10bit 4:2:2][50p/59.94p][From 6K]","XAVC S 4K_UHD FF[10bit 4:2:2][50p/59.94p][From 6K]" :
                                return 200
                            case "XAVC S-I HD_FHD FF[10bit 4:2:2][59.94p]","XAVC S-I HD_FHD S35[10bit 4:2:2][59.94p]" :
                                return 222
                            case "XAVC S-I DCI 4K_DCI 4K FF[10bit 4:2:2][23.98p/24p]","XAVC S-I 4K_UHD FF[10bit 4:2:2][23.98p]","XAVC S-I DCI 4K_DCI 4K S35[10bit 4:2:2][23.98p/24p]","XAVC S-I 4K_UHD S35[10bit 4:2:2][23.98p]","XAVC S-I DCI 4K_DCI 4K FF[10bit 4:2:2][23.98p][From 6K]","XAVC S-I 4K_UHD FF[10bit 4:2:2][23.98p][From 6K]","XAVC S-I DCI 4K_DCI 4K FF[10bit 4:2:2][23.98p][From 7K]","XAVC S-I 4K_UHD FF[10bit 4:2:2][23.98p][From 7K]" :
                                return 240
                            case "XAVC S-I DCI 4K_DCI 4K FF[10bit 4:2:2][25p]","XAVC S-I 4K_UHD FF[10bit 4:2:2][25p]","XAVC S-I DCI 4K_DCI 4K S35[10bit 4:2:2][25p]","XAVC S-I 4K_UHD S35[10bit 4:2:2][25p]","XAVC S-I DCI 4K_DCI 4K FF[10bit 4:2:2][25p][From 6K]","XAVC S-I 4K_UHD FF[10bit 4:2:2][25p][From 6K]","XAVC S-I DCI 4K_DCI 4K FF[10bit 4:2:2][25p][From 7K]","XAVC S-I 4K_UHD FF[10bit 4:2:2][25p][From 7K]" :
                                return 250
                            case "XAVC HS 4K_UHD FF[10bit 4:2:2][100p/119.88p]","XAVC S 4K_UHD FF[10bit 4:2:2][100p/119.88p]","XAVC HS 4K_UHD S35[10bit 4:2:2][100p/119.88p]","XAVC S 4K_UHD S35[10bit 4:2:2][100p/119.88p]" :
                                return 280
                            case "XAVC S-I DCI 4K_DCI 4K FF[10bit 4:2:2][29.97p]","XAVC S-I 4K_UHD FF[10bit 4:2:2][29.97p]","XAVC S-I DCI 4K_DCI 4K S35[10bit 4:2:2][29.97p]","XAVC S-I 4K_UHD S35[10bit 4:2:2][29.97p]","XAVC S-I DCI 4K_DCI 4K FF[10bit 4:2:2][29.97p][From 6K]","XAVC S-I 4K_UHD FF[10bit 4:2:2][29.97p][From 6K]","XAVC S-I DCI 4K_DCI 4K FF[10bit 4:2:2][29.97p][From 7K]","XAVC S-I 4K_UHD FF[10bit 4:2:2][29.97p][From 7K]" :
                                return 300
                            case "XAVC HS 8K_8K FF[10bit 4:2:0][23.98p/25p/29.97p]","XAVC HS 8K_8K FF[10bit 4:2:0][23.98p/25p]" :
                                return 400
                            case "XAVC S-I DCI 4K_DCI 4K FF[10bit 4:2:2][50p]","XAVC S-I 4K_UHD FF[10bit 4:2:2][50p]","XAVC S-I DCI 4K_DCI 4K S35[10bit 4:2:2][50p]","XAVC S-I 4K_UHD S35[10bit 4:2:2][50p]","XAVC S-I DCI 4K_DCI 4K FF[10bit 4:2:2][50p][From 6K]","XAVC S-I 4K_UHD FF[10bit 4:2:2][50p][From 6K]" :
                                return 500
                            case "XAVC HS 8K_8K FF[10bit 4:2:2][23.98p/25p/29.97p]":
                                return 520
                            case "XAVC S-I DCI 4K_DCI 4K FF[10bit 4:2:2][59.94p]","XAVC S-I 4K_UHD FF[10bit 4:2:2][59.94p]","XAVC S-I DCI 4K_DCI 4K S35[10bit 4:2:2][59.94p]","XAVC S-I 4K_UHD S35[10bit 4:2:2][59.94p]","XAVC S-I DCI 4K_DCI 4K FF[10bit 4:2:2][59.94p][From 6K]","XAVC S-I 4K_UHD FF[10bit 4:2:2][59.94p][From 6K]" :
                                return 600
                            default :
                                return 0.00000001
                            }
                        }
                        
                        //佳能机型码率计算区
                        @State var CanonCodecName: String = vars.Codec + "_" + vars.Resolution
                        var CanonCodecSpeed: Double {
                            switch CanonCodecName {
                            case "IPB Light AVC_FHD FF[8bit 4:2:0][25p/29.97p][From 4K]","IPB Light AVC_FHD S35[8bit 4:2:0][25p/29.97p]","IPB Light AVC_FHD FF[8bit 4:2:0][25p/29.97p]","IPB Light AVC_FHD FF[8bit 4:2:0][23.98p/25p/29.97p]","IPB Light AVC_FHD S35[8bit 4:2:0][23.98p/25p/29.97p]" :
                                return 12
                            case "IPB Light HEVC_FHD FF[10bit 4:2:2][25p/29.97p][From 4K]","IPB Light HEVC_FHD S35[10bit 4:2:2][25p/29.97p]","IPB Light HEVC_FHD FF[10bit 4:2:2][25p/29.97p]","IPB Light HEVC_FHD FF[10bit 4:2:2][23.98p/25p/29.97p]","IPB Light HEVC_FHD S35[10bit 4:2:2][23.98p/25p/29.97p]" :
                                return 28
                            case "IPB AVC_FHD FF[8bit 4:2:0][23.98p/25p/29.97p][From 4K]","IPB AVC_FHD S35[8bit 4:2:0][23.98p/25p/29.97p]","IPB AVC_FHD FF[8bit 4:2:0][23.98p/25p/29.97p]" :
                                return 30
                            case "IPB Light AVC_FHD FF[8bit 4:2:0][50p/59.94p][From 4K]","IPB Light AVC_FHD S35[8bit 4:2:0][50p/59.94p]","IPB Light AVC_FHD FF[8bit 4:2:0][50p/59.94p]" :
                                return 35
                            case "IPB HEVC_FHD FF[10bit 4:2:2][23.98p/25p/29.97p][From 4K]","IPB HEVC_FHD S35[10bit 4:2:2][23.98p/25p/29.97p]","IPB HEVC_FHD FF[10bit 4:2:2][23.98p/25p/29.97p]" :
                                return 45
                            case "IPB Light HEVC_FHD FF[10bit 4:2:2][50p/59.94p][From 4K]","IPB Light HEVC_FHD S35[10bit 4:2:2][50p/59.94p]","IPB Light HEVC_FHD FF[10bit 4:2:2][50p/59.94p]" :
                                return 50
                            case "IPB AVC_FHD FF[8bit 4:2:0][50p/59.94p][From 4K]","IPB AVC_FHD S35[8bit 4:2:0][50p/59.94p]","IPB Light AVC_DCI 4K FF[8bit 4:2:0][23.98p/24p/25p/29.97p][From 8.2K]","IPB Light AVC_UHD FF[8bit 4:2:0][23.98p/25p/29.97p][From 7.7K]","IPB Light AVC_DCI 4K S35[8bit 4:2:0][23.98p/24p/25p/29.97p][From 5.1K]","IPB Light AVC_UHD S35[8bit 4:2:0][23.98p/25p/29.97p][From 4.8K]","IPB Light AVC_UHD FF[8bit 4:2:0][23.98p/25p/29.97p][From 5.1K]","IPB Light AVC_UHD S35[8bit 4:2:0][23.98p/25p/29.97p][From 3.4K]","IPB AVC_FHD FF[8bit 4:2:0][50p/59.94p]","IPB Light AVC_UHD S35[8bit 4:2:0][23.98p/25p/29.97p][From 7K]","IPB Light AVC_DCI 4K FF[8bit 4:2:0][23.98p/24p/25p/29.97p][From 6K]","IPB Light AVC_UHD FF[8bit 4:2:0][23.98p/25p/29.97p][From 5.6K]","IPB Light AVC_DCI 4K S35[8bit 4:2:0][23.98p/24p/25p/29.97p]","IPB Light AVC_UHD S35[8bit 4:2:0][23.98p/25p/29.97p]" :
                                return 60
                            case "IPB Light AVC_FHD FF[8bit 4:2:0][100p/119.88p]","IPB Light AVC_FHD S35[8bit 4:2:0][100p/119.88p]" :
                                return 70
                            case "IPB Light HEVC_DCI 4K FF[10bit 4:2:2][23.98p/24p/25p/29.97p][From 8.2K]","IPB Light HEVC_DCI 4K S35[10bit 4:2:2][23.98p/24p/25p/29.97p][From 5.1K]","IPB Light HEVC_UHD FF[10bit 4:2:2][23.98p/25p/29.97p][From 7.7K]","IPB Light HEVC_UHD S35[10bit 4:2:2][23.98p/25p/29.97p][From 4.8K]","IPB Light HEVC_UHD FF[10bit 4:2:2][23.98p/25p/29.97p][From 5.1K]","IPB Light HEVC_UHD S35[10bit 4:2:2][23.98p/25p/29.97p][From 3.4K]","IPB Light HEVC_UHD S35[10bit 4:2:2][23.98p/25p/29.97p][From 7K]","IPB Light HEVC_DCI 4K FF[10bit 4:2:2][23.98p/24p/25p/29.97p][From 6K]","IPB Light HEVC_DCI 4K S35[10bit 4:2:2][23.98p/24p/25p/29.97p]","IPB Light HEVC_UHD FF[10bit 4:2:2][23.98p/25p/29.97p][From 5.6K]","IPB Light HEVC_UHD S35[10bit 4:2:2][23.98p/25p/29.97p]" :
                                return 85
                            case "ALL-I AVC_FHD FF[8bit 4:2:0][23.98p/25p/29.97p][From 4K]","ALL-I AVC_FHD S35[8bit 4:2:0][23.98p/25p/29.97p]","IPB HEVC_FHD FF[10bit 4:2:2][50p/59.94p][From 4K]","IPB HEVC_FHD S35[10bit 4:2:2][50p/59.94p]","IPB HEVC_FHD FF[10bit 4:2:2][50p/59.94p]","ALL-I AVC_FHD FF[8bit 4:2:0][23.98p/25p/29.97p]" :
                                return 90
                            case "IPB Light HEVC_FHD FF[10bit 4:2:2][100p/119.88p]","IPB Light HEVC_FHD S35[10bit 4:2:2][100p/119.88p]" :
                                return 100
                            case "IPB AVC_DCI 4K FF[8bit 4:2:0][23.98p/24p/25p/29.97p][From 8.2K]","IPB AVC_UHD FF[8bit 4:2:0][23.98p/25p/29.97p][From 7.7K]","IPB AVC_DCI 4K S35[8bit 4:2:0][23.98p/24p/25p/29.97p][From 5.1K]","IPB AVC_UHD S35[8bit 4:2:0][23.98p/25p/29.97p][From 4.8K]","IPB Light AVC_DCI 4K FF[8bit 4:2:0][50p/59.94p]","IPB Light AVC_UHD FF[8bit 4:2:0][50p/59.94p]","IPB Light AVC_DCI 4K S35[8bit 4:2:0][50p/59.94p][From 5.1K]","IPB Light AVC_UHD S35[8bit 4:2:0][50p/59.94p][From 4.8K]","IPB AVC_UHD FF[8bit 4:2:0][23.98p/25p/29.97p][From 5.1K]","IPB AVC_UHD S35[8bit 4:2:0][23.98p/25p/29.97p][From 3.4K]","IPB Light AVC_UHD FF[8bit 4:2:0][50p/59.94p][From 5.1K]","IPB Light AVC_UHD S35[8bit 4:2:0][50p/59.94p][From 3.4K]","IPB AVC_FHD FF[8bit 4:2:0][100p/119.88p]","IPB AVC_FHD S35[8bit 4:2:0][100p/119.88p]","IPB AVC_UHD S35[8bit 4:2:0][23.98p/25p/29.97p][From 7K]","IPB Light AVC_UHD S16[8bit 4:2:0][50p/59.94p]","IPB Light AVC_UHD S35[8bit 4:2:0][50p/59.94p]","IPB AVC_DCI 4K FF[8bit 4:2:0][23.98p/24p/25p/29.97p][From 6K]","IPB AVC_UHD FF[8bit 4:2:0][23.98p/25p/29.97p][From 5.6K]","IPB AVC_DCI 4K S35[8bit 4:2:0][23.98p/24p/25p/29.97p]","IPB AVC_UHD S35[8bit 4:2:0][23.98p/25p/29.97p]","IPB Light AVC_DCI 4K FF[8bit 4:2:0][50p/59.94p][From 6K]","IPB Light AVC_UHD FF[8bit 4:2:0][50p/59.94p][From 5.6K]","IPB Light AVC_DCI 4K S35[8bit 4:2:0][50p/59.94p]" :
                                return 120
                            case "ALL-I HEVC_FHD FF[10bit 4:2:2][23.98p/25p/29.97p][From 4K]","ALL-I HEVC_FHD S35[10bit 4:2:2][23.98p/25p/29.97p]","ALL-I HEVC_FHD FF[10bit 4:2:2][23.98p/25p/29.97p]" :
                                return 135
                            case "IPB HEVC_DCI 4K FF[10bit 4:2:2][23.98p/24p/25p/29.97p][From 8.2K]","IPB HEVC_UHD FF[10bit 4:2:2][23.98p/25p/29.97p][From 7.7K]","IPB HEVC_DCI 4K S35[10bit 4:2:2][23.98p/24p/25p/29.97p][From 5.1K]","IPB HEVC_UHD S35[10bit 4:2:2][23.98p/25p/29.97p][From 4.8K]","IPB Light HEVC_DCI 4K FF[10bit 4:2:2][50p/59.94p]","IPB Light HEVC_UHD FF[10bit 4:2:2][50p/59.94p]","IPB Light HEVC_DCI 4K S35[10bit 4:2:2][50p/59.94p][From 5.1K]","IPB Light HEVC_UHD S35[10bit 4:2:2][50p/59.94p][From 4.8K]","IPB HEVC_UHD FF[10bit 4:2:2][23.98p/25p/29.97p][From 5.1K]","IPB HEVC_UHD S35[10bit 4:2:2][23.98p/25p/29.97p][From 3.4K]","IPB Light HEVC_UHD FF[10bit 4:2:2][50p/59.94p][From 5.1K]","IPB Light HEVC_UHD S35[10bit 4:2:2][50p/59.94p][From 3.4K]","IPB HEVC_UHD S35[10bit 4:2:2][23.98p/25p/29.97p][From 7K]","IPB Light HEVC_UHD S16[10bit 4:2:2][50p/59.94p]","IPB Light HEVC_UHD S35[10bit 4:2:2][50p/59.94p]","IPB HEVC_DCI 4K FF[10bit 4:2:2][23.98p/24p/25p/29.97p][From 6K]","IPB HEVC_UHD FF[10bit 4:2:2][23.98p/25p/29.97p][From 5.6K]","IPB HEVC_DCI 4K S35[10bit 4:2:2][23.98p/24p/25p/29.97p]","IPB HEVC_UHD S35[10bit 4:2:2][23.98p/25p/29.97p]","IPB Light HEVC_UHD FF[10bit 4:2:2][50p/59.94p][From 5.6K]","IPB Light HEVC_DCI 4K FF[10bit 4:2:2][50p/59.94p][From 6K]","IPB Light HEVC_DCI 4K S35[10bit 4:2:2][50p/59.94p]" :
                                return 170
                            case "ALL-I AVC_FHD FF[8bit 4:2:0][50p/59.94p][From 4K]","ALL-I AVC_FHD S35[8bit 4:2:0][50p/59.94p]","IPB HEVC_FHD FF[10bit 4:2:2][100p/119.88p]","IPB HEVC_FHD S35[10bit 4:2:2][100p/119.88p]","ALL-I AVC_FHD FF[8bit 4:2:0][50p/59.94p]" :
                                return 180
                            case "ALL-I HEVC_FHD FF[10bit 4:2:2][50p/59.94p][From 4K]","ALL-I HEVC_FHD S35[10bit 4:2:2][50p/59.94p]","IPB AVC_DCI 4K FF[8bit 4:2:0][50p/59.94p]","IPB AVC_UHD FF[8bit 4:2:0][50p/59.94p]","IPB AVC_DCI 4K S35[8bit 4:2:0][50p/59.94p][From 5.1K]","IPB AVC_UHD S35[8bit 4:2:0][50p/59.94p][From 4.8K]","IPB Light HEVC_DCI 8K FF[8bit 4:2:0][23.98p/24p/25p/29.97p]","IPB Light HEVC_8K FF[8bit 4:2:0][23.98p/25p/29.97p]","IPB AVC_UHD FF[8bit 4:2:0][50p/59.94p][From 5.1K]","IPB AVC_UHD S35[8bit 4:2:0][50p/59.94p][From 3.4K]","IPB AVC_UHD S16[8bit 4:2:0][50p/59.94p]","IPB AVC_UHD S35[8bit 4:2:0][50p/59.94p]","ALL-I HEVC_FHD FF[10bit 4:2:2][50p/59.94p]","IPB AVC_DCI 4K FF[8bit 4:2:0][50p/59.94p][From 6K]","IPB AVC_UHD FF[8bit 4:2:0][50p/59.94p][From 5.6K]","IPB AVC_DCI 4K S35[8bit 4:2:0][50p/59.94p]" :
                                return 230
                            case "IPB HEVC_DCI 4K FF[10bit 4:2:2][50p/59.94p]","IPB HEVC_UHD FF[10bit 4:2:2][50p/59.94p]","IPB HEVC_DCI 4K S35[10bit 4:2:2][50p/59.94p][From 5.1K]","IPB HEVC_UHD S35[10bit 4:2:2][50p/59.94p][From 4.8K]","IPB Light HEVC_DCI 8K FF[10bit 4:2:2][23.98p/24p/25p/29.97p]","IPB Light HEVC_8K FF[10bit 4:2:2][23.98p/25p/29.97p]","IPB HEVC_UHD FF[10bit 4:2:2][50p/59.94p][From 5.1K]","IPB HEVC_UHD S35[10bit 4:2:2][50p/59.94p][From 3.4K]","IPB HEVC_UHD S16[10bit 4:2:2][50p/59.94p]","IPB HEVC_UHD S35[10bit 4:2:2][50p/59.94p]","IPB HEVC_DCI 4K FF[10bit 4:2:2][50p/59.94p][From 6K]","IPB HEVC_UHD FF[10bit 4:2:2][50p/59.94p][From 5.6K]","IPB HEVC_DCI 4K S35[10bit 4:2:2][50p/59.94p]" :
                                return 340
                            case "ALL-I AVC_FHD FF[8bit 4:2:0][100p/119.88p][From 4k]","ALL-I AVC_FHD FF[8bit 4:2:0][100p/119.88p]","ALL-I AVC_FHD S35[8bit 4:2:0][100p/119.88p]","ALL-I HEVC_FHD FF[10bit 4:2:2][100p/119.88p]","ALL-I HEVC_FHD S35[10bit 4:2:2][100p/119.88p]" :
                                return 360
                            case "ALL-I HEVC_DCI 4K FF[10bit 4:2:2][23.98p/24p/25p/29.97p][From 8.2K]","ALL-I HEVC_UHD FF[10bit 4:2:2][23.98p/25p/29.97p][From 7.7K]","ALL-I HEVC_DCI 4K S35[10bit 4:2:2][23.98p/24p/25p/29.97p][From 5.1K]","ALL-I HEVC_UHD S35[10bit 4:2:2][23.98p/25p/29.97p][From 4.8K]","ALL-I AVC_DCI 4K FF[8bit 4:2:0][23.98p/24p/25p/29.97p][From 8.2K]","ALL-I AVC_UHD FF[8bit 4:2:0][23.98p/25p/29.97p][From 7.7K]","ALL-I AVC_UHD S35[8bit 4:2:0][23.98p/25p/29.97p][From 4.8K]","ALL-I AVC_DCI 4K S35[8bit 4:2:0][23.98p/24p/25p/29.97p][From 5.1K]","ALL-I HEVC_FHD FF[10bit 4:2:2][100p/119.88p][From 4k]","IPB HEVC_DCI 8K FF[8bit 4:2:0][23.98p/24p/25p/29.97p]","IPB HEVC_8K FF[8bit 4:2:0][23.98p/25p/29.97p]","ALL-I HEVC_DCI 4K FF[10bit 4:2:2][23.98p/24p/25p/29.97p][From 6K]","ALL-I HEVC_UHD FF[10bit 4:2:2][23.98p/25p/29.97p][From 5.6K]","ALL-I AVC_DCI 4K FF[8bit 4:2:0][23.98p/24p/25p/29.97p][From 6K]","ALL-I AVC_UHD FF[8bit 4:2:0][23.98p/25p/29.97p][From 5.6K]","ALL-I HEVC_DCI 4K S35[10bit 4:2:2][23.98p/24p/25p/29.97p]","ALL-I HEVC_UHD S35[10bit 4:2:2][23.98p/25p/29.97p]","ALL-I AVC_DCI 4K S35[8bit 4:2:0][23.98p/24p/25p/29.97p]","ALL-I AVC_UHD S35[8bit 4:2:0][23.98p/25p/29.97p]" :
                                return 470
                            case "IPB HEVC_DCI 8K FF[10bit 4:2:2][23.98p/24p/25p/29.97p]","IPB HEVC_8K FF[10bit 4:2:2][23.98p/25p/29.97p]","ALL-I AVC_FHD FF[8bit 4:2:0][200p/239.76p]","ALL-I HEVC_FHD FF[10bit 4:2:2][200p/239.76p]" :
                                return 680
                            case "RAW Light_DCI 6K FF[12bit RAW][23.98p/24p]" :
                                return 720
                            case "RAW Light_DCI 6K FF[12bit RAW][25p/29.97p]" :
                                return 900
                            case "ALL-I AVC_DCI 4K FF[8bit 4:2:0][50p/59.94p]","ALL-I AVC_UHD FF[8bit 4:2:0][50p/59.94p]","ALL-I AVC_DCI 4K S35[8bit 4:2:0][50p/59.94p][From 5.1K]","ALL-I AVC_UHD S35[8bit 4:2:0][50p/59.94p][From 4.8K]","ALL-I AVC_DCI 4K FF[8bit 4:2:0][50p/59.94p][From 6K]","ALL-I AVC_UHD FF[8bit 4:2:0][50p/59.94p][From 5.6K]","ALL-I AVC_DCI 4K S35[8bit 4:2:0][50p/59.94p]","ALL-I AVC_UHD S35[8bit 4:2:0][50p/59.94p]" :
                                return 940
                            case "ALL-I HEVC_DCI 4K FF[10bit 4:2:2][50p/59.94p]","ALL-I HEVC_UHD FF[10bit 4:2:2][50p/59.94p]","ALL-I HEVC_DCI 4K S35[10bit 4:2:2][50p/59.94p][From 5.1K]","ALL-I HEVC_UHD S35[10bit 4:2:2][50p/59.94p][From 4.8K]","ALL-I HEVC_DCI 4K FF[10bit 4:2:2][50p/59.94p][From 6K]","ALL-I HEVC_UHD FF[10bit 4:2:2][50p/59.94p][From 5.6K]","ALL-I HEVC_DCI 4K S35[10bit 4:2:2][50p/59.94p]","ALL-I HEVC_UHD S35[10bit 4:2:2][50p/59.94p]" :
                                return 1000
                            case "ALL-I HEVC_DCI 8K FF[10bit 4:2:2][23.98p/24p/25p/29.97p]","ALL-I HEVC_8K FF[10bit 4:2:2][23.98p/25p/29.97p]","ALL-I HEVC_DCI 8K FF[8bit 4:2:0][23.98p/24p/25p/29.97p]","ALL-I HEVC_8K FF[8bit 4:2:0][23.98p/25p/29.97p]" :
                                return 1300
                            case "RAW Light_DCI 8K FF[12bit RAW Light][23.98p/24p]" :
                                return 1350
                            case "RAW_DCI 6K FF[12bit RAW][23.98p/24p]" :
                                return 1600
                            case "RAW Light_DCI 8K FF[12bit RAW Light][25/29.97p]" :
                                return 1700
                            case "RAW Light_DCI 6K FF[12bit RAW][50p/59.94p]" :
                                return 1800
                            case "ALL-I HEVC_DCI 4K FF[10bit 4:2:2][100p/119.88p]","ALL-I HEVC_UHD FF[10bit 4:2:2][100p/119.88p]","ALL-I AVC_DCI 4K FF[8bit 4:2:0][100p/119.88p]","ALL-I AVC_UHD FF[8bit 4:2:0][100p/119.88p]","ALL-I HEVC_DCI 4K S35[10bit 4:2:2][100p/119.88p]","ALL-I HEVC_UHD S35[10bit 4:2:2][100p/119.88p]","ALL-I AVC_DCI 4K S35[8bit 4:2:0][100p/119.88p]","ALL-I AVC_UHD S35[8bit 4:2:0][100p/119.88p]" :
                                return 1880
                            case "RAW_DCI 6K FF[12bit RAW][25p/29.97p]" :
                                return 2000
                            case "RAW_DCI 8K FF[12bit RAW][23.98p/24p/25p/29.97p]","RAW_DCI 6K FF[12bit RAW][50p/59.94p]" :
                                return 2600
                            default :
                                return 0.00000001
                            }
                        }
                        
                        @State var PanaCodecName: String = vars.Codec + "_" + vars.Resolution
                        var PanaCodecSpeed: Double {
                            switch PanaCodecName {
                            case "" :
                                return 1
                            default :
                                return 0.00000001
                            }
                        }
                        
                        //存储卡容量乘积
                        var MediaCapacity: Double {
                            switch vars.Media {
                            case "CFExpress TypeA 80GB" :
                                return 80
                            case "SxS Pro-X 120GB" :
                                return 120
                            case "CFast2.0 128GB","SxS Pro+ 128GB","CFExpress TypeB 128GB","SDXC 128GB" :
                                return 128
                            case "CFExpress TypeA 160GB" :
                                return 160
                            case "SxS Pro-X 240GB" :
                                return 240
                            case "CFast2.0 256GB","SxS Pro+ 256GB","AXS S24 256GB","CFExpress TypeB 256GB","SDXC 256GB" :
                                return 256
                            case "CFExpress TypeA 320GB" :
                                return 320
                            case "CFExpress TypeB 330GB" :
                                return 330
                            case "CFast2.0 512GB","XR Capture Drive 512GB","AXS S24 512GB","AXS S48 512GB","CFExpress TypeB 512GB","SDXC 512GB" :
                                return 512
                            case "CFExpress TypeA 640GB" :
                                return 640
                            case "CFExpress TypeB 660GB" :
                                return 660
                            case "CFExpress TypeA 960GB" :
                                return 960
                            case "SXR Capture Drive 1TB","Compact Drive 1TB","AXS S24 1TB","AXS S48 1TB","AXS S66 1TB","CFExpress TypeB 1TB","SDXC 1TB" :
                                return 1000
                            case "CFExpress TypeB 1.3TB" :
                                return 1333
                            case "CFExpress TypeA 1920GB" :
                                return 1920
                            case "SXR Capture Drive 2TB","Compact Drive 2TB","CFExpress TypeB 2TB","SDXC 2TB" :
                                return 2000
                            default :
                                return 0
                            }
                        }
                        
                        //加入补偿的编码速度
                        var CodecSpeedCount: Double {
                            switch vars.Codec {
                            case "Prores 4444 XQ","Prores 4444","Prores 422 HQ","Prores 422","Prores 422LT" :
                                return CodecSpeed*ProresCompensation
                            case "ARRIRAW" :
                                return CodecSpeed*ARRIRAWCompensation
                            default :
                                return CodecSpeed
                            }
                        }
                        
                        //帧率乘积
                        var RateSpeed: Double {
                            switch vars.Rate {
                            case "0.750" :
                                return 0.75
                            case "1.000" :
                                return 1
                            case "23.976","24.000" :
                                return 24
                            case "25.000" :
                                return 25
                            case "29.970","30.000" :
                                return 30
                            case "40.000" :
                                return 40
                            case "48.000":
                                return 48
                            case "50.000" :
                                return 50
                            case "59.940","60.000" :
                                return 60
                            case "72.000" :
                                return 72
                            case "75.000" :
                                return 75
                            case "90.000" :
                                return 90
                            case "96.000" :
                                return 96
                            case "100.000" :
                                return 100
                            case "120.000" :
                                return 120
                            case "150.000" :
                                return 150
                            case "200.000" :
                                return 200
                            case "ERROR" :
                                return 24
                            default :
                                return 0.00001
                            }
                        }
                        
                        //计算帧率乘积
                        let RateMultiplier = RateSpeed/24
                        
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
