#!/bin/bash
export HOST_IP=172.19.0.34
export ZK_IP=172.19.0.21:2181,172.19.0.22:2181,172.19.0.23:2181
sudo docker run -d \
-e MESOS_HOSTNAME=${HOST_IP} \
-e MESOS_IP=${HOST_IP} \
-e MESOS_QUORUM=1 \
-e MESOS_ZK=zk://${ZK_IP}/mesos \
--name mesos-master-latest --net shadownet --ip ${HOST_IP} rainbow954/mesos-master
