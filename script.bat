@echo off

echo ���ڿ�ʼ���룬�����ĵȴ���

echo ������ https://github.com/BeardedManZhao/diskMirror-docker/releases/download/jdk-17.0.12/jdk-17.0.12.tar ���ֶ���ѹΪ��Ŀ��`/jdk-17.0.12`Ŀ¼����Ȼ���»س�

pause

docker pull ubuntu:latest

docker build -t beardedmanzhao/diskmirror-docker:2025.09.06 .

echo ��װ�ű�������ϣ��������޴��������װ�ɹ��������ص����ﰴ�»س���
echo ����ʱ�������е� /usr/local/springboot/diskMirror-backEnd-spring-boot.yaml ����Ϊ�����ļ��������Խ���·��ӳ��Ŷ��

pause