import Foundation
import SwiftUI

enum NumericInputSanitizer {
  static func sanitize(_ input: String, allowsDecimal: Bool) -> String {
    var result = ""
    var hasDecimalSeparator = false

    for character in input {
      if character >= "0" && character <= "9" {
        result.append(character)
      } else if character == "." {
        guard allowsDecimal else { break }
        if !hasDecimalSeparator {
          if result.isEmpty {
            result = "0"
          }
          result.append(character)
          hasDecimalSeparator = true
        }
      }
    }

    return result
  }
}

struct NonnegativeNumberField: View {
  @Binding var value: Double
  let range: ClosedRange<Double>
  let fractionDigits: Int

  @State private var text = ""
  @FocusState private var isFocused: Bool

  private var allowsDecimal: Bool { fractionDigits > 0 }

  var body: some View {
    TextField("0", text: $text)
      .textFieldStyle(.roundedBorder)
      .multilineTextAlignment(.trailing)
      .monospacedDigit()
      .focused($isFocused)
      .onAppear(perform: synchronizeText)
      .onChange(of: value) { _ in
        if !isFocused {
          synchronizeText()
        }
      }
      .onChange(of: text, perform: handleTextChange)
      .onChange(of: isFocused) { focused in
        if !focused {
          commitText()
        }
      }
      .onSubmit(commitText)
  }

  private func handleTextChange(_ newValue: String) {
    let sanitized = NumericInputSanitizer.sanitize(newValue, allowsDecimal: allowsDecimal)
    guard sanitized == newValue else {
      text = sanitized
      return
    }

    guard let parsed = Double(sanitized), parsed.isFinite, range.contains(parsed) else { return }
    value = parsed
  }

  private func commitText() {
    guard let parsed = Double(text), parsed.isFinite else {
      synchronizeText()
      return
    }

    let clamped = min(max(parsed, range.lowerBound), range.upperBound)
    value = clamped
    text = formatted(clamped)
  }

  private func synchronizeText() {
    text = formatted(value)
  }

  private func formatted(_ number: Double) -> String {
    String(format: "%.*f", fractionDigits, number)
  }
}
