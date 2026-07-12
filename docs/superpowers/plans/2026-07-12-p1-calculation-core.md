# Taurus P1 Calculation Core Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Introduce a SwiftUI-independent calculation engine with stable selection, mode, media, and catalog types, then prove it with an explicit ALEXA 35 ARRI mode.

**Architecture:** `CameraSelection` is the immutable UI-to-core boundary. `DefaultCalculationEngine` is a pure value transformer using an injected `CameraCatalog`; its input never contains `CameraData` or a View. The existing `RecordingCalculator` remains unchanged during the initial core commit, so P0 behavior stays stable while the new core gains direct tests.

**Tech Stack:** Swift 5, Foundation, XCTest, macOS 12, no third-party dependencies.

---

### Task 1: Establish stable P1 value types

**Files:**
- Create: `Taurus/Calculation/CameraSelection.swift`
- Create: `Taurus/Calculation/RecordingMode.swift`
- Modify: `Taurus.xcodeproj/project.pbxproj`
- Test: `TaurusTests/CalculationEngineTests.swift`

- [ ] **Step 1: Write a failing core-type test**

```swift
func testSelectionAndModeAreEquatableValues() {
    let selection = CameraSelection(
        brandID: "ARRI",
        cameraID: "ALEXA 35",
        codecID: "ARRIRAW",
        codecLevelID: nil,
        formatID: nil,
        resolutionID: "4.6K S35[4608*3164][OG]",
        frameRateID: "0.750",
        mediaID: "Compact Drive 1TB"
    )
    let mode = RecordingMode(selection: selection, bitrateMbps: 141.09375, includesHDE: true, halvesRecordMinutes: false)

    XCTAssertEqual(mode.selection, selection)
    XCTAssertEqual(mode.bitrateMbps, 141.09375)
}
```

- [ ] **Step 2: Run the focused test and verify it fails**

```bash
xcodebuild test \
  -project Taurus.xcodeproj \
  -scheme Taurus \
  -destination 'platform=macOS' \
  -derivedDataPath /tmp/TaurusP1Tests \
  CODE_SIGNING_ALLOWED=NO \
  -only-testing:TaurusTests/CalculationEngineTests/testSelectionAndModeAreEquatableValues
```

Expected: compilation fails because the P1 value types do not exist.

- [ ] **Step 3: Add the immutable types**

```swift
struct MediaSpec: Equatable, Hashable {
    let id: String
    let usableCapacityGB: Double
}

struct RecordingMode: Equatable, Hashable {
    let selection: CameraSelection
    let bitrateMbps: Double
    let includesHDE: Bool
    let halvesRecordMinutes: Bool
}
```

`CameraSelection` contains the eight IDs used above and optional manual numeric strings. All types import Foundation only.

- [ ] **Step 4: Add project membership and verify the focused test passes**

Add the two production files and `CalculationEngineTests.swift` to the app/test source build phases in `Taurus.xcodeproj/project.pbxproj`, then rerun the Step 2 command.

### Task 2: Implement the pure calculation engine

**Files:**
- Create: `Taurus/Calculation/CalculationEngine.swift`
- Modify: `Taurus.xcodeproj/project.pbxproj`
- Modify: `TaurusTests/CalculationEngineTests.swift`

- [ ] **Step 1: Write failing success and failure tests**

```swift
func testEngineCalculatesMetricsFromCatalogMode() {
    let catalog = InMemoryCatalog(
        modes: [RecordingMode(selection: alexa35Selection, bitrateMbps: 141.09375, includesHDE: true, halvesRecordMinutes: false)],
        media: [MediaSpec(id: "Compact Drive 1TB", usableCapacityGB: 931)]
    )

    XCTAssertEqual(
        DefaultCalculationEngine().calculate(alexa35Selection, using: catalog),
        .success(expectedAlexa35Metrics)
    )
}

func testEngineReportsUnsupportedWhenCatalogHasNoMode() {
    XCTAssertEqual(
        DefaultCalculationEngine().calculate(alexa35Selection, using: InMemoryCatalog()),
        .unsupported(.noMatchingRule)
    )
}
```

- [ ] **Step 2: Run both focused tests and verify they fail**

```bash
xcodebuild test \
  -project Taurus.xcodeproj \
  -scheme Taurus \
  -destination 'platform=macOS' \
  -derivedDataPath /tmp/TaurusP1Tests \
  CODE_SIGNING_ALLOWED=NO \
  -only-testing:TaurusTests/CalculationEngineTests/testEngineCalculatesMetricsFromCatalogMode \
  -only-testing:TaurusTests/CalculationEngineTests/testEngineReportsUnsupportedWhenCatalogHasNoMode
```

