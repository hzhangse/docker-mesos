FROM registry.cn-hangzhou.aliyuncs.com/rainbow954/mesos-java:latest

ENV MAVEN_VERSION=3.5.2

# Install Maven
RUN wget -q http://www-eu.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
    mkdir /opt/maven && \
    tar xzf apache-maven-${MAVEN_VERSION}-bin.tar.gz -C /opt/maven && \
    rm apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
    ln -s /opt/maven/apache-maven-${MAVEN_VERSION}/bin/mvn /usr/local/bin/mvn
RUN apt-get update && apt-get install -y git





RUN git clone https://github.com/elasticjob/elastic-job-cloud

WORKDIR /elastic-job-cloud
RUN mvn clean install -Dmaven.test.skip=true
COPY elastic-job-cloud-scheduler.properties.template /elastic-job-cloud



WORKDIR /elastic-job-cloud/elastic-job-cloud-scheduler/target
RUN mv $(ls *.tar.gz |grep elastic-job-cloud-scheduler) /elastic-job-cloud/elastic-job-cloud-scheduler.tar.gz

WORKDIR /elastic-job-cloud/
RUN  mkdir -p /opt/elastic-job-cloud-scheduler
RUN tar -xzf elastic-job-cloud-scheduler.tar.gz && cd $(ls  |grep elastic-job-cloud-scheduler) && mv * /opt/elastic-job-cloud-scheduler
COPY start.sh /opt/elastic-job-cloud-scheduler/bin
COPY config.sh /opt/elastic-job-cloud-scheduler/bin
RUN chmod a+x /opt/elastic-job-cloud-scheduler/bin/start.sh
RUN chmod a+x /opt/elastic-job-cloud-scheduler/bin/config.sh
WORKDIR /opt/elastic-job-cloud-scheduler/bin
CMD ["/opt/elastic-job-cloud-scheduler/bin/config.sh"]
