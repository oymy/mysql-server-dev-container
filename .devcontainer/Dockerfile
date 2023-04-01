# 使用一个基础镜像，这里我们选择 Ubuntu 18.04，因为它与 MySQL 5.7 的依赖关系兼容
FROM ubuntu:18.04

# 安装必要的依赖包
RUN apt-get update \
    && apt-get install -y \
        build-essential \
        cmake \
        libncurses5-dev \
        libssl-dev \
        libtinfo-dev \
        wget \
        git \
	    zlib1g-dev\
	    pkg-config\
	    bison \
        gdb
