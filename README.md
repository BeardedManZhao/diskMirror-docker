# Welcome to diskMirror-docker

![image](https://private-user-images.githubusercontent.com/113756063/325554789-93b519e7-357e-4621-9127-d4edbfd47b3a.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MTQwMzkyMDksIm5iZiI6MTcxNDAzODkwOSwicGF0aCI6Ii8xMTM3NTYwNjMvMzI1NTU0Nzg5LTkzYjUxOWU3LTM1N2UtNDYyMS05MTI3LWQ0ZWRiZmQ0N2IzYS5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQwNDI1JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MDQyNVQwOTU1MDlaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1jYjEyNjlkYWVjZTQyOTIyNWYyN2U0MDYwZWIyNTc1MGVkMGRjZjRkMDRmMjUyMzQwNzhhZDY4YmFiNTA2YWVhJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCZhY3Rvcl9pZD0wJmtleV9pZD0wJnJlcG9faWQ9MCJ9.NFBikecjgjHW3OjRn8v7g9KyGC5tO95MwxPB7TndjoM)

## 获取项目

这个项目是 diskMirror-front 的前端项目，您可以使用下面的命令将此项目编译为一个镜像！

```
# 进入到您下载的源码包目录
cd diskMirror-docker

# 点击脚本来进行版本的设置以及对应版本的下载 设置 和 编译 按照引导走就可以啦
./script.sh # 或者 script.bat 根据您的操作系统来选择哦
```

然后等待下载，下载完毕之后，就开始进行 yaml 的配置！

## 编译镜像

### 运行脚本进行镜像自动装载

在旧版本中 yaml 配置结束，回到 script 打开的窗口，直接回车开始编译就可以啦！请确保期间无错误信息哦！

在 `>=1.0.2` 版本 yaml 配置时，回到窗口不需要回车，它会继续编译，当编译完成，就会如下面所示！

> 默认版本号一直会变哦，会逐渐的使用最新的版本！在这里显示的 `20xx.xx.xx` 就是版本号，实际操作中根据你的配置会有不同的变化！

```
docker 镜像安装脚本版本：1.0.2
请输入需要的版本：
"正在下载版本：2024.04.13"
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100  2940  100  2940    0     0   2374      0  0:00:01  0:00:01 --:--:--     0
您现在可以修改 diskMirror-backEnd-spring-boot.yaml 文件，并拷贝到您宿主机的某个目录下，然后耐心等待
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100 72.0M  100 72.0M    0     0  1664k      0  0:00:44  0:00:44 --:--:-- 3206k
正在开始编译，请耐心等待！
[+] Building 16.8s (7/7) FINISHED                                                                        docker:default
 => [internal] load build definition from Dockerfile                                                               0.0s
 => => transferring dockerfile: 557B                                                                               0.0s
 => [internal] load metadata for docker.io/library/openjdk:17-jdk                                                 15.4s
 => [internal] load .dockerignore                                                                                  0.0s
 => => transferring context: 52B                                                                                   0.0s
 => [internal] load build context                                                                                  1.3s
 => => transferring context: 75.57MB                                                                               1.3s
 => [1/2] FROM docker.io/library/openjdk:17-jdk@sha256:74bad65c9e59d6410bdd67d71a14e14175ddd33d654419ecfabf03ddbe  0.0s
 => CACHED [2/2] COPY ./diskMirror-backEnd-spring-boot.jar /usr/local/springboot/diskMirror-backEnd-spring-boot.j  0.0s
 => exporting to image                                                                                             0.0s
 => => exporting layers                                                                                            0.0s
 => => writing image sha256:ad4ae22e2810d2008ef903e9ab429f1cfcf1ab472a6058de9d4d5004ab594efd                       0.0s
 => => naming to docker.io/library/diskmirror-backend-spring-boot:2024.04.13                                       0.0s

View build details: docker-desktop://dashboard/build/default/default/r1zo8nzuzvx5q5kjgsyhf7xwa

What's Next?
  1. Sign in to your Docker account → docker login
  2. View a summary of image vulnerabilities and recommendations → docker scout quickview
安装脚本操作完毕，若过程无错误则代表安装成功，请您回到这里按下回车！
启动时：容器中的 /usr/local/springboot/diskMirror-backEnd-spring-boot.yaml 会做为配置文件，您可以进行路径映射哦！
```

### 查看 docker 中的镜像列表是否存在 `diskmirror-backend-spring-boot`

如果存在，则说明编译成功，否则编译失败，请您检查网络连接，或者重新下载源码包，也可以联系作者。

```
G:\MyGithub\diskMirror-docker>docker images
REPOSITORY                       TAG          IMAGE ID       CREATED         SIZE
diskmirror-backend-spring-boot   2024.04.12   96d6ca20d054   3 minutes ago   546MB
```

## 镜像启动

编译操作结束之后，我们就可以开始启动镜像了！

### 命令行版本 docker 启动

您只需要在命令行中输入下面的命令即可启动镜像，值得注意的是 本示例中展示的是使用 2024.04.12
版本的镜像，如果您需要使用其他版本的镜像，请将 `2024.04.12` 替换为 `<您的docker版本号>`

我们可以使用一个简单的命令直接使用容器内的数据存储，但是需要注意的是，这样的存储操作会将数据存储在容器内。

```
# 将您的yaml配置文件移动到被盘镜使用的本地磁盘目录下
mv ./diskMirror-backEnd-spring-boot.yaml <yaml配置文件所在的本地磁盘目录路径>
# 启动镜像
docker run -d -p 8080:8080 --name diskmirror-docker -v <yaml配置文件所在的本地磁盘目录路径>:/usr/local/springboot/conf diskmirror-backend-spring-boot:<您的docker版本号>
```

因此我们可以使用 卷 的方式来实现数据的持久化，下面是一个示例，您按照命令的提示来操作就可以啦！

```shell
# 将您的yaml配置文件移动到被盘镜使用的本地磁盘目录下
mv ./diskMirror-backEnd-spring-boot.yaml <yaml配置文件所在的本地磁盘目录路径>
# <给盘镜使用的本地磁盘路径> 代表的就是您在本地磁盘上需要给盘镜使用的磁盘路径 这个路径是您的宿主机的
# <配置文件所在的本地磁盘路径 xxx.yaml> 代表的就是您要用于存储盘镜配置文件的路径！这个路径是您的宿主机的
# <yaml中的 disk-mirror.root-dir的值> 代表的就是您的盘镜的根目录，存储数据的时候，会自动在此目录下存储数据，在下面的命令中就是使用了卷的方式实现了目录的映射 这个路径是您的容器的
docker run -d -p 8080:8080 --name diskmirror-docker \
-v <yaml 配置文件所在的本地磁盘目录路径>:/usr/local/springboot/conf \
-v <给盘镜使用的本地磁盘目录路径>:<yaml中的 disk-mirror.root-dir的值> \
diskmirror-backend-spring-boot:<您的docker版本号> 
```

下面是一个示例

```shell
mv ./diskMirror-backEnd-spring-boot.yaml C:\Users\zhao\Downloads\conf
docker run -d -p 8080:8080 --name diskmirror-docker -v C:\Users\zhao\Downloads\conf:/usr/local/springboot/conf -v G:\DiskMirror:/DiskMirror diskmirror-backend-spring-boot:2024.04.13
```

### 桌面版本 docker 启动

可以使用桌面版本的 docker 启动之后与命令行的效果是差不多的，下面是一个示例。
![image](https://github.com/BeardedManZhao/diskMirror-docker/assets/113756063/48d31c56-96d1-4082-a6a2-c7d93236dbf7)

## 更多信息

### 更新记录

#### 1.0.2 → 1.0.3

- 同步最新版本信息！

#### 1.0.1 → 1.0.2

- 将配置文件的路径暴露出容器，方便用户使用卷的方式来存储配置文件，而不需要重新编译镜像
- 镜像编译过程中移除了编写配置文件的步骤，配置文件自动下载完毕之后，由用户按照自己的需求直接修改和拷贝到卷映射的目录即可
