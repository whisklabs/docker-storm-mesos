#!/bin/bash

if [ -z ${MESOS_MASTER} ] ; then
  echo "No MESOS_MASTER specified"
  exit -1
fi

if [ -z ${ZK_SERVERS} ] ; then
  echo "No ZK_SERVERS spicified."
  exit -1
fi

echo $MESOS_MASTER
sed -i -e "s/^mesos\.master\.url.*/mesos.master.url: \"$MESOS_MASTER\"/" $STORM_CONFIG


echo $ZK_SERVERS
sed -i -e "s/^storm.zookeeper.servers.*/storm.zookeeper.servers: $ZK_SERVERS/" $STORM_CONFIG

/storm-mesos/bin/storm-mesos nimbus
