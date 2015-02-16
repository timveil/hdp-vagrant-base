# HDP Vagrant

## About
Use this project to spin up local, clean, purpose built single node Hortonworks Data Platform (HDP) 2.2 clusters.  This is an alternative to the "sandbox" approach which installs everything.  This is very useful if the configuration of your local cluster needs to change from one project to another.  In addition, because it leverages Vagrant, its very easy to extend and customize.

Currently I have 2 flavors, but will be adding more.

* all - This includes all HDP 2.2 services
* min - This includes the minimum required HDFS services + Hive

## Requirements

The following software is required:

* [Vagrant](https://www.vagrantup.com/)
* [VirtualBox](https://www.virtualbox.org/)

The boxes are configured to use 4 cores and 8gb of RAM, this means that unless you change, your workstation should have 8 cores and 16gb of RAM.

## Getting Started

Open a terminal, navigate to the root of the project and have fun:

```bash
# install required plugins
> vagrant plugin install vagrant-multi-hostsupdater
> vagrant plugin install vagrant-vbguest

# pick a flavor by changing into its directory
> cd min

# launch the vm (may take 10 to 20 minuets)
> vagrant up
```

## Customizing



### Ambari Blueprint

You can configure your `Blueprint` by referring to the following table

Service  | Required Components
-------- | ----------
HDFS | DATANODE, HDFS_CLIENT, NAMENODE, SECONDARY_NAMENODE
YARN | APP_TIMELINE_SERVER, NODEMANAGER, RESOURCEMANAGER, YARN_CLIENT
MAPREDUCE2 | HISTORYSERVER, MAPREDUCE2_CLIENT
GANGLIA | GANGLIA_MONITOR, GANGLIA_SERVER
HBASE | HBASE_CLIENT, HBASE_MASTER, HBASE_REGIONSERVER
HIVE | HIVE_CLIENT, HIVE_METASTORE, HIVE_SERVER, MYSQL_SERVER
HCATALOG | HCAT
WEBHCAT | WEBHCAT_SERVER
NAGIOS | NAGIOS_SERVER
OOZIE | OOZIE_CLIENT, OOZIE_SERVER
PIG | PIG
SQOOP | SQOOP
STORM | DRPC_SERVER, NIMBUS, STORM_UI_SERVER, SUPERVISOR
KAFKA | KAFKA_BROKER
TEZ | TEZ_CLIENT
FALCON | FALCON_CLIENT, FALCON_SERVER
ZOOKEEPER | ZOOKEEPER_CLIENT, ZOOKEEPER_SERVER
FLUME | FLUME_HANDLER
SLIDER | SLIDER
KNOX | KNOX_GATEWAY
AMBARI | AMBARI_SERVER

