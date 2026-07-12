import Foundation

func AvailableRecordingRates(cameradata: CameraData) -> [String] {
    if cameradata.CameraName.contains("CineAlta") {
        return CinealtaRate(cameradata: cameradata)
    }

    switch cameradata.BrandName {
    case "DJI":
        return DjiRate(cameradata: cameradata)
    case "Canon Cinema":
        return CanonCinemaRate(cameradata: cameradata)
    case "ARRI":
        let catalogRates = ARRIRecordingCatalog().frameRates(
            for: CameraSelection(cameradata: cameradata)
        )
        return catalogRates.isEmpty ? ArriRates(cameradata: cameradata) : catalogRates
    case "Blackmagicdesign":
        return BMDRate(cameradata: cameradata)
    case "Apple":
        return AppleRate(cameradata: cameradata)
    case "RED":
        return DSMC3Rate(cameradata: cameradata)
    case "Fujifilm":
        return FujiRate(cameradata: cameradata)
    case "Kinefinity":
        return KinefinityRate(cameradata: cameradata)
    case "[General]":
        return GeneralRate(cameradata: cameradata)
    default:
        return ["无选项"]
    }
}
