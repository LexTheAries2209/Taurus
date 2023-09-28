////
////  SwiftUIView.swift
////  Taurus
////
////  Created by 吴坤城 on 7/27/23.
////
//
//import SwiftUI
//
//struct SwiftUIView: View {
//    
//    let CameraModel : [String:[String]] = [
//        "ARRI" : ["AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA 35","ALEXA Mini","ALEXA Mini LF","ALEXA LF","ALEXA 65"],
//        "RED" : ["DRAGON","GEMINI"],
//        "SONY" : ["CineAlta V2","CineAlta V","FX9","FX6","FX3","A7S3","A7M4","FX30"]
//    ]
//    
//    let CodecAndResolution : [String:[String:[String]]] = [
//        "AMIRA" : ["ARRIRAW":["2.8k[2880*1620]"],"Prores 4444 XQ":["HD[From 2880*1620]","HD S16[From 1600*900]","2k[2048*1152][From 2868*1612]","3.2k[3200*1800]","UHD[From 3200*1800]"],"Prores 4444":["HD[From 2880*1620]","HD S16[From 1600*900]","2k[2048*1152][From 2868*1612]","3.2k[3200*1800]","UHD[From 3200*1800]"],"Prores 422 HQ":["HD[From 2880*1620]","HD S16[From 1600*900]","2k[2048*1152][From 2868*1612]","3.2k[3200*1800]","UHD[From 3200*1800]"],"Prores 422":["HD[From 2880*1620]","HD S16[From 1600*900]","2k[2048*1152][From 2868*1612]","3.2k[3200*1800]","UHD[From 3200*1800]"],"Prores 422 LT":["HD[From 2880*1620]","HD S16[From 1600*900]","2k[2048*1152][From 2868*1612]","3.2k[3200*1800]","UHD[From 3200*1800]"],"MPEG-2 HD 422":["HD[From 2880*1620]"]],
//        "ALEXA Classic" : ["Prores 4444":["HD[From 2880*1620]","2k[2048*1152][From 2868*1614]","2k[2048*1536][From 2868*2152][4:3]"],"Prores 422 HQ":["HD[From 2880*1620]","2k[2048*1152][From 2868*1614]","2k[2048*1536][From 2868*2152][4:3]"],"Prores 422":["HD[From 2880*1620]","2k[2048*1152][From 2868*1614]","2k[2048*1536][From 2868*2152][4:3]"]],
//        "ALEXA XT" : ["ARRIRAW":["2.8k[2880*1620]","2.6k[2880*1620][6:5]","2.8k[2880*2160][4:3]","3.4k[3424*2202][OG]"],"Prores 4444XQ":["HD[From 2880*1620]","2k[2048*1152][From 2868*1614]","2k[2048*1536][From 2868*2152][4:3]","3.2k[3200*1782][From 3168*1782]"],"Prores 4444":["HD[From 2880*1620]","2k[2048*1152][From 2868*1614]","2k[2048*1536][From 2868*2152][4:3]","3.2k[3200*1782][From 3168*1782]"],"Prores 422 HQ":["HD[From 2880*1620]","2k[2048*1152][From 2868*1614]","2k[2048*1536][From 2868*2152][4:3]","3.2k[3200*1782][From 3168*1782]"],"Prores 422":["HD[From 2880*1620]","2k[2048*1152][From 2868*1614]","2k[2048*1536][From 2868*2152][4:3]","3.2k[3200*1782][From 3168*1782]"]],
//        
//    ]
//    
//    
//    
//    @State var BrandName = "请选择品牌"
//    
//    @State var CameraName = "请选择机型"
//    
//    @State var Codec = "请选择编码"
//    
//    @State var Resolution = "请选择分辨率"
//    var body: some View {
//        VStack {
//            
//            
//            TabView {
//                Text("数据计算器")
//                    .tabItem {
//                        Text("数据计算器")
//                    }
//                
//                Text("阵列配置台")
//                    .tabItem {
//                        Text("阵列配置台")
//                    }
//                
//                Text("录制格式速查")
//                    .tabItem {
//                        Text("录制格式速查")
//                    }
//                
//                Text("像场覆盖图")
//                    .tabItem {
//                        Text("像场覆盖图")
//                    }
//            }
//            .frame(minWidth: 400,minHeight: 200)
//            
//            VStack {
//                
//                
//                Picker(selection: $BrandName, label: Text("请选择品牌")) {
//                    ForEach(CameraModel.keys.sorted(),id:\.self) { brand n
//                        Text(brand).tag(brand)
//                    }
//                }
//                
//                if let models = CameraModel[BrandName] {
//                    Picker(selection: $CameraName, label: Text("请选择机型")) {
//                        ForEach(models, id:\.self) { model in
//                            Text(model).tag(model)
//                        }
//                    }
//                }
//                else {
//                    Picker(selection: $CameraName, label:Text("请选择机型")) {
//                        Text("无选项")
//                    }
//                }
//            }
//            
//        
//            let CameraName = CameraModel."ARRI".(0)
//            print Text(CameraName)
//            
//            
//            
//            
//            
//            
//                Text("\(BrandName)")
//                Text("\(CameraName)")
//                Text("\(Codec)")
//                Text("\(Resolution)")
//            
//            
//           
//        }
//        .padding()
//        }
//    }
//
//
//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftUIView()
//    }
//}


