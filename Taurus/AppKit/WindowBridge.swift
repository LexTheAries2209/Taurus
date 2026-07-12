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
  let minimumContentSize: CGSize
  let preferredContentSize: CGSize
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
    Coordinator()
  }

  private func configureWindow(for view: NSView, coordinator: Coordinator) {
    guard let window = view.window else { return }

    windowReference.resolve(window)
    window.contentMinSize = minimumContentSize
    window.contentMaxSize = CGSize(
      width: CGFloat.greatestFiniteMagnitude,
      height: CGFloat.greatestFiniteMagnitude
    )
    window.minSize =
      window.frameRect(
        forContentRect: CGRect(origin: .zero, size: minimumContentSize)
      ).size
    window.maxSize = CGSize(
      width: CGFloat.greatestFiniteMagnitude,
      height: CGFloat.greatestFiniteMagnitude
    )

    if coordinator.lastPreferredContentSize != preferredContentSize {
      coordinator.lastPreferredContentSize = preferredContentSize
      window.setContentSize(preferredContentSize)
      window.center()
    }
  }

  final class Coordinator: NSObject {
    var lastPreferredContentSize: CGSize?
  }
}
