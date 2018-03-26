FROM ubuntu:xenial
MAINTAINER ryan Zhang <rainbow954@163.com>
ARG MESOS_VERSION=1.5.0-2.0.1

RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

RUN apt-get update && apt-get install --no-install-recommends -y ca-certificates curl openssh-server && rm -rf /var/lib/apt/lists/*
RUN service ssh start
# https://github.com/Yelp/dumb-init
RUN curl -fLsS -o /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.0.2/dumb-init_1.0.2_amd64 && chmod +x /usr/local/bin/dumb-init

RUN echo "deb http://repos.mesosphere.com/ubuntu xenial main" > /etc/apt/sources.list.d/mesosphere.list && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
  apt-get -y update && \
  apt-get -y install curl mesos=${MESOS_VERSION} && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

# 添加测试用户admin，密码admin，并且将此用户添加到sudoers里  
RUN useradd admin  
RUN echo "admin:admin" | chpasswd  
RUN echo "admin   ALL=(ALL)       ALL" >> /etc/sudoers  

ENV MESOS_WORK_DIR /tmp/mesos
ENV MESOS_LOG_DIR /var/log/mesos
ENV MESOS_NATIVE_JAVA_LIBRARY /usr/local/lib/libmesos.so

VOLUME /tmp/mesos

VOLUME /var/log/mesos
