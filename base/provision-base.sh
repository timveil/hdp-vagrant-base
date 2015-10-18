#!/usr/bin/env bash

# clean yum
echo '******* cleaning yum'
yum clean all

# update all yum libraries
echo '******* updating all libraries'
yum makecache fast
yum update -y

# install & start ntp as required by HDP
echo '******* installing ntp'
yum install ntp lsof -y
systemctl enable ntpd

# disable firewalld as required by HDP
echo '******* disabling firewalld'
systemctl stop firewalld
systemctl disable firewalld

# disable transparent huge pages as required by HDP
echo '******* disabling transparent huge pages'
echo never > /sys/kernel/mm/transparent_hugepage/enabled

# disable selinux
echo '******* sestatus before'
sestatus

echo '******* disabling SELinux'
sed -i "s/^SELINUX=.*/SELINUX=disabled/g" /etc/sysconfig/selinux
sed -i "s/^SELINUX=.*/SELINUX=disabled/g" /etc/selinux/config

echo '******* sestatus after'
sestatus

# fix timezone
echo '******* date before'
date

echo '******* updating timezone'
rm -rf /etc/localtime
ln -s /usr/share/zoneinfo/America/New_York /etc/localtime

echo '******* date after'
date
