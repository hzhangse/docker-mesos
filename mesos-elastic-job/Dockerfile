FROM registry.cn-hangzhou.aliyuncs.com/rainbow954/mesos-java:latest

ENV MAVEN_VERSION=3.5.2

# Install Maven
RUN wget -q http://www-eu.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
    mkdir /opt/maven && \
    tar xzf apache-maven-${MAVEN_VERSION}-bin.tar.gz -C /opt/maven && \
    rm apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
    ln -s /opt/maven/apache-maven-${MAVEN_VERSION}/bin/mvn /usr/local/bin/mvn
RUN apt-get update && apt-get install -y git





RUN git clone https://gitee.com/elasticjob/elastic-job.git 
RUN cd /elastic-job/elastic-job-cloud && ls -al
WORKDIR /elastic-job/elastic-job-cloud
RUN mvn clean install -Dmaven.test.skip=true
COPY elastic-job-cloud-scheduler.properties.template /elastic-job
COPY start.sh /elastic-job
#COPY elastic-job-cloud-scheduler.tar.gz /elastic-job
RUN cd /elastic-job/elastic-job-cloud/elastic-job-cloud-scheduler/target
RUN mv $(ls *.tar.gz |grep elastic-job-cloud-scheduler) /elastic-job/elastic-job-cloud-scheduler.tar.gz
#RUN tar -xzf $(ls *.tar.gz |grep elastic-job-cloud-scheduler) -C /elastic-job

RUN tar -xzf elastic-job-cloud-scheduler.tar.gz 
RUN chmod a+x /elastic-job/start.sh
CMD ["/elastic-job/start.sh"]
