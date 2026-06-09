//
//  NikonResolution.swift
//  Taurus
//
//  Created by Codex on 6/9/26.
//

import Foundation

struct NikonRecordingMode {
    let resolution: String
    let mbps: Double
}

func NikonResolution(cameradata:CameraData) -> [String] {
    let modes = NikonRecordingModes(cameradata: cameradata)
    return modes.isEmpty ? ["无选项"] : modes.map { $0.resolution }
}

func NikonRecordingModes(cameradata:CameraData) -> [NikonRecordingMode] {
    switch NikonCameraKey(cameradata.CameraName) {
    case "ZR":
        return NikonZRModes(codec: cameradata.Codec)
    case "Z9":
        return NikonZ9Z8Modes(codec: cameradata.Codec, z8: false)
    case "Z8":
        return NikonZ9Z8Modes(codec: cameradata.Codec, z8: true)
    case "Z6III":
        return NikonZ6IIIModes(codec: cameradata.Codec)
    default:
        return []
    }
}

private func NikonCameraKey(_ cameraName:String) -> String {
    switch cameraName {
    case "ZR":
        return "ZR"
    case "Z9":
        return "Z9"
    case "Z8":
        return "Z8"
    case "Z 6III":
        return "Z6III"
    default:
        return cameraName
    }
}

private func NikonModes(_ base:String, _ rates:[(String, Double)]) -> [NikonRecordingMode] {
    return rates.map { NikonRecordingMode(resolution: "\(base)[\($0.0)p]", mbps: $0.1) }
}

private func NikonRawHighZR() -> [NikonRecordingMode] {
    return NikonModes("6K FX[6048*3402][12bit RAW]", [("59.94", 3730), ("50", 3110), ("29.97", 1870), ("25", 1560), ("23.976", 1490)]) +
        NikonModes("4K FX[4032*2268][12bit RAW]", [("59.94", 1660), ("50", 1390), ("29.97", 830), ("25", 700), ("23.976", 670)]) +
        NikonModes("4K DX[3984*2240][12bit RAW]", [("119.88", 3240), ("100", 2700), ("59.94", 1620), ("50", 1350), ("29.97", 810), ("25", 680), ("23.976", 650)])
}

private func NikonRawNormalZR() -> [NikonRecordingMode] {
    return NikonModes("6K FX[6048*3402][12bit RAW]", [("59.94", 1870), ("50", 1560), ("29.97", 940), ("25", 780), ("23.976", 750)]) +
        NikonModes("4K FX[4032*2268][12bit RAW]", [("59.94", 830), ("50", 700), ("29.97", 420), ("25", 350), ("23.976", 340)]) +
        NikonModes("4K DX[3984*2240][12bit RAW]", [("119.88", 1630), ("100", 1360), ("59.94", 820), ("50", 680), ("29.97", 410), ("25", 340), ("23.976", 330)])
}

private func NikonZRModes(codec:String) -> [NikonRecordingMode] {
    switch codec {
    case "R3D NE", "N-RAW HQ":
        return NikonRawHighZR()
    case "N-RAW":
        return NikonRawNormalZR()
    case "ProRes RAW HQ":
        return NikonCalculatedProResModes(codec: codec, bases: NikonZRRawBases())
    case "ProRes 422 HQ":
        return NikonCalculatedProResModes(codec: codec, bases: NikonZRProResBases())
    case "H.265 10-bit":
        return NikonH26510FullSet(include5_4K: true, fhd240: true)
    case "H.265 8-bit":
        return NikonH2658FullSet(include5_4K: true, fhd240: true)
    case "H.264 8-bit":
        return NikonH264FullSet()
    default:
        return []
    }
}

private func NikonZRRawBases() -> [(String, [String])] {
    return [
        ("6K FX[6048*3402][12bit RAW]", ["29.97", "25", "23.976"]),
        ("4K FX[4032*2268][12bit RAW]", ["59.94", "50", "29.97", "25", "23.976"]),
        ("4K DX[3984*2240][12bit RAW]", ["59.94", "50", "29.97", "25", "23.976"]),
    ]
}

