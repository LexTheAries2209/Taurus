import AppKit
import SwiftUI

final class WindowReferenceStore: ObservableObject {
    private weak var window: NSWindow?

    func resolve(_ window: NSWindow) {
        self.window = window
    }

    @MainActor
    func saveScreenshot(language: AppLanguage) throws -> Bool? {
        guard let window else { return nil }
        return try ScreenshotExport.saveWindowScreenshot(from: window, language: language)
    }
}

struct WindowSizingBridge: NSViewRepresentable {
    let contentSize: CGSize
    let windowReference: WindowReferenceStore

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
        Coordinator(contentSize: contentSize)
    }

    private func configureWindow(for view: NSView, coordinator: Coordinator) {
        guard let window = view.window else { return }

        let currentContentWidth = max(window.contentView?.bounds.width ?? contentSize.width, contentSize.width)
        let fixedContentSize = CGSize(width: currentContentWidth, height: contentSize.height)
        let fixedFrameSize = window.frameRect(forContentRect: CGRect(origin: .zero, size: fixedContentSize)).size
        let minimumFrameSize = window.frameRect(forContentRect: CGRect(origin: .zero, size: contentSize)).size

        windowReference.resolve(window)
        window.contentMinSize = CGSize(width: contentSize.width, height: contentSize.height)
        window.contentMaxSize = CGSize(width: .greatestFiniteMagnitude, height: contentSize.height)
        window.minSize = CGSize(width: minimumFrameSize.width, height: fixedFrameSize.height)
        window.maxSize = CGSize(width: .greatestFiniteMagnitude, height: fixedFrameSize.height)
        coordinator.fixedFrameHeight = fixedFrameSize.height
        coordinator.minimumFrameWidth = minimumFrameSize.width
        window.delegate = coordinator
        window.setContentSize(fixedContentSize)
    }

    final class Coordinator: NSObject, NSWindowDelegate {
        var fixedFrameHeight: CGFloat
        var minimumFrameWidth: CGFloat

        init(contentSize: CGSize) {
            fixedFrameHeight = contentSize.height
            minimumFrameWidth = contentSize.width
        }

        func windowWillResize(_ sender: NSWindow, to frameSize: NSSize) -> NSSize {
            NSSize(
                width: max(frameSize.width, minimumFrameWidth),
                height: fixedFrameHeight
            )
        }
    }
}
