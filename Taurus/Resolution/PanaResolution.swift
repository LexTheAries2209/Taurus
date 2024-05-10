//
//  PanaResolution.swift
//  Taurus
//
//  Created by 吴坤城 on 5/10/24.
//

import Foundation

func PanaResolution(cameradata:CameraData) -> [String] {
    var PanaResolution = [""]
    if cameradata.CameraName == "S1H" {
        if cameradata.Codec == "HEVC LongGOP" {
            switch cameradata.Format {
            case "Full Frame" :
                PanaResolution = ["6K 3:2[5952*3968][10bit 4:2:0][23.98p/24p]","5.9K[5888*3312][10bit 4:2:0][23.98p/24p/25p/29.97p]","5.4K 3:2[5376*3584][10bit 4:2:0][25p/29.97p]","FHD[10bit 4:2:0][47.95p/48p]","FHD[10bit 4:2:0][100p/119.88p]"]
            case "APS-C" :
                PanaResolution = ["DCI 4K[10bit 4:2:0][47.95p/48p/50p/59.94p]","UHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","3.3K 4:3[3328*2496][10bit 4:2:0][47.95p/48p/50p]","FHD[10bit 4:2:0][47.95p/48p]","FHD[10bit 4:2:0][100p/119.88p]"]
            case "Pixel to Pixel" :
                PanaResolution = ["DCI 4K[10bit 4:2:0][47.95p/48p/50p/59.94p]","UHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","3.3K 4:3[3328*2496][10bit 4:2:0][47.95p/48p/50p]","FHD[10bit 4:2:0][47.95p/48p]"]
            default :
                PanaResolution = [""]
            }
        }
        if cameradata.Codec == "AVC ALL-I" {
            switch cameradata.Format {
            case "Full Frame" :
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][50p/59.94p]"]
            case "APS-C" :
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][50p/59.94p]"]
            case "Pixel to Pixel" :
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][50p/59.94p]"]
            default :
                PanaResolution = [""]
            }
        }
        if cameradata.Codec == "AVC LongGOP" {
            switch cameradata.Format {
            case "Full Frame" :
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][50p/59.94p]"]
            case "APS-C" :
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][50p/59.94p]"]
            case "Pixel to Pixel" :
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][50p/59.94p]"]
            default :
                PanaResolution = [""]
            }
        }
    }
    
    else if cameradata.CameraName == "S5M2" || cameradata.CameraName == "S5M2X"{
        if cameradata.Codec == "Prores 422 HQ" || cameradata.Codec == "Prores 422"{
            switch cameradata.Format {
            case "Full Frame" :
                PanaResolution = ["DCI 5.8K[5776*3056][10bit 4:2:2][23.98p]","DCI 5.8K[5776*3056][10bit 4:2:2][24p]","DCI 5.8K[5776*3056][10bit 4:2:2][25p]","DCI 5.8K[5776*3056][10bit 4:2:2][29.97p]","DCI 4K[10bit 4:2:2][23.98p]","DCI 4K[10bit 4:2:2][24p]","DCI 4K[10bit 4:2:2][25p]","DCI 4K[10bit 4:2:2][29.97p]","FHD[10bit 4:2:2][23.98p]","FHD[10bit 4:2:2][24p]","FHD[10bit 4:2:2][25p]","FHD[10bit 4:2:2][29.97p]","FHD[10bit 4:2:2][50p]","FHD[10bit 4:2:2][59.94p]"]
            case "APS-C" :
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p]","DCI 4K[10bit 4:2:2][24p]","DCI 4K[10bit 4:2:2][25p]","DCI 4K[10bit 4:2:2][29.97p]","DCI 4K[10bit 4:2:2][50p]","DCI 4K[10bit 4:2:2][59.94p]","3.3K 4:3[3328*2496][10bit 4:2:2][23.98p]","3.3K 4:3[3328*2496][10bit 4:2:2][24p]","3.3K 4:3[3328*2496][10bit 4:2:2][25p]","3.3K 4:3[3328*2496][10bit 4:2:2][29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][50p]","FHD[10bit 4:2:2][24p]","FHD[10bit 4:2:2][25p]","FHD[10bit 4:2:2][29.97p]","FHD[10bit 4:2:2][50p]","FHD[10bit 4:2:2][59.94p]"]
            case "Pixel to Pixel" :
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p]","DCI 4K[10bit 4:2:2][24p]","DCI 4K[10bit 4:2:2][25p]","DCI 4K[10bit 4:2:2][29.97p]","DCI 4K[10bit 4:2:2][50p]","DCI 4K[10bit 4:2:2][59.94p]","3.3K 4:3[3328*2496][10bit 4:2:2][23.98p]","3.3K 4:3[3328*2496][10bit 4:2:2][24p]","3.3K 4:3[3328*2496][10bit 4:2:2][25p]","3.3K 4:3[3328*2496][10bit 4:2:2][29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][50p]","FHD[10bit 4:2:2][24p]","FHD[10bit 4:2:2][25p]","FHD[10bit 4:2:2][29.97p]","FHD[10bit 4:2:2][50p]","FHD[10bit 4:2:2][59.94p]"]
            default :
                PanaResolution = [""]
            }
        }
        if cameradata.Codec == "HEVC LongGOP" {
            switch cameradata.Format {
            case "Full Frame" :
                PanaResolution = ["6K 3:2[5952*3968][10bit 4:2:0][23.98p/24p/25p/29.97p]","DCI 6K[5952*3136][10bit 4:2:0][23.98p/24p/25p/29.97p]","5.9K[5888*3312][10bit 4:2:0][23.98p/24p/25p/29.97p]","DCI 4K[10bit 4:2:0][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:0][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:0][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:0][100p/119.88p]"]
            case "APS-C" :
                PanaResolution = ["DCI 4K[10bit 4:2:0][23.98p/24p/25p/29.97p]","DCI 4K[10bit 4:2:0]47.95p/48p/50p/59.94p]","UHD[10bit 4:2:0][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","3.3K 4:3[3328*2496][10bit 4:2:0][23.98p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:0][47.95p/48p/50p]","FHD[10bit 4:2:0][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:0][100p/119.88p]"]
            case "Pixel to Pixel" :
                PanaResolution = ["DCI 4K[10bit 4:2:0][23.98p/24p/25p/29.97p]","DCI 4K[10bit 4:2:0][47.95p/48p/50p/59.94p]","UHD[10bit 4:2:0][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","3.3K 4:3[3328*2496][10bit 4:2:0][23.98p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:0][47.95p/48p/50p]","FHD[10bit 4:2:0][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:0][47.95p/48p/50p/59.94p]"]
            default :
                PanaResolution = [""]
            }
        }
        if cameradata.Codec == "AVC ALL-I" {
            switch cameradata.Format {
            case "Full Frame" :
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p]"]
            case "APS-C" :
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p/24p/25p/29.97p]","DCI 4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","DCI 4K[10bit 4:2:2][47.95p/48p/50p/59.94p][Light]","UHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","UHD[10bit 4:2:2][47.95p/48p/50p/59.94p][Light]","3.3K 4:3[3328*2496][10bit 4:2:2][23.98p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][47.95p/48p/50p]","3.3K 4:3[3328*2496][10bit 4:2:2][47.95p/48p/50p][Light]","FHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p]"]
            case "Pixel to Pixel" :
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p/24p/25p/29.97p]","DCI 4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","DCI 4K[10bit 4:2:2][47.95p/48p/50p/59.94p][Light]","UHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","UHD[10bit 4:2:2][47.95p/48p/50p/59.94p][Light]","3.3K 4:3[3328*2496][10bit 4:2:2][23.98p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][47.95p/48p/50p]","3.3K 4:3[3328*2496][10bit 4:2:2][47.95p/48p/50p][Light]","FHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]"]
            default :
                PanaResolution = [""]
            }
        }
        if cameradata.Codec == "AVC LongGOP" {
            switch cameradata.Format {
            case "Full Frame" :
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p]"]
            case "APS-C" :
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p/24p/25p/29.97p]","DCI 4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","UHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","3.3K 4:3[3328*2496][10bit 4:2:2][23.98p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][47.95p/48p/50p]","FHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p]"]
            case "Pixel to Pixel" :
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p/24p/25p/29.97p]","DCI 4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","UHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","3.3K 4:3[3328*2496][10bit 4:2:2][23.98p/24p/25p/29.97p]","3.3K 4:3[3328*2496][10bit 4:2:2][47.95p/48p/50p]","FHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]"]
            default :
                PanaResolution = [""]
            }
        }
    }
    
    else if cameradata.CameraName == "GH6" || cameradata.CameraName == "G9M2" {
        if cameradata.Codec == "Prores 422 HQ" || cameradata.Codec == "Prores 422" {
            if cameradata.Format == "M43" {
                PanaResolution = ["DCI 5.7K[5728*3024][10bit 4:2:2][23.98p]","DCI 5.7K[5728*3024][10bit 4:2:2][24p]","DCI 5.7K[5728*3024][10bit 4:2:2][25p]","DCI 5.7K[5728*3024][10bit 4:2:2][29.97p]","DCI 4K[10bit 4:2:2][23.98p]","DCI 4K[10bit 4:2:2][24p]","DCI 4K[10bit 4:2:2][25p]","DCI 4K[10bit 4:2:2][29.97p]","DCI 4K[10bit 4:2:2][50p]","DCI 4K[10bit 4:2:2][59.94p]","FHD[10bit 4:2:2][23.98p]","FHD[10bit 4:2:2][24p]","FHD[10bit 4:2:2][25p]","FHD[10bit 4:2:2][29.97p]","FHD[10bit 4:2:2][50p]","FHD[10bit 4:2:2][59.94p]"]
            }
            else {
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p]","DCI 4K[10bit 4:2:2][24p]","DCI 4K[10bit 4:2:2][25p]","DCI 4K[10bit 4:2:2][29.97p]","DCI 4K[10bit 4:2:2][50p]","DCI 4K[10bit 4:2:2][59.94p]","FHD[10bit 4:2:2][23.98p]","FHD[10bit 4:2:2][24p]","FHD[10bit 4:2:2][25p]","FHD[10bit 4:2:2][29.97p]","FHD[10bit 4:2:2][50p]","FHD[10bit 4:2:2][59.94p]"]
            }
        }
        if cameradata.Codec == "HEVC LongGOP" {
            if cameradata.Format == "M43" {
                PanaResolution = ["5.8K 4:3[5760*4320][10bit 4:2:0][23.98p/24p/25p/29.97p]","DCI 5.7K[5728*3024][10bit 4:2:0][23.98p/24p/25p/29.97p]","DCI 5.7K[5728*3024][10bit 4:2:0][47.95p/48p/50p/59.94p]","DCI 4K[10bit 4:2:0][23.98p/24p/25p/29.97p]","DCI 4K[10bit 4:2:0][47.95p/48p/50p/59.94p]","DCI 4K[10bit 4:2:0][100p/119.88p]","UHD[10bit 4:2:0][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","UHD[10bit 4:2:0][100p/119.88p]","FHD[10bit 4:2:0][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:0][100p/119.88p]","FHD[10bit 4:2:0][200p/239.76p]"]
            }
            else {
                PanaResolution = ["4.4K 4:3[4352*3264][10bit 4:2:0][47.95p/48p/50p/59.94p]","DCI 4K[10bit 4:2:0][23.98p/24p/25p/29.97p]","DCI 4K[10bit 4:2:0][47.95p/48p/50p/59.94p]","DCI 4K[10bit 4:2:0][100p/119.88p]","UHD[10bit 4:2:0][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","UHD[10bit 4:2:0][100p/119.88p]","FHD[10bit 4:2:0][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:0][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:0][100p/119.88p]"]
            }
        }
        if cameradata.Codec == "AVC ALL-I" {
            if cameradata.Format == "M43" {
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p/24p/25p/29.97p]","DCI 4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","DCI 4K[10bit 4:2:2][47.95p/48p/50p/59.94p][Light]","UHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","UHD[10bit 4:2:2][47.95p/48p/50p/59.94p][Light]","FHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p]","FHD[10bit 4:2:2][200p/239.76p]"]
            }
            else {
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p/24p/25p/29.97p]","DCI 4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","DCI 4K[10bit 4:2:2][47.95p/48p/50p/59.94p][Light]","UHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","UHD[10bit 4:2:2][47.95p/48p/50p/59.94p][Light]","FHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p]"]
            }
        }
        if cameradata.Codec == "AVC LongGOP" {
            if cameradata.Format == "M43" {
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p/24p/25p/29.97p]","DCI 4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","UHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","UHD[10bit 4:2:2][100p/119.88p]","FHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p]","FHD[10bit 4:2:2][200p/239.76p]"]
            }
            else {
                PanaResolution = ["DCI 4K[10bit 4:2:2][23.98p/24p/25p/29.97p]","DCI 4K[10bit 4:2:2][47.95p/48p/50p/59.94p]","UHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","UHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","UHD[10bit 4:2:2][100p/119.88p]","FHD[10bit 4:2:2][23.98p/24p/25p/29.97p]","FHD[10bit 4:2:2][47.95p/48p/50p/59.94p]","FHD[10bit 4:2:2][100p/119.88p]"]
            }
        }
    }
    return PanaResolution
}
