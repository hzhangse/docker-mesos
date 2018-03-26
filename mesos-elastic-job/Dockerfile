FROM registry.cn-hangzhou.aliyuncs.com/rainbow954/mesos-java:latest



RUN mkdir -p /elastic-job 
COPY elastic-job-cloud-scheduler.tar.gz /elastic-job
RUN  tar -xzf /elastic-job/elastic-job-cloud-scheduler.tar.gz && /elastic-job/elastic-job-cloud-scheduler/bin/start.sh

