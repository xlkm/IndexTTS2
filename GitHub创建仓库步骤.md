# GitHub 创建仓库步骤指南

## 📋 创建新仓库的步骤

### 方法 1: 通过网页创建（推荐）

1. **打开 GitHub 创建仓库页面**
   - 访问：https://github.com/new
   - 或者：登录 GitHub → 点击右上角 `+` 号 → 选择 `New repository`

2. **填写仓库信息**
   - **Repository name**: `IndexTTS2`（或你喜欢的名称）
   - **Description**: `IndexTTS2 学习与实践项目 - Mac M2 适配版`
   - **Visibility**: 
     - ✅ **Public**（公开，其他人可以看到）
     - 🔒 **Private**（私有，只有你可以看到）
   - **重要**: ⚠️ **不要**勾选以下选项：
     - ❌ Add a README file（本地已有 README.md）
     - ❌ Add .gitignore（本地已有 .gitignore）
     - ❌ Choose a license（可选，稍后可以添加）

3. **点击 "Create repository" 按钮**

4. **复制仓库地址**
   - 创建成功后，GitHub 会显示仓库地址
   - 格式类似：`https://github.com/你的用户名/IndexTTS2.git`
   - 或者 SSH 格式：`git@github.com:你的用户名/IndexTTS2.git`

### 方法 2: 使用 GitHub CLI（如果已安装）

```bash
# 安装 GitHub CLI（如果未安装）
brew install gh

# 登录 GitHub
gh auth login

# 创建仓库
gh repo create IndexTTS2 --public --description "IndexTTS2 学习与实践项目 - Mac M2 适配版" --source=. --remote=origin --push
```

## 🔗 连接本地仓库到远程

创建好 GitHub 仓库后，运行以下命令：

```bash
cd /Users/MacUser/Documents/ai/IndexTTS2

# 添加远程仓库（替换为你的实际仓库地址）
git remote add origin https://github.com/你的用户名/IndexTTS2.git

# 确认远程仓库已添加
git remote -v

# 推送到远程仓库
git push -u origin main
```

## 📝 仓库信息建议

### 推荐的仓库名称
- `IndexTTS2` - 简洁明了
- `IndexTTS2-MacM2` - 包含平台信息
- `indextts2-learning` - 学习项目标识

### 推荐的描述
- `IndexTTS2 学习与实践项目 - Mac M2 适配版`
- `基于索引机制的文本转语音系统，支持零样本语音克隆，适配 Apple Silicon`
- `IndexTTS2 TTS system with Mac M2 support for video dubbing`

### 推荐的主题标签（Topics）
创建仓库后，可以添加以下标签：
- `indextts2`
- `text-to-speech`
- `tts`
- `voice-cloning`
- `mac-m2`
- `apple-silicon`
- `python`
- `pytorch`

## ⚠️ 注意事项

1. **不要初始化 README**
   - 本地已有完整的 README.md
   - 如果 GitHub 创建了新的 README，会导致冲突

2. **不要初始化 .gitignore**
   - 本地已有配置好的 .gitignore
   - 包含 Python、数据文件、日志等的忽略规则

3. **首次推送**
   - 使用 `git push -u origin main`
   - `-u` 参数会设置上游分支，之后可以直接使用 `git push`

## 🎯 创建后的验证

创建并连接仓库后，运行以下命令验证：

```bash
# 查看远程仓库
git remote -v

# 应该显示：
# origin  https://github.com/你的用户名/IndexTTS2.git (fetch)
# origin  https://github.com/你的用户名/IndexTTS2.git (push)

# 查看所有分支
git branch -a

# 查看提交历史
git log --oneline
```

## 📚 后续操作

创建仓库后，你可以：

1. **添加仓库描述和标签**
   - 在仓库页面点击 "Settings" → "General"
   - 编辑描述和添加 Topics

2. **设置分支保护规则**（可选）
   - Settings → Branches → Add rule

3. **添加 LICENSE**（可选）
   - 在仓库页面点击 "Add file" → "Create new file"
   - 文件名输入 `LICENSE`
   - GitHub 会自动提示选择许可证类型

4. **添加 README 徽章**（可选）
   - 可以在 README.md 中添加状态徽章

---

**提示**: 创建好仓库后，告诉我你的仓库地址，我可以帮你执行连接命令！
