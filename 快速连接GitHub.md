# 快速连接 GitHub 仓库

## 🚀 快速步骤

### 1. 在 GitHub 上创建仓库

访问：**https://github.com/new**

填写信息：
- **Repository name**: `IndexTTS2`
- **Description**: `IndexTTS2 学习与实践项目 - Mac M2 适配版`
- **Visibility**: 选择 Public 或 Private
- ⚠️ **重要**: 不要勾选任何初始化选项（README、.gitignore、license）

点击 **"Create repository"**

### 2. 复制仓库地址

创建成功后，GitHub 会显示仓库地址，复制它：
- HTTPS: `https://github.com/xlkm/IndexTTS2.git`
- 或 SSH: `git@github.com:xlkm/IndexTTS2.git`

### 3. 连接本地仓库

#### 方法 A: 使用脚本（推荐）

```bash
cd /Users/MacUser/Documents/ai/IndexTTS2
./connect_to_github.sh
```

脚本会引导你输入仓库地址并自动连接。

#### 方法 B: 手动命令

```bash
cd /Users/MacUser/Documents/ai/IndexTTS2

# 添加远程仓库（替换为你的实际地址）
git remote add origin https://github.com/xlkm/IndexTTS2.git

# 验证
git remote -v

# 推送到 GitHub
git push -u origin main
```

## ✅ 验证

推送成功后，访问你的 GitHub 仓库页面，应该能看到：
- README.md
- 所有项目文件
- 2 个提交记录

## 📝 你的仓库信息

- **GitHub 用户名**: xlkm
- **建议仓库名**: IndexTTS2
- **本地分支**: main
- **提交数量**: 2 个提交

---

**提示**: 如果遇到问题，告诉我具体的错误信息，我会帮你解决！
