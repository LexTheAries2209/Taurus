//
//  Localization.swift
//  Taurus
//
//  Created by Codex on 7/8/26.
//

import Foundation

enum AppLanguage: String, CaseIterable, Identifiable {
    case chinese = "zh-Hans"
    case english = "en"

    var id: String { rawValue }

    var toggleTitle: String {
        switch self {
        case .chinese: return "中"
        case .english: return "EN"
        }
    }

    var copy: LocalizedCopy {
        LocalizedCopy(language: self)
    }
}

struct LocalizedCopy {
    let language: AppLanguage

    var calculatorTitle: String {
        switch language {
        case .chinese: return "数据计算器"
        case .english: return "Data Calculator"
        }
    }

    var resetButton: String {
        switch language {
        case .chinese: return "重置"
        case .english: return "Reset"
        }
    }

    var screenshotButton: String {
        switch language {
        case .chinese: return "截图"
        case .english: return "Screenshot"
        }
    }

    var languageControlHelp: String {
        switch language {
        case .chinese: return "语言"
        case .english: return "Language"
        }
    }

    var screenshotErrorTitle: String {
        switch language {
        case .chinese: return "截图失败"
        case .english: return "Screenshot Failed"
        }
    }

    var screenshotErrorNoWindow: String {
        switch language {
        case .chinese: return "没有找到当前窗口，无法截图。"
        case .english: return "The current window could not be found."
        }
    }

    var okButton: String {
        switch language {
        case .chinese: return "好"
        case .english: return "OK"
        }
    }

    var saveScreenshotTitle: String {
        switch language {
        case .chinese: return "保存截图"
        case .english: return "Save Screenshot"
        }
    }

    var missingContentViewError: String {
        switch language {
        case .chinese: return "没有找到可截图的窗口内容。"
        case .english: return "No window content was available to capture."
        }
    }

    var emptyContentError: String {
        switch language {
        case .chinese: return "当前窗口内容为空，无法生成截图。"
        case .english: return "The current window content is empty."
        }
    }

    var renderFailedError: String {
        switch language {
        case .chinese: return "截图渲染失败，请稍后再试。"
        case .english: return "The screenshot could not be rendered. Please try again."
        }
    }

    var selectBrand: String {
        switch language {
        case .chinese: return "请选择品牌"
        case .english: return "Select Brand"
        }
    }

    var selectMode: String {
        switch language {
        case .chinese: return "请选择模式"
        case .english: return "Select Mode"
        }
    }

    var selectCamera: String {
        switch language {
        case .chinese: return "请选择机型"
        case .english: return "Select Camera"
        }
    }

    var selectCodec: String {
        switch language {
        case .chinese: return "请选择编码"
        case .english: return "Select Codec"
        }
    }

    var selectCodecLevel: String {
        switch language {
        case .chinese: return "请选择级别"
        case .english: return "Select Level"
        }
    }

    var selectFormat: String {
        switch language {
        case .chinese: return "请选择幅面"
        case .english: return "Select Format"
        }
    }

    var selectResolution: String {
        switch language {
        case .chinese: return "请选择分辨率"
        case .english: return "Select Resolution"
        }
    }

    var selectResolutionFormat: String {
        switch language {
        case .chinese: return "请选择格式"
        case .english: return "Select Format"
        }
    }

    var selectRate: String {
        switch language {
        case .chinese: return "请选择帧率"
        case .english: return "Select Frame Rate"
        }
    }

    var selectMedia: String {
        switch language {
        case .chinese: return "请选择储存卡"
        case .english: return "Select Media"
        }
    }

    var manualBitrateLabel: String {
        switch language {
        case .chinese: return "输入码率"
        case .english: return "Enter Bitrate"
        }
    }

    var manualBitratePlaceholder: String {
        switch language {
        case .chinese: return "请输入码率"
        case .english: return "Bitrate"
        }
    }

    var manualResolutionLabel: String {
        switch language {
        case .chinese: return "输入分辨率"
        case .english: return "Enter Resolution"
        }
    }

