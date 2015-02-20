#!/usr/bin/env bash

# clean yum
yum clean all

# update all yum libraries
echo 'updating all libraries'
yum update -y -q

# install & start ntp as required by HDP
echo 'installing ntp'
yum install ntp lsof -y -q
service ntpd start

# disable iptables as required by HDP
echo 'disabling iptables'
service iptables stop

# disable transparent huge pages as required by HDP
echo 'disabling transparent huge pages'
echo never > /sys/kernel/mm/transparent_hugepage/enabled

# disable SElinux as required by HDP
echo 'disabling SELinux'
sed -i "s/^SELINUX=.*/SELINUX=disabled/g" /etc/sysconfig/selinux