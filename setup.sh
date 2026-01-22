#!/bin/bash

# IndexTTS2 环境安装脚本

set -e

echo "=========================================="
echo "IndexTTS2 环境配置脚本"
echo "=========================================="

# 检查Python版本
echo "检查Python版本..."
python_version=$(python3 --version 2>&1 | awk '{print $2}')
echo "当前Python版本: $python_version"

# 创建虚拟环境
echo ""
echo "创建虚拟环境..."
if [ ! -d "venv" ]; then
    python3 -m venv venv
    echo "虚拟环境创建成功"
else
    echo "虚拟环境已存在"
fi

# 激活虚拟环境
echo ""
echo "激活虚拟环境..."
source venv/bin/activate

# 升级pip
echo ""
echo "升级pip..."
pip install --upgrade pip

# 安装PyTorch（检测系统类型）
echo ""
echo "安装PyTorch..."
# 检测是否为Apple Silicon
if [[ $(uname -m) == "arm64" ]]; then
    echo "检测到 Apple Silicon (M1/M2)，安装支持 MPS 的 PyTorch..."
    pip install torch torchvision torchaudio
else
    read -p "是否使用GPU? (y/n): " use_gpu
    if [ "$use_gpu" = "y" ]; then
        read -p "CUDA版本 (10.2/11.3/11.6): " cuda_version
        if [ "$cuda_version" = "11.3" ]; then
            pip install torch torchaudio --extra-index-url https://download.pytorch.org/whl/cu113
        elif [ "$cuda_version" = "11.6" ]; then
            pip install torch torchaudio --extra-index-url https://download.pytorch.org/whl/cu116
        else
            pip install torch torchaudio
        fi
    else
        pip install torch torchaudio
    fi
fi

# 安装系统依赖（macOS）
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo ""
    echo "检测到 macOS，检查系统依赖..."
    if ! command -v brew &> /dev/null; then
        echo "⚠️  未安装 Homebrew，建议安装: /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
        echo "   然后运行: brew install libsndfile"
    else
        if ! brew list libsndfile &> /dev/null; then
            echo "安装 libsndfile..."
            brew install libsndfile
        fi
    fi
fi

# 安装其他依赖
echo ""
echo "安装项目依赖..."
pip install -r requirements.txt

# 创建必要的目录
echo ""
echo "创建必要的目录..."
mkdir -p data/raw data/processed checkpoints outputs/logs outputs/audio

# 完成
echo ""
echo "=========================================="
echo "环境配置完成！"
echo "=========================================="
echo ""
echo "使用以下命令激活环境:"
echo "  source venv/bin/activate"
echo ""
echo "开始学习:"
echo "  1. 查看 docs/learning/01-环境配置/ 目录"
echo "  2. 运行 python scripts/inference/inference.py --help"
echo ""