    var widthPlaceholder: String {
        switch language {
        case .chinese: return "请输入宽度"
        case .english: return "Width"
        }
    }

    var heightPlaceholder: String {
        switch language {
        case .chinese: return "请输入高度"
        case .english: return "Height"
        }
    }

    var noOption: String {
        switch language {
        case .chinese: return "无选项"
        case .english: return "No Options"
        }
    }

    var commentsTitle: String {
        switch language {
        case .chinese: return "版本说明与备注"
        case .english: return "Version Notes"
        }
    }

    func outputLabels(includeHDE: Bool) -> [String] {
        var labels: [String]
        switch language {
        case .chinese:
            labels = [
                "可录制时长[Min]:",
                "数据码率[mbps]:",
                "数据码率[MBps]:",
                "每小时数据占盘量[GB]:"
            ]
            if includeHDE {
                labels.append("每小时数据占盘量[GB][HDE]:")
            }
        case .english:
            labels = [
                "Record Time [Min]:",
                "Data Rate [mbps]:",
                "Data Rate [MBps]:",
                "Data per Hour [GB]:"
            ]
            if includeHDE {
                labels.append("Data per Hour [GB][HDE]:")
            }
        }
        return labels
    }

    func incompleteCalculationMessage(missing fields: Set<SelectionField>) -> String {
        let names = orderedSelectionFields
            .filter(fields.contains)
            .map(selectionFieldTitle)
            .joined(separator: language == .chinese ? "、" : ", ")

        switch language {
        case .chinese:
            return "请完成选择：\(names)"
        case .english:
            return "Complete the following: \(names)"
        }
    }

    func unsupportedCalculationMessage(_ issue: CalculationIssue) -> String {
        switch (language, issue) {
        case (.chinese, .noMatchingRule):
            return "当前组合没有可用的计算规则。"
        case (.english, .noMatchingRule):
            return "No calculation rule is available for this combination."
        case (.chinese, .invalidManualBitrate):
            return "请输入大于 0 的有效码率。"
        case (.english, .invalidManualBitrate):
            return "Enter a valid bitrate greater than zero."
        case (.chinese, .invalidManualResolution):
            return "请输入大于 0 的有效宽度和高度。"
        case (.english, .invalidManualResolution):
            return "Enter valid width and height values greater than zero."
        case (.chinese, .nonFiniteResult):
            return "计算结果无效，请检查当前选择。"
        case (.english, .nonFiniteResult):
            return "The calculation result is invalid. Check the current selections."
        }
    }

    private var orderedSelectionFields: [SelectionField] {
        [
            .brand,
            .camera,
            .codec,
            .codecLevel,
            .format,
            .resolution,
            .frameRate,
            .media,
            .manualBitrate,
            .manualWidth,
            .manualHeight
        ]
    }

    private func selectionFieldTitle(_ field: SelectionField) -> String {
        switch (language, field) {
        case (.chinese, .brand): return "品牌"
        case (.english, .brand): return "brand"
        case (.chinese, .camera): return "机型"
        case (.english, .camera): return "camera"
        case (.chinese, .codec): return "编码"
        case (.english, .codec): return "codec"
        case (.chinese, .codecLevel): return "编码级别"
        case (.english, .codecLevel): return "codec level"
        case (.chinese, .format): return "幅面"
        case (.english, .format): return "format"
        case (.chinese, .resolution): return "分辨率"
        case (.english, .resolution): return "resolution"
        case (.chinese, .frameRate): return "帧率"
        case (.english, .frameRate): return "frame rate"
        case (.chinese, .media): return "储存卡"
        case (.english, .media): return "media"
        case (.chinese, .manualBitrate): return "手动码率"
        case (.english, .manualBitrate): return "manual bitrate"
        case (.chinese, .manualWidth): return "宽度"
        case (.english, .manualWidth): return "width"
        case (.chinese, .manualHeight): return "高度"
        case (.english, .manualHeight): return "height"
        }
    }

