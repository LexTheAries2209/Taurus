# Taurus

## 中文

Taurus 是一款面向摄影、DIT 与 DMT 现场数据工作的原生 macOS 工具。应用提供“数据计算器”和“DMT 项目规划”两个并列工作区，用于查询摄影机录制参数、估算素材容量，并将多机位拍摄、备份和卸载流程整理为可保存、比较和导出的项目方案。

核心数据与计算均可离线使用，不依赖账户、云服务或第三方框架。计算结果用于前期规划和现场快速参考；固件版本、机内设置、可变帧率、压缩策略、外录方案及介质实际可用容量都可能使实拍数据与估算值不同。

### 下载与系统要求

- 当前版本：`Taurus V2.0.1`
- 下载：[`Taurus-v2.0.1-macOS.zip`](https://github.com/LexTheAries2209/Taurus/releases/download/v2.0.1/Taurus-v2.0.1-macOS.zip)
- 发布说明：[`docs/releases/v2.0.1.md`](docs/releases/v2.0.1.md)
- 最低系统：macOS 12
- 架构：Apple Silicon 与 Intel
- 数据截止日期：2026-07-06
- 许可证：GNU General Public License v3.0 only (`GPL-3.0-only`)

### 数据计算器

数据计算器根据摄影机、编码、格式或分辨率、帧率及记录介质，估算以下结果：

- 可录制时长（分钟）
- 数据码率（Mbps）
- 数据速率（MB/s）
- 每小时数据占用量（GB）
- 支持模式下的 ARRI HDE 每小时数据量

选择状态采用级联验证。品牌、机型或编码发生变化时，下游无效值会立即清空；不完整和不支持的组合会显示原因，不会继续输出误导性的数字。

`[General]` 通用模式支持手动输入码率与分辨率。手动数值必须为大于零的有限数字。ARRIRAW 模式会根据摄影机和录制格式显示可用的 HDE 数据结果。

### DMT 项目规划

DMT 项目规划用于把多个摄影机录制模式组合为完整拍摄方案。每个机位可设置：

- 摄影机录制模式、介质和机位备注
- 摄影机数量
- 每日开机时长与实际录制比例
- 拍摄天数
- 保留副本数量与安全余量
- 该机位介质对应的读卡器速度
- ARRIRAW 支持模式下的 HDE 无损压缩

项目级传输配置包括目标磁盘写入速度和每日可用卸载窗口。Taurus 会自动汇总：

- 单机每日、全部机位每日及全项目原始数据量
- 加入备份份数和安全余量后的存储需求
- 介质周转卡次与单张介质可录制时长
- 每个机位及全项目卸载时间
- 每日收工前能否完成双备份

桌面工作流还包括：

- 搜索摄影机与录制模式
- 收藏常用模式
- 2 至 4 个模式并排比较
- 复制、重排、重置和删除机位
- 复制项目方案
- JSON 项目导入与导出
- CSV 和 PDF 项目报告导出
- 中英文界面切换

项目和收藏会以 Codable JSON 自动保存在用户的 Application Support 目录。旧版 `DITProjects.json` 与 `DITFavorites.json` 会自动迁移到新的 DMT 文件名。第一版不使用账户、网络同步或 iCloud。

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

### 项目结构

- `Taurus/ContentView.swift`：顶部工作区切换和根窗口布局
- `Taurus/Views/CalculatorWorkspace.swift`：数据计算器选择区、结果区和备注区
- `Taurus/Views/RecordingMetricsView.swift`：统一计算结果展示
- `Taurus/Stores/CameraSelectionStore.swift`：级联选择状态与有效性维护
- `Taurus/Calculation/`：纯计算引擎、摄影机选择、录制模式和 ARRI 目录
- `Taurus/DMTProject.swift`：项目、机位、传输配置和汇总模型
- `Taurus/DMTProjectStore.swift`：本地项目持久化与导入导出
- `Taurus/DMTFavorites.swift`：收藏模式持久化
- `Taurus/DMTPlanExport.swift`：CSV 和 PDF 报告导出
- `Taurus/Views/DMTPlannerView.swift`：多机位规划桌面界面
- `Taurus/Views/DMTAddPlanItemView.swift`：新增和修改录制模式
- `Taurus/Views/DMTModeComparisonView.swift`：模式比较界面
- `TaurusTests/`：计算、选择、项目、收藏和导出 XCTest

### 本地构建与测试

使用 Xcode 打开：

```sh
open Taurus.xcodeproj
```

运行测试：

```sh
xcodebuild test \
  -project Taurus.xcodeproj \
  -scheme Taurus \
  -destination 'platform=macOS' \
  CODE_SIGNING_ALLOWED=NO
```

构建 Release：

```sh
xcodebuild build \
  -project Taurus.xcodeproj \
  -scheme Taurus \
  -configuration Release \
  -destination 'generic/platform=macOS' \
  ONLY_ACTIVE_ARCH=NO
```

### 许可证

Taurus 以 GNU General Public License v3.0 only 授权，SPDX 标识为 `GPL-3.0-only`。完整条款见 `LICENSE`。

### 特别鸣谢

- 徐理航：代码设计支持
- 郑昊：图标设计支持

---

## English

Taurus is a native macOS tool for cinematography, DIT, and DMT data workflows. It provides two parallel workspaces, Data Calculator and DMT Project Planner, for looking up camera recording parameters, estimating media requirements, and turning multi-camera capture, backup, and offload assumptions into saved, comparable, exportable project plans.

Core data and calculations work offline without accounts, cloud services, or third-party frameworks. Results are intended for pre-production planning and quick on-set reference. Firmware versions, camera settings, variable frame rates, compression behavior, external recorders, and actual usable media capacity can all cause real-world results to differ.

### Download and Requirements

- Current version: `Taurus V2.0.1`
- Download: [`Taurus-v2.0.1-macOS.zip`](https://github.com/LexTheAries2209/Taurus/releases/download/v2.0.1/Taurus-v2.0.1-macOS.zip)
- Release notes: [`docs/releases/v2.0.1.md`](docs/releases/v2.0.1.md)
- Minimum system: macOS 12
- Architectures: Apple Silicon and Intel
- Data cutoff date: 2026-07-06
- License: GNU General Public License v3.0 only (`GPL-3.0-only`)

### Data Calculator

The calculator estimates the following values from the selected camera, codec, format or resolution, frame rate, and recording media:

- Available recording time in minutes
- Bitrate in Mbps
- Data rate in MB/s
- Hourly storage usage in GB
- ARRI HDE hourly storage usage where supported

Selections are validated as a cascade. Changing the brand, camera, or codec immediately clears invalid downstream values. Incomplete or unsupported combinations show a reason instead of producing misleading numbers.

The `[General]` route supports manually entered bitrate and resolution values. Manual values must be finite numbers greater than zero. ARRIRAW modes expose HDE results when the selected camera and recording format provide a supported ratio.

### DMT Project Planner

The DMT Project Planner combines multiple camera recording modes into one production plan. Each camera position can define:

- Camera recording mode, media, and position notes
- Camera count
- Daily power-on time and actual recording ratio
- Shoot duration in days
- Retained copy count and safety margin
- Reader speed for that camera's media workflow
- HDE lossless compression for supported ARRIRAW modes

Project-level transfer settings include target-disk write speed and the daily offload window. Taurus automatically summarizes:

- Raw data per camera per day, all cameras per day, and the complete project
- Storage requirements after copy count and safety margin
- Media turnover cycles and recording time per card
- Per-camera and total offload time
- Whether daily double backup can finish before wrap

The desktop workflow also provides:

- Camera and recording-mode search
- Favorite recording modes
- Side-by-side comparison of 2 to 4 modes
- Camera duplication, reordering, reset, and deletion
- Project-plan duplication
- JSON project import and export
- CSV and PDF project reports
- Chinese and English interface switching

Projects and favorites are autosaved as Codable JSON in the user's Application Support directory. Legacy `DITProjects.json` and `DITFavorites.json` files are migrated automatically to the DMT filenames. The first release does not use accounts, network sync, or iCloud.

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

- `Taurus/ContentView.swift`: workspace switching and root-window layout
- `Taurus/Views/CalculatorWorkspace.swift`: calculator selection, results, and notes layout
- `Taurus/Views/RecordingMetricsView.swift`: unified calculation-result presentation
- `Taurus/Stores/CameraSelectionStore.swift`: cascading selection state and validation
- `Taurus/Calculation/`: pure calculation engine, camera selection, recording modes, and ARRI catalog
- `Taurus/DMTProject.swift`: project, camera-position, transfer-profile, and summary models
- `Taurus/DMTProjectStore.swift`: local project persistence and import/export
- `Taurus/DMTFavorites.swift`: favorite-mode persistence
- `Taurus/DMTPlanExport.swift`: CSV and PDF report generation
- `Taurus/Views/DMTPlannerView.swift`: multi-camera desktop planning interface
- `Taurus/Views/DMTAddPlanItemView.swift`: recording-mode creation and editing
- `Taurus/Views/DMTModeComparisonView.swift`: mode comparison interface
- `TaurusTests/`: calculation, selection, project, favorite, and export XCTest coverage

### Local Build and Tests

Open the Xcode project:

```sh
open Taurus.xcodeproj
```

Run tests:

```sh
xcodebuild test \
  -project Taurus.xcodeproj \
  -scheme Taurus \
  -destination 'platform=macOS' \
  CODE_SIGNING_ALLOWED=NO
```

Build a Release configuration:

```sh
xcodebuild build \
  -project Taurus.xcodeproj \
  -scheme Taurus \
  -configuration Release \
  -destination 'generic/platform=macOS' \
  ONLY_ACTIVE_ARCH=NO
```

### License

Taurus is licensed under the GNU General Public License v3.0 only. The SPDX identifier is `GPL-3.0-only`. See `LICENSE` for the full license text.

### Acknowledgements

- 徐理航: code design support
- 郑昊: icon design support
