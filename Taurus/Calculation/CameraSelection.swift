import Foundation

struct CameraSelection: Codable, Equatable, Hashable {
    let brandID: String
    let cameraID: String
    let codecID: String
    let codecLevelID: String?
    let formatID: String?
    let resolutionID: String
    let frameRateID: String
    let mediaID: String
    let manualBitrate: String?
    let manualWidth: String?
    let manualHeight: String?

    init(
        brandID: String,
        cameraID: String,
        codecID: String,
        codecLevelID: String? = nil,
        formatID: String? = nil,
        resolutionID: String,
        frameRateID: String,
        mediaID: String,
        manualBitrate: String? = nil,
        manualWidth: String? = nil,
        manualHeight: String? = nil
    ) {
        self.brandID = brandID
        self.cameraID = cameraID
        self.codecID = codecID
        self.codecLevelID = codecLevelID
        self.formatID = formatID
        self.resolutionID = resolutionID
        self.frameRateID = frameRateID
        self.mediaID = mediaID
        self.manualBitrate = manualBitrate
        self.manualWidth = manualWidth
        self.manualHeight = manualHeight
    }
}
