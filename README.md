# Sample application for end-to-end cluster test (build and deploy)

A sample application consisting of a database layer using persistent storage and a nodejs frontend presenting a basic REST api performing CRUD operations.

A validation script is provided to test read and write accesss to the database through the API for basic application validation.

A default storage class must be defined in the cluster for successfull deployment of a persistent PostgreSQL instance.

## Prerequisites
- [bats test framework](https://github.com/sstephenson/bats)
- [jq](https://stedolan.github.io/jq/)

## Deploying and testing the application

With the prerequisite tools installed, the sample validation application can be deployed and tested by running the `validate.bats` test suite.

```bash
$ bats validate.bats
 ✓ deploy validation application
 ✓ initial read from API
 ✓ add an element to the database trough API
 ✓ delete item from database

4 tests, 0 failures
```

## Cleaning up

The application can be removed by running the `scripts/destroy.sh` script.

```bash
$ ./scripts/destroy.sh
imagestream.image.openshift.io "nodejs-postgresql-persistent" deleted
imagestream.image.openshift.io "nodejs-12-ubi8" deleted
buildconfig.build.openshift.io "nodejs-postgresql-persistent" deleted
persistentvolumeclaim "postgresql" deleted
service "postgresql" deleted
service "nodejs-postgresql-persistent" deleted
route.route.openshift.io "nodejs-postgresql-persistent" deleted
secret "nodejs-postgresql-persistent" deleted
deploymentconfig.apps.openshift.io "nodejs-postgresql-persistent" deleted
deploymentconfig.apps.openshift.io "postgresql" deleted
namespace "cluster-validation-nodejs" deleted
```

## Cluster use cases tested

- [x] S2I builds
- [x] Push image to internal image registry
- [x] Pull image from external image registry
- [x] PV creation
- [x] Pull image from Rollout / basic deployment
- [x] Pull from internal image registry 
- [x] Pod-to-pod communication through service layer
- [x] Ingress access via application route
- [x] Read and write to persistent volume