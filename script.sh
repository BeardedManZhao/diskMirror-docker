#!/bin/bash

wget https://github.com/BeardedManZhao/diskMirror-docker/releases/download/jdk-17.0.12/jdk-17.0.12.tar && tar -vxf jdk-17.0.12.tar && docker pull ubuntu:latest && docker build -t beardedmanzhao/diskmirror-docker:2025.09.08 .

echo "安装脚本操作完毕，若过程无错误则代表安装成功，请您回到这里按下回车！"
echo "若期间有错误可以联系我们代部署或者您自行根据情况解决！"

read -p "启动时：容器中的 /usr/local/springboot/conf/diskMirror-backEnd-spring-boot.yaml 会做为配置文件，您可以进行路径映射哦！"

