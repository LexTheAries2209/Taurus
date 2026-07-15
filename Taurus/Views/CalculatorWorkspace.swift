import SwiftUI

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
            Spacer(minLength: 20)
                .frame(maxHeight: 48)

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
            .padding(.top, 28)

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
