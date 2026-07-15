# Changelog

本文件用于承接 GitHub Release 的版本说明。更详细的应用内说明保留在 `Taurus/Taurus_Log.txt`。

## V2.0.1

### 中文

- 新增 DMT 项目规划工作区，与数据计算器通过顶部标签并列切换。
- 支持多机位项目、机位数量、每日开机时长、录制比例、拍摄天数、备份份数、安全余量和机位备注。
- 汇总每日与全项目原始数据、备份后存储、介质周转卡次、单卡录制时长、卸载时间和每日双备份可行性。
- 将读卡器速度设置为每个机位独立参数，并保留项目级目标磁盘速度与每日卸载窗口。
- 支持 ARRI ARRIRAW HDE 无损压缩规划，包括 ALEXA 与 AMIRA 的可用模式。
- 支持摄影机搜索、收藏模式、2 至 4 个模式比较、机位复制、重排、重置和删除。
- 支持本地 JSON 自动保存、项目复制和 JSON 导入导出，以及 CSV、PDF 报告导出。
- 完成 DMT 项目规划中英文界面，并改进窗口切换动画、居中缩放和桌面表格布局。
- 数据计算器继续提供级联选择验证、无效输入拦截、ARRI 结构化录制模式和跨品牌计算测试。
- 版本命名：Version 为 `2.0`，Build 为 `1`，应用显示为 `Taurus V2.0.1`。

### English

- Added the DMT Project Planner as a top-level workspace alongside Data Calculator.
- Added multi-camera projects with camera count, daily power-on time, recording ratio, shoot days, retained copies, safety margin, and position notes.
- Added daily and project raw-data totals, storage after backups, media turnover cycles, recording time per card, offload time, and daily double-backup feasibility.
- Made reader speed a per-camera parameter while retaining project-level target-disk speed and daily offload-window settings.
- Added ARRI ARRIRAW HDE planning for supported ALEXA and AMIRA modes.
- Added camera search, favorites, comparison of 2 to 4 modes, camera duplication, reordering, reset, and deletion.
- Added local JSON autosave, project duplication and JSON import/export, plus CSV and PDF reports.
- Completed Chinese and English DMT Planner interfaces and refined workspace transitions, centered window resizing, and desktop table layouts.
- Preserved cascading validation, invalid-input protection, structured ARRI recording modes, and cross-brand calculation tests in Data Calculator.
- Version naming: Version is `2.0`, Build is `1`, and the app displays as `Taurus V2.0.1`.

## V1.3.7

### 中文

- 恢复 ARRI 分辨率选择的旧版显示格式，显示名称与官方计算模式分离。
- 保留官方数值：ALEXA XT 3.2K 使用 `3164*1778`，ALEXA 265 5.1K 使用 `5120*3100`。
- 按用户确认恢复旧版新增分辨率表达：ALEXA Mini ARRIRAW 1.9K/2.5K，以及 ALEXA 35 系列 3.8K 变形模式。
- 不加入 AMIRA MPEG-2 HD 422；恢复 `ALEXA 35 Live Xtreme` 机型入口。
- 恢复 ARRI 旧版帧率候选数量，并继续按官方介质限制过滤可用帧率。
- 版本命名：Version 为 `1.3`，Build 为 `7`，应用显示为 `Taurus V1.3.7`。

### English

- Restored the legacy ARRI resolution display format while keeping display names separate from official calculation modes.
- Preserved official dimensions: ALEXA XT 3.2K uses `3164*1778`, and ALEXA 265 5.1K uses `5120*3100`.
- Applied the confirmed legacy-style names for ALEXA Mini ARRIRAW 1.9K/2.5K and the ALEXA 35-series 3.8K anamorphic mode.
- Did not add AMIRA MPEG-2 HD 422, and restored the `ALEXA 35 Live Xtreme` camera entry.
- Restored the legacy ARRI frame-rate choice set while continuing to filter it by official media limits.
- Version naming: Version is `1.3`, Build is `7`, and the app displays as `Taurus V1.3.7`.

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
