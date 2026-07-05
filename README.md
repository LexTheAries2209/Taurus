# Taurus DIT Tool

Taurus 是一个面向摄影、DIT 与现场数据管理工作的 macOS SwiftUI 工具。当前版本主要提供“数据计算器”功能：根据摄影机、编码、分辨率、帧率和记录介质估算码率、每小时数据量和可录制时长。

## 当前状态

- 当前应用版本：V1.3.4
- 数据截止日期：2026-05-25
- 平台：macOS
- 工程：Xcode project, SwiftUI
- 主要目标：快速估算摄影机录制数据量和储存介质时长

计算结果用于现场规划和快速参考。不同厂商固件、机内设置、可变帧率、压缩策略和外录方案可能导致实际数据量不同。

## 已覆盖品牌

- ARRI
- RED
- SONY
- Canon
- Canon Cinema
- Kinefinity
- Nikon
- Blackmagicdesign
- Fujifilm
- Panasonic
- DJI
- Apple
- General 自定义模式

## 代码结构

- `Taurus/ContentView.swift`：主窗口、应用状态和重置逻辑
- `Taurus/PickerView.swift`：品牌、机型、编码、分辨率、帧率和储存卡选择器
- `Taurus/DataOutput.swift`：录制时长、码率和每小时数据量输出
- `Taurus/Brand_Camera.swift`：品牌与机型入口数据
- `Taurus/Codec.swift`：机型与编码选项
- `Taurus/Media.swift` 与 `Taurus/Media/`：记录介质选项
- `Taurus/Resolution/`：各品牌分辨率/格式选项
- `Taurus/Rate/`：各品牌帧率选项
- `Taurus/Count.swift` 与 `Taurus/Count/`：码率、容量和数据量计算逻辑
- `Taurus/Taurus_Log.txt`：应用内版本说明

## 本地构建

使用 Xcode 打开：

```sh
open Taurus.xcodeproj
```

或使用命令行构建：

```sh
xcodebuild -project Taurus.xcodeproj -target Taurus -configuration Release build
```

## 版本管理建议

本仓库建议使用：

- `main`：稳定主线，始终指向当前可用版本
- `feature/<name>`：新功能或新机型数据
- `fix/<name>`：错误修复
- `vX.Y.Z` tag：正式版本
- GitHub Release：面向使用者的版本说明和下载入口

历史中的 `V1.x.x` 分支应逐步整理为 `v1.x.x` tags 和 GitHub Releases。清理历史分支前，请先确认对应 tag 和 release 已经存在。

## 许可证

当前仓库尚未声明开源许可证。除非作者明确添加许可证，否则外部使用者不应默认拥有复制、修改或再发布权利。
