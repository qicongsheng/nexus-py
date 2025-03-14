import os

class Config:
  # 本地仓库路径
  REPO_ROOT = os.getenv("REPO_ROOT", os.path.expanduser("~/.m2/repository"))

  # 远程 Maven 中央仓库
  REMOTE_REPO = os.getenv("REMOTE_REPO", "https://repo1.maven.org/maven2/")

  # 中央仓库认证（可选）
  REMOTE_REPO_USERNAME = os.getenv("REMOTE_REPO_USERNAME", None)
  REMOTE_REPO_PASSWORD = os.getenv("REMOTE_REPO_PASSWORD", None)

  # 部署用户认证
  USERS = {
    os.getenv("DEPLOY_USER", "deploy_user"): os.getenv("DEPLOY_PASSWORD", "deploy_password")
  }

  # 缓存超时时间
  CACHE_TIMEOUT = int(os.getenv("CACHE_TIMEOUT", 3600))

  # 上下文路径（如 /maven2）
  CONTEXT_PATH = os.getenv("CONTEXT_PATH", "")

  # 定时任务配置
  CLEANUP_INTERVAL = int(os.getenv("CLEANUP_INTERVAL", 300))  # 5分钟
  CLEANUP_AGE = int(os.getenv("CLEANUP_AGE", 3600))  # 1小时
