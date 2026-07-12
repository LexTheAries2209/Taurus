import Foundation

func ARRIResolution(cameradata: CameraSelectionStore) -> [String] {
    guard cameradata.BrandName == "ARRI" else {
        return ["无选项"]
    }

    let resolutions = ARRIRecordingCatalog().resolutionOptions(
        for: CameraSelection(selectionStore: cameradata)
    )
    return resolutions.isEmpty ? ["无选项"] : resolutions
}
