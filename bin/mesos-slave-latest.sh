#!/bin/bash
export HOST_IP=172.19.0.35
export ZK_IP=172.19.0.21:2181,172.19.0.22:2181,172.19.0.23:2181
sudo docker run -d \
-e MESOS_HOSTNAME=${HOST_IP} \
-e MESOS_IP=${HOST_IP} \
-e MESOS_MASTER=zk://${ZK_IP}/mesos \
-e MESOS_switch_user=false \
-v /sys/fs/cgroup:/sys/fs/cgroup \
-v /var/run/docker.sock:/var/run/docker.sock \
--name mesos-slave1 --net shadownet --ip ${HOST_IP}  rainbow954/mesos-slave 




export HOST_IP=172.19.0.36
sudo docker run -d \
-e MESOS_HOSTNAME=${HOST_IP} \
-e MESOS_IP=${HOST_IP} \
-e MESOS_switch_user=false \
-e MESOS_MASTER=zk://${ZK_IP}/mesos \
-v /sys/fs/cgroup:/sys/fs/cgroup \
-v /var/run/docker.sock:/var/run/docker.sock \
--name mesos-slave2 --net shadownet --ip ${HOST_IP}  rainbow954/mesos-slave 




