#!/usr/bin/env bash

echo "JAVA_HOME = $JAVA_HOME"
echo "HOSTNAME = $1"

MYSQL_PASSWORD="hadoop"
API_URL="http://$1:8080/api/v1/clusters/secure/requests/1"
POLICY_URL="http://$1:6080"

echo "POLICY_URL = $POLICY_URL"

echo "checking cluster request status"

RET=0
until [ ${RET} -eq 1 ]; do
    RET=$(curl --silent --show-error -H "X-Requested-By: ambari" -X GET -u admin:admin $API_URL 2>&1 | grep -c "\"request_status\" : \"COMPLETED\"")

    echo "checking install status.  is complete? ${RET}"

    sleep 30
done

echo "installing ranger-admin"
yum install ranger_*-admin -y

sed -i "s/^db_password=.*/db_password=$MYSQL_PASSWORD/g" /usr/hdp/*/ranger-admin/install.properties
sed -i "s/^audit_db_password=.*/audit_db_password=$MYSQL_PASSWORD/g" /usr/hdp/*/ranger-admin/install.properties
sed -i "s|^policymgr_external_url=.*|policymgr_external_url=$POLICY_URL|g" /usr/hdp/*/ranger-admin/install.properties

echo "running setup for ranger-admin"
cd /usr/hdp/*/ranger-admin
./setup.sh

echo "starting ranger-admin"
service ranger-admin start

echo "installing ranger-usersync"
yum install ranger_*-usersync -y

sed -i "s|^POLICY_MGR_URL =.*|POLICY_MGR_URL=$POLICY_URL|g" /usr/hdp/*/ranger-usersync/install.properties

echo "running setup for ranger-usersync"
cd /usr/hdp/*/ranger-usersync
./setup.sh

echo "starting ranger-usersync"
service ranger-usersync start

echo "enable HDFS plugin"
sed -i "s|^POLICY_MGR_URL=.*|POLICY_MGR_URL=$POLICY_URL|g" /usr/hdp/*/ranger-hdfs-plugin/install.properties
sed -i "s/^REPOSITORY_NAME=.*/REPOSITORY_NAME=hdfsdev/g" /usr/hdp/*/ranger-hdfs-plugin/install.properties

sed -i "s/^XAAUDIT.DB.IS_ENABLED=false/XAAUDIT.DB.IS_ENABLED=true/g" /usr/hdp/*/ranger-hdfs-plugin/install.properties
sed -i "s/^XAAUDIT.DB.HOSTNAME=.*/XAAUDIT.DB.HOSTNAME=$1/g" /usr/hdp/*/ranger-hdfs-plugin/install.properties
sed -i "s/^XAAUDIT.DB.DATABASE_NAME=.*/XAAUDIT.DB.DATABASE_NAME=ranger_audit/g" /usr/hdp/*/ranger-hdfs-plugin/install.properties
sed -i "s/^XAAUDIT.DB.USER_NAME=.*/XAAUDIT.DB.USER_NAME=rangerlogger/g" /usr/hdp/*/ranger-hdfs-plugin/install.properties
sed -i "s/^XAAUDIT.DB.PASSWORD=.*/XAAUDIT.DB.PASSWORD=$MYSQL_PASSWORD/g" /usr/hdp/*/ranger-hdfs-plugin/install.properties
cd /usr/hdp/*/ranger-hdfs-plugin
./enable-hdfs-plugin.sh

echo "enable Hive plugin"
sed -i "s|^POLICY_MGR_URL=.*|POLICY_MGR_URL=$POLICY_URL|g" /usr/hdp/*/ranger-hive-plugin/install.properties
sed -i "s/^REPOSITORY_NAME=.*/REPOSITORY_NAME=hivedev/g" /usr/hdp/*/ranger-hive-plugin/install.properties

sed -i "s/^XAAUDIT.DB.IS_ENABLED=false/XAAUDIT.DB.IS_ENABLED=true/g" /usr/hdp/*/ranger-hive-plugin/install.properties
sed -i "s/^XAAUDIT.DB.HOSTNAME=.*/XAAUDIT.DB.HOSTNAME=$1/g" /usr/hdp/*/ranger-hive-plugin/install.properties
sed -i "s/^XAAUDIT.DB.DATABASE_NAME=.*/XAAUDIT.DB.DATABASE_NAME=ranger_audit/g" /usr/hdp/*/ranger-hive-plugin/install.properties
sed -i "s/^XAAUDIT.DB.USER_NAME=.*/XAAUDIT.DB.USER_NAME=rangerlogger/g" /usr/hdp/*/ranger-hive-plugin/install.properties
sed -i "s/^XAAUDIT.DB.PASSWORD=.*/XAAUDIT.DB.PASSWORD=$MYSQL_PASSWORD/g" /usr/hdp/*/ranger-hive-plugin/install.properties
cd /usr/hdp/*/ranger-hive-plugin
./enable-hive-plugin.sh

