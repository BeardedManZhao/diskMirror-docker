#!/bin/bash

echo "docker 镜像安装脚本版本：1.0.2"

version=""

# 让用户输入需要的版本
read -p "请输入需要的版本：" version

# 判断用户是否输入了数据 如果没有数据就默认赋值
if [ -z "$version" ]; then
  version="2024.04.13"
fi

echo "正在下载版本：$version"

# 代表用户输入了数据 将url下载到当前目录
curl -o "./diskMirror-backEnd-spring-boot.jar" --insecure -k -L "https://github.com/BeardedManZhao/diskMirror-backEnd-spring-boot/releases/download/$version/diskMirror-backEnd-spring-boot-1.0-SNAPSHOT.jar"
echo "您现在可以修改 diskMirror-backEnd-spring-boot.yaml 文件，并拷贝到您宿主机的某个目录下，然后耐心等待"
curl -o "./diskMirror-backEnd-spring-boot.yaml" --insecure -k -L "https://github.com/BeardedManZhao/diskMirror-backEnd-spring-boot/releases/download/$version/application.yaml"


echo "正在开始编译，您现在可以修改 diskMirror-backEnd-spring-boot.yaml 文件，并拷贝到您宿主机的某个目录下，然后耐心等待编译完成！"

docker build -t diskmirror-backend-spring-boot:$version .

echo "安装脚本操作完毕，若过程无错误则代表安装成功，请您回到这里按下回车！"

read -p "启动时：容器中的 /usr/local/springboot/conf/diskMirror-backEnd-spring-boot.yaml 会做为配置文件，您可以进行路径映射哦！"
