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
    @AppStorage("appLanguage") private var appLanguageRawValue = AppLanguage.chinese.rawValue

    private let windowContentSize = CGSize(width: 930, height: 540)

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
                windowReference: windowReference
            )

            Divider()

            CalculatorWorkspace(selectionStore: selectionStore, language: language)
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
        .background(
            WindowSizingBridge(
                contentSize: windowContentSize,
                windowReference: windowReference
            )
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            selectionStore: CameraSelectionStore(),
            windowReference: WindowReferenceStore()
        )
    }
}
