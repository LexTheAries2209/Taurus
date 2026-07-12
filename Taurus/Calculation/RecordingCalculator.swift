enum RecordingCalculator {
    static func calculate(_ data: CameraData) -> CalculationResult {
        calculate(data, using: [ARRIRecordingCatalog()])
    }

    static func calculate(_ data: CameraData, using catalogs: [CameraCatalog]) -> CalculationResult {
        if isPlaceholder(data.BrandName, CameraData.brandPlaceholder) {
            return .incomplete([.brand])
        }

        if isPlaceholder(data.CameraName, CameraData.cameraPlaceholder) {
            return .incomplete([.camera])
        }

        if data.CameraName == "Manual Codec" {
            return calculateManualCodec(data)
        }

        if data.CameraName == "Manual Resolution" {
            return calculateManualResolution(data)
        }

        let missingFields = missingFields(for: data)
        if !missingFields.isEmpty {
            return .incomplete(missingFields)
        }

        let selection = CameraSelection(cameradata: data)
        if let result = catalogResult(for: selection, using: catalogs) {
            return result
        }

        let capacity = MediaCapacity(cameradata: data)
        let bitrate = bitrateMbps(for: data)
        return makeResult(capacity: capacity, bitrateMbps: bitrate, data: data)
    }

    private static func catalogResult(
        for selection: CameraSelection,
        using catalogs: [CameraCatalog]
    ) -> CalculationResult? {
        for catalog in catalogs where catalog.recordingMode(for: selection) != nil {
            return DefaultCalculationEngine().calculate(selection, using: catalog)
        }

        return nil
    }

    private static func calculateManualCodec(_ data: CameraData) -> CalculationResult {
        guard let bitrate = positiveFiniteDouble(data.ManualCodecSpeed) else {
            return .unsupported(.invalidManualBitrate)
        }

        if isPlaceholder(data.Media, CameraData.mediaPlaceholder) {
            return .incomplete([.media])
        }

        return makeResult(
            capacity: MediaCapacity(cameradata: data),
            bitrateMbps: bitrate,
            data: data
        )
    }

    private static func calculateManualResolution(_ data: CameraData) -> CalculationResult {
        guard positiveFiniteDouble(data.ResolutionWidth) != nil,
              positiveFiniteDouble(data.ResolutionHeight) != nil else {
            return .unsupported(.invalidManualResolution)
        }

        var missingFields = Set<SelectionField>()
        addIfPlaceholder(data.Codec, CameraData.codecPlaceholder, field: .codec, to: &missingFields)
        addIfPlaceholder(data.Rate, CameraData.frameRatePlaceholder, field: .frameRate, to: &missingFields)
        addIfPlaceholder(data.Media, CameraData.mediaPlaceholder, field: .media, to: &missingFields)

        if !missingFields.isEmpty {
            return .incomplete(missingFields)
        }

        return makeResult(
            capacity: MediaCapacity(cameradata: data),
            bitrateMbps: GeneralSpeed(cameradata: data),
            data: data
        )
    }

    private static func missingFields(for data: CameraData) -> Set<SelectionField> {
        var fields = Set<SelectionField>()
        addIfPlaceholder(data.Codec, CameraData.codecPlaceholder, field: .codec, to: &fields)
        addIfPlaceholder(data.Resolution, CameraData.resolutionPlaceholder, field: .resolution, to: &fields)
        addIfPlaceholder(data.Media, CameraData.mediaPlaceholder, field: .media, to: &fields)

        if formatRequiredBrands.contains(data.BrandName) {
            addIfPlaceholder(data.Format, CameraData.formatPlaceholder, field: .format, to: &fields)
        }

        if !CanonCodecLevelOptions(cameradata: data).isEmpty {
            addIfPlaceholder(data.CanonCodecLevel, CameraData.codecLevelPlaceholder, field: .codecLevel, to: &fields)
        }

        if requiresIndependentFrameRate(data) {
            addIfPlaceholder(data.Rate, CameraData.frameRatePlaceholder, field: .frameRate, to: &fields)
        }

        return fields
    }

    private static func bitrateMbps(for data: CameraData) -> Double {
        switch data.BrandName {
        case "SONY" where !data.CameraName.contains("CineAlta"):
            return SonyCodecSpeed(cameradata: data)
        case "Canon":
            return CanonCodecSpeed(cameradata: data)
        case "Panasonic":
            return PanaCodecSpeed(cameradata: data)
        case "Fujifilm":
            return FujiCodecSpeed(cameradata: data)
        case "Blackmagicdesign":
            return BMDCodecSpeedmbps(cameradata: data)
        case "Canon Cinema":
            return CanonCinemaCodecSpeed(cameradata: data)
        case "Kinefinity":
            return KinefinityCodecSpeed(cameradata: data)
        case "Nikon":
            return NikonCodecSpeed(cameradata: data)
        case "[General]":
            return GeneralSpeed(cameradata: data)
        default:
            return CodecSpeedCount(cameradata: data)
                * ResolutionMultiplier(cameradata: data)
                * RateMultiplier(cameradata: data)
        }
    }

    private static func makeResult(
        capacity: Double,
        bitrateMbps: Double,
        data: CameraData
    ) -> CalculationResult {
        if capacity == 0 || bitrateMbps == 0 {
            return .unsupported(.noMatchingRule)
        }

        guard capacity.isFinite, bitrateMbps.isFinite else {
            return .unsupported(.nonFiniteResult)
        }

        guard capacity > 0, bitrateMbps > 0 else {
            return .unsupported(.noMatchingRule)
        }

        let bitrateMBps = bitrateMbps / 8
        let dataPerHourGB = bitrateMbps * 450 / 1024
        var recordMinutes = capacity * 2048 / 15 / bitrateMbps

        if data.Media.contains("Capture Drive") && data.Codec.contains("ProRes") {
            recordMinutes /= 2
        }

        let hdeDataPerHourGB = data.Codec.contains("ARRIRAW")
            ? bitrateMbps * 270 / 1024
            : nil

        let metrics = RecordingMetrics(
            recordMinutes: recordMinutes,
            bitrateMbps: bitrateMbps,
            bitrateMBps: bitrateMBps,
            dataPerHourGB: dataPerHourGB,
            hdeDataPerHourGB: hdeDataPerHourGB
        )

        guard valid(metrics) else {
            return .unsupported(.nonFiniteResult)
        }

        return .success(metrics)
    }

    private static func valid(_ metrics: RecordingMetrics) -> Bool {
        var values = [
            metrics.recordMinutes,
            metrics.bitrateMbps,
            metrics.bitrateMBps,
            metrics.dataPerHourGB
        ]
        if let hdeDataPerHourGB = metrics.hdeDataPerHourGB {
            values.append(hdeDataPerHourGB)
        }

        return values.allSatisfy { $0.isFinite && $0 > 0 }
    }

    private static func positiveFiniteDouble(_ value: String) -> Double? {
        guard let number = Double(value), number.isFinite, number > 0 else {
            return nil
        }
        return number
    }

    private static func addIfPlaceholder(
        _ value: String,
        _ placeholder: String,
        field: SelectionField,
        to fields: inout Set<SelectionField>
    ) {
        if isPlaceholder(value, placeholder) {
            fields.insert(field)
        }
    }

    private static func isPlaceholder(_ value: String, _ placeholder: String) -> Bool {
        value.isEmpty || value == placeholder || value == "无选项"
    }

    private static func requiresIndependentFrameRate(_ data: CameraData) -> Bool {
        if data.CameraName.contains("CineAlta") {
            return true
        }

        return independentFrameRateBrands.contains(data.BrandName)
    }

    private static let formatRequiredBrands: Set<String> = [
        "Panasonic",
        "Fujifilm",
        "Kinefinity"
    ]

    private static let independentFrameRateBrands: Set<String> = [
        "ARRI",
        "Blackmagicdesign",
        "Apple",
        "RED",
        "Kinefinity",
        "DJI",
        "Canon Cinema",
        "Fujifilm",
        "[General]"
    ]
}