    func localizedOptionTitle(_ rawValue: String) -> String {
        switch rawValue {
        case CameraSelectionStore.brandPlaceholder:
            return selectBrand
        case CameraSelectionStore.cameraPlaceholder:
            return selectCamera
        case CameraSelectionStore.codecPlaceholder:
            return selectCodec
        case CameraSelectionStore.codecLevelPlaceholder:
            return selectCodecLevel
        case CameraSelectionStore.formatPlaceholder:
            return selectFormat
        case CameraSelectionStore.resolutionPlaceholder:
            return selectResolution
        case CameraSelectionStore.frameRatePlaceholder:
            return selectRate
        case CameraSelectionStore.mediaPlaceholder:
            return selectMedia
        case "无选项":
            return noOption
        case "储存卡速度不足以录制该格式":
            switch language {
            case .chinese: return rawValue
            case .english: return "Media speed is too slow for this format"
            }
        case "该储存卡无法在此机型录制ARRIRAW":
            switch language {
            case .chinese: return rawValue
            case .english: return "This media cannot record ARRIRAW on this camera"
            }
        case "此存储卡只能录制ProRes编码":
            switch language {
            case .chinese: return rawValue
            case .english: return "This media can only record ProRes"
            }
        default:
            return rawValue
        }
    }

    func comments(for brandName: String, cameraName: String) -> [String] {
        switch language {
        case .chinese:
            return chineseComments(for: brandName, cameraName: cameraName)
        case .english:
            return englishComments(for: brandName, cameraName: cameraName)
        }
    }

