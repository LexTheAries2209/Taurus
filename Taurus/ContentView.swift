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
    @Published var CanonCodecLevel = "请选择级别"
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
    private let windowContentSize = CGSize(width: 930, height: 425)
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                Text("数据计算器")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 3)
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .fill(Color(nsColor: .controlBackgroundColor))
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color(nsColor: .separatorColor), lineWidth: 0.5)
                            )
                    )
                Spacer()
            }
            .frame(height: 32)
            
            Divider()
            
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
            .padding()
        }
        .frame(width: windowContentSize.width, height: windowContentSize.height)
        .background(Color(nsColor: .windowBackgroundColor))
        .background(FixedWindowContentSize(size: windowContentSize))
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
        cameradata.CanonCodecLevel = "请选择级别"
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

struct FixedWindowContentSize: NSViewRepresentable {
    let size: CGSize

    func makeNSView(context: Context) -> NSView {
        let view = NSView(frame: .zero)
        DispatchQueue.main.async {
            configureWindow(for: view)
        }
        return view
    }

    func updateNSView(_ nsView: NSView, context: Context) {
        DispatchQueue.main.async {
            configureWindow(for: nsView)
        }
    }

    private func configureWindow(for view: NSView) {
        guard let window = view.window else { return }
        window.contentMinSize = size
        window.contentMaxSize = size
        window.setContentSize(size)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
