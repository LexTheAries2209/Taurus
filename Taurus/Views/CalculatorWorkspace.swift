import SwiftUI

enum CalculatorWorkspaceLayout {
    static let resetVerticalSpacing: CGFloat = 28
}

struct CalculatorWorkspace: View {
    @ObservedObject var selectionStore: CameraSelectionStore
    let language: AppLanguage

    private var calculationResult: CalculationResult {
        RecordingCalculator.calculate(selectionStore)
    }

    private var copy: LocalizedCopy {
        language.copy
    }

    var body: some View {
        VStack(spacing: 0) {
            Spacer(minLength: 0)
                .frame(height: CalculatorWorkspaceLayout.resetVerticalSpacing)

            Button(copy.resetButton, action: selectionStore.reset)
                .keyboardShortcut("r", modifiers: [.command])

            HStack(alignment: .center) {
                CameraSelectionPanel(cameradata: selectionStore, language: language)

                Spacer()

                RecordingMetricsView(
                    result: calculationResult,
                    codecID: selectionStore.Codec,
                    language: language
                )
            }
            .padding(.top, CalculatorWorkspaceLayout.resetVerticalSpacing)

            Spacer(minLength: 16)

            CalculatorNotesPanel(
                brandID: selectionStore.BrandName,
                cameraID: selectionStore.CameraName,
                language: language
            )
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
}
