#!/usr/bin/env bash

# copy hosts file to new image
cp /vagrant/hosts /etc/hosts

# clean yum
yum clean all

# update all yum libraries
yum update -y

# install & start ntp as required by HDP
yum install ntp -y
service ntpd start

# disable iptables as required by HDP
service iptables stop

# disable transparent huge pages as required by HDP
echo never > /sys/kernel/mm/transparent_hugepage/enabled

# disable SElinux as required by HDP
sudo sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/sysconfig/selinux

# download HDP repos
wget -nv http://public-repo-1.hortonworks.com/ambari/centos6/1.x/updates/1.7.0/ambari.repo -O /etc/yum.repos.d/ambari.repo

# install ambari server and agent
yum install ambari-server ambari-agent -y

# update ambari agent config
sudo sed -i 's/^hostname=localhost/hostname=hdp2201.dev.local/g' /etc/ambari-agent/conf/ambari-agent.ini

# setup ambari server
ambari-server setup -s

# start ambari server
ambari-server start

# start ambari agent
ambari-agent start
