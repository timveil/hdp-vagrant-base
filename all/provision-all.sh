#!/usr/bin/env bash

# register ambari blueprint
curl --silent --show-error  -H "X-Requested-By: ambari" -X POST -d @/vagrant/blueprint.json -u admin:admin http://localhost:8080/api/v1/blueprints/all

# create cluster
curl --silent --show-error  -H "X-Requested-By: ambari" -X POST -d @/vagrant/create-cluster.json -u admin:admin http://localhost:8080/api/v1/clusters/all
