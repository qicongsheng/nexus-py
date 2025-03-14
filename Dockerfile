# 使用官方Python Alpine镜像
FROM python:3.9-alpine

# 设置工作目录
WORKDIR /app

# 安装系统依赖
RUN apk add --no-cache \
    build-base \
    libffi-dev \
    openssl-dev

# 复制项目文件
COPY requirements.txt .
COPY templates/ ./templates/
COPY maven_proxy.py .
COPY config.py .

# 安装Python依赖
RUN pip install --no-cache-dir -r requirements.txt

# 暴露端口
EXPOSE 8080

# 设置环境变量（可覆盖）
ENV REPO_ROOT=/data/repository
ENV CONTEXT_PATH=/maven2
ENV CLEANUP_INTERVAL=300
ENV CLEANUP_AGE=3600

# 创建数据目录
RUN mkdir -p /data/repository

# 设置启动命令
CMD ["python", "maven_proxy.py"]