    private func chineseComments(for brandName: String, cameraName: String) -> [String] {
        var lines = ["1. 当前版本为[V2.0.1]。摄影机规格参数数据截止至2026.07.06。计算结果仅供参考，实际数据量可能与计算不同。"]

        switch brandName {
        case "ARRI":
            lines.append("2. 默认宽高比为16:9；FHD指分辨率1920x1080；UHD指分辨率3840x2160；部分录制规格根据机型不同可能需要额外激活授权。")
            lines.append("3. ARRIRAW为ARRI开发的12bit非线性RAW编码（对于ALEXA 35摄影机，为13bit）；HDE为ARRI公司开发的RAW压缩技术，用于ARRIRAW的无损压缩。")
            if cameraName == "ALEXA 35 Xtreme" || cameraName == "ALEXA 35 Live Xtreme" {
                lines.append("4. ProRes为Apple开发的帧内压缩编码；ARRICORE为ARRI开发的13bit帧内压缩编码。")
            } else {
                lines.append("4. ProRes为Apple开发的10bit帧内压缩编码（对于ALEXA 35摄影机，为12bit）。")
            }
        case "Apple":
            lines.append("2. 默认宽高比为16:9；HD指分辨率1280x720；FHD指分辨率1920x1080；UHD指分辨率3840x2160。")
            lines.append("3. ProRes为Apple开发的帧内压缩编码；iPhone系列机型视频录制采用可变帧速率（VFR），实际帧速率可能与拍摄选择帧速率不同；仅有主摄支持120fps录制。")
            lines.append("4. 相机应用录制的ProRes规格为ProRes 422 HQ；根据机型不同，在内录ProRes视频时对分辨率与帧率有所限制，使用第三方录制软件以绕过限制。")
        case "Blackmagicdesign":
            lines.append("2. FHD指分辨率1920x1080；UHD指分辨率3840x2160。")
            lines.append("3. Blackmagic RAW为Blackmagicdesign开发的12bit非线性压缩RAW编码，具有不同的压缩比；ProRes为Apple开发的帧内压缩编码。")
            lines.append("4. 在使用Dual CFast2.0存储卡时，摄影机将两帧画面分别存储在两张CFast2.0存储卡上，需要使用Blackmagicdesign公司推出的Davinci Resolve软件读取与编辑。")
        case "Canon":
            lines.append("2. 默认宽高比为16:9；DCI标准的宽高比为17:9。")
            lines.append("3. DCI 4K指分辨率为4096x2160；DCI 2K指分辨率为2048x1080；FHD指分辨率1920x1080；UHD指分辨率3840x2160。")
            lines.append("4. 选项中的RAW编码为Canon开发的12bit非线性压缩RAW编码；ALL-I指帧内压缩；IPB指帧间压缩。")
        case "Canon Cinema":
            lines.append("2. DCI 4K指分辨率为4096x2160；DCI 2K指分辨率为2048x1080；FHD指分辨率1920x1080；UHD指分辨率3840x2160。")
            lines.append("3. Cinema RAW Light编码为Canon开发的10bit/12bit非线性压缩RAW编码，具有不同的压缩比。")
            lines.append("4. XF-AVC为Canon基于H.264编码开发的录制编码；Intra指帧内压缩；LongGOP指帧间压缩。")
        case "DJI":
            lines.append("2. DCI 4K指分辨率为4096x2160；DCI 2K指分辨率为2048x1080；FHD指分辨率1920x1080；UHD指分辨率3840x2160。")
            lines.append("3. ProRes RAW HQ为Apple开发的12bit非线性压缩RAW编码，部分机型可能需要激活授权；ProRes为Apple开发的帧内压缩编码；CinemaDNG为ADOBE开发的无损压缩RAW编码。")
            lines.append("4. DJI PROSSD为DJI开发的用于Ronin 4D与Inspire3机型的记录硬件，具有10Gbps速度，使用USB-C接口与机身连接。")
        case "Panasonic":
            lines.append("2. 默认宽高比为16:9；DCI 4K指分辨率为4096x2160；DCI 2K指分辨率为2048x1080；FHD指分辨率1920x1080；UHD指分辨率3840x2160。")
            lines.append("3. ProRes RAW为Apple开发的12bit非线性压缩RAW编码；ProRes为Apple开发的帧内压缩编码；ALL-I指帧内压缩；IPB指帧间压缩；部分格式可能需要激活授权。")
            lines.append("4. 幅面选项中的Full Frame、APS-C、M43指该格式传感器使用宽度约为全画幅、APS-C画幅、Micro 4/3画幅大小。")
        case "RED":
            lines.append("2. 默认宽高比为16:9；FHD指分辨率1920x1080；UHD指分辨率3840x2160。")
            lines.append("3. REDCODE为RED开发的16bit压缩RAW编码，具有不同的压缩比；ProRes为Apple开发的帧内压缩编码。")
            lines.append("4. VV画幅指VistaVision大小，17:9比例的大画幅。")
        case "SONY":
            lines.append("2. 对于未表明分辨率的情况：8K指分辨率为7680x4320（8K UHD）；DCI 4K指分辨率为4096x2160；FHD指分辨率1920x1080；UHD指分辨率3840x2160。")
            lines.append("3. X-OCN为SONY开发的16bit压缩RAW编码，具有不同的压缩比；ALL-I指帧内压缩；IPB指帧间压缩。")
            lines.append("4. XAVC S、XAVC HS为SONY开发的分别基于H.264、H.265编码开发的帧间压缩格式；XAVC S-I为索尼开发的基于H264编码的帧间压缩格式。")
        case "Kinefinity":
            lines.append("2. Kinefinity先按幅面过滤分辨率；FF、S35、M43、S16、Pixel to Pixel为Format选项，Pixel to Pixel表示官方Other/Crop裁切模式。")
            lines.append("3. Kinefinity分辨率标签按“大体分辨率[具体分辨率][比例/OG][From 8K/6K/4K]”标注；幅面不再重复显示在分辨率中。")
            lines.append("4. ProRes为Apple开发的帧内压缩编码；CinemaDNG仅显示KineOS 8.0支持的机内RAW(DNG)分辨率，并按12bit未压缩RAW像素量估算码率；VISTA的H.265按官方4K 25fps基准码率随像素和帧率换算。")
            lines.append("5. 帧率选项包含常用档位和该分辨率的最高帧率；KineMAG Nano SSD按1TB≈931GiB、2TB≈1862GiB计算，VISTA内置220GB SSD按约204.82GiB计算。")
        case "[General]":
            lines.append("2. 选择Manual Codec和Manual Resolution模式来自定义编码速度和分辨率。")
            lines.append("3. ARRIRAW为ARRI开发的RAW编码；ProRes RAW为Apple开发的压缩RAW编码；ProRes为Apple开发的帧内压缩编码；HDE用于ARRIRAW的无损压缩。")
            lines.append("4. X-OCN为SONY开发的16bit压缩RAW编码，具有不同的压缩比；REDCODE为RED开发的16bit压缩RAW编码，具有不同的压缩比。")
        default:
            lines.append("2. 默认宽高比为16:9，DCI标准的宽高比为17:9；HD指分辨率为1280x720；FHD指分辨率1920x1080；UHD指分辨率3840x2160。")
            lines.append("3. 对于未表明分辨率的情况：8K指分辨率为7680x4320（8K UHD）；DCI 4K指分辨率为4096x2160；DCI 2K指分辨率为2048x1080；")
            lines.append("4. 数据来源于各大厂商官方网站与开发者收集，部分录制规格可能需要额外激活授权才可使用。")
        }

        lines.append("5. GitHub 仓库：**github.com/LexTheAries2209/Taurus**。代码、版本说明、发布包与问题反馈均在仓库维护，欢迎通过 Issue 或 Pull Request 参与改进。")
        return lines
    }

