# Repository Maintenance Plan

本文记录仓库整理步骤，避免一次性做破坏性清理。

## 已建议的目标结构

- 默认分支：`main`
- 稳定版本：`vX.Y.Z` tags
- 版本发布：GitHub Releases
- 开发分支：`feature/*`、`fix/*`、`docs/*`
- 自动验证：GitHub Actions 运行 Xcode build
- 项目许可证：GNU General Public License v3.0 only (`GPL-3.0-only`)

## 已完成的初步整理

- GitHub 仓库已重命名为 `LexTheAries2209/Taurus`。
- 本地 `origin` 已指向 `https://github.com/LexTheAries2209/Taurus.git`。
- GitHub 默认分支已恢复为 `main`，并指向当前最新版 `V1.3.4` 的历史。
- 新增 README、CHANGELOG、贡献说明、Issue/PR 模板和 Xcode Build 工作流。
- Xcode 个人用户状态文件已从 Git 跟踪中移除，并由 `.gitignore` 忽略。
- 旧远端 `main` 已备份到 `backup/origin-main-before-restore`。
- 旧本地 `main` 已备份到 `backup/local-main-before-restore`。

## 建议执行顺序

1. 确认当前最新版 `V1.3.4` 是稳定代码。
2. 保持 `main` 指向当前稳定代码。
3. 保持 GitHub 默认分支为 `main`。
4. 为历史版本创建 `v1.3.4`、`v1.3.3`、`v1.3.2` 等 tags。
5. 使用 `CHANGELOG.md` 和 `Taurus/Taurus_Log.txt` 创建 GitHub Releases。
6. 确认 tags 和 releases 无误后，再清理历史 `V1.x.x` 远端分支。
7. 给 `main` 设置分支保护，至少要求 GitHub Actions build 通过。

## 暂不自动执行的动作

以下操作会影响 GitHub 远端状态，建议由作者确认后再执行：

- 删除历史远端分支。
- 创建正式 release。
- 更改仓库可见性或安全策略。
- 强制推送或重写历史。

## 本地建议

如果本地远端仍指向旧仓库名，可以执行：

```sh
git remote set-url origin https://github.com/LexTheAries2209/Taurus.git
```

执行后用下面命令确认：

```sh
git remote -v
```
