#!/usr/bin/env bash

# download HDP repos
wget -nv http://public-repo-1.hortonworks.com/ambari/centos6/1.x/updates/1.7.0/ambari.repo -O /etc/yum.repos.d/ambari.repo

# install ambari server and agent
echo 'installing ambari-server and ambari-agent'
yum install ambari-server ambari-agent -y -q

# update ambari agent config
sed -i 's/^hostname=localhost/hostname=min.hdp.local/g' /etc/ambari-agent/conf/ambari-agent.ini

# setup ambari server
ambari-server setup -s

# start ambari server
ambari-server start

# start ambari agent
ambari-agent start