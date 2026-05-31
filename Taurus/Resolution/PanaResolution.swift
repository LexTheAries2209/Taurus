//
//  PanaResolution.swift
//  Taurus
//
//  Created by 吴坤城 on 5/10/24.
//

import Foundation

func PanaResolution(cameradata:CameraData) -> [String] {
    var PanaResolution = [""]

    if cameradata.CameraName == "S1R2" || cameradata.CameraName == "S1M2" || cameradata.CameraName == "S1M2E" {
        let s1r2ProRes5_8 = ["5.8K[5760*3040][10bit 4:2:2][23.976p][17:9]","5.8K[5760*3040][10bit 4:2:2][24p][17:9]","5.8K[5760*3040][10bit 4:2:2][25p][17:9]","5.8K[5760*3040][10bit 4:2:2][29.97p][17:9]"]
        let s1r2ProRes4_7 = ["4.7K 4:3[4736*3552][10bit 4:2:2][23.976p]","4.7K 4:3[4736*3552][10bit 4:2:2][24p]","4.7K 4:3[4736*3552][10bit 4:2:2][25p]","4.7K 4:3[4736*3552][10bit 4:2:2][29.97p]"]
        let s1r2ProRes4K = ["DCI 4K[10bit 4:2:2][23.976p]","DCI 4K[10bit 4:2:2][24p]","DCI 4K[10bit 4:2:2][25p]","DCI 4K[10bit 4:2:2][29.97p]","DCI 4K[10bit 4:2:2][50p]","DCI 4K[10bit 4:2:2][59.94p]","UHD[10bit 4:2:2][23.976p]","UHD[10bit 4:2:2][24p]","UHD[10bit 4:2:2][25p]","UHD[10bit 4:2:2][29.97p]","UHD[10bit 4:2:2][50p]","UHD[10bit 4:2:2][59.94p]"]
        let s1r2ProResFHD = ["FHD[10bit 4:2:2][23.976p]","FHD[10bit 4:2:2][24p]","FHD[10bit 4:2:2][25p]","FHD[10bit 4:2:2][29.97p]","FHD[10bit 4:2:2][50p]","FHD[10bit 4:2:2][59.94p]","FHD[10bit 4:2:2][100p]","FHD[10bit 4:2:2][119.88p]","FHD[10bit 4:2:2][120p]"]
        let s1r2ProResFullFrame = s1r2ProRes5_8 + s1r2ProRes4K.filter { !$0.contains("[50p]") && !$0.contains("[59.94p]") } + s1r2ProResFHD
        let s1r2ProResCrop = s1r2ProRes4_7 + s1r2ProRes4K + s1r2ProResFHD
        let s1r2ProResPixel = s1r2ProRes5_8 + s1r2ProResCrop
        let s1r2RawFullFrame = ["5.8K[5760*3040][12bit RAW][23.976p][17:9]","5.8K[5760*3040][12bit RAW][24p][17:9]","5.8K[5760*3040][12bit RAW][25p][17:9]","5.8K[5760*3040][12bit RAW][29.97p][17:9]"]
        let s1r2RawPixel = s1r2RawFullFrame
        let s1r2HevcFullFrame = ["8.1K[8064*5376][10bit 4:2:0][23.976p/24p][OG]","7.2K[7200*4800][10bit 4:2:0][25p/29.97p][OG]","6.4K[6432*4288][10bit 4:2:0][23.976p/24p/25p/29.97p][OG]","8K[10bit 4:2:0][23.976p/24p/25p/29.97p]","5.9K[10bit 4:2:0][23.976p/24p/25p/29.97p]","5.9K[10bit 4:2:0][47.95p/48p/50p/59.94p]","4K[10bit 4:2:0][23.976p/24p/25p/29.97p]","4K[10bit 4:2:0][47.95p/48p/50p/59.94p]","4K[10bit 4:2:0][100p/119.88p/120p]","FHD[10bit 4:2:0][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:0][100p/119.88p/120p]"]
        let s1r2HevcCrop = ["4.7K 4:3[4736*3552][10bit 4:2:0][23.976p/24p/25p/29.97p]","4.7K 4:3[4736*3552][10bit 4:2:0][47.95p/48p/50p/59.94p]","4K[10bit 4:2:0][23.976p/24p/25p/29.97p]","4K[10bit 4:2:0][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:0][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:0][100p/119.88p/120p]"]
        let s1r2HevcPixel = ["5.9K[10bit 4:2:0][23.976p/24p/25p/29.97p]","5.9K[10bit 4:2:0][47.95p/48p/50p/59.94p]","4.7K 4:3[4736*3552][10bit 4:2:0][23.976p/24p/25p/29.97p]","4.7K 4:3[4736*3552][10bit 4:2:0][47.95p/48p/50p/59.94p]","4K[10bit 4:2:0][23.976p/24p/25p/29.97p]","4K[10bit 4:2:0][47.95p/48p/50p/59.94p]","4K[10bit 4:2:0][100p/119.88p/120p]","FHD[10bit 4:2:0][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:0][100p/119.88p/120p]"]
        let s1r2AvcAllI = ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","4K[10bit 4:2:2][47.95p/48p/50p/59.94p][Light]","FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p/120p]"]
        let s1r2AvcLongGOP = ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p/120p]"]
        let s1m2ProRes5_8 = ["5.8K[5760*3040][10bit 4:2:2][23.976p][17:9]","5.8K[5760*3040][10bit 4:2:2][24p][17:9]","5.8K[5760*3040][10bit 4:2:2][25p][17:9]","5.8K[5760*3040][10bit 4:2:2][29.97p][17:9]"]
        let s1m2ProRes4_8 = ["4.8K 4:3[4800*3600][10bit 4:2:2][23.976p]","4.8K 4:3[4800*3600][10bit 4:2:2][24p]","4.8K 4:3[4800*3600][10bit 4:2:2][25p]","4.8K 4:3[4800*3600][10bit 4:2:2][29.97p]"]
        let s1m2ProRes4K = ["DCI 4K[10bit 4:2:2][23.976p]","DCI 4K[10bit 4:2:2][24p]","DCI 4K[10bit 4:2:2][25p]","DCI 4K[10bit 4:2:2][29.97p]","DCI 4K[10bit 4:2:2][50p]","DCI 4K[10bit 4:2:2][59.94p]","UHD[10bit 4:2:2][23.976p]","UHD[10bit 4:2:2][24p]","UHD[10bit 4:2:2][25p]","UHD[10bit 4:2:2][29.97p]","UHD[10bit 4:2:2][50p]","UHD[10bit 4:2:2][59.94p]","Cs4K[4096*1728][10bit 4:2:2][23.976p][2.4:1]","Cs4K[4096*1728][10bit 4:2:2][24p][2.4:1]","Cs4K[4096*1728][10bit 4:2:2][25p][2.4:1]","Cs4K[4096*1728][10bit 4:2:2][29.97p][2.4:1]","Cs4K[4096*1728][10bit 4:2:2][50p][2.4:1]","Cs4K[4096*1728][10bit 4:2:2][59.94p][2.4:1]"]
        let s1m2ProRes3_3 = ["3.3K 4:3[3328*2496][10bit 4:2:2][23.976p]","3.3K 4:3[3328*2496][10bit 4:2:2][24p]","3.3K 4:3[3328*2496][10bit 4:2:2][25p]","3.3K 4:3[3328*2496][10bit 4:2:2][29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][50p]","3.3K 4:3[3328*2496][10bit 4:2:2][59.94p]"]
        let s1m2ProResFHD = ["FHD[10bit 4:2:2][23.976p]","FHD[10bit 4:2:2][24p]","FHD[10bit 4:2:2][25p]","FHD[10bit 4:2:2][29.97p]","FHD[10bit 4:2:2][50p]","FHD[10bit 4:2:2][59.94p]","FHD[10bit 4:2:2][100p]","FHD[10bit 4:2:2][119.88p]","FHD[10bit 4:2:2][120p]"]
        let s1m2ProResFullFrame = s1m2ProRes5_8 + s1m2ProRes4_8 + s1m2ProRes4K + s1m2ProResFHD
        let s1m2ProResCrop = s1m2ProRes4K + s1m2ProRes3_3 + s1m2ProResFHD
        let s1m2ProResPixel = s1m2ProRes4_8 + s1m2ProRes4K + s1m2ProRes3_3 + s1m2ProResFHD
        let s1m2RawPixel = ["5.8K[5760*3040][12bit RAW][23.976p][17:9]","5.8K[5760*3040][12bit RAW][24p][17:9]","5.8K[5760*3040][12bit RAW][25p][17:9]","5.8K[5760*3040][12bit RAW][29.97p][17:9]","DCI 4K[12bit RAW][23.976p]","DCI 4K[12bit RAW][24p]","DCI 4K[12bit RAW][25p]","DCI 4K[12bit RAW][29.97p]","DCI 4K[12bit RAW][50p]","DCI 4K[12bit RAW][59.94p]"]
        let s1m2HevcFullFrame = ["6K[5952*3968][10bit 4:2:0][23.976p/24p/25p/29.97p][OG]","6K[5952*2512][10bit 4:2:0][23.976p/24p/25p/29.97p][2.4:1]","6K[5952*2512][10bit 4:2:0][47.95p/48p/50p/59.94p][2.4:1]","5.1K[5088*3392][10bit 4:2:0][23.976p/24p/25p/29.97p][OG]","5.1K[5088*3392][10bit 4:2:0][47.95p/48p/50p/59.94p][OG]","5.9K[10bit 4:2:0][23.976p/24p/25p/29.97p]","5.9K[10bit 4:2:0][47.95p/48p/50p/59.94p]","4.8K 4:3[4800*3600][10bit 4:2:0][23.976p/24p/25p/29.97p]","4.8K 4:3[4800*3600][10bit 4:2:0][47.95p/48p/50p/59.94p]","4K[10bit 4:2:0][23.976p/24p/25p/29.97p]","4K[10bit 4:2:0][47.95p/48p/50p/59.94p]","4K[10bit 4:2:0][100p/119.88p/120p]","Cs4K[4096*1728][10bit 4:2:0][23.976p/24p/25p/29.97p][2.4:1]","Cs4K[4096*1728][10bit 4:2:0][47.95p/48p/50p/59.94p][2.4:1]","Cs4K[4096*1728][10bit 4:2:0][100p/119.88p/120p][2.4:1]","FHD[10bit 4:2:0][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:0][100p/119.88p/120p]","FHD[10bit 4:2:0][200p/239.76p/240p]"]
        let s1m2HevcCrop = ["4K[10bit 4:2:0][23.976p/24p/25p/29.97p]","4K[10bit 4:2:0][47.95p/48p/50p/59.94p]","4K[10bit 4:2:0][100p/119.88p/120p]","Cs4K[4096*1728][10bit 4:2:0][23.976p/24p/25p/29.97p][2.4:1]","Cs4K[4096*1728][10bit 4:2:0][47.95p/48p/50p/59.94p][2.4:1]","Cs4K[4096*1728][10bit 4:2:0][100p/119.88p/120p][2.4:1]","3.3K 4:3[3328*2496][10bit 4:2:0][23.976p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:0][47.95p/48p/50p/59.94p]","3.3K 4:3[3328*2496][10bit 4:2:0][100p/119.88p/120p]","FHD[10bit 4:2:0][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:0][100p/119.88p/120p]","FHD[10bit 4:2:0][200p/239.76p/240p]"]
        let s1m2HevcPixel = ["4.8K 4:3[4800*3600][10bit 4:2:0][23.976p/24p/25p/29.97p]","4.8K 4:3[4800*3600][10bit 4:2:0][47.95p/48p/50p/59.94p]"] + s1m2HevcCrop
        let s1m2AvcAllIFullFrame = ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","4K[10bit 4:2:2][47.95p/48p/50p/59.94p][Light]","Cs4K[4096*1728][10bit 4:2:2][23.976p/24p/25p/29.97p][2.4:1]","Cs4K[4096*1728][10bit 4:2:2][47.95p/48p/50p/59.94p][2.4:1]","Cs4K[4096*1728][10bit 4:2:2][47.95p/48p/50p/59.94p][Light][2.4:1]","FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p/120p]","FHD[10bit 4:2:2][200p/239.76p/240p]"]
        let s1m2AvcAllICrop = ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","4K[10bit 4:2:2][47.95p/48p/50p/59.94p][Light]","Cs4K[4096*1728][10bit 4:2:2][23.976p/24p/25p/29.97p][2.4:1]","Cs4K[4096*1728][10bit 4:2:2][47.95p/48p/50p/59.94p][2.4:1]","Cs4K[4096*1728][10bit 4:2:2][47.95p/48p/50p/59.94p][Light][2.4:1]","3.3K 4:3[3328*2496][10bit 4:2:2][23.976p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][47.95p/48p/50p/59.94p]","3.3K 4:3[3328*2496][10bit 4:2:2][47.95p/48p/50p/59.94p][Light]","FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p/120p]","FHD[10bit 4:2:2][200p/239.76p/240p]"]
        let s1m2AvcLongGOPFullFrame = ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","Cs4K[4096*1728][10bit 4:2:2][23.976p/24p/25p/29.97p][2.4:1]","Cs4K[4096*1728][10bit 4:2:2][47.95p/48p/50p/59.94p][2.4:1]","FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p/120p]","FHD[10bit 4:2:2][200p/239.76p/240p]"]
        let s1m2AvcLongGOPCrop = ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","Cs4K[4096*1728][10bit 4:2:2][23.976p/24p/25p/29.97p][2.4:1]","Cs4K[4096*1728][10bit 4:2:2][47.95p/48p/50p/59.94p][2.4:1]","3.3K 4:3[3328*2496][10bit 4:2:2][23.976p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p/120p]","FHD[10bit 4:2:2][200p/239.76p/240p]"]
        let s1m2eProRes5_8 = ["5.8K[5776*3056][10bit 4:2:2][23.976p][17:9]","5.8K[5776*3056][10bit 4:2:2][24p][17:9]","5.8K[5776*3056][10bit 4:2:2][25p][17:9]","5.8K[5776*3056][10bit 4:2:2][29.97p][17:9]"]
        let s1m2eProRes4K = ["DCI 4K[10bit 4:2:2][23.976p]","DCI 4K[10bit 4:2:2][24p]","DCI 4K[10bit 4:2:2][25p]","DCI 4K[10bit 4:2:2][29.97p]","DCI 4K[10bit 4:2:2][50p]","DCI 4K[10bit 4:2:2][59.94p]","UHD[10bit 4:2:2][23.976p]","UHD[10bit 4:2:2][24p]","UHD[10bit 4:2:2][25p]","UHD[10bit 4:2:2][29.97p]","UHD[10bit 4:2:2][50p]","UHD[10bit 4:2:2][59.94p]","Cs4K[4096*1728][10bit 4:2:2][23.976p][2.4:1]","Cs4K[4096*1728][10bit 4:2:2][24p][2.4:1]","Cs4K[4096*1728][10bit 4:2:2][25p][2.4:1]","Cs4K[4096*1728][10bit 4:2:2][29.97p][2.4:1]","Cs4K[4096*1728][10bit 4:2:2][50p][2.4:1]","Cs4K[4096*1728][10bit 4:2:2][59.94p][2.4:1]"]
        let s1m2eProResFullFrame4K = ["DCI 4K[10bit 4:2:2][23.976p]","DCI 4K[10bit 4:2:2][24p]","DCI 4K[10bit 4:2:2][25p]","DCI 4K[10bit 4:2:2][29.97p]","UHD[10bit 4:2:2][23.976p]","UHD[10bit 4:2:2][24p]","UHD[10bit 4:2:2][25p]","UHD[10bit 4:2:2][29.97p]","Cs4K[4096*1728][10bit 4:2:2][23.976p][2.4:1]","Cs4K[4096*1728][10bit 4:2:2][24p][2.4:1]","Cs4K[4096*1728][10bit 4:2:2][25p][2.4:1]","Cs4K[4096*1728][10bit 4:2:2][29.97p][2.4:1]","Cs4K[4096*1728][10bit 4:2:2][50p][2.4:1]","Cs4K[4096*1728][10bit 4:2:2][59.94p][2.4:1]"]
        let s1m2eProRes3_3 = ["3.3K 4:3[3328*2496][10bit 4:2:2][23.976p]","3.3K 4:3[3328*2496][10bit 4:2:2][24p]","3.3K 4:3[3328*2496][10bit 4:2:2][25p]","3.3K 4:3[3328*2496][10bit 4:2:2][29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][50p]"]
        let s1m2eProResFHD = ["FHD[10bit 4:2:2][23.976p]","FHD[10bit 4:2:2][24p]","FHD[10bit 4:2:2][25p]","FHD[10bit 4:2:2][29.97p]","FHD[10bit 4:2:2][50p]","FHD[10bit 4:2:2][59.94p]"]
        let s1m2eProResFullFrame = s1m2eProRes5_8 + s1m2eProResFullFrame4K + s1m2eProResFHD
        let s1m2eProResCrop = s1m2eProRes4K + s1m2eProRes3_3 + s1m2eProResFHD
        let s1m2eRawPixel = ["5.8K[5776*3056][12bit RAW][23.976p][17:9]","5.8K[5776*3056][12bit RAW][24p][17:9]","5.8K[5776*3056][12bit RAW][25p][17:9]","5.8K[5776*3056][12bit RAW][29.97p][17:9]","DCI 4K[12bit RAW][23.976p]","DCI 4K[12bit RAW][24p]","DCI 4K[12bit RAW][25p]","DCI 4K[12bit RAW][29.97p]","DCI 4K[12bit RAW][50p]","DCI 4K[12bit RAW][59.94p]"]
        let s1m2eHevcFullFrame = ["6K[5952*3968][10bit 4:2:0][23.976p/24p/25p/29.97p][OG]","6K[5952*3136][10bit 4:2:0][23.976p/24p/25p/29.97p][17:9]","6K[5952*2512][10bit 4:2:0][23.976p/24p/25p/29.97p][2.4:1]","6K[5952*2512][10bit 4:2:0][47.95p/48p/50p/59.94p][2.4:1]","5.9K[5888*3312][10bit 4:2:0][23.976p/24p/25p/29.97p]","4K[10bit 4:2:0][23.976p/24p/25p/29.97p]","4K[10bit 4:2:0][47.95p/48p/50p/59.94p]","Cs4K[4096*1728][10bit 4:2:0][23.976p/24p/25p/29.97p][2.4:1]","Cs4K[4096*1728][10bit 4:2:0][47.95p/48p/50p/59.94p][2.4:1]","FHD[10bit 4:2:0][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:0][100p/119.88p/120p]"]
        let s1m2eHevcCrop = ["4K[10bit 4:2:0][23.976p/24p/25p/29.97p]","4K[10bit 4:2:0][47.95p/48p/50p/59.94p]","Cs4K[4096*1728][10bit 4:2:0][23.976p/24p/25p/29.97p][2.4:1]","Cs4K[4096*1728][10bit 4:2:0][47.95p/48p/50p/59.94p][2.4:1]","3.3K 4:3[3328*2496][10bit 4:2:0][23.976p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:0][47.95p/48p/50p]","FHD[10bit 4:2:0][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:0][100p/119.88p/120p]"]
        let s1m2eHevcPixel = ["4K[10bit 4:2:0][23.976p/24p/25p/29.97p]","4K[10bit 4:2:0][47.95p/48p/50p/59.94p]","Cs4K[4096*1728][10bit 4:2:0][23.976p/24p/25p/29.97p][2.4:1]","Cs4K[4096*1728][10bit 4:2:0][47.95p/48p/50p/59.94p][2.4:1]","3.3K 4:3[3328*2496][10bit 4:2:0][23.976p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:0][47.95p/48p/50p]","FHD[10bit 4:2:0][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:0][47.95p/48p/50p/59.94p]"]
        let s1m2eAvcAllIFullFrame = ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","4K[10bit 4:2:2][47.95p/48p/50p/59.94p][Light]","Cs4K[4096*1728][10bit 4:2:2][23.976p/24p/25p/29.97p][2.4:1]","Cs4K[4096*1728][10bit 4:2:2][47.95p/48p/50p/59.94p][2.4:1]","Cs4K[4096*1728][10bit 4:2:2][47.95p/48p/50p/59.94p][Light][2.4:1]","FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p/120p]"]
        let s1m2eAvcAllICrop = ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","4K[10bit 4:2:2][47.95p/48p/50p/59.94p][Light]","Cs4K[4096*1728][10bit 4:2:2][23.976p/24p/25p/29.97p][2.4:1]","Cs4K[4096*1728][10bit 4:2:2][47.95p/48p/50p/59.94p][2.4:1]","Cs4K[4096*1728][10bit 4:2:2][47.95p/48p/50p/59.94p][Light][2.4:1]","3.3K 4:3[3328*2496][10bit 4:2:2][23.976p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][47.95p/48p/50p]","3.3K 4:3[3328*2496][10bit 4:2:2][47.95p/48p/50p][Light]","FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p/120p]"]
        let s1m2eAvcAllIPixel = s1m2eAvcAllICrop.filter { $0 != "FHD[10bit 4:2:2][100p/119.88p/120p]" }
        let s1m2eAvcLongGOPFullFrame = ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","Cs4K[4096*1728][10bit 4:2:2][23.976p/24p/25p/29.97p][2.4:1]","Cs4K[4096*1728][10bit 4:2:2][47.95p/48p/50p/59.94p][2.4:1]","FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p/120p]"]
        let s1m2eAvcLongGOPCrop = ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","Cs4K[4096*1728][10bit 4:2:2][23.976p/24p/25p/29.97p][2.4:1]","Cs4K[4096*1728][10bit 4:2:2][47.95p/48p/50p/59.94p][2.4:1]","3.3K 4:3[3328*2496][10bit 4:2:2][23.976p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][47.95p/48p/50p]","FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p/120p]"]
        let s1m2eAvcLongGOPPixel = s1m2eAvcLongGOPCrop.filter { $0 != "FHD[10bit 4:2:2][100p/119.88p/120p]" }
        let sSeriesProResFullFrame = ["DCI 5.8K[5776*3056][10bit 4:2:2][23.976p]","DCI 5.8K[5776*3056][10bit 4:2:2][24p]","DCI 5.8K[5776*3056][10bit 4:2:2][25p]","DCI 5.8K[5776*3056][10bit 4:2:2][29.97p]","DCI 4K[10bit 4:2:2][23.976p]","DCI 4K[10bit 4:2:2][24p]","DCI 4K[10bit 4:2:2][25p]","DCI 4K[10bit 4:2:2][29.97p]","FHD[10bit 4:2:2][23.976p]","FHD[10bit 4:2:2][24p]","FHD[10bit 4:2:2][25p]","FHD[10bit 4:2:2][29.97p]","FHD[10bit 4:2:2][50p]","FHD[10bit 4:2:2][59.94p]"]
        let sSeriesProResCrop = ["DCI 4K[10bit 4:2:2][23.976p]","DCI 4K[10bit 4:2:2][24p]","DCI 4K[10bit 4:2:2][25p]","DCI 4K[10bit 4:2:2][29.97p]","DCI 4K[10bit 4:2:2][50p]","DCI 4K[10bit 4:2:2][59.94p]","3.3K 4:3[3328*2496][10bit 4:2:2][23.976p]","3.3K 4:3[3328*2496][10bit 4:2:2][24p]","3.3K 4:3[3328*2496][10bit 4:2:2][25p]","3.3K 4:3[3328*2496][10bit 4:2:2][29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][50p]","FHD[10bit 4:2:2][24p]","FHD[10bit 4:2:2][25p]","FHD[10bit 4:2:2][29.97p]","FHD[10bit 4:2:2][50p]","FHD[10bit 4:2:2][59.94p]"]
        let sSeriesRawPixel = ["DCI 5.8K[5776*3056][12bit RAW][23.976p]","DCI 5.8K[5776*3056][12bit RAW][24p]","DCI 5.8K[5776*3056][12bit RAW][25p]","DCI 5.8K[5776*3056][12bit RAW][29.97p]","DCI 4K[12bit RAW][23.976p]","DCI 4K[12bit RAW][24p]","DCI 4K[12bit RAW][25p]","DCI 4K[12bit RAW][29.97p]","DCI 4K[12bit RAW][50p]","DCI 4K[12bit RAW][59.94p]"]
        let sSeriesHevcCrop = ["4K[10bit 4:2:0][23.976p/24p/25p/29.97p]","4K[10bit 4:2:0][47.95p/48p/50p/59.94p]","4K[10bit 4:2:0][100p/119.88p]","3.3K 4:3[3328*2496][10bit 4:2:0][23.976p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:0][47.95p/48p/50p]","FHD[10bit 4:2:0][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:0][100p/119.88p]"]
        let sSeriesAvcAllI = ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","4K[10bit 4:2:2][47.95p/48p/50p/59.94p][Light]","3.3K 4:3[3328*2496][10bit 4:2:2][23.976p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][47.95p/48p/50p]","3.3K 4:3[3328*2496][10bit 4:2:2][47.95p/48p/50p][Light]","FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p]"]
        let sSeriesAvcLongGOP = ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","UHD[10bit 4:2:2][100p/119.88p]","3.3K 4:3[3328*2496][10bit 4:2:2][23.976p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][47.95p/48p/50p]","FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p]"]

        if cameradata.Codec == "ProRes RAW HQ" || cameradata.Codec == "ProRes RAW" {
            switch cameradata.Format {
            case "Full Frame", "APS-C" :
                PanaResolution = ["无选项"]
            case "Pixel to Pixel" :
                if cameradata.CameraName == "S1R2" {
                    PanaResolution = s1r2RawPixel
                }
                else if cameradata.CameraName == "S1M2" {
                    PanaResolution = s1m2RawPixel
                }
                else if cameradata.CameraName == "S1M2E" {
                    PanaResolution = s1m2eRawPixel
                }
                else {
                    PanaResolution = sSeriesRawPixel
                }
            default :
                PanaResolution = ["无选项"]
            }
        }
        else if cameradata.Codec == "ProRes 422 HQ" || cameradata.Codec == "ProRes 422" {
            switch cameradata.Format {
            case "Full Frame" :
                if cameradata.CameraName == "S1R2" {
                    PanaResolution = s1r2ProResFullFrame
                }
                else if cameradata.CameraName == "S1M2" {
                    PanaResolution = s1m2ProResFullFrame
                }
                else if cameradata.CameraName == "S1M2E" {
                    PanaResolution = s1m2eProResFullFrame
                }
                else {
                    PanaResolution = sSeriesProResFullFrame
                }
            case "APS-C" :
                if cameradata.CameraName == "S1R2" {
                    PanaResolution = s1r2ProResCrop
                }
                else if cameradata.CameraName == "S1M2" {
                    PanaResolution = s1m2ProResCrop
                }
                else if cameradata.CameraName == "S1M2E" {
                    PanaResolution = s1m2eProResCrop
                }
                else {
                    PanaResolution = sSeriesProResCrop
                }
            case "Pixel to Pixel" :
                if cameradata.CameraName == "S1R2" {
                    PanaResolution = s1r2ProResPixel
                }
                else if cameradata.CameraName == "S1M2" {
                    PanaResolution = s1m2ProResPixel
                }
                else if cameradata.CameraName == "S1M2E" {
                    PanaResolution = s1m2eProResCrop
                }
                else {
                    PanaResolution = sSeriesProResCrop
                }
            default :
                PanaResolution = ["无选项"]
            }
        }
        else if cameradata.Codec == "HEVC LongGOP" {
            switch cameradata.Format {
            case "Full Frame" :
                if cameradata.CameraName == "S1R2" {
                    PanaResolution = s1r2HevcFullFrame
                }
                else if cameradata.CameraName == "S1M2" {
                    PanaResolution = s1m2HevcFullFrame
                }
                else if cameradata.CameraName == "S1M2E" {
                    PanaResolution = s1m2eHevcFullFrame
                }
                else {
                    PanaResolution = ["6K 3:2[5952*3968][10bit 4:2:0][23.976p/24p/25p/29.97p]","DCI 6K[5952*3136][10bit 4:2:0][23.976p/24p/25p/29.97p]","5.9K[5888*3312][10bit 4:2:0][23.976p/24p/25p/29.97p]","DCI 5.8K[5776*3056][10bit 4:2:0][23.976p/24p/25p/29.97p]","4K[10bit 4:2:0][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:0][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:0][100p/119.88p]"]
                }
            case "APS-C" :
                if cameradata.CameraName == "S1R2" {
                    PanaResolution = s1r2HevcCrop
                }
                else if cameradata.CameraName == "S1M2" {
                    PanaResolution = s1m2HevcCrop
                }
                else if cameradata.CameraName == "S1M2E" {
                    PanaResolution = s1m2eHevcCrop
                }
                else {
                    PanaResolution = sSeriesHevcCrop
                }
            case "Pixel to Pixel" :
                if cameradata.CameraName == "S1R2" {
                    PanaResolution = s1r2HevcPixel
                }
                else if cameradata.CameraName == "S1M2" {
                    PanaResolution = s1m2HevcPixel
                }
                else if cameradata.CameraName == "S1M2E" {
                    PanaResolution = s1m2eHevcPixel
                }
                else {
                    PanaResolution = sSeriesHevcCrop
                }
            default :
                PanaResolution = ["无选项"]
            }
        }
        else if cameradata.Codec == "AVC ALL-I" {
            switch cameradata.Format {
            case "Full Frame" :
                if cameradata.CameraName == "S1R2" {
                    PanaResolution = s1r2AvcAllI
                }
                else if cameradata.CameraName == "S1M2" {
                    PanaResolution = s1m2AvcAllIFullFrame
                }
                else if cameradata.CameraName == "S1M2E" {
                    PanaResolution = s1m2eAvcAllIFullFrame
                }
                else {
                    PanaResolution = ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p]"]
                }
            case "APS-C" :
                if cameradata.CameraName == "S1R2" {
                    PanaResolution = s1r2AvcAllI
                }
                else if cameradata.CameraName == "S1M2" {
                    PanaResolution = s1m2AvcAllICrop
                }
                else if cameradata.CameraName == "S1M2E" {
                    PanaResolution = s1m2eAvcAllICrop
                }
                else {
                    PanaResolution = sSeriesAvcAllI
                }
            case "Pixel to Pixel" :
                if cameradata.CameraName == "S1R2" {
                    PanaResolution = s1r2AvcAllI
                }
                else if cameradata.CameraName == "S1M2" {
                    PanaResolution = s1m2AvcAllICrop
                }
                else if cameradata.CameraName == "S1M2E" {
                    PanaResolution = s1m2eAvcAllIPixel
                }
                else {
                    PanaResolution = sSeriesAvcAllI
                }
            default :
                PanaResolution = ["无选项"]
            }
        }
        else if cameradata.Codec == "AVC LongGOP" {
            switch cameradata.Format {
            case "Full Frame" :
                if cameradata.CameraName == "S1R2" {
                    PanaResolution = s1r2AvcLongGOP
                }
                else if cameradata.CameraName == "S1M2" {
                    PanaResolution = s1m2AvcLongGOPFullFrame
                }
                else if cameradata.CameraName == "S1M2E" {
                    PanaResolution = s1m2eAvcLongGOPFullFrame
                }
                else {
                    PanaResolution = ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p]"]
                }
            case "APS-C" :
                if cameradata.CameraName == "S1R2" {
                    PanaResolution = s1r2AvcLongGOP
                }
                else if cameradata.CameraName == "S1M2" {
                    PanaResolution = s1m2AvcLongGOPCrop
                }
                else if cameradata.CameraName == "S1M2E" {
                    PanaResolution = s1m2eAvcLongGOPCrop
                }
                else {
                    PanaResolution = sSeriesAvcLongGOP
                }
            case "Pixel to Pixel" :
                if cameradata.CameraName == "S1R2" {
                    PanaResolution = s1r2AvcLongGOP
                }
                else if cameradata.CameraName == "S1M2" {
                    PanaResolution = s1m2AvcLongGOPCrop
                }
                else if cameradata.CameraName == "S1M2E" {
                    PanaResolution = s1m2eAvcLongGOPPixel
                }
                else {
                    PanaResolution = sSeriesAvcLongGOP
                }
            default :
                PanaResolution = ["无选项"]
            }
        }
    }

    else if cameradata.CameraName == "S1H" {
        if cameradata.Codec == "HEVC LongGOP" {
            switch cameradata.Format {
            case "Full Frame" :
                PanaResolution = ["6K 3:2[5952*3968][10bit 4:2:0][23.976p/24p]","5.9K[5888*3312][10bit 4:2:0][23.976p/24p/25p/29.97p]","5.4K 3:2[5376*3584][10bit 4:2:0][25p/29.97p]","FHD[10bit 4:2:0][47.95p/48p]","FHD[10bit 4:2:0][100p/119.88p]"]
            case "APS-C" :
                PanaResolution = ["4K[10bit 4:2:0][47.95p/48p/50p/59.94p]","3.3K 4:3[3328*2496][10bit 4:2:0][47.95p/48p/50p]","FHD[10bit 4:2:0][47.95p/48p]","FHD[10bit 4:2:0][100p/119.88p]"]
            case "Pixel to Pixel" :
                PanaResolution = ["4K[10bit 4:2:0][47.95p/48p/50p/59.94p]","3.3K 4:3[3328*2496][10bit 4:2:0][47.95p/48p/50p]","FHD[10bit 4:2:0][47.95p/48p]"]
            default :
                PanaResolution = ["无选项"]
            }
        }
        if cameradata.Codec == "AVC ALL-I" {
            switch cameradata.Format {
            case "Full Frame" :
                PanaResolution = ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][50p/59.94p]"]
            case "APS-C" :
                PanaResolution = ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][50p/59.94p]"]
            case "Pixel to Pixel" :
                PanaResolution = ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][50p/59.94p]"]
            default :
                PanaResolution = ["无选项"]
            }
        }
        if cameradata.Codec == "AVC LongGOP" {
            switch cameradata.Format {
            case "Full Frame" :
                PanaResolution = ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][50p/59.94p]"]
            case "APS-C" :
                PanaResolution = ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][50p/59.94p]"]
            case "Pixel to Pixel" :
                PanaResolution = ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][50p/59.94p]"]
            default :
                PanaResolution = ["无选项"]
            }
        }
    }
    
    else if cameradata.CameraName == "S5M2" || cameradata.CameraName == "S5M2X" || cameradata.CameraName == "S9" {
        if cameradata.Codec == "ProRes 422 HQ" || cameradata.Codec == "ProRes 422"{
            switch cameradata.Format {
            case "Full Frame" :
                PanaResolution = ["DCI 5.8K[5776*3056][10bit 4:2:2][23.976p]","DCI 5.8K[5776*3056][10bit 4:2:2][24p]","DCI 5.8K[5776*3056][10bit 4:2:2][25p]","DCI 5.8K[5776*3056][10bit 4:2:2][29.97p]","DCI 4K[10bit 4:2:2][23.976p]","DCI 4K[10bit 4:2:2][24p]","DCI 4K[10bit 4:2:2][25p]","DCI 4K[10bit 4:2:2][29.97p]","FHD[10bit 4:2:2][23.976p]","FHD[10bit 4:2:2][24p]","FHD[10bit 4:2:2][25p]","FHD[10bit 4:2:2][29.97p]","FHD[10bit 4:2:2][50p]","FHD[10bit 4:2:2][59.94p]"]
            case "APS-C" :
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.976p]","DCI 4K[10bit 4:2:2][24p]","DCI 4K[10bit 4:2:2][25p]","DCI 4K[10bit 4:2:2][29.97p]","DCI 4K[10bit 4:2:2][50p]","DCI 4K[10bit 4:2:2][59.94p]","3.3K 4:3[3328*2496][10bit 4:2:2][23.976p]","3.3K 4:3[3328*2496][10bit 4:2:2][24p]","3.3K 4:3[3328*2496][10bit 4:2:2][25p]","3.3K 4:3[3328*2496][10bit 4:2:2][29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][50p]","FHD[10bit 4:2:2][24p]","FHD[10bit 4:2:2][25p]","FHD[10bit 4:2:2][29.97p]","FHD[10bit 4:2:2][50p]","FHD[10bit 4:2:2][59.94p]"]
            case "Pixel to Pixel" :
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.976p]","DCI 4K[10bit 4:2:2][24p]","DCI 4K[10bit 4:2:2][25p]","DCI 4K[10bit 4:2:2][29.97p]","DCI 4K[10bit 4:2:2][50p]","DCI 4K[10bit 4:2:2][59.94p]","3.3K 4:3[3328*2496][10bit 4:2:2][23.976p]","3.3K 4:3[3328*2496][10bit 4:2:2][24p]","3.3K 4:3[3328*2496][10bit 4:2:2][25p]","3.3K 4:3[3328*2496][10bit 4:2:2][29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][50p]","FHD[10bit 4:2:2][24p]","FHD[10bit 4:2:2][25p]","FHD[10bit 4:2:2][29.97p]","FHD[10bit 4:2:2][50p]","FHD[10bit 4:2:2][59.94p]"]
            default :
                PanaResolution = ["无选项"]
            }
        }
        else if cameradata.Codec == "HEVC LongGOP" {
            switch cameradata.Format {
            case "Full Frame" :
                PanaResolution = ["6K 3:2[5952*3968][10bit 4:2:0][23.976p/24p/25p/29.97p]","DCI 6K[5952*3136][10bit 4:2:0][23.976p/24p/25p/29.97p]","5.9K[5888*3312][10bit 4:2:0][23.976p/24p/25p/29.97p]","4K[10bit 4:2:0][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:0][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:0][100p/119.88p]"]
            case "APS-C" :
                PanaResolution = ["4K[10bit 4:2:0][23.976p/24p/25p/29.97p]","4K[10bit 4:2:0][47.95p/48p/50p/59.94p]","3.3K 4:3[3328*2496][10bit 4:2:0][23.976p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:0][47.95p/48p/50p]","FHD[10bit 4:2:0][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:0][100p/119.88p]"]
            case "Pixel to Pixel" :
                PanaResolution = ["4K[10bit 4:2:0][23.976p/24p/25p/29.97p]","4K[10bit 4:2:0][47.95p/48p/50p/59.94p]","3.3K 4:3[3328*2496][10bit 4:2:0][23.976p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:0][47.95p/48p/50p]","FHD[10bit 4:2:0][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:0][47.95p/48p/50p/59.94p]"]
            default :
                PanaResolution = ["无选项"]
            }
        }
        else if cameradata.Codec == "AVC ALL-I" {
            switch cameradata.Format {
            case "Full Frame" :
                PanaResolution = ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p]"]
            case "APS-C" :
                PanaResolution = ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","4K[10bit 4:2:2][47.95p/48p/50p/59.94p][Light]","3.3K 4:3[3328*2496][10bit 4:2:2][23.976p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][47.95p/48p/50p]","3.3K 4:3[3328*2496][10bit 4:2:2][47.95p/48p/50p][Light]","FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p]"]
            case "Pixel to Pixel" :
                PanaResolution = ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","4K[10bit 4:2:2][47.95p/48p/50p/59.94p][Light]","3.3K 4:3[3328*2496][10bit 4:2:2][23.976p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][47.95p/48p/50p]","3.3K 4:3[3328*2496][10bit 4:2:2][47.95p/48p/50p][Light]","FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]"]
            default :
                PanaResolution = ["无选项"]
            }
        }
        else if cameradata.Codec == "AVC LongGOP" {
            switch cameradata.Format {
            case "Full Frame" :
                PanaResolution = ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p]"]
            case "APS-C" :
                PanaResolution = ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","3.3K 4:3[3328*2496][10bit 4:2:2][23.976p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][47.95p/48p/50p]","FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p]"]
            case "Pixel to Pixel" :
                PanaResolution = ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","3.3K 4:3[3328*2496][10bit 4:2:2][23.976p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][47.95p/48p/50p]","FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]"]
            default :
                PanaResolution = ["无选项"]
            }
        }
    }
    
    else if cameradata.CameraName == "GH7" {
        let gh7RawM43 = ["5.7K[5728*3024][12bit RAW][23.976p][17:9]","5.7K[5728*3024][12bit RAW][24p][17:9]","5.7K[5728*3024][12bit RAW][25p][17:9]","5.7K[5728*3024][12bit RAW][29.97p][17:9]"]
        let gh7RawPixel = ["DCI 4K[12bit RAW][23.976p]","DCI 4K[12bit RAW][24p]","DCI 4K[12bit RAW][25p]","DCI 4K[12bit RAW][29.97p]","DCI 4K[12bit RAW][50p]","DCI 4K[12bit RAW][59.94p]"]
        let gh7ProRes5_7 = ["5.7K[5728*3024][10bit 4:2:2][23.976p][17:9]","5.7K[5728*3024][10bit 4:2:2][24p][17:9]","5.7K[5728*3024][10bit 4:2:2][25p][17:9]","5.7K[5728*3024][10bit 4:2:2][29.97p][17:9]"]
        let gh7ProRes4K = ["DCI 4K[10bit 4:2:2][23.976p]","DCI 4K[10bit 4:2:2][24p]","DCI 4K[10bit 4:2:2][25p]","DCI 4K[10bit 4:2:2][29.97p]","DCI 4K[10bit 4:2:2][50p]","DCI 4K[10bit 4:2:2][59.94p]"]
        let gh7ProResFHD = ["FHD[10bit 4:2:2][23.976p]","FHD[10bit 4:2:2][24p]","FHD[10bit 4:2:2][25p]","FHD[10bit 4:2:2][29.97p]","FHD[10bit 4:2:2][50p]","FHD[10bit 4:2:2][59.94p]"]
        let gh7HevcM43 = ["5.8K[5760*4320][10bit 4:2:0][23.976p/24p/25p/29.97p][OG]","5.7K[5728*3024][10bit 4:2:0][23.976p/24p/25p/29.97p][17:9]","5.7K[5728*3024][10bit 4:2:0][47.95p/48p/50p/59.94p][17:9]","4K[10bit 4:2:0][23.976p/24p/25p/29.97p]","4K[10bit 4:2:0][47.95p/48p/50p/59.94p]","4K[10bit 4:2:0][100p/119.88p/120p]","FHD[10bit 4:2:0][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:0][100p/119.88p/120p]","FHD[10bit 4:2:0][200p/239.76p]"]
        let gh7HevcPixel = ["4.4K 4:3[4352*3264][10bit 4:2:0][47.95p/48p/50p/59.94p]","4K[10bit 4:2:0][23.976p/24p/25p/29.97p]","4K[10bit 4:2:0][47.95p/48p/50p/59.94p]","4K[10bit 4:2:0][100p/119.88p/120p]","FHD[10bit 4:2:0][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:0][100p/119.88p/120p]"]
        let gh7AvcAllIM43 = ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","4K[10bit 4:2:2][47.95p/48p/50p/59.94p][Light]","FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p/120p]","FHD[10bit 4:2:2][200p/239.76p]"]
        let gh7AvcAllIPixel = ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","4K[10bit 4:2:2][47.95p/48p/50p/59.94p][Light]","FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p/120p]"]
        let gh7AvcLongGOPM43 = ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p/120p]","FHD[10bit 4:2:2][200p/239.76p]"]
        let gh7AvcLongGOPPixel = ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p/120p]"]

        if cameradata.Codec == "ProRes RAW HQ" || cameradata.Codec == "ProRes RAW" {
            if cameradata.Format == "M43" {
                PanaResolution = gh7RawM43
            }
            else if cameradata.Format == "Pixel to Pixel" {
                PanaResolution = gh7RawPixel
            }
            else {
                PanaResolution = ["无选项"]
            }
        }
        else if cameradata.Codec == "ProRes 422 HQ" || cameradata.Codec == "ProRes 422" {
            if cameradata.Format == "M43" {
                PanaResolution = gh7ProRes5_7 + gh7ProRes4K + gh7ProResFHD
            }
            else if cameradata.Format == "Pixel to Pixel" {
                PanaResolution = gh7ProRes4K + gh7ProResFHD
            }
            else {
                PanaResolution = ["无选项"]
            }
        }
        else if cameradata.Codec == "HEVC LongGOP" {
            if cameradata.Format == "M43" {
                PanaResolution = gh7HevcM43
            }
            else if cameradata.Format == "Pixel to Pixel" {
                PanaResolution = gh7HevcPixel
            }
            else {
                PanaResolution = ["无选项"]
            }
        }
        else if cameradata.Codec == "AVC ALL-I" {
            if cameradata.Format == "M43" {
                PanaResolution = gh7AvcAllIM43
            }
            else if cameradata.Format == "Pixel to Pixel" {
                PanaResolution = gh7AvcAllIPixel
            }
            else {
                PanaResolution = ["无选项"]
            }
        }
        else if cameradata.Codec == "AVC LongGOP" {
            if cameradata.Format == "M43" {
                PanaResolution = gh7AvcLongGOPM43
            }
            else if cameradata.Format == "Pixel to Pixel" {
                PanaResolution = gh7AvcLongGOPPixel
            }
            else {
                PanaResolution = ["无选项"]
            }
        }
    }
    else if cameradata.CameraName == "GH6" || cameradata.CameraName == "G9M2" {
        if cameradata.Codec == "ProRes RAW HQ" || cameradata.Codec == "ProRes RAW" {
            PanaResolution = ["无选项"]
        }
        else if cameradata.Codec == "ProRes 422 HQ" || cameradata.Codec == "ProRes 422" {
            if cameradata.Format == "M43" {
                PanaResolution = ["DCI 5.7K[5728*3024][10bit 4:2:2][23.976p]","DCI 5.7K[5728*3024][10bit 4:2:2][24p]","DCI 5.7K[5728*3024][10bit 4:2:2][25p]","DCI 5.7K[5728*3024][10bit 4:2:2][29.97p]","DCI 4K[10bit 4:2:2][23.976p]","DCI 4K[10bit 4:2:2][24p]","DCI 4K[10bit 4:2:2][25p]","DCI 4K[10bit 4:2:2][29.97p]","DCI 4K[10bit 4:2:2][50p]","DCI 4K[10bit 4:2:2][59.94p]","FHD[10bit 4:2:2][23.976p]","FHD[10bit 4:2:2][24p]","FHD[10bit 4:2:2][25p]","FHD[10bit 4:2:2][29.97p]","FHD[10bit 4:2:2][50p]","FHD[10bit 4:2:2][59.94p]"]
            }
            else {
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.976p]","DCI 4K[10bit 4:2:2][24p]","DCI 4K[10bit 4:2:2][25p]","DCI 4K[10bit 4:2:2][29.97p]","DCI 4K[10bit 4:2:2][50p]","DCI 4K[10bit 4:2:2][59.94p]","FHD[10bit 4:2:2][23.976p]","FHD[10bit 4:2:2][24p]","FHD[10bit 4:2:2][25p]","FHD[10bit 4:2:2][29.97p]","FHD[10bit 4:2:2][50p]","FHD[10bit 4:2:2][59.94p]"]
            }
        }
        else if cameradata.Codec == "HEVC LongGOP" {
            if cameradata.Format == "M43" {
                PanaResolution = ["5.8K[5760*4320][10bit 4:2:0][23.976p/24p/25p/29.97p][OG]","DCI 5.7K[5728*3024][10bit 4:2:0][23.976p/24p/25p/29.97p]","DCI 5.7K[5728*3024][10bit 4:2:0][47.95p/48p/50p/59.94p]","4K[10bit 4:2:0][23.976p/24p/25p/29.97p]","4K[10bit 4:2:0][47.95p/48p/50p/59.94p]","4K[10bit 4:2:0][100p/119.88p]","FHD[10bit 4:2:0][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:0][100p/119.88p]","FHD[10bit 4:2:0][200p/239.76p]"]
            }
            else {
                PanaResolution = ["4.4K 4:3[4352*3264][10bit 4:2:0][47.95p/48p/50p/59.94p]","4K[10bit 4:2:0][23.976p/24p/25p/29.97p]","4K[10bit 4:2:0][47.95p/48p/50p/59.94p]","4K[10bit 4:2:0][100p/119.88p]","FHD[10bit 4:2:0][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:0][100p/119.88p]"]
            }
        }
        else if cameradata.Codec == "AVC ALL-I" {
            if cameradata.Format == "M43" {
                PanaResolution = ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","4K[10bit 4:2:2][47.95p/48p/50p/59.94p][Light]","FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p]","FHD[10bit 4:2:2][200p/239.76p]"]
            }
            else {
                PanaResolution = ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","4K[10bit 4:2:2][47.95p/48p/50p/59.94p][Light]","FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p]"]
            }
        }
        else if cameradata.Codec == "AVC LongGOP" {
            if cameradata.Format == "M43" {
                PanaResolution = ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","UHD[10bit 4:2:2][100p/119.88p]","FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p]","FHD[10bit 4:2:2][200p/239.76p]"]
            }
            else {
                PanaResolution = ["4K[10bit 4:2:2][23.976p/24p/25p/29.97p]","4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","UHD[10bit 4:2:2][100p/119.88p]","FHD[10bit 4:2:2][23.976p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p]"]
            }
        }
    }
    else {
        PanaResolution = ["无选项"]
    }
    return PanaResolution
}
