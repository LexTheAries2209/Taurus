import SwiftUI

struct CalculatorToolbar: View {
  @Binding var language: AppLanguage
  @ObservedObject var windowReference: WindowReferenceStore
  @Binding var showsPlanner: Bool

  @Environment(\.accessibilityReduceMotion) private var accessibilityReduceMotion
  @State private var screenshotErrorMessage = ""
  @State private var showsScreenshotError = false

  private var copy: LocalizedCopy {
    language.copy
  }

  var body: some View {
    ZStack {
      ZStack {
        if showsPlanner {
          Text("DIT 项目规划")
            .font(.headline)
            .fontWeight(.semibold)
            .transition(titleTransition)
        } else {
          Text(copy.calculatorTitle)
            .font(.headline)
            .fontWeight(.semibold)
            .transition(titleTransition)
        }
      }
      .animation(titleAnimation, value: showsPlanner)

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

        Button(action: toggleWorkspace) {
          Image(systemName: showsPlanner ? "chart.bar.xaxis" : "rectangle.3.group")
            .imageScale(.medium)
        }
        .buttonStyle(.borderless)
        .help(showsPlanner ? "返回计算器" : "打开项目规划器")
        .accessibilityLabel(showsPlanner ? "返回计算器" : "打开项目规划器")

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

  private var titleTransition: AnyTransition {
    accessibilityReduceMotion
      ? .opacity
      : .scale(scale: 0.9, anchor: .center).combined(with: .opacity)
  }

  private var titleAnimation: Animation {
    accessibilityReduceMotion
      ? .easeOut(duration: 0.12)
      : .spring(response: 0.42, dampingFraction: 0.86, blendDuration: 0.08)
  }

  private func toggleWorkspace() {
    showsPlanner.toggle()
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
