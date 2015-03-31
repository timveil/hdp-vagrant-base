#!/usr/bin/env bash

wget -nv http://s3.amazonaws.com/private-repo-1.hortonworks.com/ambari/centos6/2.x/updates/27aa1558b1d5feaedb249883bf4a4aee66f3c801c55d078c0e/2.0.0/ambari.repo -O /etc/yum.repos.d/ambari.repo
wget -nv http://s3.amazonaws.com/private-repo-1.hortonworks.com/HDP/centos6/2.x/updates/37ede792e14bb5d7d2259e4fcd55a3d68dfc6fa47f4318a521745208/2.2.4.0/hdp.repo -O /etc/yum.repos.d/HDP.repo

yum install yum-utils createrepo -y -q

yum install httpd -y -q
chkconfig httpd on
/etc/init.d/httpd start

cd /var/www/html
mkdir -p ambari/centos6
cd ambari/centos6
reposync -r Updates-ambari-*

cd /var/www/html
mkdir -p hdp/centos6
cd hdp/centos6
reposync -r HDP-*

createrepo /var/www/html/hdp/centos6/HDP-2.2.4.0
createrepo /var/www/html/hdp/centos6/HDP-UTILS-1.1.0.20
createrepo /var/www/html/ambari/centos6/Updates-ambari-2.0.0

cp /vagrant/ambari.repo /var/www/html/ambari/centos6
cp /vagrant/hdp.repo /var/www/html/hdp/centos6

yum update -y -q