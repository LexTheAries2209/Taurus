//
//  KinefinityResolution.swift
//  Taurus
//
//  Created by Codex on 6/4/26.
//

import Foundation

struct KinefinityRecordingMode {
    let format: String
    let resolution: String
    let maxFPS: Double
}

func KinefinityResolution(cameradata:CameraData) -> [String] {
    let modes = KinefinityRecordingModes(cameradata: cameradata)
    return modes.isEmpty ? ["无选项"] : modes.map { $0.resolution }
}

func KinefinityRecordingModes(cameradata:CameraData) -> [KinefinityRecordingMode] {
    let modes = KinefinityCodecRecordingModes(cameradata: cameradata)
    guard KinefinityValidFormat(cameradata.Format) else {
        return []
    }
    
    return modes.filter { KinefinityMode($0, matchesFormat: cameradata.Format) }
}

func KinefinityCodecRecordingModes(cameradata:CameraData) -> [KinefinityRecordingMode] {
    if cameradata.Codec == "CinemaDNG" {
        return KinefinityRawDNGRecordingModes(cameraName: cameradata.CameraName)
    }
    
    return KinefinityRecordingModes(cameraName: cameradata.CameraName)
}

func KinefinityMode(_ mode:KinefinityRecordingMode, matchesFormat format:String) -> Bool {
    return mode.format == format
}

private func KinefinityValidFormat(_ format:String) -> Bool {
    return ["FF", "S35", "M43", "S16", "Pixel to Pixel"].contains(format)
}

