#!/usr/bin/env bash

# register ambari blueprint
curl -H "X-Requested-By: ambari" -X POST -d @/vagrant/blueprint.min.json -u admin:admin http://localhost:8080/api/v1/blueprints/min

# create cluster
curl -H "X-Requested-By: ambari" -X POST -d @/vagrant/create.min.json -u admin:admin http://localhost:8080/api/v1/clusters/min
