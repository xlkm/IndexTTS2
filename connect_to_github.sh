#!/bin/bash

# IndexTTS2 连接 GitHub 仓库脚本

set -e

echo "=========================================="
echo "IndexTTS2 连接 GitHub 仓库"
echo "=========================================="
echo ""

# 检查是否已设置远程仓库
if git remote -v | grep -q "origin"; then
    echo "⚠️  已存在远程仓库："
    git remote -v
    echo ""
    read -p "是否要更新远程仓库地址？(y/n): " update_remote
    if [ "$update_remote" != "y" ]; then
        echo "已取消操作"
        exit 0
    fi
    git remote remove origin
fi

# 获取仓库地址
echo "请输入你的 GitHub 仓库地址："
echo "格式示例："
echo "  HTTPS: https://github.com/xlkm/IndexTTS2.git"
echo "  SSH:   git@github.com:xlkm/IndexTTS2.git"
echo ""
read -p "仓库地址: " repo_url

if [ -z "$repo_url" ]; then
    echo "❌ 错误：仓库地址不能为空"
    exit 1
fi

# 添加远程仓库
echo ""
echo "添加远程仓库..."
git remote add origin "$repo_url"

# 验证远程仓库
echo ""
echo "验证远程仓库..."
git remote -v

# 确认推送
echo ""
echo "准备推送到远程仓库..."
echo "分支: main"
echo "提交数量: $(git rev-list --count HEAD)"
echo ""
read -p "是否现在推送到 GitHub？(y/n): " push_now

if [ "$push_now" = "y" ]; then
    echo ""
    echo "推送到 GitHub..."
    git push -u origin main
    echo ""
    echo "✅ 推送完成！"
    echo ""
    echo "你的仓库地址："
    echo "  $repo_url"
else
    echo ""
    echo "已添加远程仓库，但未推送。"
    echo "稍后可以使用以下命令推送："
    echo "  git push -u origin main"
fi

echo ""
echo "=========================================="
echo "完成！"
echo "=========================================="
