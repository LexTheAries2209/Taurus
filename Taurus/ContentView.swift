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
    @State private var activeWindow: NSWindow?
    @State private var screenshotErrorMessage = ""
    @State private var showsScreenshotError = false
    private let windowContentSize = CGSize(width: 930, height: 540)
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
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

                HStack {
                    Spacer()
                    Button {
                        saveScreenshot()
                    } label: {
                        Image(systemName: "camera")
                            .imageScale(.medium)
                    }
                    .buttonStyle(.borderless)
                    .help("截图")
                    .accessibilityLabel("截图")
                    .padding(.trailing, 14)
                }
            }
            .padding(.top, 8)
            .frame(height: 44)
            
            Divider()
            
            VStack(spacing: 0) {
                // 重置按键
                Button("重置") {
                    resetAllData()
                }
                .keyboardShortcut("r", modifiers: [.command]) // 添加键盘快捷键
                .padding(.top, 20)
                
                // 选择器与计算功能
                HStack(alignment: .center) {
                    VStack(spacing: 10) {
                        // 选择器模块
                        PickerView(cameradata: cameradata)
                    }
                    
                    Spacer()
                    
                    // 计算数据输出模块
                    DataOutput(cameradata: cameradata)
                }
                .padding(.top, 28)
                
                Spacer(minLength: 16)
                
                // 备注与说明模块
                Comments(cameradata: cameradata)
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        .frame(
            minWidth: windowContentSize.width,
            idealWidth: windowContentSize.width,
            maxWidth: .infinity,
            minHeight: windowContentSize.height,
            idealHeight: windowContentSize.height,
            maxHeight: windowContentSize.height
        )
        .background(Color(nsColor: .windowBackgroundColor))
        .background(WindowReader { window in
            activeWindow = window
        })
        .background(FixedWindowHeight(size: windowContentSize))
        .alert("截图失败", isPresented: $showsScreenshotError) {
            Button("好", role: .cancel) {}
        } message: {
            Text(screenshotErrorMessage)
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

    @MainActor
    private func saveScreenshot() {
        guard let activeWindow else {
            screenshotErrorMessage = "没有找到当前窗口，无法截图。"
            showsScreenshotError = true
            return
        }

        do {
            _ = try ScreenshotExport.saveWindowScreenshot(from: activeWindow)
        } catch {
            screenshotErrorMessage = error.localizedDescription
            showsScreenshotError = true
        }
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

struct WindowReader: NSViewRepresentable {
    let onResolve: (NSWindow) -> Void

    func makeNSView(context: Context) -> NSView {
        let view = NSView(frame: .zero)
        DispatchQueue.main.async {
            resolveWindow(from: view)
        }
        return view
    }

    func updateNSView(_ nsView: NSView, context: Context) {
        DispatchQueue.main.async {
            resolveWindow(from: nsView)
        }
    }

    private func resolveWindow(from view: NSView) {
        guard let window = view.window else { return }
        onResolve(window)
    }
}

struct FixedWindowHeight: NSViewRepresentable {
    let size: CGSize

    func makeNSView(context: Context) -> NSView {
        let view = NSView(frame: .zero)
        DispatchQueue.main.async {
            configureWindow(for: view, coordinator: context.coordinator)
        }
        return view
    }

    func updateNSView(_ nsView: NSView, context: Context) {
        DispatchQueue.main.async {
            configureWindow(for: nsView, coordinator: context.coordinator)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(size: size)
    }

    private func configureWindow(for view: NSView, coordinator: Coordinator) {
        guard let window = view.window else { return }

        let currentContentWidth = max(window.contentView?.bounds.width ?? size.width, size.width)
        let fixedContentSize = CGSize(width: currentContentWidth, height: size.height)
        let fixedFrameSize = window.frameRect(forContentRect: CGRect(origin: .zero, size: fixedContentSize)).size
        let minFrameSize = window.frameRect(forContentRect: CGRect(origin: .zero, size: size)).size

        window.contentMinSize = CGSize(width: size.width, height: size.height)
        window.contentMaxSize = CGSize(width: CGFloat.greatestFiniteMagnitude, height: size.height)
        window.minSize = CGSize(width: minFrameSize.width, height: fixedFrameSize.height)
        window.maxSize = CGSize(width: CGFloat.greatestFiniteMagnitude, height: fixedFrameSize.height)
        coordinator.fixedFrameHeight = fixedFrameSize.height
        coordinator.minimumFrameWidth = minFrameSize.width
        window.delegate = coordinator
        window.setContentSize(fixedContentSize)
    }

    class Coordinator: NSObject, NSWindowDelegate {
        let size: CGSize
        var fixedFrameHeight: CGFloat
        var minimumFrameWidth: CGFloat

        init(size: CGSize) {
            self.size = size
            self.fixedFrameHeight = size.height
            self.minimumFrameWidth = size.width
        }

        func windowWillResize(_ sender: NSWindow, to frameSize: NSSize) -> NSSize {
            NSSize(
                width: max(frameSize.width, minimumFrameWidth),
                height: fixedFrameHeight
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
