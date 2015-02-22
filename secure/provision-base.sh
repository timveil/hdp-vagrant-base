#!/usr/bin/env bash

echo "******* JAVA_HOME = $JAVA_HOME"
echo "******* HOSTNAME = $1"

# clean yum
echo '******* cleaning yum'
yum clean all

# update all yum libraries
echo '******* updating all libraries'
yum update -y -q