Expected: compilation fails because `CameraCatalog` and `DefaultCalculationEngine` do not exist.

- [ ] **Step 3: Add catalog and engine contracts**

```swift
protocol CameraCatalog {
    func recordingMode(for selection: CameraSelection) -> RecordingMode?
    func mediaSpec(for id: String) -> MediaSpec?
}

protocol CalculationEngine {
    func calculate(_ selection: CameraSelection, using catalog: CameraCatalog) -> CalculationResult
}
```

`DefaultCalculationEngine` returns `.unsupported(.noMatchingRule)` for a missing mode or media, then uses the P0 formulas for MB/s, GB/h, record minutes, optional HDE, and Capture Drive + ProRes halving. Reject zero, negative, or non-finite values with existing issues.

- [ ] **Step 4: Add project membership and verify the focused tests pass**

Add `CalculationEngine.swift` to the app source build phase and run the Step 2 command.

### Task 3: Add the explicit ALEXA 35 catalog pilot

**Files:**
- Create: `Taurus/Calculation/ARRIRecordingCatalog.swift`
- Modify: `Taurus.xcodeproj/project.pbxproj`
- Modify: `TaurusTests/CalculationEngineTests.swift`

- [ ] **Step 1: Write the failing explicit-ARRI test**

```swift
func testAlexa35ARRIRawOpenGateUsesExplicitModeWithoutXbit() {
    let result = DefaultCalculationEngine().calculate(alexa35Selection, using: ARRIRecordingCatalog())

    XCTAssertEqual(result, .success(expectedAlexa35Metrics))
}
```

- [ ] **Step 2: Run the focused test and verify it fails**

Run the Step 2 command from Task 2 with only `testAlexa35ARRIRawOpenGateUsesExplicitModeWithoutXbit`.

Expected: compilation fails because `ARRIRecordingCatalog` does not exist.

- [ ] **Step 3: Add the explicit mode table**

```swift
struct ARRIRecordingCatalog: CameraCatalog {
    private let modes = [
        RecordingMode(
            selection: CameraSelection(
                brandID: "ARRI", cameraID: "ALEXA 35", codecID: "ARRIRAW",
                codecLevelID: nil, formatID: nil,
                resolutionID: "4.6K S35[4608*3164][OG]",
                frameRateID: "0.750", mediaID: "Compact Drive 1TB"
            ),
            bitrateMbps: 141.09375,
            includesHDE: true,
            halvesRecordMinutes: false
        )
    ]
}
```

Provide `MediaSpec(id: "Compact Drive 1TB", usableCapacityGB: 931)`. Do not call `Xbit`, `CameraNumber`, `CodecNumber`, `ResolutionNumber`, `MediaNumber`, or `ArriRates` from this catalog.

- [ ] **Step 4: Add project membership and verify the focused test passes**

Add the file to the app source build phase, then rerun the focused ARRI test.

### Task 4: Validate and commit P1.1 foundation

**Files:**
- Verify: `Taurus/Calculation/CameraSelection.swift`
- Verify: `Taurus/Calculation/RecordingMode.swift`
- Verify: `Taurus/Calculation/CalculationEngine.swift`
- Verify: `Taurus/Calculation/ARRIRecordingCatalog.swift`
- Verify: `TaurusTests/CalculationEngineTests.swift`

- [ ] **Step 1: Run complete XCTest**

```bash
xcodebuild test \
  -project Taurus.xcodeproj \
  -scheme Taurus \
  -destination 'platform=macOS' \
  -derivedDataPath /tmp/TaurusP1Tests \
  CODE_SIGNING_ALLOWED=NO
```

Expected: all P0 tests and new pure-engine tests pass.

- [ ] **Step 2: Run Release build**

```bash
xcodebuild build \
  -project Taurus.xcodeproj \
  -scheme Taurus \
  -configuration Release \
  -destination 'platform=macOS' \
  -derivedDataPath /tmp/TaurusP1Release \
  CODE_SIGNING_ALLOWED=NO
```

Expected: `BUILD SUCCEEDED`.

- [ ] **Step 3: Check and commit**

```bash
git diff --check
git add Taurus/Calculation TaurusTests/CalculationEngineTests.swift Taurus.xcodeproj/project.pbxproj
git commit -m "refactor: add pure recording calculation core"
```

Expected: the commit includes only P1.1 core files, tests, and Xcode membership. It does not remove legacy functions; the next P1 commit will route UI and expand ARRI coverage.

