#! /bin/bash

cerberus_ns=cerberus
kubeconfig=../../kubeconfig

# create namespace
oc apply -f cerberus-ns.yaml

# create config maps
oc create cm cerberus-config --from-file=config.yaml -n ${cerberus_ns} && rm config.yaml
oc create cm kube-config --from-file=config=${kubeconfig} -n ${cerberus_ns}

# apply remaining deployment assets
oc apply -f deploy
