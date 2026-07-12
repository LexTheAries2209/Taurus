# Taurus P1 计算核心设计

## 范围

P1 建立可脱离 SwiftUI 测试的计算边界，并完成 ARRI 的显式录制模式迁移。它保持 macOS 12、离线运行、GPL-3.0-only 和零第三方依赖；不开始 P2 的 Codable JSON 目录，也不开始 P3 项目规划。

## 稳定边界

- `CameraSelection` 是不可变选择快照，包含品牌、机型、编码、幅面、分辨率、帧率、介质和手动输入。
- `CameraSelectionStore` 是唯一的 SwiftUI 可观察选择状态；品牌、机型和编码变化按级联关系清空下游选择。
- `RecordingMode` 保存目录解析后的码率、HDE 倍率，以及必要时的实际写入速率、可用容量和录制时长修正。
- `MediaSpec` 使用字节保存实际可用容量；`CameraCatalog` 只解析录制模式与介质；`DefaultCalculationEngine` 只接收选择和目录并返回 `CalculationResult`。
- `RecordingCalculator` 是旧品牌计算的兼容外观。它先把 `CameraSelectionStore` 转成 `CameraSelection`，优先走目录；未迁移品牌才保留既有公式。

## SwiftUI 与 AppKit 边界

- `TaurusApp` 持有选择状态和窗口引用；`ContentView` 只组合工具栏、选择区、结果区和备注区。
- `CameraSelectionPanel`、`RecordingMetricsView`、`CalculatorNotesPanel` 与 `CalculatorToolbar` 各自只承担一个界面职责。
- 截图、`NSWindowDelegate` 和固定窗口高度集中于 `AppKit/WindowBridge.swift`；根视图不再同时持有窗口代理、截图状态和业务状态。
- 结果展示只接收 `CalculationResult`。不完整或不支持状态显示 `—` 与原因，而不是虚假的 `0.00`。

## ARRI 官方目录

数值唯一来源为 ARRI Formats and Data Rate Calculator v2.6.3 的 2026-06-10 数据快照（2026-07-12 生成）。`ARRIOfficialCatalogData.swift` 固化该离线快照，包含 11 个 ARRI 摄影机、官方介质实际容量和 317 条机型/编码/分辨率的显式规则。

- 机型、编码、分辨率、介质和帧率选择全部从 `ARRIRecordingCatalog` 派生。
- 每条规则以字节/帧和逐介质帧率范围表达；不再通过十位 `Xbit` 字符串反向拼接。
- 缺少官方规则的完整 ARRI 选择立即返回 `.unsupported(.noMatchingRule)`，绝不回退到旧公式。
- 计算使用 FDRC 的十进制换算：`Mbps = bytesPerFrame × fps × 8 / 1_000_000`，`GB/h = MB/s × 3600 / 1000`。
- 目录同时保留 ARRI 的特殊行为：ARRIRAW HDE 倍率、XT/SXT 的写入速率修正、Classic/XT 的时长修正，以及 XR/SXR Capture Drive 的 ProRes 实际可用容量。

## 验证

- `CalculationEngineTests` 直接注入目录测试成功、缺失模式和缺失介质；不创建 SwiftUI View。
- 317 条官方 ARRI 显式规则逐条通过纯计算引擎，覆盖所有目录机型、编码、分辨率、介质和允许帧率。
- `RecordingCalculatorTests` 继续覆盖 General、SONY、Canon、Panasonic、Blackmagicdesign、Canon Cinema、Kinefinity、Nikon、DJI、Apple，以及 ARRI HDE、Capture Drive 和无回退规则。
- XCTest 与 Release 构建是 P1 交付门槛。
