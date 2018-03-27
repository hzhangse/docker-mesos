#!/bin/bash -x


IP=$(grep "\s${HOSTNAME}$" /etc/hosts | head -n 1 | awk '{print $1}')

cat /elastic-job/elastic-job-cloud-scheduler.properties.template | sed \
  -e "s|{{hostname}}|${hostname:-$IP}|g" \
  -e "s|{{mesos_url}}|${mesos_url}|g" \
  -e "s|{{zk_servers}}|${zk_servers}|g" \
  -e "s|{{event_trace_rdb_driver}}|${event_trace_rdb_driver}|g" \
  -e "s|{{event_trace_rdb_url}}|${event_trace_rdb_url}|g" \
  -e "s|{{event_trace_rdb_username}}|${event_trace_rdb_username:root}|g" \
  -e "s|{{event_trace_rdb_password}}|${event_trace_rdb_password:root}|g" \
   > /opt/elastic-job-cloud-scheduler/conf/elastic-job-cloud-scheduler.properties



echo "Starting elastic-job-cloud"
service ssh start
#exec /opt/elastic-job-cloud-scheduler/bin/start.sh

cd `dirname $0`
cd ..
DEPLOY_DIR=`pwd`
CONF_DIR=${DEPLOY_DIR}/conf
LIB_DIR=${DEPLOY_DIR}/lib/*
CONTAINER_MAIN=io.elasticjob.cloud.scheduler.Bootstrap
JAVA_OPTS=" -Djava.awt.headless=true -Djava.net.preferIPv4Stack=true -Djava.library.path=/usr/local/lib:/usr/lib:/usr/lib64:/media/userData/home/ryan/work/tools/mesos-lib -Xdebug -Xrunjdwp:transport=dt_socket,address=6666,server=y,suspend=n"

source ${CONF_DIR}/elastic-job-cloud-scheduler.properties
if [ ${hostname} = "" ] || [ ${hostname} = "127.0.0.1" ] || [ ${hostname} = "localhost" ]; then
  echo "Please config hostname in conf/elastic-job-cloud-scheduler.properties with a routable IP address."
  exit;
fi
export LIBPROCESS_IP=${hostname}

java ${JAVA_OPTS} -classpath ${CONF_DIR}/*:${LIB_DIR}:. ${CONTAINER_MAIN}