private func KinefinityRecordingModes(cameraName:String) -> [KinefinityRecordingMode] {
    switch cameraName {
    case "VISTA":
        return [
            KinefinityRecordingMode(format: "FF", resolution: "6K[6016*3984][OG]", maxFPS: 36),
            KinefinityRecordingMode(format: "FF", resolution: "6K[6016*3172][17:9]", maxFPS: 50),
            KinefinityRecordingMode(format: "FF", resolution: "6K[6016*2520][2.4:1]", maxFPS: 60),
            KinefinityRecordingMode(format: "FF", resolution: "5.7K[5760*3700][3:2]", maxFPS: 42),
            KinefinityRecordingMode(format: "FF", resolution: "6K[5760*3240][16:9]", maxFPS: 48),
            KinefinityRecordingMode(format: "FF", resolution: "5.7K[5760*2400][2.4:1]", maxFPS: 60),
            KinefinityRecordingMode(format: "FF", resolution: "5K[5120*3700][4:3]", maxFPS: 40),
            KinefinityRecordingMode(format: "FF", resolution: "5K[5120*2700][17:9]", maxFPS: 58),
            KinefinityRecordingMode(format: "FF", resolution: "5K[5120*2160][2.4:1]", maxFPS: 72),
            KinefinityRecordingMode(format: "FF", resolution: "4.6K[4608*3700][6:5]", maxFPS: 40),
            KinefinityRecordingMode(format: "S35", resolution: "4K[4096*2700][3:2]", maxFPS: 56),
            KinefinityRecordingMode(format: "S35", resolution: "4K[4096*2160][17:9]", maxFPS: 96),
            KinefinityRecordingMode(format: "S35", resolution: "4K[4096*1720][2.4:1]", maxFPS: 120),
            KinefinityRecordingMode(format: "S35", resolution: "4K[3840*2160][16:9]", maxFPS: 96),
            KinefinityRecordingMode(format: "S35", resolution: "3.8K[3840*1600][2.4:1]", maxFPS: 120),
            KinefinityRecordingMode(format: "S35", resolution: "3.6K[3712*2700][4:3]", maxFPS: 56),
            KinefinityRecordingMode(format: "S35", resolution: "3.2K[3328*2700][6:5]", maxFPS: 56),
            KinefinityRecordingMode(format: "S35", resolution: "2.7K[2688*2688][1:1]", maxFPS: 56),
        ]
    case "MAVO Edge 8K":
        return [
            KinefinityRecordingMode(format: "FF", resolution: "8K[8192*5288][OG]", maxFPS: 45),
            KinefinityRecordingMode(format: "FF", resolution: "8K[8192*4320][17:9]", maxFPS: 55),
            KinefinityRecordingMode(format: "FF", resolution: "8K[8192*3384][2.4:1]", maxFPS: 70),
            KinefinityRecordingMode(format: "FF", resolution: "8K[7680*4320][16:9]", maxFPS: 55),
            KinefinityRecordingMode(format: "FF", resolution: "7.6K[7680*3200][2.4:1]", maxFPS: 72),
            KinefinityRecordingMode(format: "FF", resolution: "7.2K[7168*4760][3:2]", maxFPS: 50),
            KinefinityRecordingMode(format: "FF", resolution: "6.4K[6400*4760][4:3]", maxFPS: 50),
            KinefinityRecordingMode(format: "FF", resolution: "5.7K[5760*4760][6:5]", maxFPS: 50),
            KinefinityRecordingMode(format: "FF", resolution: "4.8K[4864*3176][3:2][From 8K]", maxFPS: 50),
            KinefinityRecordingMode(format: "FF", resolution: "4.2K[4224*3176][4:3][From 8K]", maxFPS: 50),
            KinefinityRecordingMode(format: "FF", resolution: "4K[4096*2644][OG][From 8K]", maxFPS: 45),
            KinefinityRecordingMode(format: "FF", resolution: "4K[4096*2160][17:9][From 8K]", maxFPS: 55),
            KinefinityRecordingMode(format: "FF", resolution: "4K[4096*1692][2.4:1][From 8K]", maxFPS: 70),
            KinefinityRecordingMode(format: "FF", resolution: "3.8K[3840*3176][6:5][From 8K]", maxFPS: 50),
            KinefinityRecordingMode(format: "FF", resolution: "4K[3840*2160][16:9][From 8K]", maxFPS: 55),
            KinefinityRecordingMode(format: "FF", resolution: "3.8K[3840*1600][2.4:1][From 8K]", maxFPS: 70),
            KinefinityRecordingMode(format: "S35", resolution: "6K[6144*3840][3:2]", maxFPS: 60),
            KinefinityRecordingMode(format: "S35", resolution: "6K[6144*3240][17:9]", maxFPS: 72),
            KinefinityRecordingMode(format: "S35", resolution: "6K[6144*2560][2.4:1]", maxFPS: 92),
            KinefinityRecordingMode(format: "S35", resolution: "6K[5760*3240][16:9]", maxFPS: 72),
            KinefinityRecordingMode(format: "S35", resolution: "5K[5120*3840][4:3]", maxFPS: 60),
            KinefinityRecordingMode(format: "S35", resolution: "5K[5120*2700][17:9]", maxFPS: 85),
            KinefinityRecordingMode(format: "S35", resolution: "5K[5120*2160][2.4:1]", maxFPS: 108),
            KinefinityRecordingMode(format: "S35", resolution: "4.8K[4864*3840][6:5]", maxFPS: 60),
            KinefinityRecordingMode(format: "S35", resolution: "4K[4096*2560][3:2][From 6K]", maxFPS: 60),
            KinefinityRecordingMode(format: "S35", resolution: "4K[4096*2160][17:9][From 6K]", maxFPS: 72),
            KinefinityRecordingMode(format: "S35", resolution: "4K[3840*2160][16:9][From 6K]", maxFPS: 72),
            KinefinityRecordingMode(format: "S35", resolution: "3.8K[3840*1600][2.4:1][From 6K]", maxFPS: 92),
            KinefinityRecordingMode(format: "S35", resolution: "3.4K[3456*2560][4:3][From 6K]", maxFPS: 60),
            KinefinityRecordingMode(format: "S35", resolution: "3K[3072*2560][6:5][From 6K]", maxFPS: 60),
            KinefinityRecordingMode(format: "Pixel to Pixel", resolution: "4K[4096*2160][17:9]", maxFPS: 108),
            KinefinityRecordingMode(format: "Pixel to Pixel", resolution: "4K[4096*1692][2.4:1]", maxFPS: 130),
            KinefinityRecordingMode(format: "Pixel to Pixel", resolution: "4K[3840*2160][16:9]", maxFPS: 108),
            KinefinityRecordingMode(format: "Pixel to Pixel", resolution: "3.8K[3840*1600][2.4:1]", maxFPS: 130),
            KinefinityRecordingMode(format: "Pixel to Pixel", resolution: "3K[3072*1620][17:9]", maxFPS: 144),
            KinefinityRecordingMode(format: "Pixel to Pixel", resolution: "3K[3072*1200][2.4:1]", maxFPS: 195),
            KinefinityRecordingMode(format: "Pixel to Pixel", resolution: "2K[2048*1080][17:9]", maxFPS: 200),
            KinefinityRecordingMode(format: "Pixel to Pixel", resolution: "2K[2048*860][2.4:1]", maxFPS: 270),
            KinefinityRecordingMode(format: "Pixel to Pixel", resolution: "2K[1920*1080][16:9]", maxFPS: 220),
            KinefinityRecordingMode(format: "Pixel to Pixel", resolution: "1.9K[1920*800][2.4:1]", maxFPS: 290),
        ]
    case "MAVO Edge 6K", "MAVO Mark2 LF":
        return KinefinityFullFrame6KModes()
    case "MAVO Mark2 S35":
        return [
            KinefinityRecordingMode(format: "S35", resolution: "6K[6144*4016][OG]", maxFPS: 60),
            KinefinityRecordingMode(format: "S35", resolution: "6K[6144*3240][17:9]", maxFPS: 75),
            KinefinityRecordingMode(format: "S35", resolution: "6K[6144*2516][2.4:1]", maxFPS: 96),
            KinefinityRecordingMode(format: "S35", resolution: "6K[5760*3240][16:9]", maxFPS: 75),
            KinefinityRecordingMode(format: "S35", resolution: "5K[5120*2700][17:9]", maxFPS: 90),
            KinefinityRecordingMode(format: "S35", resolution: "5.7K[5760*3840][3:2]", maxFPS: 60),
            KinefinityRecordingMode(format: "S35", resolution: "5K[5120*3840][4:3]", maxFPS: 60),
            KinefinityRecordingMode(format: "S35", resolution: "4.8K[4864*3840][6:5]", maxFPS: 60),
            KinefinityRecordingMode(format: "S35", resolution: "4K[4096*2160][17:9][From 6K]", maxFPS: 75),
            KinefinityRecordingMode(format: "S35", resolution: "4K[4096*1672][2.4:1][From 6K]", maxFPS: 96),
            KinefinityRecordingMode(format: "S35", resolution: "3.8K[3840*2460][3:2][From 6K]", maxFPS: 60),
            KinefinityRecordingMode(format: "S35", resolution: "4K[3840*2160][16:9][From 6K]", maxFPS: 75),
            KinefinityRecordingMode(format: "S35", resolution: "3.8K[3840*1576][2.4:1][From 6K]", maxFPS: 96),
            KinefinityRecordingMode(format: "S35", resolution: "3.4K[3456*2460][4:3][From 6K]", maxFPS: 60),
            KinefinityRecordingMode(format: "S35", resolution: "3K[3072*2460][6:5][From 6K]", maxFPS: 60),
            KinefinityRecordingMode(format: "M43", resolution: "4K[4096*2160][17:9]", maxFPS: 110),
            KinefinityRecordingMode(format: "M43", resolution: "4K[4096*1672][2.4:1]", maxFPS: 140),
            KinefinityRecordingMode(format: "M43", resolution: "4K[3840*2160][16:9]", maxFPS: 110),
            KinefinityRecordingMode(format: "M43", resolution: "3.8K[3840*1576][2.4:1]", maxFPS: 150),
            KinefinityRecordingMode(format: "M43", resolution: "4K[4096*3072][4:3]", maxFPS: 75),
            KinefinityRecordingMode(format: "M43", resolution: "2K[2048*1080][17:9][From 4K]", maxFPS: 110),
            KinefinityRecordingMode(format: "M43", resolution: "2K[2048*832][2.4:1][From 4K]", maxFPS: 140),
            KinefinityRecordingMode(format: "M43", resolution: "2K[1920*1080][16:9][From 4K]", maxFPS: 110),
            KinefinityRecordingMode(format: "M43", resolution: "1.9K[1920*784][2.4:1][From 4K]", maxFPS: 150),
            KinefinityRecordingMode(format: "S16", resolution: "2K[2048*1080][17:9]", maxFPS: 220),
            KinefinityRecordingMode(format: "S16", resolution: "2K[2048*832][2.4:1]", maxFPS: 270),
            KinefinityRecordingMode(format: "S16", resolution: "2K[1920*1080][16:9]", maxFPS: 218),
            KinefinityRecordingMode(format: "S16", resolution: "1.9K[1920*784][2.4:1]", maxFPS: 270),
        ]
    default:
        return []
    }
}

