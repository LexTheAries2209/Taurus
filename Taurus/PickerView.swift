//
//  PickerView.swift
//  Taurus
//
//  Created by 吴坤城 on 6/13/24.
//

import SwiftUI

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}

struct PickerView: View {
    @ObservedObject var cameradata: CameraData
    private let rowWidth: CGFloat = 405
    private let pickerWidth: CGFloat = 305
    private let labelWidth: CGFloat = 100
    
    var body: some View {
        VStack(spacing: 10) {
            //品牌选择
            createPicker(selection: $cameradata.BrandName, label: "请选择品牌", options: CameraModel.keys.sorted())
            
            //机型选择
            if let models = CameraModel[cameradata.BrandName] {
                if cameradata.BrandName == "[General]" {
                    createPicker(selection: $cameradata.CameraName, label: "请选择模式", options: models)
                } else {
                    createPicker(selection: $cameradata.CameraName, label: "请选择机型", options: models)
                }
            } else {
                createPicker(selection: $cameradata.CameraName, label: "请选择机型", options: ["无选项"], showNoOptionText: true)
            }
            
            //手动编码模式
            if cameradata.CameraName == "Manual Codec" { //手动输入码率
                HStack(alignment: .top) {
                    Text("输入码率")
                        .padding(.leading, 22)
                        .padding(.top, 2.5)
                    
                    Spacer()
                    
                    TextField("请输入码率", text: $cameradata.ManualCodecSpeed)
                        .placeholder(when: cameradata.ManualCodecSpeed.isEmpty) { //输入框提示
                            Text("").foregroundColor(.gray)
                        }
                        .frame(width: 100)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onChange(of: cameradata.ManualCodecSpeed) { newValue in
                            cameradata.ManualCodecSpeed = filterDigits(from: newValue) // 过滤掉非数字字符
                        }
                    
                    Spacer()
                }
                
                //储存卡选择
                createMediaPicker()
            }
            
            else {
                
                //编码选择
                if let codec = CodecName[cameradata.CameraName] { //选择码率
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
                if cameradata.CameraName == "Manual Resolution" { //手动输入分辨率
                    HStack(alignment: .top) {
                        Text("输入分辨率")
                            .padding(.leading, 15)
                            .padding(.top, 2.5)
                        
                        Spacer()
                        
                        TextField("请输入宽度", text: $cameradata.ResolutionWidth)
                            .placeholder(when: cameradata.ResolutionWidth.isEmpty) { //输入框提示
                                Text("").foregroundColor(.gray)
                            }
                            .frame(width: 100)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .onChange(of: cameradata.ResolutionWidth) { newValue in
                                cameradata.ResolutionWidth = filterDigits(from: newValue) // 过滤掉非数字字符
                            }
                        
                        Text("*")
                            .padding(.top, 5)
                        
                        TextField("请输入高度", text: $cameradata.ResolutionHeight)
                            .placeholder(when: cameradata.ResolutionHeight.isEmpty) { //输入框提示
                                Text("").foregroundColor(.gray)
                            }
                            .frame(width: 100)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .onChange(of: cameradata.ResolutionHeight) { newValue in
                                cameradata.ResolutionHeight = filterDigits(from: newValue) // 过滤掉非数字字符
                            }
                        
                        Spacer()
                    }
                } else {
                    createResolutionPicker()
                }
                
                //DJI、CineAlta、CanonCinema帧率选择
                if cameradata.BrandName == "DJI" || cameradata.CameraName.contains("CineAlta") || cameradata.BrandName == "Canon Cinema" || cameradata.BrandName == "[General]" {
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
        case "[General]":
            resolutions = GeneralResolution(cameradata: cameradata)
        default:
            resolutions = ["无选项"]
        }
        if cameradata.BrandName == "Canon" || cameradata.BrandName == "SONY" {
            return createPicker(selection: $cameradata.Resolution, label: "请选择格式", options: resolutions, showNoOptionText: resolutions == ["无选项"])
        }
        else {
            return createPicker(selection: $cameradata.Resolution, label: "请选择分辨率", options: resolutions, showNoOptionText: resolutions == ["无选项"])
        }
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
            case "[General]":
                rates = GeneralRate(cameradata: cameradata)
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
        case "Apple":
            medias = AppleMedia(cameradata: cameradata)
        case "[General]":
            medias = GeneralMedia(cameradata: cameradata)
        default:
            medias = MediaName[cameradata.CameraName] ?? ["无选项"]
        }
        
        return createPicker(selection: $cameradata.Media, label: "请选择储存卡", options: medias, showNoOptionText: medias == ["无选项"], autoSelectInvalid: true)
    }
    
    private func createPicker(selection: Binding<String>, label: String, options: [String], showNoOptionText: Bool = false, autoSelectInvalid: Bool = false) -> some View {
        HStack(spacing: 0) {
            Text(label)
                .frame(width: labelWidth, alignment: .center)
            FixedWidthPopUpButton(
                selection: selection,
                options: showNoOptionText ? ["无选项"] : options,
                autoSelectInvalid: autoSelectInvalid
            )
            .frame(minWidth: pickerWidth, idealWidth: pickerWidth, maxWidth: pickerWidth, alignment: .leading)
        }
        .frame(width: rowWidth, alignment: .leading)
    }
    private func filterDigits(from input: String) -> String {
        let digits = "0123456789"
        return input.filter { char in
            digits.contains(char)
        }
    }
}

struct FixedWidthPopUpButton: NSViewRepresentable {
    @Binding var selection: String
    let options: [String]
    let autoSelectInvalid: Bool
    
    func makeNSView(context: Context) -> NSPopUpButton {
        let button = NSPopUpButton(frame: .zero, pullsDown: false)
        button.bezelStyle = .rounded
        button.controlSize = .regular
        button.target = context.coordinator
        button.action = #selector(Coordinator.selectionChanged(_:))
        button.setContentHuggingPriority(.defaultLow, for: .horizontal)
        button.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return button
    }
    
    func updateNSView(_ nsView: NSPopUpButton, context: Context) {
        context.coordinator.parent = self
        
        nsView.removeAllItems()
        nsView.addItems(withTitles: options)
        
        if selection == "无选项" || options == ["无选项"] {
            nsView.select(nil)
            DispatchQueue.main.async {
                if self.selection == "无选项" {
                    self.selection = self.autoSelectInvalid ? "请选择储存卡" : ""
                }
            }
        } else if options.contains(selection) {
            nsView.selectItem(withTitle: selection)
        } else if autoSelectInvalid {
            nsView.select(nil)
            DispatchQueue.main.async {
                if !self.isPlaceholderSelection(self.selection) {
                    self.selection = self.placeholderSelection(for: self.selection)
                }
            }
        } else {
            nsView.select(nil)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject {
        var parent: FixedWidthPopUpButton
        
        init(_ parent: FixedWidthPopUpButton) {
            self.parent = parent
        }
        
        @objc func selectionChanged(_ sender: NSPopUpButton) {
            parent.selection = sender.titleOfSelectedItem ?? ""
        }
    }
    
    private func isPlaceholderSelection(_ value: String) -> Bool {
        return value.hasPrefix("请选择") || value.isEmpty || value == "无选项"
    }
    
    private func placeholderSelection(for value: String) -> String {
        if value.contains("GB") || value.contains("TB") || value.contains("SSD") || value.contains("CF") || value.contains("SD") || value.contains("SxS") || value.contains("XQD") || value.contains("AXS") || value.contains("Drive") || value.contains("Built-in") {
            return "请选择储存卡"
        }
        
        return ""
    }
}
