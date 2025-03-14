from setuptools import setup, find_packages

with open("README.md", "r", encoding="utf-8") as fh:
  long_description = fh.read()

setup(
    name="maven-proxy",
    version="0.0.1",
    author="Your Name",
    author_email="your.email@example.com",
    description="Maven Repository Proxy with caching and authentication",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/yourusername/maven-proxy",
    packages=find_packages(),
    package_data={
      "maven_proxy": ["templates/*.html"]
    },
    install_requires=[
      "Flask>=2.0.3",
      "requests>=2.26.0",
      "flask-httpauth>=4.5.0",
      "APScheduler>=3.8.1"
    ],
    entry_points={
      "console_scripts": [
        "maven-proxy=maven_proxy.app:main"
      ]
    },
    python_requires=">=3.7",
)