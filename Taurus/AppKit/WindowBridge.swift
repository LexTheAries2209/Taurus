import AppKit
import SwiftUI

enum WindowFrameGeometry {
  static func center(of frame: CGRect) -> CGPoint {
    CGPoint(x: frame.midX, y: frame.midY)
  }

  static func centeredFrame(size: CGSize, around center: CGPoint) -> CGRect {
    CGRect(
      x: center.x - size.width / 2,
      y: center.y - size.height / 2,
      width: size.width,
      height: size.height
    )
  }
}

final class WindowReferenceStore: ObservableObject {
  private weak var window: NSWindow?
  private var pendingWorkspaceResizeCenter: CGPoint?

  @MainActor
  func resolve(_ window: NSWindow) {
    self.window = window
  }

  @MainActor
  func prepareForWorkspaceResize() {
    guard let window else { return }
    pendingWorkspaceResizeCenter = WindowFrameGeometry.center(of: window.frame)
  }

  @MainActor
  func consumeWorkspaceResizeCenter(fallback: CGPoint) -> CGPoint {
    defer { pendingWorkspaceResizeCenter = nil }
    return pendingWorkspaceResizeCenter ?? fallback
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
  let animatesSizeChanges: Bool
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

  @MainActor
  private func configureWindow(for view: NSView, coordinator: Coordinator) {
    guard let window = view.window else { return }

    let centerBeforeConstraintUpdate = WindowFrameGeometry.center(of: window.frame)

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
      let isInitialConfiguration = coordinator.lastPreferredContentSize == nil
      coordinator.lastPreferredContentSize = preferredContentSize

      if isInitialConfiguration {
        window.setContentSize(preferredContentSize)
        window.center()
      } else {
        let resizeCenter = windowReference.consumeWorkspaceResizeCenter(
          fallback: centerBeforeConstraintUpdate
        )
        let targetFrameSize = window.frameRect(
          forContentRect: CGRect(origin: .zero, size: preferredContentSize)
        ).size
        let targetFrame = WindowFrameGeometry.centeredFrame(
          size: targetFrameSize,
          around: resizeCenter
        )

        window.setFrame(
          targetFrame,
          display: true,
          animate: animatesSizeChanges
        )
      }
    }
  }

  final class Coordinator: NSObject {
    var lastPreferredContentSize: CGSize?
  }
}