    private func englishComments(for brandName: String, cameraName: String) -> [String] {
        var lines = ["1. Current version: V2.0.1. Camera specifications are current through 2026.07.06. Calculation results are estimates and may differ from actual data volumes."]

        switch brandName {
        case "ARRI":
            lines.append("2. Default aspect ratio is 16:9. FHD is 1920x1080; UHD is 3840x2160. Some formats may require licenses.")
            lines.append("3. ARRIRAW is ARRI's nonlinear RAW codec: 12-bit generally, 13-bit on ALEXA 35. HDE is lossless ARRIRAW compression.")
            if cameraName == "ALEXA 35 Xtreme" || cameraName == "ALEXA 35 Live Xtreme" {
                lines.append("4. ProRes is Apple's intraframe codec. ARRICORE is ARRI's 13-bit intraframe codec.")
            } else {
                lines.append("4. ProRes is Apple's 10-bit intraframe codec, or 12-bit on ALEXA 35.")
            }
        case "Apple":
            lines.append("2. Default aspect ratio is 16:9. HD is 1280x720; FHD is 1920x1080; UHD is 3840x2160.")
            lines.append("3. ProRes is Apple's intraframe codec. iPhone video uses variable frame rate, so actual fps may vary.")
            lines.append("4. Camera app ProRes uses ProRes 422 HQ. Some models limit internal ProRes resolution and frame rate.")
        case "Blackmagicdesign":
            lines.append("2. FHD is 1920x1080; UHD is 3840x2160.")
            lines.append("3. Blackmagic RAW is a 12-bit nonlinear compressed RAW codec; ProRes is Apple's intraframe codec.")
            lines.append("4. Dual CFast 2.0 recording splits frames across two cards and should be read in DaVinci Resolve.")
        case "Canon":
            lines.append("2. Default aspect ratio is 16:9; DCI uses 17:9.")
            lines.append("3. DCI 4K is 4096x2160; DCI 2K is 2048x1080; FHD is 1920x1080; UHD is 3840x2160.")
            lines.append("4. RAW options are Canon 12-bit nonlinear compressed RAW. ALL-I is intraframe; IPB is interframe.")
        case "Canon Cinema":
            lines.append("2. DCI 4K is 4096x2160; DCI 2K is 2048x1080; FHD is 1920x1080; UHD is 3840x2160.")
            lines.append("3. Cinema RAW Light is Canon's 10-bit/12-bit nonlinear compressed RAW codec.")
            lines.append("4. XF-AVC is Canon's H.264-based recording codec. Intra is intraframe; Long GOP is interframe.")
        case "DJI":
            lines.append("2. DCI 4K is 4096x2160; DCI 2K is 2048x1080; FHD is 1920x1080; UHD is 3840x2160.")
            lines.append("3. ProRes RAW HQ is Apple's 12-bit compressed RAW codec. Some models may need activation.")
            lines.append("4. DJI PROSSD is 10Gbps recording media for Ronin 4D and Inspire 3, connected over USB-C.")
        case "Panasonic":
            lines.append("2. Default aspect ratio is 16:9. DCI 4K is 4096x2160; DCI 2K is 2048x1080; FHD is 1920x1080; UHD is 3840x2160.")
            lines.append("3. ProRes RAW is Apple's 12-bit compressed RAW codec. ALL-I is intraframe; IPB is interframe.")
            lines.append("4. Full Frame, APS-C, and M43 indicate the sensor area used by the selected format.")
        case "RED":
            lines.append("2. Default aspect ratio is 16:9. FHD is 1920x1080; UHD is 3840x2160.")
            lines.append("3. REDCODE is RED's 16-bit compressed RAW codec. ProRes is Apple's intraframe codec.")
            lines.append("4. VV means VistaVision, a large-format 17:9 sensor area.")
        case "SONY":
            lines.append("2. For unlabeled resolutions: 8K is 7680x4320, DCI 4K is 4096x2160, FHD is 1920x1080, UHD is 3840x2160.")
            lines.append("3. X-OCN is SONY's 16-bit compressed RAW codec. ALL-I is intraframe; IPB is interframe.")
            lines.append("4. XAVC S and XAVC HS are H.264/H.265 interframe formats; XAVC S-I is H.264 intraframe.")
        case "Kinefinity":
            lines.append("2. Kinefinity filters resolution by format first. FF, S35, M43, S16, and Pixel to Pixel are Format options.")
            lines.append("3. Resolution labels show approximate size, exact pixels, ratio/OG, and source mode such as From 8K/6K/4K.")
            lines.append("4. CinemaDNG lists KineOS 8.0 internal RAW modes and estimates bitrate from uncompressed 12-bit RAW pixels.")
            lines.append("5. Frame rate options include common rates and the selected resolution's maximum frame rate.")
        case "[General]":
            lines.append("2. Use Manual Codec and Manual Resolution to enter custom bitrate and resolution values.")
            lines.append("3. ARRIRAW, ProRes RAW, ProRes, and HDE are included for general estimate workflows.")
            lines.append("4. X-OCN and REDCODE are 16-bit compressed RAW codecs with multiple compression ratios.")
        default:
            lines.append("2. Default aspect ratio is 16:9; DCI uses 17:9. HD is 1280x720; FHD is 1920x1080; UHD is 3840x2160.")
            lines.append("3. For unlabeled resolutions: 8K is 7680x4320, DCI 4K is 4096x2160, and DCI 2K is 2048x1080.")
            lines.append("4. Data is collected from official manufacturer sources. Some modes may require extra licenses.")
        }

        lines.append("5. GitHub repo: **github.com/LexTheAries2209/Taurus**. Code, releases, notes, and issues are maintained there.")
        return lines
    }
}

