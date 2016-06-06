# HDP Vagrant Base

## Overview

This is a Vagrant box that can serve as a sensible base to install the Hortonworks Data Platform (HDP).  This box is based on Centos 7 (https://atlas.hashicorp.com/centos/boxes/7) and includes the below 
 modifications, consistent with Hortonworks documentation (http://docs.hortonworks.com/)

## Modifications

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
* install Java 8 (`java-1.8.0-openjdk-devel`) and set `JAVA_HOME`
* apply JCE Policy

## Usage

To run, execute the following

```bash
vagrant init timveil/centos7-hdp-base; vagrant up --provider virtualbox
```

## Release Notes

The latest release is `v1.0.7`.  For detailed release information see https://atlas.hashicorp.com/timveil/boxes/centos7-hdp-base


