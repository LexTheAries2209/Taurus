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
    @Published var ManualCodecSpeed: String = ""
}

struct ContentView: View {
    
    @StateObject var cameradata = CameraData()
    @State private var currentTime: String = ""
    @State private var currentDate: String = ""
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                
                // 主功能选择
                TabView {
                    
                    // 数据计算器模块
                    VStack {
                        Spacer()
                        
                        // 重置按键
                        Button("重置") {
                            resetAllData()
                        }
                        .keyboardShortcut("r", modifiers: [.command]) // 添加键盘快捷键
                        
                        Spacer()
                        
                        // 选择器与计算功能
                        HStack {
                            VStack(spacing: 10) {
                                // 选择器模块
                                PickerView(cameradata: cameradata)
                            }
                            .padding(.top, 20.0)
                            
                            Spacer()
                            
                            // 计算数据输出模块
                            DataOutput(cameradata: cameradata)
                        }
                        Spacer()
                        
                        // 备注与说明模块
                        Comments(cameradata: cameradata)
                    }
                    // 主菜单选择模块
                    .tabItem {
                        Text("数据计算器")
                    }
                }
                .frame(minWidth: 800, minHeight: 425)
                .frame(maxWidth: 800, maxHeight: 425)
            }
            .padding()
        }
        //显示当前时间的文本，位于左上角
//            HStack {
//                Spacer()
//                Text(currentDate)
//                    .font(.headline)
//                    .foregroundColor(.secondary)
//                    .padding(.top, 35)
//                    .padding(.trailing, 0)
//                Text(currentTime)
//                    .font(.headline)
//                    .foregroundColor(.secondary)
//                    .padding(.top, 35)
//                    .padding(.trailing, 25)
//
//            }
        .onAppear(perform: updateTime)
    }
    
    // 将重置逻辑提取为独立函数
    private func resetAllData() {
        cameradata.BrandName = "请选择品牌"
        cameradata.CameraName = "请选择机型"
        cameradata.Codec = "请选择编码"
        cameradata.Resolution = "请选择分辨率"
        cameradata.Media = "请选择储存卡"
        cameradata.Rate = "请选择帧率"
        cameradata.Format = "请选择幅面"
        cameradata.ResolutionWidth = ""
        cameradata.ResolutionHeight = ""
        cameradata.ManualCodecSpeed = ""
    }
    
    func updateTime() {
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            let timeFormatter = DateFormatter()
            timeFormatter.dateFormat = "HH:mm:ss"

            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"

            self.currentTime = timeFormatter.string(from: Date())
            self.currentDate = dateFormatter.string(from: Date())
        }
        RunLoop.current.add(timer, forMode: .common)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
