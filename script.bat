@echo off

set /P "version=请输入需要的版本："

if "%version%" == "" (
    set "version=2024.04.12"
)

echo "正在下载版本：%version%"

curl -o "./diskMirror-backEnd-spring-boot.jar" --insecure -k -L "https://github.com/BeardedManZhao/diskMirror-backEnd-spring-boot/releases/download/%version%/diskMirror-backEnd-spring-boot-1.0-SNAPSHOT.jar"
curl -o "./diskMirror-backEnd-spring-boot.yaml" --insecure -k -L "https://github.com/BeardedManZhao/diskMirror-backEnd-spring-boot/releases/download/%version%/application.yaml"

echo 下载完毕，您可以修改application.yaml文件，来配置您的服务器，一切完毕之后，请您回到这里按下回车！

pause

docker build -t diskmirror-backend-spring-boot .

echo 安装脚本操作完毕

pause