# Changelog

本文件用于承接 GitHub Release 的版本说明。更详细的应用内说明保留在 `Taurus/Taurus_Log.txt`。

## V1.3.6

### 中文

- 完成 P1 计算核心重构：引入稳定的摄影机选择、录制模式、介质规格、计算结果和计算引擎类型。
- 将计算逻辑从 SwiftUI 视图中分离为可独立测试的纯计算引擎，并统一录制结果展示。
- 根据 ARRI FDRC v2.6.3 官方数据快照重建 ARRI 录制模式和介质限制，不再依赖数字编码字符串拼接规则。
- 修复 ARRI 分辨率选择器：所有官方 ARRI 摄影机与编码组合在选择分辨率前都能显示可用分辨率。
- 增加级联选择和跨品牌回归测试，确保失效组合不会继续参与计算。
- 版本命名：Version 为 `1.3`，Build 为 `6`，应用显示为 `Taurus V1.3.6`。

### English

- Completed the P1 calculation-core refactor with stable camera-selection, recording-mode, media-specification, calculation-result, and calculation-engine types.
- Separated calculation logic from SwiftUI views into an independently testable pure calculation engine and unified recording-metrics presentation.
- Rebuilt ARRI recording modes and media constraints from the official ARRI FDRC v2.6.3 data snapshot, removing numeric codec-string composition rules.
- Fixed the ARRI resolution picker so every official ARRI camera and codec pair exposes its available resolutions before a resolution is selected.
- Added cascading-selection and cross-brand regression tests to prevent invalid selections from reaching the calculation stage.
- Version naming: Version is `1.3`, Build is `6`, and the app displays as `Taurus V1.3.6`.

## V1.3.5

### 中文

- 加入英文界面翻译，数据计算器的主要界面文本现在支持英文显示。
- 加入右上角截图功能，便于导出当前计算界面。
- 加入 ARRI ALEXA 35 Live Xtreme 机型的选择和计算。
- 更新底部注释，将特别鸣谢移入 README，并在应用内介绍 GitHub 仓库。
- 调整版本命名规则：Version 保持为 `1.3`，Build 为 `5`，应用显示为 `Taurus V1.3.5`。

### English

- Added English UI translation for the main data-calculator interface.
- Added a screenshot button in the upper-right corner for exporting the current calculator view.
- Added selection and calculation support for ARRI ALEXA 35 Live Xtreme.
- Updated the in-app notes: acknowledgements moved to the README, and the app now points users to the GitHub repository.
- Updated version naming: Version stays at `1.3`, Build is `5`, and the app displays as `Taurus V1.3.5`.

## V1.3.4

- 简化 Canon 机型的分辨率选择。
- 加入 Canon R6 V、C50、R6 Mark3。
- 优化 Canon 系列机型的分辨率和编码显示。
- 优化 UI 显示。
- 加入 Panasonic S1R2、S1M2、S1M2E。
- 修复 Panasonic 机型在选择 ProRes RAW 时的码率错误。
- 加入 Sony A7R6、A7M5。
- 修复 Panasonic GH7 的分辨率选择问题。
- 修复 Sony 机型的一个普遍分辨率错误。
- 加入 Fujifilm GFX ETERNA 55。
- 加入 BMCC 6K、EVA1、Nikon ZR、Z9、Z8、Z 6III、DJI Pocket 系列相关选择和计算。

## V1.3.3

- 修复 iPhone 机型帧率选择错误。
- 为 iPhone 系列机型加入更多编码选项。
- 为部分 iPhone 机型加入 Open Gate 模式。
- 更新 iPhone 的计算和选择。
- 修复 ARRI ALEXA 35 Xtreme 帧率选择错误。
- 修复 KOMODO 拼写错误。
- 修复 ARRI 一个机型的分辨率拼写错误。
- 修改 DJI Ronin 4D 与 DJI Inspire 3 的编码问题。
- 修改注释。

## V1.3.2

- 更新注释。
- 修复使用 XR/SXR Capture Drive 记录 ProRes 时的容量计算错误。
- 加入 Blackmagic URSA Mini Pro 12K 6:5 分辨率选择和计算。
- 修复 Blackmagic URSA Mini Pro 12K 错误的分辨率选择。
- 加入 Sony CineAlta Burano 更多帧率和新分辨率选择。
- 修复 ALEXA SXT 一个分辨率错误。
- 修复 ALEXA 35 系列 ProRes 码率问题。
- 为 ARRI 机型加入更多分辨率选择。
- 加入 ARRI ALEXA 35 Xtreme、RED V-Raptor XE、Apple iPhone 17 系列、Blackmagic URSA Cine Immersive、URSA Cine 17K 65、URSA Cine 12K LF。
- 修复 iPhone 系列帧率选择错误。

## V1.3.1

- 加入 ARRI ALEXA 35 Live 选择和计算。
- 加入日期时间显示。
- 增加 Command+R 重置功能。
- 优化数据输出区对齐。
- 修复 `[General]` 模式无法计算 ProRes 编码的问题。

## V1.3.0

- 更新注释。
- 加入 Canon CinemaEOS C400、C80。
- 加入 Canon EOS R5 Mark2、EOS R1。
- 加入 DJI Ronin 4D 6K/8K 16:9 录制规格。
- 加入 Sony A1M2。
- 修复 DJI Ronin 4D 6K 一个选择错误。
- 修复 ProRes 表述。

## V1.2.11 and earlier

历史版本说明仍保留在 `Taurus/Taurus_Log.txt`。后续创建 GitHub Release 时，可以继续把旧版本逐步拆分为单独 release。
