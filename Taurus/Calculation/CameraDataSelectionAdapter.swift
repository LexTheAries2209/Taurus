extension CameraSelection {
    init(cameradata data: CameraData) {
        self.init(
            brandID: data.BrandName,
            cameraID: data.CameraName,
            codecID: data.Codec,
            codecLevelID: Self.optionalID(
                data.CanonCodecLevel,
                placeholder: CameraData.codecLevelPlaceholder
            ),
            formatID: Self.optionalID(data.Format, placeholder: CameraData.formatPlaceholder),
            resolutionID: data.Resolution,
            frameRateID: data.Rate,
            mediaID: data.Media,
            manualBitrate: Self.nonEmpty(data.ManualCodecSpeed),
            manualWidth: Self.nonEmpty(data.ResolutionWidth),
            manualHeight: Self.nonEmpty(data.ResolutionHeight)
        )
    }

    private static func optionalID(_ value: String, placeholder: String) -> String? {
        guard value != placeholder, value != "无选项" else { return nil }
        return nonEmpty(value)
    }

    private static func nonEmpty(_ value: String) -> String? {
        value.isEmpty ? nil : value
    }
}
