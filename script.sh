#!/bin/bash

version=""

# 让用户输入需要的版本
read -p "请输入需要的版本：" version

# 判断用户是否输入了数据 如果没有数据就默认赋值
if [ -z "$version" ]; then
  version="2024.04.12"
fi

echo "正在下载版本：$version"

# 代表用户输入了数据 将url下载到当前目录
curl -o "./diskMirror-backEnd-spring-boot.jar" --insecure -k -L "https://github.com/BeardedManZhao/diskMirror-backEnd-spring-boot/releases/download/$version/diskMirror-backEnd-spring-boot-1.0-SNAPSHOT.jar"
curl -o "./diskMirror-backEnd-spring-boot.yaml" --insecure -k -L "https://github.com/BeardedManZhao/diskMirror-backEnd-spring-boot/releases/download/$version/application.yaml"


echo "下载完毕，您可以修改application.yaml文件，来配置您的服务器，一切完毕之后，请您回到这里按下回车！"

# 在这里阻塞一下
read -p "按回车键继续..."

docker build -t diskmirror-backend-spring-boot .

read -p "安装脚本操作完毕!"