# Contributing

这个仓库目前主要由作者维护。为了让版本线保持清晰，建议后续所有改动都按下面方式进行。

## 分支

- `main`：稳定主线，只放已经确认可以发布的代码。
- `feature/<short-name>`：新增机型、品牌、编码或界面功能。
- `fix/<short-name>`：修复错误数据、错误计算或界面问题。
- `docs/<short-name>`：文档和仓库配置整理。

不要再用 `V1.3.5` 这种版本号作为开发分支。版本号应放在 Git tag 和 GitHub Release 中。

## 提交

建议提交信息说明“影响范围 + 做了什么”，例如：

```text
Add Nikon ZR media options
Fix Panasonic ProRes RAW bitrate calculation
Update V1.3.5 changelog
```

## 发布

发布新版本时：

1. 确认 `main` 可以成功构建。
2. 更新 `CHANGELOG.md` 和 `Taurus/Taurus_Log.txt`。
3. 创建 `vX.Y.Z` tag。
4. 在 GitHub Release 中粘贴对应版本说明。
5. 如有安装包或压缩包，将构建产物附到 release。

## 数据修改

新增或修正摄影机数据时，尽量在 PR 或 commit 中写明数据来源，例如厂商官网、固件说明、用户手册或实测来源。涉及估算值时，应明确保留“仅供参考”的说明。
