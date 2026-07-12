# Taurus Output Font Consistency Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Make every P0-added calculation output string use the same body text size as the legacy output UI.

**Architecture:** Add a small semantic typography configuration inside `DataOutput.swift`. Apply its body text style explicitly to metric labels, metric values, and calculation messages while preserving the message's secondary color.

**Tech Stack:** Swift 5, SwiftUI, AppKit, XCTest, Xcode 17

---

### Task 1: Lock the output typography baseline

**Files:**
- Modify: `TaurusTests/RecordingCalculatorTests.swift`
- Modify: `Taurus/DataOutput.swift`

- [ ] **Step 1: Write the failing test**

Add this test to `RecordingCalculatorTests`:

```swift
func testNewOutputTextUsesLegacyBodyStyle() {
    XCTAssertEqual(DataOutputTypography.metricTextStyle, .body)
    XCTAssertEqual(DataOutputTypography.messageTextStyle, .body)
}
```

- [ ] **Step 2: Run the focused test and verify it fails**

Run:

```bash
xcodebuild test \
  -project Taurus.xcodeproj \
  -scheme Taurus \
  -destination 'platform=macOS' \
  -derivedDataPath /tmp/TaurusFontTests \
  CODE_SIGNING_ALLOWED=NO \
  -only-testing:TaurusTests/RecordingCalculatorTests/testNewOutputTextUsesLegacyBodyStyle
```

Expected: compilation fails because `DataOutputTypography` does not exist.

- [ ] **Step 3: Implement the body typography configuration**

Add to `Taurus/DataOutput.swift`:

```swift
enum DataOutputTypography {
    static let metricTextStyle: Font.TextStyle = .body
    static let messageTextStyle: Font.TextStyle = .body
}
```

Apply `.font(.system(DataOutputTypography.metricTextStyle))` to metric labels and values. Replace `.font(.caption)` on the message with `.font(.system(DataOutputTypography.messageTextStyle))`; keep `.foregroundColor(.secondary)` unchanged.

- [ ] **Step 4: Run the focused test and verify it passes**

Run the Step 2 command again.

Expected: the focused XCTest passes.

### Task 2: Verify the complete application

**Files:**
- Verify: `Taurus/DataOutput.swift`
- Verify: `TaurusTests/RecordingCalculatorTests.swift`

- [ ] **Step 1: Run the complete XCTest suite**

```bash
xcodebuild test \
  -project Taurus.xcodeproj \
  -scheme Taurus \
  -destination 'platform=macOS' \
  -derivedDataPath /tmp/TaurusP0Tests \
  CODE_SIGNING_ALLOWED=NO
```

Expected: all XCTest cases pass.

- [ ] **Step 2: Run the Release build**

```bash
xcodebuild build \
  -project Taurus.xcodeproj \
  -scheme Taurus \
  -configuration Release \
  -destination 'platform=macOS' \
  -derivedDataPath /tmp/TaurusP0Release \
  CODE_SIGNING_ALLOWED=NO
```

Expected: `BUILD SUCCEEDED`.

- [ ] **Step 3: Perform visual verification**

Launch `/tmp/TaurusP0Release/Build/Products/Release/Taurus.app`, select only a brand, and confirm that the incomplete-selection message uses the same body size as the metric labels while remaining gray.

- [ ] **Step 4: Check the final diff**

```bash
git diff --check
git status --short
```

Expected: no whitespace errors; only the typography implementation, its test, and approved documentation are changed. Existing unrelated scheme formatting is left untouched.

