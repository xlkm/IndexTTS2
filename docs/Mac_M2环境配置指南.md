# Mac M2 环境配置指南

## 🍎 Apple Silicon 特殊说明

Mac M2 使用 Apple Silicon 架构，与传统的 x86 架构和 NVIDIA GPU 不同，需要特殊配置。

## 🔧 环境配置步骤

### 1. 检查 MPS 支持

```bash
python3 -c "import torch; print('MPS可用:', torch.backends.mps.is_available())"
```

如果显示 `True`，说明可以使用 Apple 的 GPU 加速。

### 2. 安装依赖（Mac M2 适配）

#### 方法1: 使用 Conda（推荐）

```bash
# 创建 conda 环境
conda create -n indextts2 python=3.10 -y
conda activate indextts2

# 安装 PyTorch（支持 MPS）
conda install pytorch torchvision torchaudio -c pytorch

# 安装其他依赖
pip install -r requirements.txt
```

#### 方法2: 使用 pip

```bash
# 创建虚拟环境
python3 -m venv venv
source venv/bin/activate

# 安装 PyTorch（支持 MPS）
pip install torch torchvision torchaudio

# 安装其他依赖
pip install -r requirements.txt
```

### 3. 安装音频处理库

```bash
# 安装系统依赖（macOS）
brew install libsndfile

# 安装 Python 库
pip install librosa soundfile
```

### 4. 验证安装

```python
import torch
import librosa
import soundfile as sf

# 检查 MPS
print(f"MPS 可用: {torch.backends.mps.is_available()}")
print(f"MPS 已构建: {torch.backends.mps.is_built()}")

# 检查音频库
print("Librosa:", librosa.__version__)
print("SoundFile:", sf.__version__)
```

## ⚙️ 代码适配 MPS

### 设备选择

```python
import torch

def get_device():
    """获取可用设备"""
    if torch.backends.mps.is_available():
        return torch.device("mps")
    elif torch.cuda.is_available():
        return torch.device("cuda")
    else:
        return torch.device("cpu")

device = get_device()
print(f"使用设备: {device}")
```

### 模型加载到 MPS

```python
model = model.to(device)

# 注意：某些操作在 MPS 上可能不支持
# 如果遇到错误，可以回退到 CPU
try:
    output = model(input.to(device))
except RuntimeError as e:
    if "MPS" in str(e):
        print("MPS 不支持此操作，使用 CPU")
        output = model(input.cpu()).to(device)
```

## 🐛 常见问题

### 问题1: MPS 不支持某些操作

**解决方案**: 
- 检查 PyTorch 版本（建议 2.0+）
- 某些操作需要回退到 CPU
- 等待 PyTorch 更新支持

### 问题2: 音频库安装失败

**解决方案**:
```bash
# 安装系统依赖
brew install libsndfile ffmpeg

# 使用 conda 安装
conda install -c conda-forge librosa soundfile
```

### 问题3: 性能较慢

**可能原因**:
- MPS 加速不如 CUDA 快
- 某些操作在 CPU 上执行

**优化建议**:
- 使用批处理
- 减少不必要的设备间数据传输
- 考虑使用云端 GPU（如需要更快速度）

## 📊 性能对比

| 设备 | 推理速度 | 训练速度 | 备注 |
|------|---------|---------|------|
| MPS (M2) | 中等 | 慢 | 适合推理 |
| CPU (M2) | 慢 | 很慢 | 备用方案 |
| CUDA (NVIDIA) | 快 | 快 | 最佳性能 |

## 💡 优化建议

1. **使用 MPS 进行推理**: 比 CPU 快很多
2. **批处理**: 一次处理多个样本
3. **模型量化**: 减小模型大小，提高速度
4. **云端训练**: 如需训练，考虑使用云端 GPU

## 🔗 相关资源

- [PyTorch MPS 文档](https://pytorch.org/docs/stable/notes/mps.html)
- [Apple Metal Performance Shaders](https://developer.apple.com/metal/)

---

**提示**: Mac M2 的 MPS 加速在推理时表现良好，但训练可能较慢。建议在 Mac 上进行推理，训练使用云端 GPU。
