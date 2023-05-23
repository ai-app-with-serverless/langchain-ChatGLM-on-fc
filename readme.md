## 项目说明
本项目可以帮助您把langchain-chatglm应用部署到阿里云函数计算平台，帮助构建私人语料库体智能问答的云原生系统

## 前置条件
开通阿里云函数计算，开通阿里云文件存储nas，开通阿里云容器镜像服务acr

## 快速开始
### 1 构建镜像（已有镜像直接跳第2步）
+ 使用本项目进行docker镜像构建
```
dockert build -t . <your imagename:version> .
```
+ 按照acr 示例教程上传镜像
+ 获得镜像地址
### 2 部署应用
+ 登录阿里云函数计算，选择应用中心-> 创建应用
+ 选择人工智能-> MAAS-Template
+ 填写region和你的镜像地址

### 3 上传源码和模型文件

+ 登录 admin 开头的地址，设置好账密之后登录nas网盘
+ 访问 /mnt/auto 创建目录chatglm
+ 将本项目 chatGLM目录下的内容传至chatglm路径下
+ 将 text2vec 模型放到 local-text2vec-model 目录
+ 将 chatglm  模型放到  local-chatglm-model 目录

### 4 启动服务
访问 sd开头的目录