private func NikonZRProResBases() -> [(String, [String])] {
    return [
        ("5.4K FX[5376*3024][10bit 4:2:2]", ["29.97", "25", "23.976"]),
        ("4K FX[3840*2160][10bit 4:2:2]", ["59.94", "50", "29.97", "25", "23.976"]),
        ("4K DX[3840*2160][10bit 4:2:2]", ["59.94", "50", "29.97", "25", "23.976"]),
        ("FHD FX[1920*1080][10bit 4:2:2]", ["119.88", "100", "59.94", "50"]),
        ("FHD DX[1920*1080][10bit 4:2:2]", ["119.88", "100", "59.94", "50"]),
    ]
}

private func NikonZ6IIIModes(codec:String) -> [NikonRecordingMode] {
    switch codec {
    case "N-RAW HQ":
        return NikonModes("6K FX[6048*3402][12bit RAW]", [("59.94", 3730), ("50", 3110), ("29.97", 1870), ("25", 1560), ("23.976", 1490)]) +
            NikonModes("4K FX[4032*2268][12bit RAW]", [("59.94", 1640), ("50", 1370), ("29.97", 820), ("25", 690), ("23.976", 660)]) +
            NikonModes("4K DX[3984*2240][12bit RAW]", [("119.88", 3240), ("100", 2700), ("59.94", 1620), ("50", 1350), ("29.97", 810), ("25", 680), ("23.976", 650)])
    case "N-RAW":
        return NikonModes("6K FX[6048*3402][12bit RAW]", [("59.94", 1870), ("50", 1560), ("29.97", 940), ("25", 780), ("23.976", 750)]) +
            NikonModes("4K FX[4032*2268][12bit RAW]", [("59.94", 830), ("50", 700), ("29.97", 420), ("25", 350), ("23.976", 340)]) +
            NikonModes("4K DX[3984*2240][12bit RAW]", [("119.88", 1630), ("100", 1360), ("59.94", 820), ("50", 680), ("29.97", 410), ("25", 340), ("23.976", 330)])
    case "ProRes RAW HQ":
        return NikonCalculatedProResModes(codec: codec, bases: NikonZ6IIIRawBases())
    case "ProRes 422 HQ":
        return NikonCalculatedProResModes(codec: codec, bases: NikonZ6IIIProResBases())
    case "H.265 10-bit":
        return NikonH26510FullSet(include5_4K: true, fhd240: true)
    case "H.265 8-bit":
        return NikonH2658FullSet(include5_4K: true, fhd240: true)
    case "H.264 8-bit":
        return NikonH264FullSet()
    default:
        return []
    }
}

private func NikonZ9Z8Modes(codec:String, z8:Bool) -> [NikonRecordingMode] {
    switch codec {
    case "N-RAW HQ":
        let fx8K = z8
            ? NikonModes("8.3K FX[8256*4644][12bit RAW]", [("59.94", 5780), ("50", 4810), ("29.97", 3470), ("25", 2890), ("23.976", 2780)])
            : NikonModes("8.3K FX[8256*4644][12bit RAW]", [("59.94", 5780), ("50", 4810), ("29.97", 2890), ("25", 2410), ("23.976", 2310)])
        return fx8K + NikonZ9Z8NRawHighShared(z8: z8)
    case "N-RAW":
        return NikonModes("8.3K FX[8256*4644][12bit RAW]", [("59.94", 3470), ("50", 2890), ("29.97", 1740), ("25", 1450), ("23.976", 1390)]) +
            NikonZ9Z8NRawNormalShared()
    case "ProRes RAW HQ":
        return NikonCalculatedProResModes(codec: codec, bases: NikonZ9Z8RawBases())
    case "ProRes 422 HQ":
        return NikonCalculatedProResModes(codec: codec, bases: NikonZ9Z8ProResBases())
    case "H.265 10-bit":
        return NikonH26510FullSet(include8K: true, include5_4K: false, fhd240: false)
    case "H.265 8-bit":
        return NikonH2658FullSet(include8K: true, include5_4K: false, fhd240: false)
    case "H.264 8-bit":
        return NikonH264FullSet()
    default:
        return []
    }
}

