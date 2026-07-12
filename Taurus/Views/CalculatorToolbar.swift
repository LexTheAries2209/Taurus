import SwiftUI

struct CalculatorToolbar: View {
    @Binding var language: AppLanguage
    @ObservedObject var windowReference: WindowReferenceStore

    @State private var screenshotErrorMessage = ""
    @State private var showsScreenshotError = false

    private var copy: LocalizedCopy {
        language.copy
    }

    var body: some View {
        ZStack {
            Text(copy.calculatorTitle)
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
                Picker("", selection: $language) {
                    ForEach(AppLanguage.allCases) { language in
                        Text(language.toggleTitle).tag(language)
                    }
                }
                .pickerStyle(.segmented)
                .labelsHidden()
                .frame(width: 88)
                .help(copy.languageControlHelp)
                .padding(.leading, 14)

                Spacer()

                Button(action: saveScreenshot) {
                    Image(systemName: "camera")
                        .imageScale(.medium)
                }
                .buttonStyle(.borderless)
                .help(copy.screenshotButton)
                .accessibilityLabel(copy.screenshotButton)
                .padding(.trailing, 14)
            }
        }
        .padding(.top, 8)
        .frame(height: 44)
        .alert(copy.screenshotErrorTitle, isPresented: $showsScreenshotError) {
            Button(copy.okButton, role: .cancel) {}
        } message: {
            Text(screenshotErrorMessage)
        }
    }

    @MainActor
    private func saveScreenshot() {
        do {
            guard let didSave = try windowReference.saveScreenshot(language: language) else {
                screenshotErrorMessage = copy.screenshotErrorNoWindow
                showsScreenshotError = true
                return
            }
            if didSave {
                showsScreenshotError = false
            }
        } catch let exportError as ScreenshotExport.ExportError {
            screenshotErrorMessage = exportError.message(in: language)
            showsScreenshotError = true
        } catch {
            screenshotErrorMessage = error.localizedDescription
            showsScreenshotError = true
        }
    }
}
