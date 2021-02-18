#! /bin/bash
# deploy.sh

oc apply -f 00-namespaces
oc apply -f 10-blackbox-exporter
oc apply -f 20-nodejs-postgresql-persistent
