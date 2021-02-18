# Sample application for end-to-end cluster test (build and deploy)

A sample application consisting of a database layer using persistent storage and a nodejs frontend presenting a basic REST api performing CRUD operations.

Next to this the blackbox-exporter is deployed together with a Prometheus configuration that polls the application and API through the blackbox exporter layer.
