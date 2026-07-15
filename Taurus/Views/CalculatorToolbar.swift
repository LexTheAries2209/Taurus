import SwiftUI

struct CalculatorToolbar: View {
  @Binding var language: AppLanguage
  @ObservedObject var windowReference: WindowReferenceStore
  @Binding var workspace: WorkspaceTab

  @State private var screenshotErrorMessage = ""
  @State private var showsScreenshotError = false

  private var copy: LocalizedCopy {
    language.copy
  }

  private var plannerCopy: DITPlannerCopy {
    copy.ditPlanner
  }

  var body: some View {
    ZStack {
      Picker(plannerCopy.text("工作区"), selection: $workspace) {
        Label(copy.calculatorTitle, systemImage: "chart.bar.xaxis")
          .tag(WorkspaceTab.calculator)
        Label(copy.plannerTitle, systemImage: "rectangle.3.group")
          .tag(WorkspaceTab.planner)
      }
      .pickerStyle(.segmented)
      .labelsHidden()
      .frame(width: 320)
      .help(plannerCopy.text("切换工作区"))
      .accessibilityLabel(plannerCopy.text("工作区"))

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

        Spacer()

        Button(action: saveScreenshot) {
          Image(systemName: "camera")
            .imageScale(.medium)
        }
        .buttonStyle(.borderless)
        .help(copy.screenshotButton)
        .accessibilityLabel(copy.screenshotButton)
      }
    }
    .padding(.horizontal, 18)
    .padding(.top, 10)
    .padding(.bottom, 8)
    .frame(height: 58)
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
