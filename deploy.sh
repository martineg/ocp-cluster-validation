#! /bin/bash
# deploy.sh

oc apply -f 00-namespaces
oc apply -f 20-nodejs-postgresql-persistent
