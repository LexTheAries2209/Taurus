//
//  PickerView.swift
//  Taurus
//
//  Created by 吴坤城 on 6/13/24.
//

import SwiftUI

struct PickerView: View {
    @ObservedObject var cameradata: CameraData
    var body: some View {
        VStack(spacing: 10) {
            // 品牌选择
            createPicker(selection: $cameradata.BrandName, label: "请选择品牌", options: CameraModel.keys.sorted())
            
            // 机型选择
            if let models = CameraModel[cameradata.BrandName] {
                createPicker(selection: $cameradata.CameraName, label: "请选择机型", options: models)
            } else {
                createPicker(selection: $cameradata.CameraName, label: "请选择机型", options: ["无选项"])
            }
            
            // 编码选择
            if let codec = CodecName[cameradata.CameraName] {
                createPicker(selection: $cameradata.Codec, label: "请选择编码", options: codec)
            } else {
                createPicker(selection: $cameradata.Codec, label: "请选择编码", options: ["无选项"])
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
    }
    private func createPicker(selection: Binding<String>, label: String, options: [String]) -> some View {
        Picker(selection: selection, label: Text(label).frame(width: 100, alignment: .center)) {
            ForEach(options, id: \.self) { option in
                Text(option).tag(option)
            }
        }
    }
}



