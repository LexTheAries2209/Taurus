//
//  ScreenshotExport.swift
//  Taurus
//
//  Created by Codex on 7/8/26.
//

import AppKit
import Foundation
import UniformTypeIdentifiers

enum ScreenshotExport {
    enum ExportError: LocalizedError {
        case missingContentView
        case emptyContent
        case renderFailed

        var errorDescription: String? {
            message(in: .chinese)
        }

        func message(in language: AppLanguage) -> String {
            let copy = language.copy
            switch self {
            case .missingContentView:
                return copy.missingContentViewError
            case .emptyContent:
                return copy.emptyContentError
            case .renderFailed:
                return copy.renderFailedError
            }
        }
    }

    static func defaultFileName(now: Date = Date(), timeZone: TimeZone = .current) -> String {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = timeZone
        formatter.dateFormat = "yyyyMMdd-HHmmss"
        return "Taurus-Screenshot-\(formatter.string(from: now)).png"
    }

    @MainActor
    static func saveWindowScreenshot(from window: NSWindow, language: AppLanguage) throws -> Bool {
        let imageData = try pngData(for: window)
        guard let destinationURL = chooseDestinationURL(defaultFileName: defaultFileName(), language: language) else {
            return false
        }

        try imageData.write(to: destinationURL, options: .atomic)
        return true
    }

    @MainActor
    static func pngData(for window: NSWindow) throws -> Data {
        guard let contentView = window.contentView else {
            throw ExportError.missingContentView
        }

        contentView.displayIfNeeded()
        let bounds = contentView.bounds
        guard !bounds.isEmpty else {
            throw ExportError.emptyContent
        }

        guard let bitmap = contentView.bitmapImageRepForCachingDisplay(in: bounds) else {
            throw ExportError.renderFailed
        }

        bitmap.size = bounds.size
        contentView.cacheDisplay(in: bounds, to: bitmap)

        guard let pngData = bitmap.representation(using: .png, properties: [:]) else {
            throw ExportError.renderFailed
        }

        return pngData
    }

    @MainActor
    private static func chooseDestinationURL(defaultFileName: String, language: AppLanguage) -> URL? {
        let panel = NSSavePanel()
        panel.title = language.copy.saveScreenshotTitle
        panel.nameFieldStringValue = defaultFileName
        panel.canCreateDirectories = true
        panel.allowedContentTypes = [.png]
        panel.isExtensionHidden = false
        return panel.runModal() == .OK ? panel.url : nil
    }
}
