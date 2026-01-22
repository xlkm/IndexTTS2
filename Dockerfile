FROM pytorch/pytorch:1.10.0-cuda11.3-cudnn8-runtime

# 设置工作目录
WORKDIR /app

# 安装系统依赖
RUN apt-get update && apt-get install -y \
    libsndfile1 \
    ffmpeg \
    git \
    && rm -rf /var/lib/apt/lists/*

# 复制依赖文件
COPY requirements.txt .

# 安装Python依赖
RUN pip install --no-cache-dir -r requirements.txt

# 复制项目文件
COPY . .

# 设置环境变量
ENV PYTHONPATH=/app
ENV CUDA_VISIBLE_DEVICES=0

# 默认命令
CMD ["python", "scripts/inference/inference.py"]
