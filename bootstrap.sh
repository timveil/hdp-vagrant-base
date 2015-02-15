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
sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/sysconfig/selinux