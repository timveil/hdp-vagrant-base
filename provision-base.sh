#!/usr/bin/env bash

# installing required libraries
echo '******* installing required libraries'
yum install scp curl unzip tar wget ntp openssl-devel gcc kernel-devel java-1.8.0-openjdk-devel.x86_64 -y

# set JAVA_HOME
echo '******* setting JAVA_HOME'
echo "export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk" >> /etc/profile.d/java_env.sh

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

echo '******* update ulimit'
ulimit -n 10000

echo '******* update umask'
echo umask 0022 >> /etc/profile

# clean yum
echo '******* cleaning yum'
yum clean all
rm -rf /var/cache/yum