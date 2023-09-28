//
//  ContentView.swift
//  Taurus
//
//  Created by 吴坤城 on 7/25/23.
//

import SwiftUI

struct ContentView: View {
    
//机型库
    let CameraModel : [String:[String]] = [
        "ARRI" : ["AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA 35","ALEXA Mini","ALEXA Mini LF","ALEXA LF","ALEXA 65"],
        "RED" : ["RED ONE[Mysterium 4K S35]","RED ONE M-X[Mysterium-X 4K S35]","Scarlet[Mysterium-X 5K S35]","Scarlet[Dragon 6K S35]","Scarlet-W[Dragon 5K S35]","Epic[Mysterium-X 5K S35]","Epic[Dragon 6K S35]","Epic-W[Helium 8K S35]","Epic-W[Dragon 6K S35]","Epic-W[Gemini 5K S35]","Weapon[Dragon 6K S35]","Weapon[Helium 8K S35]","Weapon[Monstro 8K VV]","Raven[Dragon 4.5K]","DSMC2[Dragon-X 6K S35]","DCMC2[Gemini 5K S35]","DSMC2[Helium 8K S35]","DSMC2[Monstro 8K VV]","Ranger[Gemini 5K S35]","Ranger[Helium 8K S35]","Ranger[Monstro 8K VV]","KEMODO","KEMODO-X","V-Raptor[8K S35]","V-Raptor[8K VV]","V-Raptor XL[8K S35]","V-Raptor XL[8K VV]"],
        "SONY" : ["Cinealta Venice 2[8K]","Cinealta Venice 2[6K]","Cinealta Venice","Cinealta Burano","Cinealta F65","Cinealta F55","FX 9","FX 6","FX 3","FX 30","FR 7","Alpha 1","Alpha7S Mark3","Alpha7 Mark4"],
        "Canon" : ["CinemaEOS C700 FF","CinemaEOS C700","CinemaEOS C500 Mark2","CinemaEOS C500","CinemaEOS C300 Mark3","CinemaEOS C300 Mark2","CinemaEOS C300","CinemaEOS C200","CinemaEOS C100 Mark2","CinemaEOS C100","CinemaEOS C70","CinemaEOS R5 C","CinemaEOS 1D-C","EOS R3","EOS R5","EOS R6 Mark2","EOS R6","EOS R8","EOS R7","EOS 1D-X Mark3"],
        "Kinefinity" : ["MC8020","MAVO Edge 8K","MAVO Edge 6K","MAVO Mark2","MAVO Mark2 LF"],
        "Nikon" : ["Z 9","Z 8","Z f","Z 7II","Z 7","Z 6II","Z 6","Z 5","Z 50","ZFC","Z 30"]
    ]
    
//编码库
    let CodecName : [String:[String]] = [
        //ARRI
        "AMIRA" : ["ARRIRAW","Prores 4444 XQ","Prores 4444","Prores 422 HQ","Prores 422","Prores 422 LT","MPEG-2 HD 422"],
        "ALEXA Classic" : ["Prores 4444","Prores 422 HQ","Prores 422"],
        "ALEXA XT" : ["ARRIRAW","Prores 4444 XQ","Prores 4444","Prores 422 HQ","Prores 422"],
        "ALEXA SXT" : ["ARRIRAW","Prores 4444 XQ","Prores 4444","Prores 422 HQ","Prores 422"],
        "ALEXA 35" : ["ARRIRAW","Prores 4444 XQ","Prores 4444","Prores 422 HQ"],
        "ALEXA Mini" : ["ARRIRAW","Prores 4444 XQ","Prores 4444","Prores 422 HQ","Prores 422","Prores 422 LT"],
        "ALEXA Mini LF" : ["ARRIRAW","Prores 4444 XQ","Prores 4444","Prores 422 HQ"],
        "ALEXA LF" : ["ARRIRAW","Prores 4444 XQ","Prores 4444","Prores 422 HQ","Prores 422"],
        "ALEXA 65" : ["ARRIRAW"],
        
        //RED
        "RED ONE[Mysterium 4K S35]" : ["REDCODE 28","REDCODE 36","REDCODE 42"],
        "RED ONE M-X[Mysterium-X 4K S35]" : ["REDCODE 28","REDCODE 36","REDCODE 42"],
        "Scarlet[Mysterium-X 5K S35]" : ["REDCODE 1:5","REDCODE 1:8"],
        "Scarlet[Dragon 6K S35]" : ["REDCODE 1:5","REDCODE 1:8","REDCODE 1:12","REDCODE 1:16"],
        "Scarlet-W[Dragon 5K S35]" : ["REDCODE 1:6","REDCODE 1:8","REDCODE 1:12","REDCODE 1:16"],
        "Epic[Mysterium-X 5K S35]" : ["REDCODE"],
        
        //SONY
        "Cinealta Venice 2[8K]": ["X-OCN XT","X-OCN ST","X-OCN LT","Prores 4444","Prores 422 HQ"],
        "Cinealta Venice 2[6K]": ["X-OCN XT","X-OCN ST","X-OCN LT","Prores 4444","Prores 422 HQ"],
        "Cinealta Venice" : ["X-OCN XT","X-OCN ST","X-OCN LT","RAW SQ","MPEG","Prores 422","Prores 422 HQ","XAVC Class300","XAVC Class 480"]
        
        
        
        
    ]
 
//分辨率库
    let ResolutionName : [String:[String]] = [
        //default 16:9
        "AMIRA_ARRIRAW" : ["2.8K S35[2880*1620]"],
        "AMIRA_Prores 4444 XQ" : ["HD S35[From 2880*1620]","HD S16[From 1600*900]","2K S35[2048*1152][From 2868*1612]","3.2K S35[3200*1800]","UHD S35[From 3200*1800]"],
        "AMIRA_Prores 4444" : ["HD S35[From 2880*1620]","HD S16[From 1600*900]","2K S35[2048*1152][From 2868*1612]","3.2K S35[3200*1800]","UHD S35[From 3200*1800]"],
        "AMIRA_Prores 422 HQ" : ["HD S35[From 2880*1620]","HD S16[From 1600*900]","2K S35[2048*1152][From 2868*1612]","3.2K S35[3200*1800]","UHD S35[From 3200*1800]"],
        "AMIRA_Prores 422" : ["HD S35[From 2880*1620]","HD S16[From 1600*900]","2K S35[2048*1152][From 2868*1612]","3.2K S35[3200*1800]","UHD S35[From 3200*1800]"],
        "AMIRA_Prores 422 LT" : ["HD S35[From 2880*1620]","HD S16[From 1600*900]","2K S35[2048*1152][From 2868*1612]","3.2K S35[3200*1800]","UHD S35[From 3200*1800]"],
        "AMIRA_MPEG-2 HD 422" : ["HD S35[From 2880*1620]"],
        "ALEXA Classic_Prores 4444" : ["HD S35[From 2880*1620]","2K S35[2048*1152][From 2868*1614]","2K S35[2048*1536][From 2868*2152][4:3]"],
        "ALEXA Classic_Prores 422 HQ" : ["HD S35[From 2880*1620]","2K S35[2048*1152][From 2868*1614]","2K S35[2048*1536][From 2868*2152][4:3]"],
        "ALEXA Classic_Prores 422" : ["HD S35[From 2880*1620]","2K S35[2048*1152][From 2868*1614]","2K S35[2048*1536][From 2868*2152][4:3]"],
        "ALEXA XT_ARRIRAW" : ["2.8K S35[2880*1620]","2.8K S35[2880*2160][4:3]","2.6K S35[2578*2160][6:5]","3.4K S35[3424*2202][OG]"],
        "ALEXA XT_Prores 4444 XQ" : ["HD S35[From 2880*1620]","2K S35[2048*1152][From 2868*1614]","2K S35[2048*1536][From 2868*2152][4:3]","3.2K S35[3168*1782]"],
        "ALEXA XT_Prores 4444" : ["HD S35[From 2880*1620]","2K S35[2048*1152][From 2868*1614]","2K S35[2048*1536][From 2868*2152][4:3]","3.2K S35[3168*1782]"],
        "ALEXA XT_Prores 422 HQ" : ["HD S35[From 2880*1620]","2K S35[2048*1152][From 2868*1614]","2K S35[2048*1536][From 2868*2152][4:3]","3.2K S35[3168*1782]"],
        "ALEXA XT_Prores 422" : ["HD S35[From 2880*1620]","2K S35[2048*1152][From 2868*1614]","2K S35[2048*1536][From 2868*2152][4:3]","3.2K S35[3168*1782]"],
        "ALEXA SXT_ARRIRAW" : ["3.2K S35[3168*1782]","2.8K S35[2880*1620]","2.6K S35[2578*2160][6:5]","2.8K S35[2880*2160][4:3]","3.4K S35[3424*2202][OG]"],
        "ALEXA SXT_Prores 4444 XQ" : ["HD S35[From 2880*1620]","2K S35[2048*1152][From 2880*1620]","2.8K S35[2880*2160][4:3]","3.2K S35[3200*1800]","UHD S35[From 3200*1800]","2K S35[2048*858][From 2560*2146][6:5 ANA]","4K S35[4096*1716][From 2560*2146][6:5 ANA]","3.4K S35[3424*2202][OG]","4K S35[4096*2636][From 3414*2198][2.39:1]"],
        "ALEXA SXT_Prores 4444" : ["HD S35[From 2880*1620]","2K S35[2048*1152][From 2880*1620]","2.8K S35[2880*2160][4:3]","3.2K S35[3200*1800]","UHD S35[From 3200*1800]","2K S35[2048*858][From 2560*2146][6:5 ANA]","4K S35[4096*1716][From 2560*2146][6:5 ANA]","3.4K S35[3424*2202][OG]","4K S35[4096*2636][From 3414*2198][2.39:1]"],
        "ALEXA SXT_Prores 422 HQ" : ["HD S35[From 2880*1620]","2K S35[2048*1152][From 2880*1620]","2.8K S35[2880*2160][4:3]","3.2K S35[3200*1800]","UHD S35[From 3200*1800]","2K S35[2048*858][From 2560*2146][6:5 ANA]","4K S35[4096*1716][From 2560*2146][6:5 ANA]","3.4K S35[3424*2202][OG]","4K S35[4096*2636][From 3414*2198][2.39:1]"],
        "ALEXA SXT_Prores 422" : ["HD S35[From 2880*1620]","2K S35[2048*1152][From 2880*1620]","2.8K S35[2880*2160][4:3]","3.2K S35[3200*1800]","UHD S35[From 3200*1800]","2K S35[2048*858][From 2560*2146][6:5 ANA]","4K S35[4096*1716][From 2560*2146][6:5 ANA]","3.4K S35[3424*2202][OG]","4K S35[4096*2636][From 3414*2198][2.39:1]"],
        "ALEXA 35_ARRIRAW" :["4.6K S35[4608*3164][OG]","4.6K S35[4608*2592]","4K S35[4096*2304]","UHD S35","4K S35[4096*2048][2:1]","3.3K S35[3328*2790][6:5]","3K S35[3072*3072][1:1]"],
        "ALEXA 35_Prores 4444 XQ" :["4.6K S35[4608*3164][OG]","4K S35[4096*2304][From 4608*2592]","4K S35[4096*2304]","UHD S35[From 4096*2304]","2K S35[2048*1152][From 4096*2304]","HD S35[From 4096*2304]","4K S35[4096*2048][2:1]","3.3K S35[3328*2790][6:5]","4K S35[4096*1716][From 3328*2790][6:5 ANA]","3K S35[3072*3072][1:1]","3.8K S35[3840*1920][From 3072*3072][1:1 ANA]","UHD S35[From 2743*3086][8:9 ANA]","2K S16[2048*1152]"],
        "ALEXA 35_Prores 4444" :["4.6K S35[4608*3164][OG]","4K S35[4096*2304][From 4608*2592]","4K S35[4096*2304]","UHD S35[From 4096*2304]","2K S35[2048*1152][From 4096*2304]","HD S35[From 4096*2304]","4K S35[4096*2048][2:1]","3.3K S35[3328*2790][6:5]","4K S35[4096*1716][From 3328*2790][6:5 ANA]","3K S35[3072*3072][1:1]","3.8K S35[3840*1920][From 3072*3072][1:1 ANA]","UHD S35[From 2743*3086][8:9 ANA]","2K S16[2048*1152]"],
        "ALEXA 35_Prores 422 HQ" :["4.6K S35[4608*3164][OG]","4K S35[4096*2304][From 4608*2592]","4K S35[4096*2304]","UHD S35[From 4096*2304]","2K S35[2048*1152][From 4096*2304]","HD S35[From 4096*2304]","4K S35[4096*2048][2:1]","3.3K S35[3328*2790][6:5]","4K S35[4096*1716][From 3328*2790][6:5 ANA]","3K S35[3072*3072][1:1]","3.8K S35[3840*1920][From 3072*3072][1:1 ANA]","UHD S35[From 2743*3086][8:9 ANA]","2K S16[2048*1152]"],
        "ALEXA Mini_ARRIRAW" : ["2.8K S35[2880*1620]","3.4K S35[3424*2202][OG]"],
        "ALEXA Mini_Prores 4444 XQ" : ["HD S35[From 2880*1620]","HD S16[From 1600*900]","HD S35[From 1920*2160][8:9 ANA]","2K S35[2048*1152][From 2868*1612]","2K S35[2048*858][From 2560*2145][6:5 ANA]","3.2K S35[3200*1800]","UHD S35[From 3200*1800]","2.8K S35[2880*2160][4:3]"],
        "ALEXA Mini_Prores 4444" : ["HD S35[From 2880*1620]","HD S16[From 1600*900]","HD S35[From 1920*2160][8:9 ANA]","2K S35[2048*1152][From 2868*1612]","2K S35[2048*858][From 2560*2145][6:5 ANA]","3.2K S35[3200*1800]","UHD S35[From 3200*1800]","2.8K S35[2880*2160][4:3]"],
        "ALEXA Mini_Prores 422 HQ" : ["HD S35[From 2880*1620]","HD S16[From 1600*900]","HD S35[From 1920*2160][8:9 ANA]","2K S35[2048*1152][From 2868*1612]","2K S35[2048*858][From 2560*2145][6:5 ANA]","3.2K S35[3200*1800]","UHD S35[From 3200*1800]","2.8K S35[2880*2160][4:3]"],
        "ALEXA Mini_Prores 422" : ["HD S35[From 2880*1620]","HD S16[From 1600*900]","HD S35[From 1920*2160][8:9 ANA]","2K S35[2048*1152][From 2868*1612]","2K S35[2048*858][From 2560*2145][6:5 ANA]","3.2K S35[3200*1800]","UHD S35[From 3200*1800]","2.8K S35[2880*2160][4:3]"],
        "ALEXA Mini_Prores 422 LT" : ["HD S35[From 2880*1620]","HD S16[From 1600*900]","HD S35[From 1920*2160][8:9 ANA]","2K S35[2048*1152][From 2868*1612]","2K S35[2048*858][From 2560*2145][6:5 ANA]","3.2K S35[3200*1800]","UHD S35[From 3200*1800]","2.8K S35[2880*2160][4:3]"],
        "ALEXA Mini LF_ARRIRAW" : ["4.5K LF[4448*3096][OG]","4.5K LF[4448*1856][2.39:1]","UHD LF","2.8K LF[2880*2880][1:1]","3.4K S35[3424*2202][3:2]"],
        "ALEXA Mini LF_Prores 4444 XQ" : ["4.5K LF[4448*3096][OG]","4.5K LF[4448*1856][2.39:1]","UHD LF[From 4320*2430]","HD LF[From 4320*2430]","UHD LF","HD LF[From UHD]","2K LF[2048*1152][From UHD]","2.8K LF[2880*2880][1:1]","3.2K S35[3200*1800]","2.8K S35[2880*2160][4:3]","HD S35[From 2880*1620]"],
        "ALEXA Mini LF_Prores 4444" : ["4.5K LF[4448*3096][OG]","4.5K LF[4448*1856][2.39:1]","UHD LF[From 4320*2430]","HD LF[From 4320*2430]","UHD LF","HD LF[From UHD]","2K LF[2048*1152][From UHD]","2.8K LF[2880*2880][1:1]","3.2K S35[3200*1800]","2.8K S35[2880*2160][4:3]","HD S35[From 2880*1620]"],
        "ALEXA Mini LF_Prores 422 HQ" : ["4.5K LF[4448*3096][OG]","4.5K LF[4448*1856][2.39:1]","UHD LF[From 4320*2430]","HD LF[From 4320*2430]","UHD LF","HD LF[From UHD]","2K LF[2048*1152][From UHD]","2.8K LF[2880*2880][1:1]","3.2K S35[3200*1800]","2.8K S35[2880*2160][4:3]","HD S35[From 2880*1620]"],
        "ALEXA LF_ARRIRAW" : ["4.5K LF[4448*3096][OG]","4.5K LF[4448*1856][2.39:1]","UHD LF"],
        "ALEXA LF_Prores 4444 XQ" : ["4.5K LF[4448*3096][OG]","4.5K LF[4448*1856][2.39:1]","HD LF[From UHD]","UHD LF","2K LF[2048*1152][From UHD]"],
        "ALEXA LF_Prores 4444" : ["4.5K LF[4448*3096][OG]","4.5K LF[4448*1856][2.39:1]","HD LF[From UHD]","UHD LF","2K LF[2048*1152][From UHD]"],
        "ALEXA LF_Prores 422 HQ" : ["4.5K LF[4448*3096][OG]","4.5K LF[4448*1856][2.39:1]","HD LF[From UHD]","UHD LF","2K LF[2048*1152][From UHD]"],
        "ALEXA LF_Prores 422" : ["4.5K LF[4448*3096][OG]","4.5K LF[4448*1856][2.39:1]","HD LF[From UHD]","UHD","2K LF[2048*1152][From UHD]"],
        "ALEXA 65_ARRIRAW" : ["6.5K 65mm[6560*3100][OG]","5.1K 65mm[5120*2880]","4.3K LF[4320*2880][3:2]","UHD LF","4.5K LF[4448*3096][3:2]"]
        
    ]
    
//储存卡库
    let MediaName : [String:[String]] = [
        "AMIRA" : ["CFast2.0 128GB","CFast2.0 256GB","CFast2.0 512GB"],
        "ALEXA Classic" : ["SxS Pro+ 128GB"],
        "ALEXA XT" : ["SxS Pro+ 128GB","CFast2.0 128GB","XR Capture Drive 512GB"],
        "ALEXA SXT" : ["SxS Pro+ 128GB","SxS Pro+ 256GB","CFast2.0 256GB","XR Capture Drive 512GB","SXR Capture Drive 1TB","SXR Capture Drive 2TB"],
        "ALEXA 35" : ["Compact Drive 1TB","Compact Drive 2TB"],
        "ALEXA Mini" : ["CFast2.0 128GB","CFast2.0 256GB","CFast2.0 512GB"],
        "ALEXA Mini LF" : ["Compact Drive 1TB","Compact Drive 2TB"],
        "ALEXA LF" : ["SxS Pro+ 256GB","SXR Capture Drive 1TB","SXR Capture Drive 2TB"],
        "ALEXA 65" : ["XR Capture Drive 512GB","SXR Capture Drive 1TB","SXR Capture Drive 2TB"]
        
    ]
    
//变量定义区
    @State var BrandName = "请选择品牌"
    
