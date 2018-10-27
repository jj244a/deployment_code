#!/bin/bash

# $1 - Floating IP

count=30
echo "Adding Floating IP: $1 to config.json cluster" >> /tmp/fogflow.log

DockerIP=$(ip -4 addr show docker0 | grep -oP "(?<=inet ).*(?=/)")
echo "Adding IP: $DockerIP to config.json cluster" >> /tmp/fogflow.log
sed -i  's/"webportal_ip":.*/"webportal_ip": "'$1'",/' /tmp/fogflow/config.json
sed -i  's/"coreservice_ip":.*/"coreservice_ip": "'$1'",/' /tmp/fogflow/config.json
sed -i  's/"external_hostip":.*/"external_hostip": "'$1'",/' /tmp/fogflow/config.json
sed -i  's/"internal_hostip":.*/"internal_hostip": "'$DockerIP'",/' /tmp/fogflow/config.json

cd /tmp/fogflow/

#pull the docker images of all FogFlow components
echo "pull the docker images of all FogFlow components" >> /tmp/fogflow.log
docker-compose pull


#start the FogFlow system
echo "Starting docker container of all FogFlow components" >> /tmp/fogflow.log
docker-compose up -d
echo "FogFlow Installation completed" >> /tmp/fogflow.log

cat /tmp/fogflow.log
