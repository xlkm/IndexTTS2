# 04. 训练实践

## 学习目标
- [ ] 理解训练配置
- [ ] 掌握训练脚本的使用
- [ ] 学会监控训练过程
- [ ] 能够处理训练中的问题

## 训练前准备

### 1. 检查数据
```bash
# 检查数据是否准备完成
python scripts/preprocess/check_data.py --data_dir data/processed
```

### 2. 准备配置文件
```bash
# 复制并修改配置文件
cp configs/train/default.yaml configs/train/my_config.yaml
```

### 3. 检查GPU
```python
import torch
print(f"CUDA可用: {torch.cuda.is_available()}")
print(f"GPU数量: {torch.cuda.device_count()}")
```

## 配置文件说明

### 基本配置结构
```yaml
# configs/train/default.yaml
model:
  name: IndexTTS2
  # 模型参数...

data:
  train_dir: data/datasets/train
  val_dir: data/datasets/val
  batch_size: 16
  # 数据参数...

training:
  epochs: 100
  learning_rate: 0.0001
  save_interval: 10
  # 训练参数...
```

## 开始训练

### 单GPU训练
```bash
python scripts/train/train.py \
    --config configs/train/my_config.yaml \
    --gpu 0
```

### 多GPU训练
```bash
python scripts/train/train.py \
    --config configs/train/my_config.yaml \
    --gpu 0,1,2,3 \
    --distributed
```

### 恢复训练
```bash
python scripts/train/train.py \
    --config configs/train/my_config.yaml \
    --resume checkpoints/training/checkpoint_epoch_50.pth
```

## 训练监控

### TensorBoard
```bash
# 启动TensorBoard
tensorboard --logdir outputs/logs

# 在浏览器打开 http://localhost:6006
```

### 监控指标
- **Loss**: 训练损失和验证损失
- **Learning Rate**: 学习率变化
- **Audio Samples**: 生成的音频样本
- **Spectrograms**: 频谱图可视化

## 模型保存

### 保存策略
- **定期保存**: 每N个epoch保存一次
- **最佳模型**: 保存验证集上表现最好的模型
- **最新模型**: 保存最新的检查点

### 检查点内容
- 模型权重
- 优化器状态
- 训练进度（epoch, step）
- 配置信息

## 实践任务

### 任务1: 小规模训练
- [ ] 使用小数据集训练10个epoch
- [ ] 观察损失变化
- [ ] 检查生成的音频质量

### 任务2: 超参数调优
- [ ] 调整学习率
- [ ] 调整batch size
- [ ] 对比不同配置的效果

### 任务3: 训练监控
- [ ] 设置TensorBoard
- [ ] 定期查看训练日志
- [ ] 分析训练曲线

## 常见问题

### Q1: 训练不收敛
**可能原因**:
- 学习率过大或过小
- 数据质量问题
- 模型配置错误

**解决方案**:
- 调整学习率
- 检查数据
- 使用预训练模型初始化

### Q2: 显存不足
**解决方案**:
- 减小batch size
- 使用梯度累积
- 使用混合精度训练

### Q3: 训练速度慢
**解决方案**:
- 使用多GPU训练
- 优化数据加载
- 减少数据预处理时间

## 训练技巧

### 1. 学习率调度
```python
# 使用学习率衰减
scheduler = torch.optim.lr_scheduler.StepLR(
    optimizer, step_size=30, gamma=0.1
)
```

### 2. 梯度裁剪
```python
# 防止梯度爆炸
torch.nn.utils.clip_grad_norm_(model.parameters(), max_norm=1.0)
```

### 3. 混合精度训练
```python
# 使用AMP加速训练
from torch.cuda.amp import autocast, GradScaler
```

## 下一步

训练完成后，继续学习：
- [05. 推理使用](../05-推理使用/README.md)
