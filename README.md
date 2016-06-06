# HDP Vagrant Base

Base Vagrant box used by https://github.com/timveil/hdp-vagrant-generator.  For detailed released information see https://atlas.hashicorp.com/timveil/boxes/centos7-hdp-base

The box is based off of https://atlas.hashicorp.com/centos/boxes/7.  Additional modifications include:

* installation of the following packages
  * ntp
  * wget
  * lsof
  * unzip
  * git
  * openssl-devel
* yum update and clean
* enabling and starting `ntp`
* disabling `firewalld`
* disabling `transparent huge pages`
* disabling `selinux`
* updating timezone to New York
* install Java 8 and set `JAVA_HOME`
* apply JCE Policy

To run, execute the following

```bash
vagrant init timveil/centos7-hdp-base; vagrant up --provider virtualbox
```




