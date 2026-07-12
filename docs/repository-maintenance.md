# Repository Maintenance Plan

本文记录仓库整理步骤，避免一次性做破坏性清理。

## 当前目标结构

- 默认分支：`main`
- 稳定版本：`vX.Y.Z` tags
- 版本发布：GitHub Releases
- 开发分支：`feature/*`、`fix/*`、`docs/*`
- 自动验证：GitHub Actions 运行 Xcode build
- 项目许可证：GNU General Public License v3.0 only (`GPL-3.0-only`)

## 已完成的初步整理

- GitHub 仓库已重命名为 `LexTheAries2209/Taurus`。
- 本地 `origin` 已指向 `https://github.com/LexTheAries2209/Taurus.git`。
- GitHub 默认分支已恢复为 `main`，并保留已发布版 `V1.3.4` 的历史。
- 当前正式版本 `v1.3.7` 已创建 tag 和 GitHub Release。
- `Taurus-v1.3.7-macOS.zip` 已作为 `v1.3.7` Release 资源上传。
- `main` 已进入 `v1.3.7` 稳定发布状态。
- 历史 `V1.x.x` 分支已整理为 `v1.x.x` tags。
- `20230928` 日期分支已保留为 `archive/20230928` tag。
- 旧的本地和远端 `V1.x.x`、`20230928`、`codex/repo-maintenance-baseline` 分支已清理。
- 新增 README、CHANGELOG、贡献说明、Issue/PR 模板和 Xcode Build 工作流。
- Xcode 个人用户状态文件已从 Git 跟踪中移除，并由 `.gitignore` 忽略。
- 旧远端 `main` 已备份到 `backup/origin-main-before-restore`。
- 旧本地 `main` 已备份到 `backup/local-main-before-restore`。

## 后续建议

1. 保持 `main` 指向当前稳定代码。
2. 后续开发使用 `feature/*`、`fix/*` 或 `docs/*` 分支，不再使用 `V1.x.x` 分支承载版本。
3. 正式发布时先确认 `main` 稳定，再创建 `vX.Y.Z` tag 和 GitHub Release。
4. 如旧版本需要面向用户下载或说明，再从已有 tags 补充对应 GitHub Releases。
5. 等确认备份不再需要后，再考虑删除 `backup/*` 分支。
6. 给 `main` 设置分支保护，至少要求 GitHub Actions build 通过。

## 暂不自动执行的动作

以下操作会影响 GitHub 远端状态，建议由作者确认后再执行：

- 删除 `backup/*` 分支。
- 批量创建旧版本 releases。
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
