//
//  ContentView.swift
//  Taurus
//
//  Created by 吴坤城 on 7/25/23.
//

import SwiftUI

enum WorkspaceTab: Hashable {
  case calculator
  case planner
}

struct ContentView: View {
  @ObservedObject var selectionStore: CameraSelectionStore
  @ObservedObject var windowReference: WindowReferenceStore
  @ObservedObject var projectStore: DITProjectStore
  @ObservedObject var favoriteStore: DITFavoriteStore
  @Environment(\.accessibilityReduceMotion) private var accessibilityReduceMotion
  @AppStorage("appLanguage") private var appLanguageRawValue = AppLanguage.chinese.rawValue
  @State private var selectedWorkspace = WorkspaceTab.calculator

  private var showsPlanner: Bool {
    selectedWorkspace == .planner
  }

  private var windowMinimumSize: CGSize {
    showsPlanner
      ? CGSize(width: 1_180, height: 680)
      : CGSize(width: 930, height: 540)
  }

  private var windowPreferredSize: CGSize {
    showsPlanner
      ? CGSize(width: 1_320, height: 780)
      : CGSize(width: 930, height: 540)
  }

  private var language: AppLanguage {
    AppLanguage(rawValue: appLanguageRawValue) ?? .chinese
  }

  private var languageSelection: Binding<AppLanguage> {
    Binding(
      get: { language },
      set: { appLanguageRawValue = $0.rawValue }
    )
  }

  private var workspaceTransition: AnyTransition {
    if accessibilityReduceMotion {
      return .opacity
    }

    return .asymmetric(
      insertion: .scale(scale: 0.94, anchor: .center).combined(with: .opacity),
      removal: .scale(scale: 1.035, anchor: .center).combined(with: .opacity)
    )
  }

  private var workspaceAnimation: Animation {
    accessibilityReduceMotion
      ? .easeOut(duration: 0.12)
      : .spring(response: 0.42, dampingFraction: 0.86, blendDuration: 0.08)
  }

  var body: some View {
    VStack(spacing: 0) {
      CalculatorToolbar(
        language: languageSelection,
        windowReference: windowReference,
        workspace: $selectedWorkspace
      )

      Divider()

      ZStack {
        if !showsPlanner {
          CalculatorWorkspace(selectionStore: selectionStore, language: language)
            .transition(workspaceTransition)
            .zIndex(0)
        }

        if showsPlanner {
          DITPlannerView(
            projectStore: projectStore,
            favoriteStore: favoriteStore,
            language: language
          )
          .transition(workspaceTransition)
          .zIndex(1)
        }
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .clipped()
      .animation(workspaceAnimation, value: showsPlanner)
    }
    .frame(
      minWidth: windowMinimumSize.width,
      idealWidth: windowPreferredSize.width,
      maxWidth: .infinity,
      minHeight: windowMinimumSize.height,
      idealHeight: windowPreferredSize.height,
      maxHeight: .infinity
    )
    .background(Color(nsColor: .windowBackgroundColor))
    .background(
      WindowSizingBridge(
        minimumContentSize: windowMinimumSize,
        preferredContentSize: windowPreferredSize,
        animatesSizeChanges: !accessibilityReduceMotion,
        windowReference: windowReference
      )
    )
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(
      selectionStore: CameraSelectionStore(),
      windowReference: WindowReferenceStore(),
      projectStore: DITProjectStore(
        fileURL: URL(fileURLWithPath: "/tmp/taurus-preview-projects.json")),
      favoriteStore: DITFavoriteStore(
        fileURL: URL(fileURLWithPath: "/tmp/taurus-preview-favorites.json"))
    )
  }
}
