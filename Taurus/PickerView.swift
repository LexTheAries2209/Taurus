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
    let language: AppLanguage
    private let rowWidth: CGFloat = 530
    private var pickerWidth: CGFloat {
        language == .english ? 390 : 430
    }
    private var labelWidth: CGFloat {
        language == .english ? 140 : 100
    }
    private var copy: LocalizedCopy {
        language.copy
    }

    private var brandSelection: Binding<String> {
        Binding(get: { cameradata.BrandName }, set: { cameradata.selectBrand($0) })
    }

    private var cameraSelection: Binding<String> {
        Binding(get: { cameradata.CameraName }, set: { cameradata.selectCamera($0) })
    }

    private var codecSelection: Binding<String> {
        Binding(get: { cameradata.Codec }, set: { cameradata.selectCodec($0) })
    }

    private var codecLevelSelection: Binding<String> {
        Binding(get: { cameradata.CanonCodecLevel }, set: { cameradata.selectCanonCodecLevel($0) })
    }

    private var formatSelection: Binding<String> {
        Binding(get: { cameradata.Format }, set: { cameradata.selectFormat($0) })
    }

    private var resolutionSelection: Binding<String> {
        Binding(get: { cameradata.Resolution }, set: { cameradata.selectResolution($0) })
    }

    private var rateSelection: Binding<String> {
        Binding(get: { cameradata.Rate }, set: { cameradata.selectRate($0) })
    }

    private var mediaSelection: Binding<String> {
        Binding(get: { cameradata.Media }, set: { cameradata.selectMedia($0) })
    }
    
    var body: some View {
        VStack(spacing: 10) {
            //品牌选择
            createPicker(selection: brandSelection, label: copy.selectBrand, options: CameraModel.keys.sorted(), placeholderValue: "请选择品牌")
            
            //机型选择
            if let models = CameraModel[cameradata.BrandName] {
                if cameradata.BrandName == "[General]" {
                    createPicker(selection: cameraSelection, label: copy.selectMode, options: models, placeholderValue: "请选择机型")
                } else {
                    createPicker(selection: cameraSelection, label: copy.selectCamera, options: models, placeholderValue: "请选择机型")
                }
            } else {
                createPicker(selection: cameraSelection, label: copy.selectCamera, options: ["无选项"], placeholderValue: "请选择机型", showNoOptionText: true)
            }
            
            //手动编码模式
            if cameradata.CameraName == "Manual Codec" { //手动输入码率
                HStack(spacing: 0) {
                    Text(copy.manualBitrateLabel)
                        .font(.body)
                        .frame(width: labelWidth, alignment: .center)
                        .lineLimit(1)
                    
                    Spacer()
                    
                    TextField(copy.manualBitratePlaceholder, text: $cameradata.ManualCodecSpeed)
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
                .frame(width: rowWidth, alignment: .leading)
                
                //储存卡选择
                createMediaPicker()
            }
            
            else {
                
                //编码选择
                if let codec = CodecName[cameradata.CameraName] { //选择码率
                    createPicker(selection: codecSelection, label: copy.selectCodec, options: codec, placeholderValue: "请选择编码")
                } else {
                    createPicker(selection: codecSelection, label: copy.selectCodec, options: ["无选项"], placeholderValue: "请选择编码", showNoOptionText: true)
                }
                
                //Canon Intra级别选择
                let canonCodecLevels = CanonCodecLevelOptions(cameradata: cameradata)
                if !canonCodecLevels.isEmpty {
                    createPicker(selection: codecLevelSelection, label: copy.selectCodecLevel, options: canonCodecLevels, placeholderValue: "请选择级别")
                }

                //幅面选择
                if cameradata.BrandName == "Panasonic" || cameradata.BrandName == "Fujifilm" || cameradata.BrandName == "Kinefinity" {
                    createFormatPicker()
                }
                
                //分辨率选择
                if cameradata.CameraName == "Manual Resolution" { //手动输入分辨率
                    HStack(spacing: 0) {
                        Text(copy.manualResolutionLabel)
                            .font(.body)
                            .frame(width: labelWidth, alignment: .center)
                            .lineLimit(1)
                        
                        Spacer()
                        
                        TextField(copy.widthPlaceholder, text: $cameradata.ResolutionWidth)
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
                        
                        TextField(copy.heightPlaceholder, text: $cameradata.ResolutionHeight)
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
                    .frame(width: rowWidth, alignment: .leading)
                } else {
                    createResolutionPicker()
                }
                
                //DJI、CineAlta、CanonCinema帧率选择
                if cameradata.BrandName == "DJI" || cameradata.CameraName.contains("CineAlta") || cameradata.BrandName == "Canon Cinema" || cameradata.BrandName == "Fujifilm" || cameradata.BrandName == "[General]" {
                    createRatePicker()
                }
                
                //储存卡选择
                createMediaPicker()
                
                //ARRI、BMD、Apple、RED、Kinefinity帧率选择
                if cameradata.BrandName == "ARRI" || cameradata.BrandName == "Blackmagicdesign" || cameradata.BrandName == "Apple" || cameradata.BrandName == "RED" || cameradata.BrandName == "Kinefinity" {
                    createRatePicker()
                }
            }
        }
    }
    
    private func createFormatPicker() -> some View {
        let formats: [String]
        switch cameradata.BrandName {
        case "Fujifilm":
            formats = FujiFormat(cameradata: cameradata)
        case "Kinefinity":
            formats = KinefinityFormat(cameradata: cameradata)
        default:
            formats = PanaFormat(cameradata: cameradata)
        }

        return createPicker(selection: formatSelection, label: copy.selectFormat, options: formats == [""] ? ["无选项"] : formats, placeholderValue: "请选择幅面", showNoOptionText: formats == [""])
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
        case "Fujifilm":
            resolutions = FujiResolution(cameradata: cameradata)
        case "DJI":
            resolutions = DjiResolution(cameradata: cameradata)
        case "Kinefinity":
            resolutions = KinefinityResolution(cameradata: cameradata)
        case "Nikon":
            resolutions = NikonResolution(cameradata: cameradata)
        case "[General]":
            resolutions = GeneralResolution(cameradata: cameradata)
        default:
            resolutions = ["无选项"]
        }
        if cameradata.BrandName == "Canon" || cameradata.BrandName == "SONY" || cameradata.BrandName == "Nikon" {
            return createPicker(selection: resolutionSelection, label: copy.selectResolutionFormat, options: resolutions, placeholderValue: "请选择分辨率", showNoOptionText: resolutions == ["无选项"])
        }
        else {
            return createPicker(selection: resolutionSelection, label: copy.selectResolution, options: resolutions, placeholderValue: "请选择分辨率", showNoOptionText: resolutions == ["无选项"])
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
            case "Fujifilm":
                rates = FujiRate(cameradata: cameradata)
            case "Kinefinity":
                rates = KinefinityRate(cameradata: cameradata)
            case "[General]":
                rates = GeneralRate(cameradata: cameradata)
            default:
                rates = ["无选项"]
            }
        }
        
        return createPicker(selection: rateSelection, label: copy.selectRate, options: rates, placeholderValue: "请选择帧率", showNoOptionText: rates == ["无选项"])
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
        case "Fujifilm":
            medias = FujiMedia(cameradata: cameradata)
        case "Kinefinity":
            medias = KinefinityMedia(cameradata: cameradata)
        case "Nikon":
            medias = NikonMedia(cameradata: cameradata)
        case "[General]":
            medias = GeneralMedia(cameradata: cameradata)
        default:
            medias = MediaName[cameradata.CameraName] ?? ["无选项"]
        }
        
        return createPicker(selection: mediaSelection, label: copy.selectMedia, options: medias, placeholderValue: "请选择储存卡", showNoOptionText: medias == ["无选项"])
    }
    
    private func createPicker(selection: Binding<String>, label: String, options: [String], placeholderValue: String, showNoOptionText: Bool = false) -> some View {
        HStack(spacing: 0) {
            Text(label)
                .font(.body)
                .frame(width: labelWidth, alignment: .center)
                .lineLimit(1)
            FixedWidthPopUpButton(
                selection: selection,
                options: showNoOptionText ? ["无选项"] : options,
                placeholderValue: placeholderValue,
                language: language
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
    let placeholderValue: String
    let language: AppLanguage
    
    func makeNSView(context: Context) -> NSPopUpButton {
        let button = NSPopUpButton(frame: .zero, pullsDown: false)
        button.bezelStyle = .rounded
        button.controlSize = .regular
        button.font = NSFont.systemFont(ofSize: NSFont.systemFontSize)
        button.target = context.coordinator
        button.action = #selector(Coordinator.selectionChanged(_:))
        button.setContentHuggingPriority(.defaultLow, for: .horizontal)
        button.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return button
    }
    
    func updateNSView(_ nsView: NSPopUpButton, context: Context) {
        context.coordinator.parent = self
        nsView.font = NSFont.systemFont(ofSize: NSFont.systemFontSize)
        
        nsView.removeAllItems()
        nsView.addItem(withTitle: language.copy.localizedOptionTitle(placeholderValue))
        nsView.item(at: 0)?.isEnabled = false
        nsView.addItems(withTitles: options.map { language.copy.localizedOptionTitle($0) })
        if options == ["无选项"] {
            nsView.item(at: 1)?.isEnabled = false
        }
        
        let normalizedSelection = PickerSelectionNormalizer.normalizedValue(
            current: selection,
            options: options,
            placeholder: placeholderValue
        )
        let selectedIndex = PickerSelectionNormalizer.popupIndex(
            current: normalizedSelection,
            options: options,
            placeholder: placeholderValue
        )
        nsView.selectItem(at: selectedIndex)

        if normalizedSelection != selection {
            DispatchQueue.main.async {
                let latestValue = PickerSelectionNormalizer.normalizedValue(
                    current: self.selection,
                    options: self.options,
                    placeholder: self.placeholderValue
                )
                if latestValue != self.selection {
                    self.selection = latestValue
                }
            }
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
            let selectedIndex = sender.indexOfSelectedItem
            guard let selectedValue = PickerSelectionNormalizer.optionValue(
                popupIndex: selectedIndex,
                options: parent.options
            ) else {
                parent.selection = parent.placeholderValue
                return
            }
            parent.selection = selectedValue
        }
    }
}
