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

## 官方数据更新（P1.3）

P1.1 的 ALEXA 35 数值只是用于证明架构的旧公式试点；P1.3 以 ARRI Formats and Data Rate Calculator v2.6.3（2026-07-12 访问）为唯一数值来源，替换该试点。`MediaSpec` 改为保存字节容量，`RecordingMode` 保存可选 HDE 数据率倍率，计算核心使用 FDRC 的十进制 MB/GB 换算：

- `Mbps = bytesPerFrame × fps × 8 / 1_000_000`
- `GB/h = MB/s × 3600 / 1000`
- `minutes = mediaBytes / (MB/s × 1_000_000) / 60`

首批迁移范围仍限定为 ALEXA 35 / ARRIRAW / 4.6K Open Gate，但覆盖 Compact Drive 1TB 与 2TB 的全部官方允许帧率。界面帧率选择优先读取该目录；目录未覆盖的旧机型继续走既有 `ArriRates` 兼容路径。
