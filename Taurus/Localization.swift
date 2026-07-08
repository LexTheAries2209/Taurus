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

    func localizedOptionTitle(_ rawValue: String) -> String {
        switch rawValue {
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
        var lines = ["1. 此版本[V1.3.5]仅包含《数据计算器》功能。摄影机规格参数数据截止至2026.07.06。计算结果仅供参考，实际数据量可能与计算不同。"]

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
        var lines = ["1. V1.3.5 includes the Data Calculator only. Specs current to 2026.07.06; results are estimates."]

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
