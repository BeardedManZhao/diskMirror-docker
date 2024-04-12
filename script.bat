@echo off

set /P "version=��������Ҫ�İ汾��"

if "%version%" == "" (
    set "version=2024.04.12"
)

echo "�������ذ汾��%version%"

curl -o "./diskMirror-backEnd-spring-boot.jar" --insecure -k -L "https://github.com/BeardedManZhao/diskMirror-backEnd-spring-boot/releases/download/%version%/diskMirror-backEnd-spring-boot-1.0-SNAPSHOT.jar"
curl -o "./diskMirror-backEnd-spring-boot.yaml" --insecure -k -L "https://github.com/BeardedManZhao/diskMirror-backEnd-spring-boot/releases/download/%version%/application.yaml"

echo ������ϣ��������޸�application.yaml�ļ������������ķ�������һ�����֮�������ص����ﰴ�»س���

pause

docker build -t diskmirror-backend-spring-boot .

echo ��װ�ű��������

pause