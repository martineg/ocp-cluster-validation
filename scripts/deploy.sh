#! /bin/bash
# deploy.sh

oc apply -f 00-namespaces
oc apply -f 20-nodejs-postgresql-persistent

wait_for_build() {
    app_ns=cluster-validation-nodejs
    for build in $(oc get builds -n $app_ns -o json | \
        jq -r '.items[] | .metadata.name'); do
        echo "Waiting for build $build to complete"
        while :; do
            build_phase=$(oc get build -n $app_ns $build -o json | jq -r '.status.phase')
            if test "$build_phase" = "Complete"; then
                echo -e "\n$build is complete"
                break;
            else
                echo -n "."
                sleep 1
            fi
        done
    done
}

wait_for_deploy() {
    # simplistic wait for both db and app pods to be ready
    # https://medium.com/@reuvenharrison/how-to-wait-for-a-kubernetes-pod-to-be-ready-one-liner-144bbbb5a76f

    for app in postgresql nodejs-postgresql-persistent; do
         echo "waiting for $app to become ready"
        while [[ $(oc get pods -n $app_ns -l name=$app \
        -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; do
            sleep 1
        done
    done
}

wait_for_build && \
wait_for_deploy