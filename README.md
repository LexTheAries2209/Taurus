# Taurus

## 中文

Taurus 是一个面向摄影、DIT 与现场数据管理工作的 macOS SwiftUI 工具。当前主要功能是“数据计算器”：根据摄影机、编码、分辨率、帧率和记录介质，估算数据码率、每小时数据量和可录制时长。

计算结果用于现场规划和快速参考。不同厂商固件、机内设置、可变帧率、压缩策略、外录方案和介质实际可用容量都可能让实际数据量与估算值不同。

### 当前状态

- 默认分支：`main`
- 当前开发/构建版本：`v1.3.5`（应用内版本号：`V1.3.5`）
- 最新正式发布：`v1.3.4` tag 和 GitHub Release
- 历史版本：已整理为 `v1.x.x` tags
- 数据截止日期：2026-05-25
- 平台：macOS
- 技术栈：SwiftUI, Xcode project
- 自动验证：GitHub Actions 运行 Xcode Release build
- 许可证：GNU General Public License v3.0 only (`GPL-3.0-only`)

### 已覆盖品牌

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
- `[General]` 自定义模式

### 代码结构

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

### 本地构建

使用 Xcode 打开：

```sh
open Taurus.xcodeproj
```

或使用命令行构建：

```sh
xcodebuild -project Taurus.xcodeproj -target Taurus -configuration Release build
```

### 版本管理

本仓库已恢复 `main` 作为稳定主线。后续建议：

- `main`：稳定主线，始终指向当前可用版本
- `feature/<name>`：新增机型、品牌、编码、介质或界面功能
- `fix/<name>`：修复数据、计算或界面问题
- `docs/<name>`：文档和仓库配置整理
- `vX.Y.Z` tag：正式版本
- GitHub Release：面向使用者的版本说明和下载入口

历史中的 `V1.x.x` 分支已整理为 `v1.x.x` tags；`20230928` 日期分支已保留为 `archive/20230928` tag。远端仅保留 `main` 和必要的 `backup/*` 分支。后续如需补全旧版本说明，可以继续从 tags 创建对应的 GitHub Releases。

### 许可证

Taurus 以 GNU General Public License v3.0 only 授权，SPDX 标识为 `GPL-3.0-only`。完整条款见 `LICENSE`。

### 特别鸣谢

- 徐理航：代码设计支持
- 郑昊：图标设计支持

---

## English

Taurus is a macOS SwiftUI tool for cinematography, DIT, and on-set data management workflows. Its current primary feature is a data calculator that estimates bitrate, hourly storage usage, and recording time from camera, codec, resolution, frame rate, and recording media selections.

The calculated results are intended for planning and quick reference. Real-world usage can differ because of firmware versions, in-camera settings, variable frame rates, compression behavior, external recording workflows, and actual usable media capacity.

### Current Status

- Default branch: `main`
- Current development/build version: `v1.3.5` (in-app version: `V1.3.5`)
- Latest formal release: `v1.3.4` tag and GitHub Release
- Historical versions: converted to `v1.x.x` tags
- Data cutoff date: 2026-05-25
- Platform: macOS
- Stack: SwiftUI, Xcode project
- Automation: GitHub Actions runs an Xcode Release build
- License: GNU General Public License v3.0 only (`GPL-3.0-only`)

### Covered Brands

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
- `[General]` custom mode

### Project Structure

- `Taurus/ContentView.swift`: main window, app state, and reset logic
- `Taurus/PickerView.swift`: brand, camera, codec, resolution, frame rate, and media selectors
- `Taurus/DataOutput.swift`: recording time, bitrate, and hourly storage output
- `Taurus/Brand_Camera.swift`: brand and camera entry data
- `Taurus/Codec.swift`: camera-to-codec options
- `Taurus/Media.swift` and `Taurus/Media/`: recording media options
- `Taurus/Resolution/`: brand-specific resolution and format options
- `Taurus/Rate/`: brand-specific frame rate options
- `Taurus/Count.swift` and `Taurus/Count/`: bitrate, capacity, and storage calculations
- `Taurus/Taurus_Log.txt`: in-app version notes

### Local Build

Open with Xcode:

```sh
open Taurus.xcodeproj
```

Or build from the command line:

```sh
xcodebuild -project Taurus.xcodeproj -target Taurus -configuration Release build
```

### Version Management

This repository now uses `main` as the stable development line. Recommended workflow:

- `main`: stable line, always pointing to the current usable version
- `feature/<name>`: new cameras, brands, codecs, media, or UI features
- `fix/<name>`: data, calculation, or UI fixes
- `docs/<name>`: documentation and repository maintenance
- `vX.Y.Z` tag: formal version marker
- GitHub Release: user-facing release notes and downloadable artifacts

Historical `V1.x.x` branches have been converted into `v1.x.x` tags; the `20230928` date branch is preserved as the `archive/20230928` tag. The remote now keeps only `main` and the necessary `backup/*` branches. Older release notes can be gradually backfilled as GitHub Releases from the tags if needed.

### License

Taurus is licensed under the GNU General Public License v3.0 only. The SPDX identifier is `GPL-3.0-only`. See `LICENSE` for the full license text.

### Acknowledgements

- 徐理航: code design support
- 郑昊: icon design support
