# 02. 数据准备

## 学习目标
- [ ] 了解数据格式要求
- [ ] 掌握数据预处理流程
- [ ] 完成数据集的准备和组织
- [ ] 理解数据加载机制

## 数据格式要求

### 音频文件
- **格式**: WAV（推荐）
- **采样率**: 16kHz或更高（推荐22.05kHz或44.1kHz）
- **声道**: 单声道（mono）
- **位深**: 16-bit或更高
- **时长**: 建议3-10秒（可根据模型调整）

### 文本标注
- **格式**: 纯文本或JSON
- **编码**: UTF-8
- **内容**: 与音频对应的文本内容
- **示例格式**:
```
audio_001.wav|这是第一段测试文本
audio_002.wav|这是第二段测试文本
```

## 数据预处理流程

### 1. 音频标准化

```python
# 参考脚本: scripts/preprocess/audio_normalize.py
# 功能：
# - 统一采样率
# - 转换为单声道
# - 标准化音量
```

### 2. 文本预处理

```python
# 参考脚本: scripts/preprocess/text_preprocess.py
# 功能：
# - 文本清洗
# - 标点处理
# - 分词（如需要）
```

### 3. 特征提取

```python
# 参考脚本: scripts/preprocess/extract_features.py
# 提取特征：
# - 梅尔频谱图
# - F0（基频）
# - 其他声学特征
```

## 数据集组织

### 目录结构
```
data/
├── raw/              # 原始数据
│   ├── audio/        # 原始音频文件
│   └── transcripts/  # 原始文本标注
├── processed/        # 处理后的数据
│   ├── features/     # 提取的特征
│   └── metadata.json # 数据元信息
└── datasets/         # 训练数据集
    ├── train/        # 训练集
    ├── val/          # 验证集
    └── test/         # 测试集
```

### 数据集划分

```python
# 参考脚本: scripts/preprocess/split_dataset.py
# 划分比例：
# - 训练集: 80%
# - 验证集: 10%
# - 测试集: 10%
```

## 实践任务

### 任务1: 准备小规模测试数据
- [ ] 收集10-20个音频文件
- [ ] 准备对应的文本标注
- [ ] 运行预处理脚本

### 任务2: 数据验证
- [ ] 检查音频质量
- [ ] 验证文本-音频对齐
- [ ] 检查特征提取结果

## 代码示例

### 音频加载示例
```python
import librosa
import soundfile as sf

# 加载音频
audio, sr = librosa.load('audio.wav', sr=22050)

# 保存音频
sf.write('output.wav', audio, sr)
```

### 特征提取示例
```python
import librosa

# 提取梅尔频谱
mel = librosa.feature.melspectrogram(
    y=audio, 
    sr=sr, 
    n_mels=80
)
```

## 常见问题

### Q1: 音频采样率不一致
**解决方案**: 使用librosa统一重采样

### Q2: 文本编码问题
**解决方案**: 确保使用UTF-8编码

### Q3: 内存不足
**解决方案**: 分批处理，使用生成器

## 下一步

数据准备完成后，继续学习：
- [03. 模型理解](../03-模型理解/README.md)
