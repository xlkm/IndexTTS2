# 01. 环境配置

## 学习目标
- [ ] 了解系统要求
- [ ] 完成Python环境配置
- [ ] 安装所有依赖包
- [ ] 验证环境是否正确配置

## 系统要求

### 硬件要求
- **CPU**: 4核以上推荐
- **内存**: 16GB以上推荐
- **GPU**: NVIDIA GPU（推荐，CUDA 10.2+）
- **存储**: 至少50GB可用空间

### 软件要求
- **操作系统**: Linux/macOS/Windows
- **Python**: 3.7-3.10
- **CUDA**: 10.2/11.3/11.6（如使用GPU）

## 安装步骤

### 方法1: 使用setup.sh脚本（推荐）

```bash
# 运行安装脚本
./setup.sh
```

### 方法2: 手动安装

#### 1. 创建虚拟环境

```bash
# 使用venv
python3 -m venv venv
source venv/bin/activate  # Linux/macOS
# 或
venv\Scripts\activate  # Windows
```

#### 2. 安装PyTorch

```bash
# CPU版本
pip install torch torchaudio

# GPU版本（CUDA 11.3）
pip install torch torchaudio --extra-index-url https://download.pytorch.org/whl/cu113
```

#### 3. 安装项目依赖

```bash
pip install -r requirements.txt
```

### 方法3: 使用Conda

```bash
# 创建conda环境
conda env create -f environment.yml

# 激活环境
conda activate indextts2
```

### 方法4: 使用Docker

```bash
# 构建镜像
docker-compose build

# 启动容器
docker-compose up -d

# 进入容器
docker-compose exec indextts2 bash
```

## 验证安装

### 1. 检查Python版本
```bash
python --version
# 应该显示 Python 3.7-3.10
```

### 2. 检查PyTorch
```python
import torch
print(torch.__version__)
print(torch.cuda.is_available())  # GPU是否可用
```

### 3. 检查音频库
```python
import librosa
import soundfile
print("音频库安装成功")
```

### 4. 运行测试
```bash
pytest tests/unit/test_environment.py
```

## 常见问题

### Q1: CUDA版本不匹配
**解决方案**: 根据你的CUDA版本安装对应的PyTorch版本

### Q2: 依赖冲突
**解决方案**: 使用虚拟环境隔离依赖

### Q3: 音频库安装失败
**解决方案**: 
- Linux: `sudo apt-get install libsndfile1`
- macOS: `brew install libsndfile`
- Windows: 使用预编译的wheel文件

## 下一步

环境配置完成后，继续学习：
- [02. 数据准备](../02-数据准备/README.md)

## 实践任务

- [ ] 完成环境安装
- [ ] 运行验证脚本
- [ ] 记录遇到的问题和解决方案