extension LocalizedCopy {
    var plannerTitle: String {
        language == .chinese ? "DMT 项目规划" : "DMT Project Planner"
    }

    var dmtPlanner: DMTPlannerCopy {
        DMTPlannerCopy(language: language)
    }
}

struct DMTPlannerCopy {
    let language: AppLanguage

    func text(_ chinese: String) -> String {
        guard language == .english else { return chinese }
        switch chinese {
        case "暂无项目": return "No Projects"
        case "新建一个项目开始多机位规划": return "Create a project to start multi-camera planning"
        case "项目": return "Projects"
        case "新建项目": return "New Project"
        case "项目与方案": return "Projects & Plans"
        case "未命名项目": return "Untitled Project"
        case "复制方案": return "Duplicate Plan"
        case "删除项目": return "Delete Project"
        case "收藏模式": return "Favorites"
        case "暂无收藏": return "No Favorites"
        case "添加到当前项目": return "Add to Current Project"
        case "删除收藏": return "Delete Favorite"
        case "删除": return "Delete"
        case "项目名称": return "Project Name"
        case "比较已勾选的 2 至 4 个模式": return "Compare 2 to 4 selected modes"
        case "模式比较": return "Compare Modes"
        case "导出 JSON": return "Export JSON"
        case "导出 CSV": return "Export CSV"
        case "导出 PDF": return "Export PDF"
        case "导出项目": return "Export Project"
        case "导入项目 JSON": return "Import Project JSON"
        case "每日原始量": return "Daily Raw Data"
        case "项目原始量": return "Project Raw Data"
        case "备份后存储": return "Storage After Backups"
        case "每日双备份": return "Daily Double Backup"
        case "可完成": return "Ready"
        case "需调整": return "Needs Adjustment"
        case "机位规划": return "Camera Plan"
        case "机位": return "Camera"
        case "台数": return "Count"
        case "项目存储": return "Project Storage"
        case "选择机位后在右侧调整参数": return "Select a camera to adjust its parameters in the inspector"
        case "尚未添加机位": return "No Cameras Added"
        case "从下方选择摄影机和录制模式": return "Select a camera and recording mode below"
        case "复制机位": return "Duplicate Camera"
        case "上移": return "Move Up"
        case "下移": return "Move Down"
        case "移出比较": return "Remove from Compare"
        case "加入比较": return "Add to Compare"
        case "取消收藏": return "Remove Favorite"
        case "重置拍摄参数": return "Reset Shooting Parameters"
        case "为项目添加一个新的摄影机录制模式": return "Add a camera recording mode to the project"
        case "添加机位": return "Add Camera"
        case "机位检查器": return "Camera Inspector"
        case "录制模式": return "Recording Mode"
        case "摄影机": return "Camera"
        case "编码": return "Codec"
        case "幅面": return "Format"
        case "格式": return "Resolution"
        case "帧率": return "Frame Rate"
        case "码率": return "Bitrate"
        case "HDE 数据码率": return "HDE Data Rate"
        case "分辨率": return "Resolution"
        case "总存储": return "Total Storage"
        case "介质": return "Media"
        case "使用 HDE 无损压缩": return "Use HDE Lossless Compression"
        case "修改录制模式": return "Edit Recording Mode"
        case "拍摄参数": return "Shooting Parameters"
        case "机位名称": return "Camera Name"
        case "机位备注": return "Camera Note"
        case "主机位、斯坦尼康等": return "Main camera, Steadicam, etc."
        case "摄影机数量": return "Camera Count"
        case "每日开机": return "Power-on Hours"
        case "拍摄天数": return "Shoot Days"
        case "保留副本": return "Backup Copies"
        case "实际录制比例": return "Recording Ratio"
        case "安全余量": return "Safety Margin"
        case "规划结果": return "Plan Results"
        case "单机每日": return "Per Camera / Day"
        case "全部每日": return "All Cameras / Day"
        case "单机全项目": return "Per Camera / Project"
        case "卡次": return "Card Cycles"
        case "读卡器": return "Reader"
        case "有效速度": return "Effective Speed"
        case "每张卡时长": return "Time per Card"
        case "卸载时间": return "Offload Time"
        case "选择一个机位": return "Select a Camera"
        case "录制模式、拍摄参数与规划结果将在这里显示":
            return "Recording mode, shooting parameters, and plan results appear here"
        case "传输配置": return "Transfer Configuration"
        case "目标盘": return "Target Disk"
        case "每日窗口": return "Daily Window"
        case "台": return "units"
        case "小时": return "hours"
        case "天": return "days"
        case "份": return "copies"
        case "次": return "cycles"
        case "分钟": return "minutes"
        case "不适用": return "Not Applicable"
        case "未启用": return "Disabled"
        case "调整列宽": return "Resize Column"
        case "拖动调整列宽": return "Drag to resize column"
        case "操作失败": return "Operation Failed"
        case "好": return "OK"
        case "继续选择": return "Continue selecting"
        case "当前录制组合不可用于项目规划，请更换录制模式":
            return "This recording combination is unavailable for project planning. Choose another mode."
        case "当前模式不支持项目规划": return "This mode is not supported for project planning"
        case "请完成录制模式选择": return "Complete the recording mode selection"
        case "录制模式预览": return "Recording Mode Preview"
        case "每卡时长": return "Time per Card"
        case "选择摄影机和录制模式": return "Select Camera and Recording Mode"
        case "确认机位信息": return "Confirm Camera Info"
        case "搜索摄影机": return "Search Cameras"
        case "完成": return "Done"
        case "取消": return "Cancel"
        case "关闭": return "Close"
        case "例如：A 机位 - 主摄影机": return "e.g. A Camera - Main Camera"
        case "添加到项目": return "Add to Project"
        case "保存修改": return "Save Changes"
        case "修改摄影机、编码、格式、分辨率、帧率或介质":
            return "Modify the camera, codec, format, resolution, frame rate, or media"
        case "选择摄影机的完整录制模式，再加入当前项目":
            return "Select a complete recording mode, then add it to the current project"
        case "录制模式完整，可以添加": return "Recording mode complete, ready to add"
        case "录制模式完整，可以保存": return "Recording mode complete, ready to save"
        case "品牌或机型": return "Brand or camera model"
        case "工作区": return "Workspace"
        case "切换工作区": return "Switch Workspace"
        default: return chinese
        }
    }