private func KinefinityRawDNGRecordingModes(cameraName:String) -> [KinefinityRecordingMode] {
    switch cameraName {
    case "MAVO Edge 8K":
        return [
            KinefinityRecordingMode(format: "FF", resolution: "4K[4096*2644][OG][From 8K]", maxFPS: 45),
            KinefinityRecordingMode(format: "FF", resolution: "4K[4096*2160][17:9][From 8K]", maxFPS: 55),
            KinefinityRecordingMode(format: "FF", resolution: "4K[3840*2160][16:9][From 8K]", maxFPS: 55),
            KinefinityRecordingMode(format: "S35", resolution: "4K[4096*2160][17:9][From 6K]", maxFPS: 72),
            KinefinityRecordingMode(format: "S35", resolution: "4K[3840*2160][16:9][From 6K]", maxFPS: 72),
        ]
    case "MAVO Edge 6K", "MAVO Mark2 LF":
        return [
            KinefinityRecordingMode(format: "FF", resolution: "4K[3840*2160][16:9][From 6K]", maxFPS: 58),
            KinefinityRecordingMode(format: "S35", resolution: "4K[4096*2160][17:9][From 4K]", maxFPS: 112),
            KinefinityRecordingMode(format: "S35", resolution: "4K[3840*2160][16:9][From 4K]", maxFPS: 112),
        ]
    case "MAVO Mark2 S35":
        return [
            KinefinityRecordingMode(format: "S35", resolution: "4K[3840*2160][16:9][From 6K]", maxFPS: 75),
            KinefinityRecordingMode(format: "M43", resolution: "4K[4096*2160][17:9]", maxFPS: 112),
            KinefinityRecordingMode(format: "M43", resolution: "4K[3840*2160][16:9]", maxFPS: 112),
        ]
    default:
        return []
    }
}

