# 使用官方提供的 jdk 基础镜像
FROM openjdk:17-jdk

# 将本地包复制到Docker容器的 /usr/local/springboot/ 目录下
COPY ./diskMirror-backEnd-spring-boot.jar /usr/local/springboot/diskMirror-backEnd-spring-boot.jar

# 配置端口号
EXPOSE 8080

# 配置必须的卷
VOLUME /usr/local/springboot/conf

# 设置启动命令
CMD java -Dspring.config.location=/usr/local/springboot/conf/diskMirror-backEnd-spring-boot.yaml -jar /usr/local/springboot/diskMirror-backEnd-spring-boot.jar data