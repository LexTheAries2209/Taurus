# Contributing / 贡献指南

## 中文

这个仓库目前主要由作者维护。贡献流程的目标是让摄影机数据、计算逻辑、版本发布和仓库历史都保持清晰。

### 分支

- `main`：稳定主线，只放已经确认可以构建和发布的代码。
- `feature/<short-name>`：新增机型、品牌、编码、介质或界面功能。
- `fix/<short-name>`：修复错误数据、错误计算或界面问题。
- `docs/<short-name>`：文档、GitHub 模板、CI 或仓库配置整理。

不要再用 `V1.3.5` 这种版本号作为开发分支。版本号应放在 Git tag 和 GitHub Release 中，例如 `v1.3.5`。

### 提交

提交信息建议写清楚影响范围和实际动作，例如：

```text
Add Nikon ZR media options
Fix Panasonic ProRes RAW bitrate calculation
Update V1.3.5 changelog
```

### Pull Request

PR 应尽量包含：

- 改了什么
- 影响哪些品牌、机型、编码、分辨率、帧率或介质
- 数据来源或验证方式
- 是否更新了 `CHANGELOG.md` 和 `Taurus/Taurus_Log.txt`
- 是否通过本地或 GitHub Actions 构建

本地构建命令：

```sh
xcodebuild -project Taurus.xcodeproj -target Taurus -configuration Release build
```

### 数据修改

新增或修正摄影机数据时，应尽量说明来源，例如厂商官网、固件说明、用户手册、白皮书或可靠实测。涉及估算、推导或非官方数据时，应明确保留“仅供参考”的说明。

### 发布

发布新版本时：

1. 确认 `main` 可以成功构建。
2. 更新 `CHANGELOG.md` 和 `Taurus/Taurus_Log.txt`。
3. 创建 `vX.Y.Z` tag。
4. 在 GitHub Release 中粘贴对应版本说明。
5. 如有安装包或压缩包，将构建产物附到 Release。

### 许可证

Taurus 使用 GNU General Public License v3.0 only 授权，SPDX 标识为 `GPL-3.0-only`。提交贡献即表示你同意你的贡献以同一许可证并入本项目。不要提交与你无权授权或许可证不兼容的代码、数据或素材。

---

## English

This repository is currently maintained primarily by the author. The contribution workflow is meant to keep camera data, calculation logic, releases, and repository history easy to understand.

### Branches

- `main`: stable line, only for code that is ready to build and release.
- `feature/<short-name>`: new cameras, brands, codecs, media, or UI features.
- `fix/<short-name>`: data, calculation, or UI fixes.
- `docs/<short-name>`: documentation, GitHub templates, CI, or repository maintenance.

Do not use version numbers such as `V1.3.5` as development branches. Versions should be represented by Git tags and GitHub Releases, for example `v1.3.5`.

### Commits

Commit messages should describe the affected area and the action taken, for example:

```text
Add Nikon ZR media options
Fix Panasonic ProRes RAW bitrate calculation
Update V1.3.5 changelog
```

### Pull Requests

A PR should ideally include:

- What changed
- Which brands, cameras, codecs, resolutions, frame rates, or media are affected
- Data sources or verification notes
- Whether `CHANGELOG.md` and `Taurus/Taurus_Log.txt` were updated
- Whether the project builds locally or in GitHub Actions

Local build command:

```sh
xcodebuild -project Taurus.xcodeproj -target Taurus -configuration Release build
```

### Camera Data Changes

When adding or correcting camera data, include the source whenever possible, such as manufacturer websites, firmware notes, user manuals, white papers, or reliable tests. If a value is estimated, derived, or unofficial, keep the “for reference only” limitation clear.

### Releases

When publishing a new version:

1. Confirm that `main` builds successfully.
2. Update `CHANGELOG.md` and `Taurus/Taurus_Log.txt`.
3. Create a `vX.Y.Z` tag.
4. Paste the release notes into GitHub Release.
5. Attach build artifacts if an app bundle, installer, or archive is available.

### License

Taurus is licensed under the GNU General Public License v3.0 only. The SPDX identifier is `GPL-3.0-only`. By contributing, you agree that your contribution will be included under the same license. Do not submit code, data, or assets that you cannot license this way or that are incompatible with the project license.
