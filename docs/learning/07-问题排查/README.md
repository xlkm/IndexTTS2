# 07. 问题排查

## 学习目标
- [ ] 掌握常见问题的诊断方法
- [ ] 学会使用调试工具
- [ ] 能够解决训练和推理中的问题

## 训练问题

### 问题1: 训练不收敛

**症状**: 损失不下降或波动很大

**诊断步骤**:
1. 检查学习率
2. 检查数据质量
3. 检查模型初始化
4. 检查梯度

**解决方案**:
```python
# 检查梯度
for name, param in model.named_parameters():
    if param.grad is not None:
        print(f"{name}: {param.grad.norm()}")
```

### 问题2: 显存不足

**症状**: CUDA out of memory

**解决方案**:
- 减小batch size
- 使用梯度累积
- 使用混合精度训练
- 减少模型大小

### 问题3: 训练速度慢

**诊断**:
- 检查数据加载速度
- 检查GPU利用率
- 检查预处理时间

**优化**:
```python
# 优化数据加载
DataLoader(
    dataset,
    batch_size=32,
    num_workers=4,  # 多进程加载
    pin_memory=True  # GPU加速
)
```

## 推理问题

### 问题1: 生成音频质量差

**可能原因**:
- 参考音频质量差
- 文本与音频不匹配
- 模型未充分训练

**解决方案**:
- 使用高质量参考音频
- 确保文本与参考音频匹配
- 使用更好的预训练模型

### 问题2: 推理速度慢

**优化方法**:
- 使用GPU
- 模型量化
- 批处理
- 使用TensorRT

### 问题3: 内存泄漏

**诊断**:
```python
import torch
print(torch.cuda.memory_allocated())
print(torch.cuda.memory_reserved())
```

**解决**:
- 及时释放不需要的张量
- 使用`torch.no_grad()`
- 定期清理缓存

## 调试工具

### 1. 日志系统
```python
import logging

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
```

### 2. TensorBoard
```bash
tensorboard --logdir outputs/logs
```

### 3. 可视化工具
```python
# 可视化频谱图
import matplotlib.pyplot as plt
plt.imshow(mel_spectrogram)
plt.savefig('spectrogram.png')
```

## 常见错误

### CUDA相关错误
- **CUDA out of memory**: 减小batch size
- **CUDA device error**: 检查GPU驱动
- **版本不匹配**: 检查CUDA和PyTorch版本

### 数据相关错误
- **文件不存在**: 检查路径
- **格式错误**: 检查数据格式
- **编码问题**: 使用UTF-8编码

### 模型相关错误
- **权重不匹配**: 检查模型配置
- **维度错误**: 检查输入维度
- **设备不匹配**: 确保模型和数据在同一设备

## 调试技巧

### 1. 添加断点
```python
import pdb; pdb.set_trace()  # 调试断点
```

### 2. 打印中间结果
```python
print(f"Shape: {tensor.shape}")
print(f"Value range: [{tensor.min()}, {tensor.max()}]")
```

### 3. 验证输入
```python
assert text is not None, "Text cannot be None"
assert len(audio) > 0, "Audio cannot be empty"
```

## 获取帮助

### 资源
- GitHub Issues
- 社区论坛
- 官方文档
- Stack Overflow

### 提问技巧
- 提供错误信息
- 提供代码片段
- 提供环境信息
- 提供复现步骤

## 实践任务

- [ ] 记录遇到的问题
- [ ] 尝试解决问题
- [ ] 总结解决方案
- [ ] 分享经验
