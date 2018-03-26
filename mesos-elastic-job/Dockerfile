FROM registry.cn-hangzhou.aliyuncs.com/rainbow954/mesos-java:latest
RUN mkdir -p /elastic-job
COPY elastic-job-cloud-scheduler.properties.template /elastic-job
COPY start.sh /elastic-job
 
COPY elastic-job-cloud-scheduler.tar.gz /elastic-job
RUN  cd /elastic-job && tar -xzf elastic-job-cloud-scheduler.tar.gz 
RUN chmod a+x /elastic-job/start.sh
CMD ["/elastic-job/start.sh"]
