//
//  ContentView.swift
//  Taurus
//
//  Created by 吴坤城 on 7/25/23.
//

import SwiftUI
import Foundation
import Combine

class CameraData: ObservableObject {
    @Published var BrandName = "请选择品牌"
    @Published var CameraName = "请选择机型"
    @Published var Codec = "请选择编码"
    @Published var Resolution = "请选择分辨率"
    @Published var Media = "请选择储存卡"
    @Published var Rate = "请选择帧率"
    @Published var Format = "请选择幅面"
    @Published var ResolutionWidth: String = ""
    @Published var ResolutionHeight: String = ""
}

struct ContentView: View {
    
    @StateObject var cameradata = CameraData()
    
    var body: some View {
        
        VStack {
            
            //主功能选择
            TabView {
                
                //数据计算器模块
                VStack{
                    Spacer()
                    
                    //重置按键
                    Button("重置") {
                        cameradata.BrandName = "请选择品牌"
                        cameradata.CameraName = "请选择机型"
                        cameradata.Codec = "请选择编码"
                        cameradata.Resolution = "请选择分辨率"
                        cameradata.Media = "请选择储存卡"
                        cameradata.Rate = "请选择帧率"
                        cameradata.Format = "请选择幅面"
                        cameradata.ResolutionWidth = ""
                        cameradata.ResolutionHeight = ""
                        
                    }
                    Spacer()
                    
                    //选择器与计算功能
                    HStack{
                        
                        VStack (spacing:10){
                            //选择器模块
                            PickerView(cameradata: cameradata)
                        }
                        .padding(.top, 20.0)
                        Spacer()
                        
                        //计算数据输出模块
                        DataOutput(cameradata: cameradata)
                    }
                    Spacer()
                    
                    //备注与说明模块
                    Comments(cameradata: cameradata)
                }
                
                //主菜单选择模块
                .tabItem {
                    Text("数据计算器")
                }
                
                                                //其他功能模块
                                                Text("还没做出功能的阵列配置台")
                                                    .tabItem {
                                                        Text("阵列配置台")
                                                    }
                
                                                Text("还没做出功能的录制格式速查")
                                                    .tabItem {
                                                        Text("录制格式速查")
                                                    }
                
                                                Text("还没做出功能的像场覆盖图")
                                                    .tabItem {
                                                        Text("像场覆盖图")
                                                    }
            }
            .frame(minWidth:800,minHeight: 425)
            .frame(maxWidth:800,maxHeight: 425)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
