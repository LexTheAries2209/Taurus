import Combine

final class CameraSelectionStore: ObservableObject {
    static let brandPlaceholder = "请选择品牌"
    static let cameraPlaceholder = "请选择机型"
    static let codecPlaceholder = "请选择编码"
    static let codecLevelPlaceholder = "请选择级别"
    static let formatPlaceholder = "请选择幅面"
    static let resolutionPlaceholder = "请选择分辨率"
    static let frameRatePlaceholder = "请选择帧率"
    static let mediaPlaceholder = "请选择储存卡"

    @Published var BrandName = CameraSelectionStore.brandPlaceholder
    @Published var CameraName = CameraSelectionStore.cameraPlaceholder
    @Published var Codec = CameraSelectionStore.codecPlaceholder
    @Published var CanonCodecLevel = CameraSelectionStore.codecLevelPlaceholder
    @Published var Resolution = CameraSelectionStore.resolutionPlaceholder
    @Published var Media = CameraSelectionStore.mediaPlaceholder
    @Published var Rate = CameraSelectionStore.frameRatePlaceholder
    @Published var Format = CameraSelectionStore.formatPlaceholder
    @Published var ResolutionWidth = ""
    @Published var ResolutionHeight = ""
    @Published var ManualCodecSpeed = ""

    func selectBrand(_ value: String) {
        guard BrandName != value else { return }
        BrandName = value
        resetCameraAndDownstream()
    }

    func selectCamera(_ value: String) {
        guard CameraName != value else { return }
        CameraName = value
        resetCodecAndDownstream()
        clearManualInputs()
    }

    func selectCodec(_ value: String) {
        guard Codec != value else { return }
        Codec = value
        CanonCodecLevel = Self.codecLevelPlaceholder
        Format = Self.formatPlaceholder
        Resolution = Self.resolutionPlaceholder
        Rate = Self.frameRatePlaceholder
        Media = Self.mediaPlaceholder
        ResolutionWidth = ""
        ResolutionHeight = ""
    }

    func selectCanonCodecLevel(_ value: String) {
        guard CanonCodecLevel != value else { return }
        CanonCodecLevel = value
        Resolution = Self.resolutionPlaceholder
        Rate = Self.frameRatePlaceholder
        Media = Self.mediaPlaceholder
    }

    func selectFormat(_ value: String) {
        guard Format != value else { return }
        Format = value
        Resolution = Self.resolutionPlaceholder
        Rate = Self.frameRatePlaceholder
        Media = Self.mediaPlaceholder
    }

    func selectResolution(_ value: String) {
        guard Resolution != value else { return }
        Resolution = value
        Rate = Self.frameRatePlaceholder
        Media = Self.mediaPlaceholder
    }

    func selectRate(_ value: String) {
        guard Rate != value else { return }
        Rate = value
        if !Self.mediaDependentRateBrands.contains(BrandName) {
            Media = Self.mediaPlaceholder
        }
    }

    func selectMedia(_ value: String) {
        guard Media != value else { return }
        Media = value
        if Self.mediaDependentRateBrands.contains(BrandName) {
            Rate = Self.frameRatePlaceholder
        }
    }

    func reset() {
        BrandName = Self.brandPlaceholder
        resetCameraAndDownstream()
    }

    private static let mediaDependentRateBrands: Set<String> = [
        "ARRI",
        "Blackmagicdesign",
        "Apple",
        "RED",
        "Kinefinity"
    ]

    private func resetCameraAndDownstream() {
        CameraName = Self.cameraPlaceholder
        resetCodecAndDownstream()
        clearManualInputs()
    }

    private func resetCodecAndDownstream() {
        Codec = Self.codecPlaceholder
        CanonCodecLevel = Self.codecLevelPlaceholder
        Format = Self.formatPlaceholder
        Resolution = Self.resolutionPlaceholder
        Rate = Self.frameRatePlaceholder
        Media = Self.mediaPlaceholder
    }

    private func clearManualInputs() {
        ManualCodecSpeed = ""
        ResolutionWidth = ""
        ResolutionHeight = ""
    }
}