private func NikonZ9Z8NRawHighShared(z8:Bool) -> [NikonRecordingMode] {
    let fx4K120 = z8 ? 3480.0 : 3840.0
    return NikonModes("4.1K FX[4128*2322][12bit RAW]", [("119.88", fx4K120), ("100", 2900), ("59.94", 1740), ("50", 1450), ("29.97", 870), ("25", 730), ("23.976", 700)]) +
        NikonModes("5.4K DX[5392*3032][12bit RAW]", [("59.94", 2960), ("50", 2470), ("29.97", 1480), ("25", 1240), ("23.976", 1190)]) +
        NikonModes("4K 2.3x[3840*2160][12bit RAW]", [("119.88", 3020), ("100", 2510)])
}

private func NikonZ9Z8NRawNormalShared() -> [NikonRecordingMode] {
    return NikonModes("4.1K FX[4128*2322][12bit RAW]", [("119.88", 1750), ("100", 1460), ("59.94", 880), ("50", 730), ("29.97", 440), ("25", 370), ("23.976", 350)]) +
        NikonModes("5.4K DX[5392*3032][12bit RAW]", [("59.94", 1490), ("50", 1240), ("29.97", 750), ("25", 620), ("23.976", 600)]) +
        NikonModes("4K 2.3x[3840*2160][12bit RAW]", [("119.88", 1510), ("100", 1260)])
}

private func NikonH26510FullSet(include8K:Bool = false, include5_4K:Bool, fhd240:Bool) -> [NikonRecordingMode] {
    var modes: [NikonRecordingMode] = []
    if include8K {
        modes += NikonModes("8K FX[7680*4320][10bit 4:2:0]", [("29.97", 400), ("25", 400), ("23.976", 400)])
    }
    if include5_4K {
        modes += NikonModes("5.4K FX[5376*3024][10bit 4:2:0]", [("59.94", 400), ("50", 400), ("29.97", 340), ("25", 340), ("23.976", 340)])
    }
    modes += NikonModes("4K DX[3840*2160][10bit 4:2:0]", [("119.88", 400), ("100", 400)])
    modes += NikonModes("4K FX[3840*2160][10bit 4:2:0]", [("59.94", 340), ("50", 340), ("29.97", 190), ("25", 190), ("23.976", 190)])
    modes += NikonModes("4K DX[3840*2160][10bit 4:2:0]", [("59.94", 340), ("50", 340), ("29.97", 190), ("25", 190), ("23.976", 190)])
    if fhd240 {
        modes += NikonModes("FHD FX[1920*1080][10bit 4:2:0][95%]", [("239.76", 340), ("200", 340)])
    }
    modes += NikonModes("FHD FX[1920*1080][10bit 4:2:0]", [("119.88", 190), ("100", 190), ("59.94", 100), ("50", 100), ("29.97", 50), ("25", 50), ("23.976", 50)])
    modes += NikonModes("FHD DX[1920*1080][10bit 4:2:0]", [("119.88", 190), ("100", 190), ("59.94", 100), ("50", 100), ("29.97", 50), ("25", 50), ("23.976", 50)])
    return modes
}

private func NikonH2658FullSet(include8K:Bool = false, include5_4K:Bool, fhd240:Bool) -> [NikonRecordingMode] {
    var modes: [NikonRecordingMode] = []
    if include8K {
        modes += NikonModes("8K FX[7680*4320][8bit 4:2:0]", [("29.97", 370), ("25", 370), ("23.976", 370)])
    }
    if include5_4K {
        modes += NikonModes("5.4K FX[5376*3024][8bit 4:2:0]", [("59.94", 370), ("50", 370), ("29.97", 300), ("25", 300), ("23.976", 300)])
    }
    modes += NikonModes("4K DX[3840*2160][8bit 4:2:0]", [("119.88", 370), ("100", 370)])
    modes += NikonModes("4K FX[3840*2160][8bit 4:2:0]", [("59.94", 300), ("50", 300), ("29.97", 150), ("25", 150), ("23.976", 150)])
    modes += NikonModes("4K DX[3840*2160][8bit 4:2:0]", [("59.94", 300), ("50", 300), ("29.97", 150), ("25", 150), ("23.976", 150)])
    if fhd240 {
        modes += NikonModes("FHD FX[1920*1080][8bit 4:2:0][95%]", [("239.76", 300), ("200", 300)])
    }
    modes += NikonModes("FHD FX[1920*1080][8bit 4:2:0]", [("119.88", 150), ("100", 150), ("59.94", 80), ("50", 80), ("29.97", 40), ("25", 40), ("23.976", 40)])
    modes += NikonModes("FHD DX[1920*1080][8bit 4:2:0]", [("119.88", 150), ("100", 150), ("59.94", 80), ("50", 80), ("29.97", 40), ("25", 40), ("23.976", 40)])
    return modes
}

