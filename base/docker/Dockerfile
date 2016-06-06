FROM centos
MAINTAINER Tim Veil <tjveil@gmail.com>

RUN yum update -y
RUN yum install java-1.8.0-openjdk-devel -y
RUN yum install ntp lsof unzip git deltarpm openssl-devel epel-release -y
RUN yum clean all

ENV JAVA_HOME /usr/lib/jvm/java-1.8.0
ENV PATH $PATH:$JAVA_HOME/bin

RUN systemctl enable ntpd

#RUN systemctl stop firewalld; exit 0
#RUN systemctl disable firewalld

#RUN echo "never" > /sys/kernel/mm/transparent_hugepage/enabled

#RUN sed -i "s/^SELINUX=.*/SELINUX=disabled/g" /etc/sysconfig/selinux
#RUN sed -i "s/^SELINUX=.*/SELINUX=disabled/g" /etc/selinux/config

RUN rm -rf /etc/localtime
RUN ln -s /usr/share/zoneinfo/America/New_York /etc/localtime