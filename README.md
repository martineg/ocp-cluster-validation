# Sample application for end-to-end cluster test (build and deploy)

A sample application consisting of a database layer using persistent storage and a nodejs frontend presenting a basic REST api performing CRUD operations to the database.

A validation script is provided to test read and write accesss to the database through the API for basic application validation.

## Prerequisites
- A default storage class must be defined in the cluster for creation of a PV used by persistent PostgreSQL instance.
- [bats test framework](https://github.com/sstephenson/bats)
- [jq](https://stedolan.github.io/jq/)

## Deploying and testing the application

With the prerequisite tools installed, the sample validation application can be deployed and tested by running the `validate.bats` test suite.


```bash
 ✓ deploy validation application
 ✓ initial read from API
 ✓ add an element to the database trough API
 ✓ delete item from database
 ✓ delete validation application

5 tests, 0 failures
```

## Cluster use cases tested

- [x] S2I builds
- [x] Push image to internal image registry
- [x] Pull image from external image registry
- [x] PV creation and PVC binding
- [x] Pull image from internal image registry
- [x] Basic deployment rollout
- [x] Pod-to-pod communication through service layer
- [x] Ingress access via application route
- [x] Read and write to persistent volume