private func NikonH264FullSet() -> [NikonRecordingMode] {
    return NikonModes("FHD FX[1920*1080][8bit 4:2:0]", [("119.88", 100), ("100", 100), ("59.94", 50), ("50", 50), ("29.97", 30), ("25", 30), ("23.976", 30)]) +
        NikonModes("FHD DX[1920*1080][8bit 4:2:0]", [("59.94", 50), ("50", 50), ("29.97", 30), ("25", 30), ("23.976", 30)])
}

private func NikonZ6IIIRawBases() -> [(String, [String])] {
    return [
        ("6K FX[6048*3402][12bit RAW]", ["59.94", "50", "29.97", "25", "23.976"]),
        ("4K FX[4032*2268][12bit RAW]", ["59.94", "50", "29.97", "25", "23.976"]),
        ("4K DX[3984*2240][12bit RAW]", ["119.88", "100", "59.94", "50", "29.97", "25", "23.976"]),
    ]
}

private func NikonZ6IIIProResBases() -> [(String, [String])] {
    return [
        ("5.4K FX[5376*3024][10bit 4:2:2]", ["29.97", "25", "23.976"]),
        ("4K FX[3840*2160][10bit 4:2:2]", ["59.94", "50", "29.97", "25", "23.976"]),
        ("4K DX[3840*2160][10bit 4:2:2]", ["119.88", "100", "59.94", "50", "29.97", "25", "23.976"]),
        ("FHD FX[1920*1080][10bit 4:2:2]", ["119.88", "100", "59.94", "50"]),
    ]
}

private func NikonZ9Z8RawBases() -> [(String, [String])] {
    return [
        ("8.3K FX[8256*4644][12bit RAW]", ["59.94", "50", "29.97", "25", "23.976"]),
        ("4K 2.3x[3840*2160][12bit RAW]", ["119.88", "100", "59.94", "50"]),
    ]
}

private func NikonZ9Z8ProResBases() -> [(String, [String])] {
    return [
        ("8K FX[7680*4320][10bit 4:2:2]", ["29.97", "25", "23.976"]),
        ("4K FX[3840*2160][10bit 4:2:2]", ["119.88", "100", "59.94", "50", "29.97", "25", "23.976"]),
        ("FHD FX[1920*1080][10bit 4:2:2]", ["119.88", "100", "59.94", "50", "29.97", "25", "23.976"]),
    ]
}

private func NikonCalculatedProResModes(codec:String, bases:[(String, [String])]) -> [NikonRecordingMode] {
    return bases.flatMap { base, rates in
        rates.map { rate in
            let label = "\(base)[\(rate)p]"
            return NikonRecordingMode(resolution: label, mbps: NikonCalculatedProResSpeed(codec: codec, resolution: label, rate: rate))
        }
    }
}

private func NikonCalculatedProResSpeed(codec:String, resolution:String, rate:String) -> Double {
    let baseMbps: Double
    switch codec {
    case "ProRes 422 HQ":
        baseMbps = 176
    case "ProRes RAW HQ":
        baseMbps = 190
    default:
        return 0
    }

    guard let rateValue = Double(rate) else {
        return 0
    }

    return baseMbps * NikonParsedResolutionMultiplier(resolution) * rateValue / 24
}

private func NikonParsedResolutionMultiplier(_ resolution:String) -> Double {
    let pattern = #"\[(\d+)\*(\d+)\]"#
    guard let regex = try? NSRegularExpression(pattern: pattern) else {
        return 0
    }
    let range = NSRange(resolution.startIndex..<resolution.endIndex, in: resolution)
    guard let match = regex.firstMatch(in: resolution, range: range),
          let widthRange = Range(match.range(at: 1), in: resolution),
          let heightRange = Range(match.range(at: 2), in: resolution),
          let width = Double(resolution[widthRange]),
          let height = Double(resolution[heightRange]) else {
        return 0
    }
    return width * height / Double(1920 * 1080)
}
