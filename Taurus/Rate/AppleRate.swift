//
//  AppleRate.swift
//  Taurus
//
//  Created by 吴坤城 on 5/10/24.
//

import Foundation

func AppleRate(cameradata:CameraData) -> [String] {
    var rates: [String] = []
    
    if cameradata.BrandName == "Apple" {
        if cameradata.Media == "Built-in 128GB" && cameradata.Resolution == "UHD" && (cameradata.Codec == "Prores 422 HQ" || cameradata.Codec == "Prores 422" || cameradata.Codec == "Prores 422 LT" || cameradata.Codec == "Prores 422 Proxy") {
            rates = ["128GB机型最大只能录制Prores FHD 30fps！"]
        }
        else if (cameradata.Media == "Built-in 128GB" || cameradata.Media == "Built-in 256GB" || cameradata.Media == "Built-in 512GB" || cameradata.Media == "Built-in 1TB") && (cameradata.Codec == "Prores 422 HQ" || cameradata.Codec == "Prores 422" || cameradata.Codec == "Prores 422 LT" || cameradata.Codec == "Prores 422 Proxy") {
            rates = ["23.976","24.000","25.000","29.970","30.000"]
        }
        else if (cameradata.Media == "[Output]SSD 512GB" || cameradata.Media == "[Output]SSD 1TB" || cameradata.Media == "[Output]SSD 2TB") && (cameradata.Codec == "Prores 422 HQ" || cameradata.Codec == "Prores 422" || cameradata.Codec == "Prores 422 LT" || cameradata.Codec == "Prores 422 Proxy") {
            rates = ["23.976","24.000","25.000","29.970","30.000","48.000","50.000","59.940","60.000"]
        }
        else {
            rates = ["无选项"]
        }
    }
    
    return rates
}
