#!/bin/bash

tag=$1
prefix=rainbow954

marathon_tag=1.3.6
chronos_tag=3.0.1
kafka_tag=0.10.0.0
spark_tag=2.1.0
zeppelin_tag=0.7.0

dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
home="$(dirname "$dir")"

if [ -z ${tag} ]
then
   echo "No tag provided, building with tag 'latest'"
   echo "To provide specific tag, invoke script with tag argument: build-all.sh <tag>"
   tag=latest
else
   echo "Starting build with tag $tag"
fi

sudo docker build --tag ${prefix}/mesos:${tag}                                  ${home}/mesos
sudo docker build --tag ${prefix}/mesos-java:${tag}                             ${home}/mesos-java
sudo docker build --tag ${prefix}/mesos-master:${tag}                           ${home}/mesos-master
sudo docker build --tag ${prefix}/mesos-slave:${tag}                            ${home}/mesos-slave
sudo docker build --tag ${prefix}/marathon:${marathon_tag}                      ${home}/marathon


