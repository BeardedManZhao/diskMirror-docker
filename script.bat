@echo off

echo ���ڿ�ʼ���룬�����ĵȴ���

echo ���ֶ���ѹ `jdk-17.0.12.zip` �ļ�����Ȼ���»س�

pause

docker pull ubuntu:latest

docker build -t beardedmanzhao/diskmirror-docker:2024.12.05 .

echo ��װ�ű�������ϣ��������޴��������װ�ɹ��������ص����ﰴ�»س���
echo ����ʱ�������е� /usr/local/springboot/diskMirror-backEnd-spring-boot.yaml ����Ϊ�����ļ��������Խ���·��ӳ��Ŷ��

pause