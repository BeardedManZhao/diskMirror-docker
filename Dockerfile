# 使用基础的 Linux 环境
FROM ubuntu

# 设置 Locale 为 zh_CN.UTF-8
RUN apt-get update && \
    apt-get install -y locales && \
    locale-gen zh_CN.UTF-8 && \
    update-locale LANG=zh_CN.UTF-8

# 安装中文字体
RUN apt-get install -y fonts-wqy-zenhei

# 创建需要的目录
RUN mkdir -p "/opt/app/diskMirror-spring-boot" && chmod -R 755 "/opt/app/diskMirror-spring-boot"

# 设置环境变量
ENV LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN:zh \
    LC_ALL=zh_CN.UTF-8

# 复制本地 JDK 目录到 Docker 容器
COPY ./jdk-17.0.12 /usr/lib/jvm/jdk-17.0.12

# 设置 JAVA_HOME 环境变量
ENV JAVA_HOME=/usr/lib/jvm/jdk-17.0.12
ENV PATH=$JAVA_HOME/bin:$PATH

# 将本地包复制到Docker容器的 /usr/local/springboot/ 目录下
COPY ./diskMirror-backEnd-spring-boot.jar /usr/local/springboot/diskMirror-backEnd-spring-boot.jar

# 配置端口号
EXPOSE 8080

# 配置必须的卷
VOLUME /usr/local/springboot/conf

# 设置启动命令
CMD ["java", "-Dspring.config.location=/usr/local/springboot/conf/diskMirror-backEnd-spring-boot.yaml", "-jar", "/usr/local/springboot/diskMirror-backEnd-spring-boot.jar", "data"]