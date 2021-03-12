# helper.bash

set_route() {
    validation_namespace=cluster-validation-nodejs
    app_route=$(oc get -n cluster-validation-nodejs route nodejs-postgresql-persistent -o template="{{.spec.host}}")
    export app_root=${app_route}/api/fruits
}