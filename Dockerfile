FROM python:3.9.21-alpine3.20
MAINTAINER qicongsheng

ENV AUTH_USER=user \
    AUTH_PASSWORD=passwd \
    REMOTE_REPO=https://repo1.maven.org/maven2/ \
    REMOTE_REPO_USERNAME= \
    REMOTE_REPO_PASSWORD= \
    CONTEXT_PATH="" \
    LOCAL_REPO_DIR=/data/repository \
    TZ=Asia/Shanghai

WORKDIR /app

COPY requirements.txt .
COPY maven_proxy/templates/ ./templates/
COPY maven_proxy/proxy.py .
COPY maven_proxy/config.py .

RUN pip install --no-cache-dir -r requirements.txt \
    && mkdir -p /data/repository

EXPOSE 8081

CMD ["python", "nexus_py.py"]
