#!/usr/bin/env bash

echo "HOSTNAME = $1"

echo "JAVA_HOME = $JAVA_HOME"

# download HDP repos
wget -nv http://public-repo-1.hortonworks.com/ambari/centos6/1.x/updates/1.7.0/ambari.repo -O /etc/yum.repos.d/ambari.repo

# install ambari server and agent
echo 'installing ambari-server and ambari-agent'
yum install ambari-server ambari-agent -y -q

# update ambari agent config
sed -i "s/^hostname=localhost/hostname=$1/g" /etc/ambari-agent/conf/ambari-agent.ini

# setup ambari server
ambari-server setup -s -j $JAVA_HOME

# start ambari server
ambari-server start

# start ambari agent
ambari-agent start