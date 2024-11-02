@echo off

echo docker ����װ�ű��汾��1.0.5

set /P "version=��������Ҫ�İ汾��"

if "%version%" == "" (
    set "version=2024.11.02"
)

echo "�������ذ汾��%version%"

curl -o "./diskMirror-backEnd-spring-boot.yaml" --insecure -k -L "https://github.com/BeardedManZhao/diskMirror-backEnd-spring-boot/releases/download/%version%/application.yaml"

echo �����ڿ����޸� diskMirror-backEnd-spring-boot.yaml �ļ���������������������ĳ��Ŀ¼�£�Ȼ�����ĵȴ�

curl -o "./diskMirror-backEnd-spring-boot.jar" --insecure -k -L "https://github.com/BeardedManZhao/diskMirror-backEnd-spring-boot/releases/download/%version%/diskMirror-backEnd-spring-boot-1.0-SNAPSHOT.jar"

echo ���ڿ�ʼ���룬�����ĵȴ���

docker build -t diskmirror-backend-spring-boot:%version% .

echo ��װ�ű�������ϣ��������޴��������װ�ɹ��������ص����ﰴ�»س���
echo ����ʱ�������е� /usr/local/springboot/diskMirror-backEnd-spring-boot.yaml ����Ϊ�����ļ��������Խ���·��ӳ��Ŷ��

pause