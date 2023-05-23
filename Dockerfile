FROM  nvidia/cuda:12.1.0-runtime-ubuntu20.04

USER root

ENV ROOT=/mnt/auto/chatglm

# ENV ROOT=/chatGLM

ENV DEBIAN_FRONTEND=noninteractive

LABEL MAINTAINER="chatGLM"

RUN mkdir -p /mnt/auto/chatglm
COPY ./chatGLM/requirements.txt /mnt/auto/chatglm/requirements.txt


# COPY . /docker/

WORKDIR ${ROOT}

RUN apt-get update -y && apt-get install -y tzdata && apt-get install python3 python3-pip curl -y

RUN ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

RUN apt-get install -y nvidia-container-toolkit-base && apt-get install libgl1-mesa-glx -y

RUN apt-get install -y libglib2.0-0 libsm6 libxrender1 libxext6 && apt-get clean

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py 

RUN pip3 install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple --trusted-host pypi.tuna.tsinghua.edu.cn && rm -rf `pip3 cache dir`

# RUN chmod +x /docker/entrypoint.sh

EXPOSE 7860

# ENTRYPOINT ["/docker/entrypoint.sh"]

CMD ["python3","-u", "webui.py"]