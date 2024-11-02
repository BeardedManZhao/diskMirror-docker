@echo off

echo docker 镜像安装脚本版本：1.0.5

set /P "version=请输入需要的版本："

if "%version%" == "" (
    set "version=2024.11.02"
)

echo "正在下载版本：%version%"

curl -o "./diskMirror-backEnd-spring-boot.yaml" --insecure -k -L "https://github.com/BeardedManZhao/diskMirror-backEnd-spring-boot/releases/download/%version%/application.yaml"

echo 您现在可以修改 diskMirror-backEnd-spring-boot.yaml 文件，并拷贝到您宿主机的某个目录下，然后耐心等待

curl -o "./diskMirror-backEnd-spring-boot.jar" --insecure -k -L "https://github.com/BeardedManZhao/diskMirror-backEnd-spring-boot/releases/download/%version%/diskMirror-backEnd-spring-boot-1.0-SNAPSHOT.jar"

echo 正在开始编译，请耐心等待！

docker build -t diskmirror-backend-spring-boot:%version% .

echo 安装脚本操作完毕，若过程无错误则代表安装成功，请您回到这里按下回车！
echo 启动时：容器中的 /usr/local/springboot/diskMirror-backEnd-spring-boot.yaml 会做为配置文件，您可以进行路径映射哦！

pause