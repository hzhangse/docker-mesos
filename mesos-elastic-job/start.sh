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
exec /opt/elastic-job-cloud-scheduler/bin/start.sh
