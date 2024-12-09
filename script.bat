@echo off

echo 正在开始编译，请耐心等待！

echo 请手动解压 `jdk-17.0.12.zip` 文件！！然后按下回车

pause

docker pull ubuntu:latest

docker build -t beardedmanzhao/diskmirror-docker:2024.12.05 .

echo 安装脚本操作完毕，若过程无错误则代表安装成功，请您回到这里按下回车！
echo 启动时：容器中的 /usr/local/springboot/diskMirror-backEnd-spring-boot.yaml 会做为配置文件，您可以进行路径映射哦！

pause