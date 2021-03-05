#! /usr/bin/env bats

setup() {
    echo "setting up"
    validation_namespace=cluster-validation-nodejs
    app_route=$(oc get -n cluster-validation-nodejs route nodejs-postgresql-persistent -o template="{{.spec.host}}")
    export app_root=${app_route}/api/fruits
}

@test "deploy validation application" {
    run scripts/deploy.sh
}

@test "initial read from API" {
    curl -s $app_root | jq
}

@test "add an element to the database trough API" {
    curl -s -X POST \
    --header "Content-Type: application/json" \
    --data '{"name":"Banana", "stock": 11}' \
    $app_root | jq
}

@test "delete item from database" {
    item_id=$(curl -s $app_root | \
    jq '.[] | select(.name == "Banana") | .id')
    curl -s -X DELETE $app_root/$item_id | jq
}