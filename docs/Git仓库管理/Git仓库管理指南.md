# IndexTTS2 Git 仓库管理指南

**最后更新**: 2026-01-22

---

## 📋 目录

1. [仓库状态](#仓库状态)
2. [仓库设置历史](#仓库设置历史)
3. [GitHub 仓库连接](#github-仓库连接)
4. [常用 Git 命令](#常用-git-命令)
5. [问题解决记录](#问题解决记录)

---

## 📊 仓库状态

### 当前仓库信息

- **仓库位置**: `/Users/MacUser/Documents/ai/IndexTTS2/.git/`
- **远程仓库**: `https://github.com/xlkm/IndexTTS2.git`
- **分支**: `main`
- **状态**: ✅ 已连接并同步

### 验证仓库状态

```bash
cd /Users/MacUser/Documents/ai/IndexTTS2

# 查看远程仓库
git remote -v

# 查看分支跟踪
git branch -vv

# 查看提交历史
git log --oneline -5

# 查看工作区状态
git status
```

---

## ✅ 仓库设置历史

### 已解决的问题：仓库不匹配 ✅

**完成时间**: 2026-01-22

**问题描述**: 
- Git 远程仓库是 `vocabulary-test`，但本地项目是 `IndexTTS2`
- 所有 IndexTTS2 项目文件都未添加到 Git

**解决方案**:
1. ✅ 在 IndexTTS2 目录内初始化新的独立 Git 仓库
2. ✅ 添加所有项目文件到 Git（44个文件）
3. ✅ 创建初始提交
4. ✅ 在 GitHub 上创建新仓库：https://github.com/xlkm/IndexTTS2.git
5. ✅ 连接本地仓库到远程并推送

**当前状态**: 
- 本地仓库：干净的工作区
- 远程仓库：已连接并同步
- 分支跟踪：`main` → `origin/main`

---

## 🔗 GitHub 仓库连接

### 仓库信息

- **GitHub 用户名**: xlkm
- **仓库名称**: IndexTTS2
- **仓库地址**: `https://github.com/xlkm/IndexTTS2.git`
- **访问地址**: https://github.com/xlkm/IndexTTS2

### 连接本地仓库到 GitHub

#### 方法1: 使用脚本（推荐）

```bash
cd /Users/MacUser/Documents/ai/IndexTTS2
./connect_to_github.sh
```

脚本会引导你输入仓库地址并自动连接。

#### 方法2: 手动命令

```bash
cd /Users/MacUser/Documents/ai/IndexTTS2

# 添加远程仓库
git remote add origin https://github.com/xlkm/IndexTTS2.git

# 验证
git remote -v

# 推送到 GitHub
git push -u origin main
```

### 在 GitHub 上创建新仓库

1. **访问创建页面**
   - 打开：https://github.com/new
   - 或：登录 GitHub → 点击右上角 `+` → 选择 `New repository`

2. **填写仓库信息**
   - **Repository name**: `IndexTTS2`
   - **Description**: `IndexTTS2 学习与实践项目 - Mac M2 适配版`
   - **Visibility**: Public 或 Private
   - ⚠️ **重要**: 不要勾选任何初始化选项（README、.gitignore、license）

3. **点击 "Create repository"**

4. **复制仓库地址**
   - 创建成功后，复制显示的仓库地址
   - 格式：`https://github.com/你的用户名/IndexTTS2.git`

---

## 📝 常用 Git 命令

### 日常使用

```bash
# 查看状态
git status

# 添加文件
git add <文件名>
git add .  # 添加所有更改

# 提交更改
git commit -m "提交说明"

# 查看提交历史
git log --oneline

# 查看差异
git diff
```

### 远程仓库操作

```bash
# 推送到远程
git push origin main
git push  # 如果已设置上游分支

# 拉取远程更新
git pull origin main
git pull  # 如果已设置上游分支

# 查看远程信息
git remote -v

# 查看所有分支
git branch -a
```

### 分支管理

```bash
# 创建新分支
git branch <分支名>

# 切换分支
git checkout <分支名>

# 创建并切换分支
git checkout -b <分支名>

# 删除分支
git branch -d <分支名>
```

---

## 🔍 问题解决记录

### 2026-01-22: 仓库不匹配问题

**问题**: 
- 远程仓库是 `vocabulary-test`，但本地项目是 `IndexTTS2`
- 所有 IndexTTS2 文件都未提交

**解决步骤**:
1. 在 IndexTTS2 目录内初始化新仓库
2. 添加所有文件并提交
3. 在 GitHub 创建新仓库
4. 连接并推送

**结果**: ✅ 成功创建独立仓库并连接到 GitHub

---

## ⚠️ 注意事项

1. **.gitignore 文件**
   - 已包含在仓库中
   - 会自动忽略不需要版本控制的文件（如 `__pycache__`、`.DS_Store` 等）

2. **敏感信息**
   - `.env` 文件已在 `.gitignore` 中
   - 不要提交包含 API 密钥或密码的文件

3. **提交规范**
   - 使用清晰的提交信息
   - 每次提交解决一个问题或完成一个功能

---

## 📚 相关文档

- [环境配置指南](../环境配置/环境配置完整指南.md)
- [项目 README](../../README.md)
- [快速开始指南](../../快速开始.md)

---

**提示**: 如果遇到 Git 相关问题，可以查看此文档或使用 `git help <命令>` 获取帮助。

**最后更新**: 2026-01-22
