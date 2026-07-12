//
//  TaurusApp.swift
//  Taurus
//
//  Created by 吴坤城 on 7/25/23.
//

import SwiftUI

@main
struct TaurusApp: App {
    @StateObject private var selectionStore = CameraSelectionStore()
    @StateObject private var windowReference = WindowReferenceStore()

    var body: some Scene {
        WindowGroup {
            ContentView(
                selectionStore: selectionStore,
                windowReference: windowReference
            )
        }
    }
}
