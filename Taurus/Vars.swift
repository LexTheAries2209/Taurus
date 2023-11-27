//
//  Vars.swift
//  Taurus
//
//  Created by 吴坤城 on 11/23/23.
//

import Foundation
import Combine

class CameraData: ObservableObject {
    @Published var BrandName = "请选择品牌"
    
    @Published var CameraName = "请选择机型"
    
    @Published var Codec = "请选择编码"
    
    @Published var Resolution = "请选择分辨率"
    
    @Published var Media = "请选择储存卡"
    
    @Published var Rate = "请选择帧率"
}