//数据计算模块
//                        VStack(spacing: 8){
//
//
//                            switch Resolution {
//                            case "HD[From 2880*1620]","HD S16[From 1600*900]","HD[From 4096*2304]","HD[From 1920*2160][ANA]","HD[From 4320*2430]","HD S35[From 2880*1620]","HD[From UHD]":
//                                let ResolutionMultiplier:Double = 1
//                                switch Codec {
//                                case "Prores 4444 XQ" :
//                                    let CodecSpeed:Double = 400
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    default :
//                                        Text("请选择以计算容量:HD,XQ")
//                                    }
//
//                                case "Prores 4444" :
//                                    let CodecSpeed:Double = 264
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    default :
//                                        Text("请选择以计算容量:HD,4444")
//                                    }
//
//                                case "Prores 422 HQ" :
//                                    let CodecSpeed:Double = 176
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    default :
//                                        Text("请选择以计算容量:HD,HQ")
//                                    }
//
//                                case "Prores 422" :
//                                    let CodecSpeed:Double = 117.6
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    default :
//                                        Text("请选择以计算容量:HD,422")
//                                    }
//
//                                case "Prores 422 LT" :
//                                    let CodecSpeed:Double = 81.2
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    default :
//                                        Text("请选择以计算容量:HD,LT")
//                                    }
//                                default :
//                                    Text("ERROR:HD")
//                                }
//
//
//
//                            case "2K[2048*1152][From 2868*1614]","2K[2048*1152][From 2868*1612]","2K[2048*1152][From 2096*2304]","2K[2048*1152][From UHD]","2K S16[2048*1152]":
//                                let ResolutionMultiplier:Double = 1.14
//                                switch Codec {
//                                case "Prores 4444 XQ" :
//                                    let CodecSpeed:Double = 400
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    default :
//                                        Text("请选择以计算容量:2K_16:9,XQ")
//                                    }
//
//                                case "Prores 4444" :
//                                    let CodecSpeed:Double = 264
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    default :
//                                        Text("请选择以计算容量:2K_16:9,4444")
//                                    }
//
//                                case "Prores 422 HQ" :
//                                    let CodecSpeed:Double = 176
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    default :
//                                        Text("请选择以计算容量:2K_16:9,HQ")
//                                    }
//
//                                case "Prores 422" :
//                                    let CodecSpeed:Double = 117.6
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    default :
//                                        Text("请选择以计算容量:2K_16:9,422")
//                                    }
//
//                                case "Prores 422 LT" :
//                                    let CodecSpeed:Double = 81.2
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    default :
//                                        Text("请选择以计算容量:2K_16:9,LT")
//                                    }
//                                default :
//                                    Text("ERROR:2K")
//                                }
//
//
//                            case "2K[2048*858][From 2560*2146][ANA]","2K[2048*858][From 2560*2145][ANA]":
//                                let ResolutionMultiplier:Double = 0.85
//                                switch Codec {
//                                case "Prores 4444 XQ" :
//                                    let CodecSpeed:Double = 400
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量:2K 2.39:1,XQ")
//                                    }
//
//                                case "Prores 4444" :
//                                    let CodecSpeed:Double = 264
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量:2K 2.39:1,4444")
//                                    }
//
//                                case "Prores 422 HQ" :
//                                    let CodecSpeed:Double = 176
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量:2K 2.39:1,HQ")
//                                    }
//
//                                case "Prores 422" :
//                                    let CodecSpeed:Double = 117.6
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量:2K 2.39:1,422")
//                                    }
//
//                                case "Prores 422 LT" :
//                                    let CodecSpeed:Double = 81.2
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量:2K 2.39:1,LT")
//                                    }
//                                default :
//                                    Text("ERROR:2K 2.39:1")
//                                }
//
//
//                            case "2K[2048*1536][From 2868*2152][4:3]":
//                                let ResolutionMultiplier:Double = 1.5
//                                switch Codec {
//                                case "Prores 4444 XQ" :
//                                    let CodecSpeed:Double = 400
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量:2K 4:3,XQ")
//                                    }
//
//                                case "Prores 4444" :
//                                    let CodecSpeed:Double = 264
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量:2K 4:3,4444")
//                                    }
//
//                                case "Prores 422 HQ" :
//                                    let CodecSpeed:Double = 176
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量:2K 4:3,HQ")
//                                    }
//
//                                case "Prores 422" :
//                                    let CodecSpeed:Double = 117.6
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量:2K 4:3,422")
//                                    }
//
//                                default :
//                                    Text("ERROR:2K 4:3")
//                                }
//
//
//                            case "2.8K[2880*1620]":
//                                let ResolutionMultiplier:Double = 2.25
//                                switch Codec {
//                                case "ARRIRAW" :
//                                    let CodecSpeed:Double = 600
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                            Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                            Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                            Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                            Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                            Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量:2K_16:9,ARRIRAW")
//                                    }
//                                default :
//                                    Text("ERROR:2.8K")
//                                }
//
//
//                            case "2.6K[2578*2160][6:5]","2.6K[2578*2160][From 2592*2160][6:5]":
//                                let ResolutionMultiplier:Double = 2.69
//                                switch Codec {
//                                case "ARRIRAW" :
//                                    let CodecSpeed:Double = 600
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                            Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                            Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                            Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                            Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                            Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量:2.8K,ARRIRAW")
//                                    }
//                                default :
//                                    Text("ERROR:2.6K 6:5")
//                                }
//
//
//                            case "3.2K[3200*1800]","3.2K[3200*1782][From 3168*1782]","3.2K S35[3200*1800]":
//                                let ResolutionMultiplier:Double = 2.77
//                                switch Codec {
//                                case "ARRIRAW" :
//                                    let CodecSpeed:Double = 600
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量:3.2K,ARRIRAW")
//                                    }
//                                case "Prores 4444 XQ" :
//                                    let CodecSpeed:Double = 400
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    default :
//                                        Text("请选择以计算容量:3.2K,XQ")
//                                    }
//
//                                case "Prores 4444" :
//                                    let CodecSpeed:Double = 264
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    default :
//                                        Text("请选择以计算容量:3.2K,4444")
//                                    }
//
//                                case "Prores 422 HQ" :
//                                    let CodecSpeed:Double = 176
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    default :
//                                        Text("请选择以计算容量:3.2K,HQ")
//                                    }
//
//                                case "Prores 422" :
//                                    let CodecSpeed:Double = 117.6
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    default :
//                                        Text("请选择以计算容量:3.2K,422")
//                                    }
//
//                                case "Prores 422 LT" :
//                                    let CodecSpeed:Double = 81.2
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    default :
//                                        Text("请选择以计算容量:3.2K,LT")
//                                    }
//                                default :
//                                    Text("ERROR:3.2K")
//                                }
//
//
//                            case "2.8K[2880*2160][4:3]","2.8K[2944*2160][From 2880*2160][4:3]","2.8K S35[2880*2160][4:3]","2.8K S35[3072*2160][From 2880*2160][4:3]":
//                                let ResolutionMultiplier:Double = 3
//                                switch Codec {
//                                case "ARRIRAW" :
//                                    let CodecSpeed:Double = 600
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量:2.8K,ARRIRAW")
//                                    }
//                                case "Prores 4444 XQ" :
//                                    let CodecSpeed:Double = 400
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    default :
//                                        Text("请选择以计算容量:2.8K,XQ")
//                                    }
//
//                                case "Prores 4444" :
//                                    let CodecSpeed:Double = 264
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    default :
//                                        Text("请选择以计算容量:2.8K,4444")
//                                    }
//
//                                case "Prores 422 HQ" :
//                                    let CodecSpeed:Double = 176
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    default :
//                                        Text("请选择以计算容量:2.8K,HQ")
//                                    }
//
//                                case "Prores 422" :
//                                    let CodecSpeed:Double = 117.6
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    default :
//                                        Text("请选择以计算容量:2.8K,422")
//                                    }
//
//                                case "Prores 422 LT" :
//                                    let CodecSpeed:Double = 81.2
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    default :
//                                        Text("请选择以计算容量:2.8K,LT")
//                                    }
//                                default :
//                                    Text("请选择以计算容量:2.8K")
//                                }
//
//
//                            case "4K[4096*1716][From 2560*2146][ANA]","4K[4096*1716][From 3328*2790][ANA]":
//                                let ResolutionMultiplier:Double = 3.39
//                                switch Codec {
//                                case "Prores 4444 XQ" :
//                                    let CodecSpeed:Double = 400
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    default :
//                                        Text("请选择以计算容量:4k 2.39:1,XQ")
//                                    }
//
//                                case "Prores 4444" :
//                                    let CodecSpeed:Double = 264
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    default :
//                                        Text("请选择以计算容量:4k 2.39:1,4444")
//                                    }
//
//                                case "Prores 422 HQ" :
//                                    let CodecSpeed:Double = 176
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    default :
//                                        Text("请选择以计算容量:4k 2.39:1,HQ")
//                                    }
//
//                                case "Prores 422" :
//                                    let CodecSpeed:Double = 117.6
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    default :
//                                        Text("请选择以计算容量:4k 2.39:1,422")
//                                    }
//                                default :
//                                    Text("ERROR:4k 2.39:1")
//                                }
//
//
//                            case "3.8K[3840*1920][From 3072*3072][ANA]":
//                                let ResolutionMultiplier:Double = 3.56
//                                switch Codec {
//                                case "Prores 4444 XQ" :
//                                    let CodecSpeed:Double = 400
//                                    switch Media {
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量:3.8K,XQ")
//                                    }
//                                case "Prores 4444" :
//                                    let CodecSpeed:Double = 264
//                                    switch Media {
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                    default :
//                                        Text("3.8K,4444")
//                                    }
//                                case "Prores 422 HQ" :
//                                    let CodecSpeed:Double = 176
//                                    switch Media {
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量：3.8K,HQ")
//                                    }
//                                default :
//                                    Text("ERROR:3.8K")
//                                }
//
//
//                            case "3.4K[3424*2202][OG]","3.4K[3424*2202][From 2880*2160][4:3]","3.4K[3424*2202][From 1920*2160][ANA]","3.4K[3424*2202][From 2560*2145][ANA]","3.4K S35[3424*2202][3:2]":
//                                let ResolutionMultiplier:Double = 3.64
//                                switch Codec {
//                                case "ARRIRAW" :
//                                    let CodecSpeed:Double = 600
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                            Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                            Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                            Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                            Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                            Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量:3.4K OG,ARRIRAW")
//                                    }
//                                default :
//                                    Text("ERROR:3.4K OG")
//                                }
//
//
//                            case "3.4K[3456*2202][From 3424*2202][OG]":
//                                let ResolutionMultiplier:Double = 3.64
//                                switch Codec {
//                                case "Prores 4444 XQ" :
//                                    let CodecSpeed:Double = 400
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量:3.4K,XQ")
//                                    }
//
//                                case "Prores 4444" :
//                                    let CodecSpeed:Double = 264
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量:3.4K,4444")
//                                    }
//
//                                case "Prores 422 HQ" :
//                                    let CodecSpeed:Double = 176
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量:3.4K,HQ")
//                                    }
//
//                                case "Prores 422" :
//                                    let CodecSpeed:Double = 117.6
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量:3.4K,422")
//                                    }
//                                default :
//                                    Text("ERROR:3.4K")
//                                }
//
//
//                            case "2.8K[2880*2880][1:1]","UHD","UHD[From 3200*1800]","UHD[From 4096*2304]","UHD[From 2742*3086][ANA]","UHD[From 4320*2430]","4.5K[4448*1856][2.39:1]","4K[4096*2048][2:1]":
//                                let ResolutionMultiplier:Double = 4
//                                switch Codec {
//                                case "ARRIRAW" :
//                                    let CodecSpeed:Double = 600
//                                    switch Media {
//                                    case "SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    case "XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量:UHD,ARRIRAW")
//                                    }
//                                case "Prores 4444 XQ" :
//                                    let CodecSpeed:Double = 400
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    default :
//                                        Text("请选择以计算容量:UHD,XQ")
//                                    }
//
//                                case "Prores 4444" :
//                                    let CodecSpeed:Double = 264
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    default :
//                                        Text("请选择以计算容量:UHD,4444")
//                                    }
//
//                                case "Prores 422 HQ" :
//                                    let CodecSpeed:Double = 176
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    default :
//                                        Text("请选择以计算容量:UHD,HQ")
//                                    }
//
//                                case "Prores 422" :
//                                    let CodecSpeed:Double = 117.6
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    default :
//                                        Text("请选择以计算容量:UHD,422")
//                                    }
//
//                                case "Prores 422 LT" :
//                                    let CodecSpeed:Double = 81.2
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    default :
//                                        Text("请选择以计算容量:UHD,LT")
//                                    }
//                                default :
//                                    Text("ERROR:UHD")
//                                }
//
//
//                            case "3.3K[3328*2790][6:5]":
//                                let ResolutionMultiplier:Double = 4.48
//                                switch Codec {
//                                case "ARRIRAW" :
//                                    let CodecSpeed:Double = 600
//                                    switch Media {
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量:3.3K,ARRIRAW")
//                                    }
//                                case "Prores 4444 XQ" :
//                                    let CodecSpeed:Double = 400
//                                    switch Media {
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量:3.3K,XQ")
//                                    }
//                                case "Prores 4444" :
//                                    let CodecSpeed:Double = 264
//                                    switch Media {
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                    default :
//                                        Text("3.3K,4444")
//                                    }
//                                case "Prores 422 HQ" :
//                                    let CodecSpeed:Double = 176
//                                    switch Media {
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量：3.3K,HQ")
//                                    }
//                                default :
//                                    Text("ERROR:3.3K")
//                                }
//
//
//                            case "4K[4096*2304]","3K[3072*3072][1:1]","4K[4096*2304][From 4608*2592]":
//                                let ResolutionMultiplier:Double = 4.55
//                                switch Codec {
//                                case "ARRIRAW" :
//                                    let CodecSpeed:Double = 600
//                                    switch Media {
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量:4K 16:9,ARRIRAW")
//                                    }
//                                case "Prores 4444 XQ" :
//                                    let CodecSpeed:Double = 400
//                                    switch Media {
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量:4K 16:9,XQ")
//                                    }
//                                case "Prores 4444" :
//                                    let CodecSpeed:Double = 264
//                                    switch Media {
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                    default :
//                                        Text("4K 16:9,4444")
//                                    }
//                                case "Prores 422 HQ" :
//                                    let CodecSpeed:Double = 176
//                                    switch Media {
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量：4K 16:9,HQ")
//                                    }
//                                default :
//                                    Text("ERROR:4K 16:9")
//                                }
//
//
//                            case "4K[4096*2636][From 3414*2198][CineOG]":
//                                let ResolutionMultiplier:Double = 5.2
//                                switch Codec {
//                                case "Prores 4444 XQ" :
//                                    let CodecSpeed:Double = 400
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量:CineOG,XQ")
//                                    }
//
//                                case "Prores 4444" :
//                                    let CodecSpeed:Double = 264
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量:CineOG,4444")
//                                    }
//
//                                case "Prores 422 HQ" :
//                                    let CodecSpeed:Double = 176
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量:CineOG,HQ")
//                                    }
//
//                                case "Prores 422" :
//                                    let CodecSpeed:Double = 117.6
//                                    switch Media {
//                                    case "CFast2.0 128GB","SxS Pro+ 128GB" :
//                                        let MediaCapacity:Double = 128
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        let ProresCompensation:Double = 1.125
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量:CineOG,422")
//                                    }
//                                default :
//                                    Text("ERROR:CineOG")
//                                }
//
//
//                            case "4.6K[4608*2592]":
//                                let ResolutionMultiplier:Double = 5.76
//                                switch Codec {
//                                case "ARRIRAW" :
//                                    let CodecSpeed:Double = 600
//                                    switch Media {
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                            Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                            Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量:4.6K 16:9,ARRIRAW")
//                                    }
//                                default :
//                                    Text("ERROR:4.6K 16:9")
//                                }
//
//
//                            case "4.3K[4320*2880][4:3]":
//                                let ResolutionMultiplier:Double = 6
//                                switch Codec {
//                                case "ARRIRAW" :
//                                    let CodecSpeed:Double = 600
//                                    switch Media {
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                            Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                            Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                            Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量:4.3K,ARRIRAW")
//                                    }
//                                default :
//                                    Text("ERROR:4.3K")
//                                }
//
//
//                            case "4.5K[4448*3096][OG]","4.5K[4480*3096][From 4448*3096][OG]":
//                                let ResolutionMultiplier:Double = 6.64
//                                switch Codec {
//                                case "ARRIRAW" :
//                                    let CodecSpeed:Double = 600
//                                    switch Media {
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                            Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                            Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量:4.5K,ARRIRAW")
//                                    }
//                                case "Prores 4444 XQ" :
//                                    let CodecSpeed:Double = 400
//                                    switch Media {
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    default :
//                                        Text("请选择以计算容量:4.5K,XQ")
//                                    }
//
//                                case "Prores 4444" :
//                                    let CodecSpeed:Double = 264
//                                    switch Media {
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    default :
//                                        Text("请选择以计算容量:4.5K,4444")
//                                    }
//
//                                case "Prores 422 HQ" :
//                                    let CodecSpeed:Double = 176
//                                    switch Media {
//                                    case "CFast2.0 256GB","SxS Pro+ 256GB" :
//                                        let MediaCapacity:Double = 256
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        switch CameraName {
//                                        case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF":
//                                            let ProresCompensation:Double = 1.125
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ProresCompensation/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ProresCompensation*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ProresCompensation*ResolutionMultiplier*450/1024/1024)")
//                                        default:
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        }
//                                    default :
//                                        Text("请选择以计算容量:4.5K,HQ")
//                                    }
//                                default :
//                                    Text("ERROR:4.5K")
//                                }
//
//
//                            case "4.6K[4608*3164][3:2][OG]":
//                                let ResolutionMultiplier:Double = 7
//                                switch Codec {
//                                case "ARRIRAW" :
//                                    let CodecSpeed:Double = 600
//                                    switch Media {
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                        Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量:4.6K OG,ARRIRAW")
//                                    }
//                                case "Prores 4444 XQ" :
//                                    let CodecSpeed:Double = 400
//                                    switch Media {
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量:4.6K OG,XQ")
//                                    }
//                                case "Prores 4444" :
//                                    let CodecSpeed:Double = 264
//                                    switch Media {
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                    default :
//                                        Text("4.6K OG,4444")
//                                    }
//                                case "Prores 422 HQ" :
//                                    let CodecSpeed:Double = 176
//                                    switch Media {
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                        Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                        Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                        Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量：4.6K OG,HQ")
//                                    }
//                                default :
//                                    Text("ERROR:4.6K OG")
//                                }
//
//
//                            case "5.1K 65mm[5120*2880]":
//                                let ResolutionMultiplier:Double = 7.11
//                                switch Codec {
//                                case "ARRIRAW" :
//                                    let CodecSpeed:Double = 600
//                                    switch Media {
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                            Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                            Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                            Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量:5.1K,ARRIRAW")
//                                    }
//                                default :
//                                    Text("ERROR:5.1K")
//                                }
//
//
//                            case "6.5K 65mm[6560*3100][OG]":
//                                let ResolutionMultiplier:Double = 9.8
//                                switch Codec {
//                                case "ARRIRAW" :
//                                    let CodecSpeed:Double = 600
//                                    switch Media {
//                                    case "CFast2.0 512GB","XR Capture Drive 512GB" :
//                                        let MediaCapacity:Double = 512
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                            Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    case "SXR Capture Drive 1TB","Compact Drive 1TB" :
//                                        let MediaCapacity:Double = 1024
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                            Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    case "SXR Capture Drive 2TB","Compact Drive 2TB" :
//                                        let MediaCapacity:Double = 2048
//                                            Text("可录制时长[Min]：\(MediaCapacity*0.931*400/3/CodecSpeed/ResolutionMultiplier)")
//                                            Text("数据码率[mbps]: \(CodecSpeed*ResolutionMultiplier)")
//                                            Text("每小时数据占盘量[TB]：\(CodecSpeed*ResolutionMultiplier*450/1024/1024)")
//                                            Text("每小时数据占盘量[TB][HDE]：\(CodecSpeed*ResolutionMultiplier*270/1024/1024)")
//                                    default :
//                                        Text("请选择以计算容量:6.5K OG,ARRIRAW")
//                                    }
//                                default :
//                                    Text("ERROR:6.5K OG")
//                                }
//                            default :
//                                Text("请选择以计算容量")
//                            }
//
//                        }
