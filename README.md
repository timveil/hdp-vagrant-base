# HDP Vagrant

## About
Use this project to spin up local, clean, purpose built single node [Hortonworks Data Platform](http://hortonworks.com/hdp/) (HDP) 2.2 clusters.  This is an alternative to the "sandbox" approach which installs everything.  This is very useful if the configuration of your local cluster needs to change from one project to another.  In addition, because it leverages Vagrant, its very easy to extend and customize.

Currently I have 2 flavors, but will be adding more.

* all - This includes all HDP 2.2 services
* min - This includes the minimum required HDFS services + Hive
* streaming - Coming soon!  Includes `min` + Storm, Kafka and Solr
* nosql - Coming soon! Includes `min` + HBase (Phoenix)


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

Each flavor contains the following files:

* `blueprint.json` - use this file to customize the services included in your cluster
* `create-cluster.json` - this file is used to request cluster creation.  you can change the name of the cluster here
```JSON
{
  "blueprint" : "all",
  "default_password" : "password",
  "host_groups" :[
    {
      "name" : "host_group_1",
      "hosts" : [
        {
          "fqdn" : "all.hdp.local"
        }
      ]
    }
  ]
}
```
* `provision-ambari.sh` - a vagrant provisioner to install and start the Ambari Server and Agent
* `provision-base.sh` - a vagrant provisioner to prepare the virtual box. for example, this script disables SELinux and iptables
* `provision-cluster` - responsible for creating the Ambari Blueprint and requesting cluster creation
* `Vagrantfile` - the Vagrant configuration file that defines box creation.  Most customization can be done here.
```bash
# the top of the file includes the following variables which can be changed if needed
HOSTNAME = "all.hdp.local"
IP = "192.168.66.101"
```

### Ambari Blueprint

You can configure your `Blueprint` by referring to the following table

Service  | Required Components
-------- | ----------
HDFS | DATANODE, HDFS_CLIENT, NAMENODE, SECONDARY_NAMENODE
YARN | APP_TIMELINE_SERVER, NODEMANAGER, RESOURCEMANAGER, YARN_CLIENT
MapReduce2 | HISTORYSERVER, MAPREDUCE2_CLIENT
Ganglia | GANGLIA_MONITOR, GANGLIA_SERVER
HBase | HBASE_CLIENT, HBASE_MASTER, HBASE_REGIONSERVER
Hive | HIVE_CLIENT, HIVE_METASTORE, HIVE_SERVER, MYSQL_SERVER
HCatalog | HCAT
WebHCat | WEBHCAT_SERVER
Nagios| NAGIOS_SERVER
Oozie| OOZIE_CLIENT, OOZIE_SERVER
Pig | PIG
Sqoop | SQOOP
Storm | DRPC_SERVER, NIMBUS, STORM_UI_SERVER, SUPERVISOR
Kafka | KAFKA_BROKER
Tez | TEZ_CLIENT
Falcon | FALCON_CLIENT, FALCON_SERVER
Zookeeper | ZOOKEEPER_CLIENT, ZOOKEEPER_SERVER
Flume | FLUME_HANDLER
Slider | SLIDER
Knox | KNOX_GATEWAY
Ambari | AMBARI_SERVER

