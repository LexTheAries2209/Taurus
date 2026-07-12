//
//  ContentView.swift
//  Taurus
//
//  Created by 吴坤城 on 7/25/23.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var selectionStore: CameraSelectionStore
  @ObservedObject var windowReference: WindowReferenceStore
  @ObservedObject var projectStore: DITProjectStore
  @ObservedObject var favoriteStore: DITFavoriteStore
  @AppStorage("appLanguage") private var appLanguageRawValue = AppLanguage.chinese.rawValue
  @State private var showsPlanner = false

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

  var body: some View {
    VStack(spacing: 0) {
      CalculatorToolbar(
        language: languageSelection,
        windowReference: windowReference,
        showsPlanner: $showsPlanner
      )

      Divider()

      if showsPlanner {
        DITPlannerView(
          selectionStore: selectionStore,
          projectStore: projectStore,
          favoriteStore: favoriteStore,
          showsPlanner: $showsPlanner
        )
      } else {
        CalculatorWorkspace(selectionStore: selectionStore, language: language)
      }
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
