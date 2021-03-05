# Sample application for end-to-end cluster test (build and deploy)

A sample application consisting of a database layer using persistent storage and a nodejs frontend presenting a basic REST api performing CRUD operations.

A validation script is provided to test read and write accesss to the database through the API for basic application validation.

A default storage class must be defined in the cluster for successfull deployment of a persistent PostgreSQL instance.


- [x] S2I builds
- [x] Push image to internal image registry
- [x] Pull image from external image registry
- [x] PV creation
- [x] Pull image from Rollout / basic deployment
- [x] Pull from internal image registry 
- [x] Pod-to-pod communication through service layer
- [x] Ingress access via application route
- [x] Read and write to persistent volume