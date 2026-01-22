# 05. 推理使用

## 学习目标
- [ ] 掌握模型加载方法
- [ ] 学会使用推理脚本
- [ ] 实现语音克隆功能
- [ ] 进行批量推理

## 模型加载

### 加载预训练模型
```python
from models import IndexTTS2
import torch

# 加载模型
model = IndexTTS2(config)
checkpoint = torch.load('checkpoints/pretrained/model.pth')
model.load_state_dict(checkpoint['model'])
model.eval()
```

### 检查模型状态
```python
# 检查模型是否在评估模式
print(f"训练模式: {model.training}")  # 应该是False
```

## 基础推理

### 单句推理
```bash
python scripts/inference/inference.py \
    --text "你好，这是测试文本" \
    --reference_audio data/reference/speaker1.wav \
    --output outputs/audio/output.wav \
    --checkpoint checkpoints/pretrained/model.pth
```

### Python代码推理
```python
from scripts.inference import inference

# 推理
audio = inference(
    text="你好，这是测试文本",
    reference_audio="data/reference/speaker1.wav",
    model_path="checkpoints/pretrained/model.pth"
)

# 保存
import soundfile as sf
sf.write("output.wav", audio, 22050)
```

## 语音克隆

### 零样本语音克隆
```python
# 使用新的说话人音频进行克隆
audio = model.clone_voice(
    text="要合成的文本",
    reference_audio="新说话人的音频.wav"
)
```

### 批量语音克隆
```bash
python scripts/inference/batch_inference.py \
    --input_file data/texts.txt \
    --reference_dir data/references/ \
    --output_dir outputs/audio/batch/ \
    --checkpoint checkpoints/pretrained/model.pth
```

## 推理优化

### 1. 使用GPU加速
```python
model = model.cuda()
# 推理时数据会自动移到GPU
```

### 2. 批处理
```python
# 批量处理多个文本
texts = ["文本1", "文本2", "文本3"]
audios = model.batch_inference(texts, reference_audio)
```

### 3. 模型量化
```python
# 使用INT8量化加速
model = torch.quantization.quantize_dynamic(
    model, {torch.nn.Linear}, dtype=torch.qint8
)
```

## 实践任务

### 任务1: 基础推理
- [ ] 加载预训练模型
- [ ] 合成一段测试音频
- [ ] 检查音频质量

### 任务2: 语音克隆
- [ ] 准备参考音频
- [ ] 克隆不同说话人的声音
- [ ] 对比克隆效果

### 任务3: 批量处理
- [ ] 准备文本列表
- [ ] 批量生成音频
- [ ] 验证所有输出

## 代码示例

### 完整推理脚本
```python
import torch
import soundfile as sf
from models import IndexTTS2

# 加载模型
model = IndexTTS2(config)
model.load_checkpoint('checkpoints/pretrained/model.pth')
model.eval()
model.cuda()

# 准备输入
text = "要合成的文本内容"
reference_audio, sr = librosa.load('reference.wav', sr=22050)

# 推理
with torch.no_grad():
    audio = model.inference(text, reference_audio)

# 保存
sf.write('output.wav', audio, 22050)
```

## 常见问题

### Q1: 推理速度慢
**解决方案**:
- 使用GPU
- 减少模型大小
- 使用量化模型

### Q2: 生成音频质量差
**可能原因**:
- 参考音频质量差
- 文本与参考音频不匹配
- 模型未充分训练

### Q3: 内存不足
**解决方案**:
- 减小batch size
- 使用CPU推理（较慢）
- 优化模型

## 下一步

推理使用完成后，继续学习：
- [06. 高级应用](../06-高级应用/README.md)
