#! bin/bash
# destroy

oc delete -f 20-nodejs-postgresql-persistent
oc delete -f 10-blackbox-exporter
oc delete -f 00-namespaces