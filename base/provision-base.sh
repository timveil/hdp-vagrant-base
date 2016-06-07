#!/usr/bin/env bash

# installing required libraries
echo '******* installing required libraries'
yum install ntp wget lsof unzip git openssl-devel gcc kernel-devel -y

# enabling yum fastcache
echo '******* enabling yum fastcache'
yum makecache fast

# clean yum
echo '******* cleaning yum'
yum clean all

# update all yum libraries
echo '******* updating all libraries'
yum update -y

# start ntp as required by HDP
echo '******* installing ntp'
systemctl start ntpd
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
