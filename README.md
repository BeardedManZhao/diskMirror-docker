# Welcome to diskMirror-docker

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

yaml 配置结束，回到 script 打开的窗口，直接回车开始编译就可以啦！请确保期间无错误信息哦！下面是一个编译的日志展示。
> 默认版本号一直会变哦，会逐渐的使用最新的版本！

```
G:\MyGithub\diskMirror-docker>script.bat
请输入需要的版本：
"正在下载版本：2024.04.12"
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100 72.0M  100 72.0M    0     0   9.9M      0  0:00:07  0:00:07 --:--:-- 14.3M
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100  1394  100  1394    0     0   1102      0  0:00:01  0:00:01 --:--:--     0
下载完毕，您可以修改application.yaml文件，来配置您的服务器，一切完毕之后，请您回到这里按下回车！
请按任意键继续. . .
[+] Building 16.6s (8/8) FINISHED                                                                                                                                                                 docker:default
 => [internal] load build definition from Dockerfile                                                                                                                                                        0.0s
 => => transferring dockerfile: 672B                                                                                                                                                                        0.0s
 => [internal] load metadata for docker.io/library/openjdk:17-jdk                                                                                                                                          15.3s
 => [internal] load .dockerignore                                                                                                                                                                           0.0s
 => => transferring context: 52B                                                                                                                                                                            0.0s
 => [1/3] FROM docker.io/library/openjdk:17-jdk@sha256:74bad65c9e59d6410bdd67d71a14e14175ddd33d654419ecfabf03ddbe70fff4                                                                                     0.0s
 => [internal] load build context                                                                                                                                                                           1.3s
 => => transferring context: 75.57MB                                                                                                                                                                        1.3s
 => CACHED [2/3] COPY ./diskMirror-backEnd-spring-boot.jar /usr/local/springboot/diskMirror-backEnd-spring-boot.jar                                                                                         0.0s
 => CACHED [3/3] COPY ./diskMirror-backEnd-spring-boot.yaml /usr/local/springboot/diskMirror-backEnd-spring-boot.yaml                                                                                       0.0s
 => exporting to image                                                                                                                                                                                      0.0s
 => => exporting layers                                                                                                                                                                                     0.0s
 => => writing image sha256:96d6ca20d054323d6ba90376b89e5329dfbaa8a0a590ea35fd901e862ab48c89                                                                                                                0.0s
 => => naming to docker.io/library/diskmirror-backend-spring-boot:2024.04.12                                                                                                                                0.0s

View build details: docker-desktop://dashboard/build/default/default/s2srdwc3jz6fcquh9raw8x76e

What's Next?
  1. Sign in to your Docker account → docker login
  2. View a summary of image vulnerabilities and recommendations → docker scout quickview
安装脚本操作完毕
请按任意键继续. . .
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
![60a647f2e4914c2027c032069fb6dca](https://github.com/BeardedManZhao/diskMirror-docker/assets/113756063/880d3551-f020-4b65-87eb-5c340e44a46c)

## 更多信息

### 更新记录

#### 1.0.1 → 1.0.2

- 将配置文件的路径暴露出容器，方便用户使用卷的方式来存储配置文件，而不需要重新编译镜像
- 镜像编译过程中移除了编写配置文件的步骤，配置文件自动下载完毕之后，由用户按照自己的需求直接修改和拷贝到卷映射的目录即可