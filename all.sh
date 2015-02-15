#!/usr/bin/env bash

# register ambari blueprint
curl -H "X-Requested-By: ambari" -X POST -d @/vagrant/blueprint.all.json -u admin:admin http://localhost:8080/api/v1/blueprints/all

# create cluster
curl -H "X-Requested-By: ambari" -X POST -d @/vagrant/create.all.json -u admin:admin http://localhost:8080/api/v1/clusters/all
