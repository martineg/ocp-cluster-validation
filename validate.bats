#! /usr/bin/env bats

load scripts/helper

@test "deploy validation application" {
    run scripts/deploy.sh
}

@test "initial read from API" {
    set_route
    curl -s $app_root
}

@test "add an element to the database trough API" {
    set_route
    curl -s -X POST \
    --header "Content-Type: application/json" \
    --data '{"name":"Banana", "stock": 11}' \
    $app_root | jq
}

@test "delete item from database" {
    set_route
    item_id=$(curl -s $app_root | \
    jq '.[] | select(.name == "Banana") | .id')
    curl -s -X DELETE $app_root/$item_id | jq
}

@test "delete validation application" {
    run scripts/destroy.sh
}