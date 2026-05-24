//
//  DjiRate.swift
//  Taurus
//
//  Created by 吴坤城 on 5/10/24.
//

import Foundation

func DjiRate(cameradata:CameraData) -> [String] {
    var rates: [String] = []
    
    if cameradata.CameraName == "Ronin 4D[8K]" {
        if cameradata.Codec == "ProRes RAW HQ" {
            if isDji8KFullFrame(cameradata.Resolution) {
                rates = ["23.976","24.000","25.000"]
            }
            else if isDji5_5KS35(cameradata.Resolution) {
                rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000"]
            }
            else if isDji4KFullFrame(cameradata.Resolution) {
                rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000","72.000","75.000","96.000","100.000"]
            }
            else {
                rates = ["无选项"]
            }
        }
        else if cameradata.Codec == "ProRes RAW" {
            if isDji8KFullFrame(cameradata.Resolution) {
                rates = ["29.970","30.000","48.000","50.000","59.940","60.000"]
            }
            else if cameradata.Resolution == "8K FF[8192*3424][2.39:1]" {
                rates = ["72.000","75.000"]
            }
            else if isDji5_5KS35(cameradata.Resolution) {
                rates = ["59.940","60.000"]
            }
            else if isDji4KFullFrame(cameradata.Resolution) {
                rates = ["120.000"]
            }
            else {
                rates = ["无选项"]
            }
        }
        else if cameradata.Codec == "ProRes 422 HQ" {
            if isDji8KFullFrame(cameradata.Resolution) {
                rates = ["23.976","24.000","25.000","29.970","30.000"]
            }
            else if isDji4KFullFrame(cameradata.Resolution) {
                rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000","72.000","75.000","96.000","100.000","120.000"]
            }
            else if isDji4KS35(cameradata.Resolution) {
                rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000"]
            }
            else {
                rates = ["无选项"]
            }
        }
        else if cameradata.Codec == "H.264(10bit 4:2:0)" {
            if isDji4KFullFrame(cameradata.Resolution) {
                rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000","72.000","75.000","96.000","100.000","120.000"]
            }
            else if isDji4KS35(cameradata.Resolution) {
                rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000"]
            }
            else {
                rates = ["无选项"]
            }
        }
        else {
            rates = ["无选项"]
        }
    }
    else if cameradata.CameraName == "Ronin 4D[6K]" {
        if cameradata.Codec == "ProRes RAW HQ" {
            if isDji6KFullFrame(cameradata.Resolution) {
                rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000"]
            }
            else if isDji4KS35(cameradata.Resolution) {
                rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000","72.000","75.000","96.000"]
            }
            else {
                rates = ["无选项"]
            }
        }
        else if cameradata.Codec == "ProRes RAW" {
            if isDji6KFullFrame(cameradata.Resolution) {
                rates = ["59.940","60.000"]
            }
            else if isDji4KS35(cameradata.Resolution) {
                rates = ["100.000","120.000"]
            }
            else {
                rates = ["无选项"]
            }
        }
        else if cameradata.Codec == "ProRes 4444 XQ" {
            if isDji6KFullFrame(cameradata.Resolution) {
                rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000"]
            }
            else if isDji4KS35(cameradata.Resolution) {
                rates = allDjiRates()
            }
            else {
                rates = ["无选项"]
            }
        }
        else if cameradata.Codec == "ProRes 422 HQ" {
            if isDji6KFullFrame(cameradata.Resolution) || isDji4KFullFrame(cameradata.Resolution) {
                rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000"]
            }
            else if isDji4KS35(cameradata.Resolution) || isDji2KFullFrame(cameradata.Resolution) {
                rates = allDjiRates()
            }
            else if isDji2KS35(cameradata.Resolution) {
                rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000","72.000","75.000","96.000"]
            }
            else {
                rates = ["无选项"]
            }
        }
        else if cameradata.Codec == "ProRes 422 LT" {
            if isDji6KFullFrame(cameradata.Resolution) || isDji4KFullFrame(cameradata.Resolution) {
                rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000"]
            }
            else if isDji4KS35(cameradata.Resolution) || isDji2KFullFrame(cameradata.Resolution) {
                rates = allDjiRates()
            }
            else if isDji2KS35(cameradata.Resolution) {
                rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000","72.000","75.000","96.000"]
            }
            else {
                rates = ["无选项"]
            }
        }
        else if cameradata.Codec == "H.264(10bit 4:2:0)" {
            if isDji4KFullFrame(cameradata.Resolution) {
                rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000"]
            }
            else if isDji4KS35(cameradata.Resolution) || isDji2KFullFrame(cameradata.Resolution) {
                rates = allDjiRates()
            }
            else if isDji2KS35(cameradata.Resolution) {
                rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000","72.000","75.000","96.000"]
            }
            else {
                rates = ["无选项"]
            }
        }
        else {
            rates = ["无选项"]
        }
    }
    else if cameradata.CameraName == "Inspire 3" {
        if isDji8KFullFrame(cameradata.Resolution) {
            if cameradata.Codec == "CinemaDNG" || cameradata.Codec == "ProRes RAW HQ" {
                rates = ["23.976","24.000","25.000"]
            }
            else if cameradata.Codec == "ProRes RAW" {
                rates = ["29.970","30.000","48.000","50.000","59.940","60.000"]
            }
            else if cameradata.Codec == "ProRes 422 HQ" {
                rates = ["23.976","24.000","25.000","29.970","30.000"]
            }
            else {
                rates = ["无选项"]
            }
        }
        else if cameradata.Resolution == "8K FF[8192*3424][2.39:1]" {
            if cameradata.Codec == "ProRes RAW" {
                rates = ["72.000","75.000"]
            }
            else {
                rates = ["无选项"]
            }
        }
        else if isDji4KFullFrame(cameradata.Resolution) {
            if cameradata.Codec == "CinemaDNG" {
                rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000","72.000","75.000","96.000","100.000"]
            }
            else if cameradata.Codec == "ProRes RAW HQ" {
                rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000","72.000","75.000","96.000","100.000"]
            }
            else if cameradata.Codec == "ProRes RAW" {
                rates = ["119.880","120.000"]
            }
            else if cameradata.Codec == "ProRes 422 HQ" || cameradata.Codec == "H.264(10bit 4:2:0)" {
                rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000","72.000","75.000","96.000","100.000","119.880","120.000"]
            }
            else {
                rates = ["无选项"]
            }
        }
        else if isDji4KS35(cameradata.Resolution) {
            rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000"]
        }
        else if isDji5_5KS35(cameradata.Resolution) {
            if cameradata.Codec == "CinemaDNG" || cameradata.Codec == "ProRes RAW HQ" {
                rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000"]
            }
            else if cameradata.Codec == "ProRes RAW" {
                rates =  ["59.940","60.000"]
            }
            else {
                rates = ["无选项"]
            }
        }
        else {
            rates = ["无选项"]
        }
    }
    else {
        rates = ["无选项"]
    }
    
    return rates
}

private func allDjiRates() -> [String] {
    return ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000","72.000","75.000","96.000","100.000","120.000"]
}

private func isDji8KFullFrame(_ resolution: String) -> Bool {
    return resolution == "8K FF[8192*4320][17:9]" || resolution == "8K FF[7680*4320][16:9]"
}

private func isDji5_5KS35(_ resolution: String) -> Bool {
    return resolution == "5.5K S35[5568*2952][17:9]" || resolution == "5.5K S35[5248*2952][16:9]"
}

private func isDji6KFullFrame(_ resolution: String) -> Bool {
    return resolution.contains("6K FF")
}

private func isDji4KFullFrame(_ resolution: String) -> Bool {
    return resolution.contains("4K FF")
}

private func isDji4KS35(_ resolution: String) -> Bool {
    return resolution.contains("4K S35")
}

private func isDji2KFullFrame(_ resolution: String) -> Bool {
    return resolution.contains("2K FF")
}

private func isDji2KS35(_ resolution: String) -> Bool {
    return resolution.contains("2K S35")
}
