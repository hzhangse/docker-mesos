#!/bin/bash
export HOST_IP=172.19.0.37
export ZK_IP=172.19.0.21:2181,172.19.0.22:2181,172.19.0.23:2181
export event_trace_rdb_driver=com.mysql.jdbc.Driver
export event_trace_rdb_url=jdbc:mysql://172.19.0.10:3306/elastic_job_cloud_log
export mesos_url=zk://172.19.0.21:2181/mesos
sudo docker run -d \
-e hostname=${HOST_IP} \
-e mesos_url=${mesos_url} \
-e zk_servers=${ZK_IP} \
-e event_trace_rdb_driver=${event_trace_rdb_driver} \
-e event_trace_rdb_url=${event_trace_rdb_url} \
-e event_trace_rdb_username=root \
-e event_trace_rdb_password=root \
--name mesos-elstic-job --net shadownet --ip ${HOST_IP}  registry.cn-hangzhou.aliyuncs.com/rainbow954/mesos-elasticjob:latest




