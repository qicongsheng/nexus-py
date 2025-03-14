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
COPY nexus_proxy.py .

# 安装Python依赖
RUN pip install --no-cache-dir -r requirements.txt

# 暴露端口
EXPOSE 8080

# 设置启动命令
CMD ["python", "nexus_proxy.py"]