private func KinefinityFullFrame6KModes() -> [KinefinityRecordingMode] {
    return [
        KinefinityRecordingMode(format: "FF", resolution: "6K[6016*3984][OG]", maxFPS: 48),
        KinefinityRecordingMode(format: "FF", resolution: "6K[6016*3172][17:9]", maxFPS: 60),
        KinefinityRecordingMode(format: "FF", resolution: "6K[6016*2520][2.4:1]", maxFPS: 75),
        KinefinityRecordingMode(format: "FF", resolution: "5.7K[5760*3700][3:2]", maxFPS: 50),
        KinefinityRecordingMode(format: "FF", resolution: "6K[5760*3240][16:9]", maxFPS: 58),
        KinefinityRecordingMode(format: "FF", resolution: "5.7K[5760*2400][2.4:1]", maxFPS: 75),
        KinefinityRecordingMode(format: "FF", resolution: "5K[5120*3700][4:3]", maxFPS: 50),
        KinefinityRecordingMode(format: "FF", resolution: "5K[5120*2700][17:9]", maxFPS: 70),
        KinefinityRecordingMode(format: "FF", resolution: "5K[5120*2160][2.4:1]", maxFPS: 86),
        KinefinityRecordingMode(format: "FF", resolution: "4.6K[4608*3700][6:5]", maxFPS: 50),
        KinefinityRecordingMode(format: "FF", resolution: "3.8K[3840*2460][3:2][From 6K]", maxFPS: 50),
        KinefinityRecordingMode(format: "FF", resolution: "4K[3840*2160][16:9][From 6K]", maxFPS: 58),
        KinefinityRecordingMode(format: "FF", resolution: "3.8K[3840*1600][2.4:1][From 6K]", maxFPS: 75),
        KinefinityRecordingMode(format: "FF", resolution: "3.4K[3456*2460][4:3][From 6K]", maxFPS: 50),
        KinefinityRecordingMode(format: "FF", resolution: "3K[3072*2460][6:5][From 6K]", maxFPS: 50),
        KinefinityRecordingMode(format: "S35", resolution: "4K[4096*2700][3:2]", maxFPS: 70),
        KinefinityRecordingMode(format: "S35", resolution: "4K[4096*2160][17:9]", maxFPS: 112),
        KinefinityRecordingMode(format: "S35", resolution: "4K[4096*1720][2.4:1]", maxFPS: 140),
        KinefinityRecordingMode(format: "S35", resolution: "4K[3840*2160][16:9]", maxFPS: 112),
        KinefinityRecordingMode(format: "S35", resolution: "3.8K[3840*1600][2.4:1]", maxFPS: 150),
        KinefinityRecordingMode(format: "S35", resolution: "3.6K[3712*2700][4:3]", maxFPS: 70),
        KinefinityRecordingMode(format: "S35", resolution: "3.2K[3328*2700][6:5]", maxFPS: 70),
        KinefinityRecordingMode(format: "S35", resolution: "2.7K[2688*2688][1:1]", maxFPS: 70),
        KinefinityRecordingMode(format: "S35", resolution: "2K[2048*1080][17:9][From 4K]", maxFPS: 112),
        KinefinityRecordingMode(format: "S35", resolution: "2K[2048*860][2.4:1][From 4K]", maxFPS: 140),
        KinefinityRecordingMode(format: "S35", resolution: "2K[1920*1080][16:9][From 4K]", maxFPS: 112),
        KinefinityRecordingMode(format: "S35", resolution: "1.9K[1920*800][2.4:1][From 4K]", maxFPS: 140),
        KinefinityRecordingMode(format: "Pixel to Pixel", resolution: "3K[3072*1620][17:9]", maxFPS: 144),
        KinefinityRecordingMode(format: "Pixel to Pixel", resolution: "3K[3072*1200][2.4:1]", maxFPS: 195),
        KinefinityRecordingMode(format: "Pixel to Pixel", resolution: "3K[2944*1620][1.82:1]", maxFPS: 145),
        KinefinityRecordingMode(format: "Pixel to Pixel", resolution: "3K[2944*1200][2.4:1]", maxFPS: 195),
        KinefinityRecordingMode(format: "Pixel to Pixel", resolution: "2K[2048*1080][17:9]", maxFPS: 200),
        KinefinityRecordingMode(format: "Pixel to Pixel", resolution: "2K[2048*860][2.4:1]", maxFPS: 270),
        KinefinityRecordingMode(format: "Pixel to Pixel", resolution: "2K[1920*1080][16:9]", maxFPS: 220),
        KinefinityRecordingMode(format: "Pixel to Pixel", resolution: "1.9K[1920*800][2.4:1]", maxFPS: 290),
    ]
}