    func itemCount(_ count: Int) -> String {
        language == .chinese ? "\(count) 个机位" : "\(count) camera\(count == 1 ? "" : "s")"
    }

    func selectedModes(_ count: Int) -> String {
        language == .chinese ? "已选 \(count) / 4" : "Selected \(count) / 4"
    }

    func modeCount(_ count: Int) -> String {
        language == .chinese ? "\(count) 个模式" : "\(count) mode\(count == 1 ? "" : "s")"
    }

    func hdeDataDescription(percent: String) -> String {
        language == .chinese
            ? "项目数据量约为 ARRIRAW 的 \(percent)%"
            : "Project data is approximately \(percent)% of ARRIRAW"
    }

    func hdeState(percent: String) -> String {
        language == .chinese ? "已启用（\(percent)%）" : "Enabled (\(percent)%)"
    }

    func missingFieldName(_ field: SelectionField) -> String {
        switch (language, field) {
        case (.chinese, .brand): return "品牌"
        case (.english, .brand): return "brand"
        case (.chinese, .camera): return "摄影机"
        case (.english, .camera): return "camera"
        case (.chinese, .codec): return "编码"
        case (.english, .codec): return "codec"
        case (.chinese, .codecLevel): return "级别"
        case (.english, .codecLevel): return "codec level"
        case (.chinese, .format): return "幅面"
        case (.english, .format): return "format"
        case (.chinese, .resolution): return "分辨率"
        case (.english, .resolution): return "resolution"
        case (.chinese, .frameRate): return "帧率"
        case (.english, .frameRate): return "frame rate"
        case (.chinese, .media): return "介质"
        case (.english, .media): return "media"
        case (.chinese, .manualBitrate): return "手动码率"
        case (.english, .manualBitrate): return "manual bitrate"
        case (.chinese, .manualWidth): return "宽度"
        case (.english, .manualWidth): return "width"
        case (.chinese, .manualHeight): return "高度"
        case (.english, .manualHeight): return "height"
        }
    }

    func hdeApplicableState(isApplicable: Bool) -> String {
        if isApplicable {
            return text("未启用")
        }
        return text("不适用")
    }
}
