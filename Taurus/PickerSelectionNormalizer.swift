enum PickerSelectionNormalizer {
    static func normalizedValue(
        current: String,
        options: [String],
        placeholder: String
    ) -> String {
        if current == placeholder || options.contains(current) {
            return current
        }

        return placeholder
    }

    static func popupIndex(
        current: String,
        options: [String],
        placeholder: String
    ) -> Int {
        let normalized = normalizedValue(
            current: current,
            options: options,
            placeholder: placeholder
        )

        guard normalized != placeholder,
              let optionIndex = options.firstIndex(of: normalized) else {
            return 0
        }

        return optionIndex + 1
    }

    static func optionValue(popupIndex: Int, options: [String]) -> String? {
        let optionIndex = popupIndex - 1
        guard optionIndex >= 0, optionIndex < options.count else {
            return nil
        }

        return options[optionIndex]
    }
}
