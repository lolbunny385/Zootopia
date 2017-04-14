#!/bin/bash

BASE="http://192.168.0.102:7180/api/v12"
CLUSTER="Cluster 1"
CDH=5.10


### Download Parcel
curl -X POST -u "admin:admin" -i $BASE/clusters/$CLUSTER/parcels/products/CDH/versions/$CDH/commands/startDownload
parcel_wait_for DOWNLOADED

### Distribute Parcel
curl -X POST -u "admin:admin" -i $BASE/clusters/$CLUSTER/parcels/products/CDH/versions/$CDH/commands/startDistribution
parcel_wait_for DISTRIBUTED

### Activate Parcel
curl -X POST -u "admin:admin" -i $BASE/clusters/$CLUSTER/parcels/products/CDH/versions/$CDH/commands/activate

parcel_wait_for ACTIVATED

