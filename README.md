# hdp-vagrant
Use this project to spin up local, clean, purpose built single node HDP 2.2 clusters.  This is an alternative to the "sandbox" approach which installs everything.  This project uses Vagrant, Oracle VirtulBox and Ambari Blueprints to create clusters that run only the services you need.

Currently I have 2 flavors, but will be adding more.

* all - This includes all HDP 2.2 services
* min - This includes the minimum required HDFS services + Hive



## Ambari Blueprint

You can configure your `Blueprint` by referring to the following table

Service  | Components
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

