//
//  CanonCinemaCount.swift
//  Taurus
//
//  Created by 吴坤城 on 6/9/24.
//

import Foundation

func CanonCinemaResolutionSpeed(cameradata:CameraData) -> Double {
    if cameradata.CameraName == "CinemaEOS C70" {
        if cameradata.Codec.contains("HQ") {
            if cameradata.Resolution.contains("2K") {
                return 205
            }
        }
        else if cameradata.Codec.contains("ST") {
            if cameradata.Resolution.contains("4K") {
                return 398
            }
            else if cameradata.Resolution.contains("2K") {
                return 101
            }
        }
        else if cameradata.Codec.contains("LT") {
            if cameradata.Resolution.contains("4K") {
                return 258
            }
            else if cameradata.Resolution.contains("2K") {
                return 66
            }
        }
        else if cameradata.Codec == "XF-AVC Intra" {
            if cameradata.Resolution.contains("4K") || cameradata.Resolution.contains("UHD") {
                return 240
            }
            else if cameradata.Resolution.contains("2K") || cameradata.Resolution.contains("FHD") {
                if cameradata.Rate == "59.940" || cameradata.Rate == "50.000" {
                    return 310
                }
                else {
                    return 160
                }
            }
        }
        else if cameradata.Codec == "XF-AVC LongGOP" {
            if cameradata.Resolution.contains("4K") || cameradata.Resolution.contains("UHD") {
                if cameradata.Rate == "59.940" || cameradata.Rate == "50.000" {
                    return 310
                }
                else {
                    return 160
                }
            }
            else if cameradata.Resolution == "HD S35[10bit 4:2:2]" || cameradata.Resolution == "HD S16[10bit 4:2:2]" {
                return 24
            }
            else {
                return 50
            }
        }
    }
    return 0
}

func CanonCinemaCodecSpeed(cameradata:CameraData) -> Double {
    if cameradata.CameraName.contains("C70") {
        if cameradata.Resolution.contains("410mbps") {
            return 410
        }
        else if cameradata.Codec.contains("RAW") || (cameradata.Codec.contains("Intra") && cameradata.Resolution.contains("4K") || cameradata.Resolution.contains("UHD")) {
            return CanonCinemaResolutionSpeed(cameradata: cameradata) * RateMultiplier(cameradata: cameradata)
        }
        else {
            return CanonCinemaResolutionSpeed(cameradata: cameradata)
        }
    }
    else {
        return 0
    }
}