    @State var CameraName = "请选择机型"
    
    @State var Codec = "请选择编码"
    
    @State var Resolution = "请选择分辨率"
    
    @State var Media = "请选择储存卡"
    
    @State var Rate = "请选择帧率"
    var body: some View {
        VStack {
            
            TabView {
                
                //数据计算器模块//
                VStack{
                    
                    Spacer()
                    
                    Button("重置") {
                        BrandName = "请选择品牌"
                        CameraName = "请选择机型"
                        Codec = "请选择编码"
                        Resolution = "请选择分辨率"
                        Media = "请选择储存卡"
                        Rate = "请选择帧率"
                    }
                    
                    
                    Spacer()
                    
                    //选择器与计算功能
                    HStack{
                        
                        //选择器模块
                        VStack (spacing:10){
                            
                            
                            //品牌选择
                            Picker(selection: $BrandName, label: Text("请选择品牌").frame(width: 100,alignment: .center)) {
                                ForEach(CameraModel.keys.sorted(),id:\.self) { brand in
                                    Text(brand).tag(brand)
                                }
                            }
                            
                            //机型选择
                            if let models = CameraModel[BrandName] {
                                Picker(selection: $CameraName, label: Text("请选择机型").frame(width: 100,alignment: .center)) {
                                    ForEach(models, id:\.self) { model in
                                        Text(model).tag(model)
                                    }
                                }
                            }
                            else {
                                Picker(selection: $CameraName, label:Text("请选择机型").frame(width: 100,alignment: .center)) {
                                    Text("无选项")
                                }
                            }
                            
                            //编码选择
                            if let codec = CodecName[CameraName] {
                                Picker(selection: $Codec, label: Text("请选择编码").frame(width: 100,alignment: .center)) {
                                    ForEach(codec, id:\.self) { codecs in
                                        Text(codecs).tag(codecs)
                                    }
                                }
                            }
                            else {
                                Picker(selection: $Codec, label:Text("请选择编码").frame(width: 100,alignment: .center)) {
                                    Text("无选项")
                                }
                            }
                            
                            //分辨率选择
                            @State var CodecAndCamera = CameraName + "_" + Codec
                            
                            if let resolutions = ResolutionName[CodecAndCamera] {
                                Picker(selection: $Resolution, label: Text("请选择分辨率").frame(width: 100,alignment: .center)) {
                                    ForEach(resolutions,id:\.self) { resolution in
                                        Text(resolution).tag(resolution)
                                    }
                                }
                            }
                            else {
                                Picker(selection: $Resolution, label:Text("请选择分辨率").frame(width: 100,alignment: .center)) {
                                    Text("无选项")
                                }
                            }
                            
                            //储存卡选择
                            if let medias = MediaName[CameraName] {
                                Picker(selection: $Media, label: Text("请选择储存卡").frame(width: 100,alignment: .center)) {
                                    ForEach(medias,id:\.self) { media in
                                        Text(media).tag(media)
                                    }
                                }
                            }
                            else {
                                Picker(selection: $Media, label:Text("请选择储存卡").frame(width: 100,alignment: .center)) {
                                    Text("无选项")
                                }
                            }
                            
                            //帧率选择
                            if Media == "请选择储存卡" {
                                Picker(selection: $Rate, label:Text("请选择帧率").frame(width: 100,alignment: .center)) {
                                    Text("无选项")
                                }
                            }
                            else {
                                Picker(selection: $Rate, label: Text("请选择帧率").frame(width: 100,alignment: .center)) {
                                    ForEach(availableRates(),id:\.self) { rate in
                                        Text(rate).tag(rate)
                                    }
                                }
                            }
                            
                            
                            
                            
                            
                        }
                        .padding(.top, 20.0)
                        
                        Spacer()
                        
                        //编码乘积
                        var CodecSpeed: Double {
                            switch Codec {
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
                          switch Resolution {
                          case "HD S35[From 2880*1620]","HD S16[From 1600*900]","HD S35[From 4096*2304]","HD S35[From 1920*2160][8:9 ANA]","HD LF[From 4320*2430]","HD LF[From UHD]" :
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
                            switch CameraName {
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
                            switch CameraName {
                            case "ALEXA 35" :
                                return 1.075
                            default :
                                return 1
                            }
                        }
                        
                        //存储卡容量乘积
                        var MediaCapacity: Double {
                            switch Media {
                            case "CFast2.0 128GB","SxS Pro+ 128GB" :
                                return 128
                            case "CFast2.0 256GB","SxS Pro+ 256GB" :
                                return 256
                            case "CFast2.0 512GB","XR Capture Drive 512GB" :
                                return 512
                            case "SXR Capture Drive 1TB","Compact Drive 1TB" :
                                return 1024
                            case "SXR Capture Drive 2TB","Compact Drive 2TB" :
                                return 2048
                            default :
                                return 0
                            }
                        }
                        
                        //加入补偿的编码速度
                        
                        var CodecSpeedCount: Double {
                            switch Codec {
                            case "Prores 4444 XQ","Prores 4444","Prores 422 HQ","Prores 422","Prores 422LT" :
                                return CodecSpeed*ProresCompensation
                            case "ARRIRAW" :
                                return CodecSpeed*ARRIRAWCompensation
                            default :
                                return CodecSpeed
                            }
                        }
                        
                        
                        //数据输出区
                        VStack(alignment: .center){
                            
                        
                            
                            Text("可录制时长[Min]=\(MediaCapacity*0.931*400/3/CodecSpeedCount/ResolutionMultiplier)")
                            Text("数据码率[mbps]: \(CodecSpeedCount*ResolutionMultiplier)")
                            Text("每小时数据占盘量[TB]：\(CodecSpeedCount*ResolutionMultiplier*450/1024/1024)")
                            if Codec == "ARRIRAW" {
                                Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
                            }
                            
                                
                        }
                        .padding([.leading,.trailing],30)
                        
                        //数值监控区
//                        VStack {
//                            Text("CodecSpeed=\(CodecSpeed)")
//                            Text("ResolutionMultiplier=\(ResolutionMultiplier)")
//                            Text("MediaCapacity=\(MediaCapacity)")
//                            Text("CodecSpeedCount=\(CodecSpeedCount)")
//                        }
                        
                        
                    }
                    Spacer()
                    
                    //备注与说明区
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color.gray)
                            .frame(maxHeight: 200)
                        VStack (spacing: 1) {
                                        Text("版本说明与备注")
                                            .font(.title3)
                                            .fontWeight(.medium)
                                            .multilineTextAlignment(.center)
                                            .frame(maxWidth: .infinity,alignment:.center)
                                        Text(" ")
                                            .font(.system(size: 1))
                                        Text("1. 此版本仅包含《数据计算器》功能。")
                                            .font(.system(size: 10))
                                            .padding(.leading,10)
                                            .frame(maxWidth: .infinity,alignment:.leading)
                                        Text("2. 分辨率默认高宽比为16:9；分辨率选项中，HD指分辨率为1920x1080，UHD指分辨率为3840x2160，其中第一个后缀括号描述素材分辨率，第二个后缀括号描述采样分辨率；计算帧率均为24.000p；根据画面内容，实际数据量可能与计算不同。")
                                            .font(.system(size: 10))
                                            .padding(.leading,10)
                                            .frame(maxWidth: .infinity,alignment:.leading)
                                        Text("3. HDE为ARRI公司推出的压缩技术，用于ARRIRAW的无损压缩。REDCODE为RED公司推出的压缩RAW技术。对于ALEXA 35摄影机，Prores编码位深均为12Bit。")
                                            .font(.system(size: 10))
                                            .padding(.leading,10)
                                            .frame(maxWidth: .infinity,alignment:.leading)
                                        Text("4. ARRI摄影机相关数据来自arri.com。RED摄影机相关数据来自red.com。Prores编码相关数据来自apple.com。特别鸣谢 徐理航 对于此程序的代码设计支持。")
                                           .font(.system(size: 10))
                                           .padding(.leading,10)
                                           .frame(maxWidth: .infinity,alignment:.leading)
                                        Spacer()
                                    }
                                    .frame(maxHeight: 150)
                                    .padding([.top,.trailing],8)
                                    
                            
                        
                    }
                    .padding(.top, 31.0)
                    .padding([.leading,.trailing,.bottom],10)
                }
                
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
            .frame(minWidth: 700,minHeight: 425)
            
            
            VStack {
//参数监测区
//                    Text("\(BrandName)")
//                    Text("\(CameraName)")
//                    Text("\(Codec)")
//                    Text("\(Resolution)")
//                    Text("\(Media)")
//                    Text("\(CodecAndCamera)")
            }
        }
        .padding()
    }
   
    func availableRates() -> [String] {
        var rates = ["23.976","24.000","25.000"]
        
        
        
        
        
        
        
        return rates
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
    
}
