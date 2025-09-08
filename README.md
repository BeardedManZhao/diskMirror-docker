# Welcome to diskMirror-docker

![image](https://github.com/BeardedManZhao/diskMirror-docker/assets/113756063/1c8c6c62-c23c-4aea-83e1-585e4f0d8fb5)

镜像地址：https://hub.docker.com/r/beardedmanzhao/diskmirror-docker

## 自动拉取镜像（推荐）

在 `1.0.6` 以及之后的版本 diskMirror-docker 项目中，我们还可以直接通过 `docker pull` 命令来拉取镜像，然后启动镜像，这样您就可以直接使用镜像了！下面是一个示例

```shell
docker pull diskmirror-docker

# 修改 yaml 配置，配置信息可以在 https://www.codebook.ltd/a/-31975978 中查询到·
vim ./diskMirror-backEnd-spring-boot.yaml

# 将您的yaml配置文件移动到被盘镜使用的本地磁盘目录下
mv ./diskMirror-backEnd-spring-boot.yaml <yaml配置文件所在的本地磁盘目录路径>

# <给盘镜使用的本地磁盘路径> 代表的就是您在本地磁盘上需要给盘镜使用的磁盘路径 这个路径是您的宿主机的
# <配置文件所在的本地磁盘目录路径> 代表的就是您要用于存储盘镜配置文件的目录路径！这个路径是您的宿主机的目录 其中应该包含 diskMirror-backEnd-spring-boot.yaml 文件，请确保不要将此目录从宿主机中删除哦
# <yaml中的 disk-mirror.root-dir的值> 代表的就是您的盘镜的根目录，存储数据的时候，会自动在此目录下存储数据，在下面的命令中就是使用了卷的方式实现了目录的映射 这个路径是您的容器的
docker run -d -p 8080:8080 --name diskmirror-docker \
-v <yaml 配置文件所在的本地磁盘目录路径>:/usr/local/springboot/conf \
-v <给盘镜使用的本地磁盘目录路径>:<yaml中的 disk-mirror.root-dir的值> \
beardedmanzhao/diskmirror-docker:<您的docker版本号> 
```

到这里操作就算是成功了！这样的方法相较于手动部署要方便且快捷，但如果您没有办法访问到 docker 仓库，您只能使用手动部署了 /(ㄒoㄒ)/~~

## 一对一镜像编译和部署（无需任何思考）

可以联系微信（微信号 CH-liming02240898）进行定制修改或代替部署哦！

## 手动部署（无 docker 仓库访问网络可用）

如果您没有 docker 仓库访问网络，您可以前往 [diskMirror-docker 软件包仓库](https://github.com/BeardedManZhao/diskMirror-docker.git) 下载源码并按照这里的文档操作！

### 下载项目

这个项目是 diskMirror-spring-boot 镜像版本的项目，您可以使用下面的命令将此项目编译为一个镜像！

```
# 进入到您下载的源码包目录
cd diskMirror-docker

# 点击脚本来进行版本的设置以及对应版本的下载 设置 和 编译 按照引导走就可以啦
./script.sh # 或者 script.bat 根据您的操作系统来选择哦
```

然后等待下载，下载完毕之后，就开始进行 yaml 的配置！

### 编译镜像

#### 运行脚本进行镜像自动装载

在旧版本中 yaml 配置结束，回到 script 打开的窗口，直接回车开始编译就可以啦！请确保期间无错误信息哦！

在 `>=1.0.6` 版本中，允许脚本将全程不需要用户操作，全自动化流程！ 下面是一个执行编译镜像的示例

```
D:\MyGithub\diskMirror-docker>script.bat
正在开始编译，请耐心等待！
请下载 https://github.com/BeardedManZhao/diskMirror-docker/releases/download/jdk-17.0.12/jdk-17.0.12.tar 并手动解压为项目的`/jdk-17.0.12`目录！！然后按下回车
请按任意键继续. . .
latest: Pulling from library/ubuntu
Digest: sha256:9cbed754112939e914291337b5e554b07ad7c392491dba6daf25eef1332a22e8
Status: Image is up to date for ubuntu:latest
docker.io/library/ubuntu:latest
[+] Building 173.7s (10/10) FINISHED                                                                                                                                                        docker:desktop-linux
 => [internal] load build definition from Dockerfile                                                                                                                                                        0.0s
 => => transferring dockerfile: 1.08kB                                                                                                                                                                      0.0s
 => [internal] load metadata for docker.io/library/ubuntu:latest                                                                                                                                            0.0s
 => [internal] load .dockerignore                                                                                                                                                                           0.0s
 => => transferring context: 52B                                                                                                                                                                            0.0s
 => CACHED [1/5] FROM docker.io/library/ubuntu:latest@sha256:9cbed754112939e914291337b5e554b07ad7c392491dba6daf25eef1332a22e8                                                                               0.0s
 => => resolve docker.io/library/ubuntu:latest@sha256:9cbed754112939e914291337b5e554b07ad7c392491dba6daf25eef1332a22e8                                                                                      0.0s
 => [internal] load build context                                                                                                                                                                           0.0s
 => => transferring context: 26.22kB                                                                                                                                                                        0.0s
 => [2/5] RUN apt-get update &&     apt-get install -y locales &&     locale-gen zh_CN.UTF-8 &&     update-locale LANG=zh_CN.UTF-8                                                                        131.6s
 => [3/5] RUN apt-get install -y fonts-wqy-zenhei                                                                                                                                                          30.4s
 => [4/5] COPY ./jdk-17.0.12 /usr/lib/jvm/jdk-17.0.12                                                                                                                                                       1.1s
 => [5/5] COPY ./diskMirror-backEnd-spring-boot.jar /usr/local/springboot/diskMirror-backEnd-spring-boot.jar                                                                                                0.3s
 => exporting to image                                                                                                                                                                                     10.0s
 => => exporting layers                                                                                                                                                                                     7.8s
 => => exporting manifest sha256:0b6d0ef8b473ce4e05dde3fac9d5a9cb89de77e979a3b5b0957bc6f383ab6d82                                                                                                           0.0s
 => => exporting config sha256:ad7d5a6be9a7cd116441286cac4a9d750312809e43639c395ec90e8a16a1da11                                                                                                             0.0s
 => => exporting attestation manifest sha256:be29c3f73364106834bd0db9d7c2c985129b36af606516ff9506ec1d5f82ce17                                                                                               0.0s
 => => exporting manifest list sha256:2375c877ad6f3b429613de8910f8f6b75c32a850f3d73cad5b34bd8962698bc0                                                                                                      0.0s
 => => naming to docker.io/beardedmanzhao/diskmirror-docker:2025.09.06                                                                                                                                      0.0s
 => => unpacking to docker.io/beardedmanzhao/diskmirror-docker:2025.09.06                                                                                                                                   2.1s
WARNING: current commit information was not captured by the build: git was not found in the system: exec: "git.exe": executable file not found in %PATH%
安装脚本操作完毕，若过程无错误则代表安装成功，请您回到这里按下回车！
启动时：容器中的 /usr/local/springboot/diskMirror-backEnd-spring-boot.yaml 会做为配置文件，您可以进行路径映射哦！
请按任意键继续. . .
```

#### 查看 docker 中的镜像列表是否存在 `beardedmanzhao/diskmirror-docker`

如果存在，则说明编译成功，否则编译失败，请您检查网络连接，或者重新下载源码包，也可以联系作者。

```
C:\Users\zhao>docker images
REPOSITORY                         TAG          IMAGE ID       CREATED         SIZE
beardedmanzhao/diskmirror-docker   2024.12.05   b54c66d9e7e0   9 minutes ago   476MB
ubuntu                             latest       b1d9df8ab815   2 weeks ago     78.1MB
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
docker run -d -p 8080:8080 --name diskmirror-docker -v <yaml配置文件所在的本地磁盘目录路径>:/usr/local/springboot/conf beardedmanzhao/diskmirror-docker:<您的docker版本号>
```

因此我们可以使用 卷 的方式来实现数据的持久化，下面是一个示例，您按照命令的提示来操作就可以啦！

```shell
# 将您的yaml配置文件移动到被盘镜使用的本地磁盘目录下
mv ./diskMirror-backEnd-spring-boot.yaml <yaml配置文件所在的本地磁盘目录路径>
# <给盘镜使用的本地磁盘路径> 代表的就是您在本地磁盘上需要给盘镜使用的磁盘路径 这个路径是您的宿主机的
# <给盘镜使用的本地磁盘目录路径> 代表的就是您要用于存储盘镜配置文件的路径 是目录！这个路径是您的宿主机的
# <yaml中的 disk-mirror.root-dir的值> 代表的就是您的盘镜的根目录，存储数据的时候，会自动在此目录下存储数据，在下面的命令中就是使用了卷的方式实现了目录的映射 这个路径是您的容器的
docker run -d -p 8080:8080 --name diskmirror-docker \
-v <yaml 配置文件所在的本地磁盘目录路径>:/usr/local/springboot/conf \
-v <给盘镜使用的本地磁盘目录路径>:<yaml中的 disk-mirror.root-dir的值> \
beardedmanzhao/diskmirror-docker:<您的docker版本号> 
```

下面是一个示例

```shell
mv ./diskMirror-backEnd-spring-boot.yaml C:\Users\zhao\Downloads\conf
docker run -d -p 8080:8080 --name diskmirror-docker -v C:\Users\zhao\Downloads\conf:/usr/local/springboot/conf -v F:\DiskMirror:/DiskMirror beardedmanzhao/diskmirror-docker:2024.12.05
```

### 桌面版本 docker 启动

可以使用桌面版本的 docker 启动之后与命令行的效果是差不多的，下面是一个示例。
![image](https://github.com/BeardedManZhao/diskMirror-docker/assets/113756063/48d31c56-96d1-4082-a6a2-c7d93236dbf7)

## 更多信息

### 1.0.6 → 1.0.7

- 同步 `diskmirror-backend-spring-boot:2025.09.06` 版本信息！

#### 1.0.5 → 1.0.6

- 脚本不再需要用户手动输入版本号，会自动选择！
- 镜像支持直接 `docker pull` 命令来拉取镜像

#### 1.0.4 → 1.0.5

- 同步 `diskmirror-backend-spring-boot:2024.11.02` 版本信息！

#### 1.0.3 → 1.0.4

- 同步 `diskmirror-backend-spring-boot:2024.04.26` 版本信息！

#### 1.0.2 → 1.0.3

- 同步 `diskmirror-backend-spring-boot:2024.04.25` 版本信息！

#### 1.0.1 → 1.0.2

- 将配置文件的路径暴露出容器，方便用户使用卷的方式来存储配置文件，而不需要重新编译镜像
- 镜像编译过程中移除了编写配置文件的步骤，配置文件自动下载完毕之后，由用户按照自己的需求直接修改和拷贝到卷映射的目录即可
