# HDP Vagrant Base

## Overview

This is a Vagrant box that can serve as a sensible base to install the Hortonworks Data Platform (HDP).  This box is based on Centos 7 (https://atlas.hashicorp.com/centos/boxes/7) and includes the below 
 modifications, consistent with Hortonworks documentation (http://docs.hortonworks.com/)

## Modifications

* installation of the following packages
  * scp
  * curl
  * unzip
  * tar
  * wget
  * ntp
  * openssl-devel
  * gcc (required for VirtualBox Guest Additions)
  * kernel-devel (required for VirtualBox Guest Additions)
* enabling yum `fastcache`
* update all yum packages and clean yum history
* enabling and starting `ntp`
* disabling `firewalld`
* disabling `transparent huge pages`
* disabling `selinux`
* updating timezone to New York
* increasing `ulimit`
* updating `umask`

## Usage

To run, execute the following

```bash
vagrant init timveil/centos7-hdp-base; vagrant up --provider virtualbox
```

## Release Notes

The latest release is `v1.0.10`.  For detailed release information see https://atlas.hashicorp.com/timveil/boxes/centos7-hdp-base

## Development Notes

Before packaging box, make sure to change both `vagrant` and `root` password to `vagrant`

```bash
sudo su -

# change root password
passwd 

# change vagrant password
passwd vagrant
```

To package and deploy see https://scotch.io/tutorials/how-to-create-a-vagrant-base-box-from-an-existing-one

```bash
vagrant package --output centos7-hdp-base.box
vagrant box add centos7-hdp-base centos7-hdp-base.box --force
```


