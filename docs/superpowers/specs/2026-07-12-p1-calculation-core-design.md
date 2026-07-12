# Taurus P1.1 计算核心设计

## 范围

P1.1 建立可脱离 SwiftUI 测试的计算核心，并以 ALEXA 35 为 ARRI 显式录制模式的第一条迁移路线。它不迁移 JSON 数据目录、不改变其他品牌计算结果，也不开始 P3 项目规划功能。

## 稳定边界

- `CameraSelection` 是不可变的选择快照，包含品牌、机型、编码、幅面、分辨率、帧率、介质和手动输入值。
- `RecordingMode` 是目录解析后的可录制模式，保存对应选择、码率、ARRIRAW HDE 标识和 Capture Drive + ProRes 时长规则。
- `MediaSpec` 保存介质 ID 与实际可用容量 GB。
- `CameraCatalog` 解析选择到录制模式和介质；`CalculationEngine` 只接收选择和目录并返回既有 `CalculationResult`。

## 兼容策略

`RecordingCalculator` 暂时保留为 UI 兼容外观：它把 `CameraData` 快照转换为 `CameraSelection`，优先走新目录；未迁移品牌仍走现有计算函数。纯 `DefaultCalculationEngine` 不导入 SwiftUI，也不读取 `CameraData`。

## ARRI 迁移策略

P1.1 先将 ALEXA 35 的 ARRIRAW 4.6K Open Gate / Compact Drive 1TB / 0.750 fps 显式编码为 `RecordingMode`。此模式锁定当前 141.09375 Mbps 与 HDE 结果，证明新目录可替代一条十位 Xbit 路线。后续 P1 提交按同样表结构扩展其余 ALEXA 35 模式和全部 ARRI 机型，最终删除 `Xbit`、编号函数和 `ArriRates` 的十位字符串分支。

## 验证

- `CalculationEngineTests` 直接用内存目录测试成功、缺失介质和不支持模式；不创建 SwiftUI View。
- ALEXA 35 试点的纯引擎结果与 P0 黄金结果相同。
- 现有 36 条 XCTest 与 Release 构建继续通过。

