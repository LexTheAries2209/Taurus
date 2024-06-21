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
            //品牌选择
            createPicker(selection: $cameradata.BrandName, label: "请选择品牌", options: CameraModel.keys.sorted())
            
            //机型选择
            if let models = CameraModel[cameradata.BrandName] {
                createPicker(selection: $cameradata.CameraName, label: "请选择机型", options: models)
            } else {
                createPicker(selection: $cameradata.CameraName, label: "请选择机型", options: ["无选项"], showNoOptionText: true)
            }
            
            //编码选择
            if let codec = CodecName[cameradata.CameraName] {
                createPicker(selection: $cameradata.Codec, label: "请选择编码", options: codec)
            } else {
                createPicker(selection: $cameradata.Codec, label: "请选择编码", options: ["无选项"], showNoOptionText: true)
            }
            
            //Panasonic幅面选择
            if cameradata.BrandName == "Panasonic" {
                let formats = PanaFormat(cameradata: cameradata)
                createPicker(selection: $cameradata.Format, label: "请选择幅面", options: formats == [""] ? ["无选项"] : formats, showNoOptionText: formats == [""])
            }
            
            //分辨率选择
            createResolutionPicker()
            
            //DJI、CineAlta、CanonCinema帧率选择
            if cameradata.BrandName == "DJI" || cameradata.CameraName.contains("CineAlta") || cameradata.BrandName == "Canon Cinema"{
                createRatePicker()
            }
            
            //储存卡选择
            createMediaPicker()
            
            //ARRI、BMD、Apple、RED帧率选择
            if cameradata.BrandName == "ARRI" || cameradata.BrandName == "Blackmagicdesign" || cameradata.BrandName == "Apple" || cameradata.BrandName == "RED" {
                createRatePicker()
            }
        }
    }
    
    private func createResolutionPicker() -> some View {
            let resolutions: [String]
            
            switch cameradata.BrandName {
            case "ARRI":
                resolutions = ARRIResolution(cameradata: cameradata)
            case "RED":
                resolutions = REDResolution(cameradata: cameradata)
            case "Canon":
                resolutions = CanonResolution(cameradata: cameradata)
            case "Canon Cinema":
                resolutions = CanonCinemaResolution(cameradata: cameradata)
            case "Apple":
                resolutions = AppleResolution(cameradata: cameradata)
            case "Blackmagicdesign":
                resolutions = BMDResolution(cameradata: cameradata)
            case "SONY":
                resolutions = SonyResolution(cameradata: cameradata)
            case "Panasonic":
                resolutions = PanaResolution(cameradata: cameradata)
            case "DJI":
                resolutions = DjiResolution(cameradata: cameradata)
            default:
                resolutions = ["无选项"]
            }
            
            return createPicker(selection: $cameradata.Resolution, label: "请选择分辨率", options: resolutions, showNoOptionText: resolutions == ["无选项"])
        }
        
    private func createRatePicker() -> some View {
            let rates: [String]
            
            if cameradata.CameraName.contains("CineAlta") {
                rates = CinealtaRate(cameradata: cameradata)
            } else {
                switch cameradata.BrandName {
                case "DJI":
                    rates = DjiRate(cameradata: cameradata)
                case "Canon Cinema":
                    rates = CanonCinemaRate(cameradata: cameradata)
                case "ARRI":
                    rates = ArriRates(cameradata: cameradata)
                case "Blackmagicdesign":
                    rates = BMDRate(cameradata: cameradata)
                case "Apple":
                    rates = AppleRate(cameradata: cameradata)
                case "RED":
                    rates = DSMC3Rate(cameradata: cameradata)
                default:
                    rates = ["无选项"]
                }
            }
            
            return createPicker(selection: $cameradata.Rate, label: "请选择帧率", options: rates, showNoOptionText: rates == ["无选项"])
        }
        
        private func createMediaPicker() -> some View {
            let medias: [String]
            
            switch cameradata.BrandName {
            case "Canon":
                medias = CanonMedia(cameradata: cameradata)
            case "SONY":
                medias = SonyMedia(cameradata: cameradata)
            case "Panasonic":
                medias = PanaMedia(cameradata: cameradata)
            case "DJI":
                medias = DjiMedia(cameradata: cameradata)
            case "Canon Cinema":
                medias = CanonCinemaMedia(cameradata: cameradata)
            default:
                medias = MediaName[cameradata.CameraName] ?? ["无选项"]
            }
            
            return createPicker(selection: $cameradata.Media, label: "请选择储存卡", options: medias, showNoOptionText: medias == ["无选项"])
        }
    
    private func createPicker(selection: Binding<String>, label: String, options: [String], showNoOptionText: Bool = false) -> some View {
        Picker(selection: selection, label: Text(label).frame(width: 100, alignment: .center)) {
            if showNoOptionText {
                Text("无选项")
            } else {
                ForEach(options, id: \.self) { option in
                    Text(option).tag(option)
                }
            }
        }
    }
}



