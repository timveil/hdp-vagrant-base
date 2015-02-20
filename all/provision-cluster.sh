#!/usr/bin/env bash

echo "HOSTNAME = $1"

BLUEPRINT_URL="http://$1:8080/api/v1/blueprints/all"

echo $BLUEPRINT_URL

CLUSTER_URL="http://$1:8080/api/v1/clusters/all"

echo $CLUSTER_URL

# register ambari blueprint
curl --silent --show-error -H "X-Requested-By: ambari" -X POST -d @/vagrant/blueprint.json -u admin:admin $BLUEPRINT_URL

# create cluster
curl --silent --show-error -H "X-Requested-By: ambari" -X POST -d @/vagrant/create-cluster.json -u admin:admin $CLUSTER_URL
