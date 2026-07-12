//
//  Comments.swift
//  Taurus
//
//  Created by 吴坤城 on 3/25/24.
//

import SwiftUI

struct CalculatorNotesPanel: View {
    let brandID: String
    let cameraID: String
    let language: AppLanguage

    private var copy: LocalizedCopy {
        language.copy
    }

    private var commentLines: [String] {
        copy.comments(for: brandID, cameraName: cameraID)
    }

    private var bodyFontSize: CGFloat {
        language == .english ? 11 : 10
    }

    private var lineSpacing: CGFloat {
        language == .english ? 2 : 1
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(Color.gray)
                .frame(maxHeight: 110)

            VStack(spacing: lineSpacing) {
                Text(copy.commentsTitle)
                    .font(.title3)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)

                Text(" ")
                    .font(.system(size: 1))

                ForEach(Array(commentLines.enumerated()), id: \.offset) { _, line in
                    commentLineText(line)
                        .font(.system(size: bodyFontSize))
                        .lineLimit(1)
                        .minimumScaleFactor(language == .english ? 0.9 : 0.82)
                        .padding(.leading, 10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }

                Spacer()
            }
            .frame(maxHeight: 110)
            .padding([.top, .trailing], 8)
        }
        .padding(.top, 31.0)
        .padding([.leading, .trailing, .bottom], 10)
    }
}

private func commentLineText(_ line: String) -> Text {
    let options = AttributedString.MarkdownParsingOptions(interpretedSyntax: .inlineOnlyPreservingWhitespace)
    if let attributedLine = try? AttributedString(markdown: line, options: options) {
        return Text(attributedLine)
    }

    return Text(line)
}
