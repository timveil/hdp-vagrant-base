#!/usr/bin/env bash

wget -nv http://public-repo-1.hortonworks.com/ambari/centos6/1.x/updates/1.7.0/ambari.repo -O /etc/yum.repos.d/ambari.repo
wget -nv http://public-repo-1.hortonworks.com/HDP/centos6/2.x/GA/2.2.0.0/hdp.repo -O /etc/yum.repos.d/HDP.repo

yum install yum-utils createrepo -y -q

yum install httpd -y -q
chkconfig httpd on
/etc/init.d/httpd start

cd /var/www/html
mkdir -p ambari/centos6
cd ambari/centos6
reposync -rq Updates-ambari-*

cd /var/www/html
mkdir -p hdp/centos6
cd hdp/centos6
reposync -rq HDP-*

createrepo /var/www/html/hdp/centos6/HDP-2.2.0.0
createrepo /var/www/html/hdp/centos6/HDP-UTILS-1.1.0.20
createrepo /var/www/html/ambari/centos6/Updates-ambari-1.7.0

cp /vagrant/ambari.repo /var/www/html/ambari/centos6
cp /vagrant/hdp.repo /var/www/html/hdp/centos6

yum update -y -q