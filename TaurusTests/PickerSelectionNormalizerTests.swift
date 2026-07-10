import XCTest
@testable import Taurus

final class PickerSelectionNormalizerTests: XCTestCase {
    func testInvalidValueNormalizesToExplicitPlaceholder() {
        XCTAssertEqual(
            PickerSelectionNormalizer.normalizedValue(
                current: "Codex Compact Drive 2TB",
                options: ["CFexpress Type B 1TB"],
                placeholder: "请选择储存卡"
            ),
            "请选择储存卡"
        )
    }

    func testValidValueIsPreserved() {
        XCTAssertEqual(
            PickerSelectionNormalizer.normalizedValue(
                current: "24",
                options: ["24", "25"],
                placeholder: "请选择帧率"
            ),
            "24"
        )
    }

    func testPlaceholderIsPreservedWhenItIsNotAnOption() {
        XCTAssertEqual(
            PickerSelectionNormalizer.normalizedValue(
                current: "请选择分辨率",
                options: ["UHD", "4K"],
                placeholder: "请选择分辨率"
            ),
            "请选择分辨率"
        )
    }

    func testPopupIndexReservesFirstItemForPlaceholder() {
        XCTAssertEqual(
            PickerSelectionNormalizer.popupIndex(
                current: "请选择帧率",
                options: ["24.000", "25.000"],
                placeholder: "请选择帧率"
            ),
            0
        )
        XCTAssertEqual(
            PickerSelectionNormalizer.popupIndex(
                current: "25.000",
                options: ["24.000", "25.000"],
                placeholder: "请选择帧率"
            ),
            2
        )
    }

    func testPopupSelectionMapsPastPlaceholderItem() {
        XCTAssertNil(
            PickerSelectionNormalizer.optionValue(
                popupIndex: 0,
                options: ["24.000", "25.000"]
            )
        )
        XCTAssertEqual(
            PickerSelectionNormalizer.optionValue(
                popupIndex: 2,
                options: ["24.000", "25.000"]
            ),
            "25.000"
        )
    }

    func testEnglishPlaceholderTitleIsLocalized() {
        XCTAssertEqual(
            AppLanguage.english.copy.localizedOptionTitle(CameraData.mediaPlaceholder),
            "Select Media"
        )
    }
}
