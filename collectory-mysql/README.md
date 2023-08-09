# Cassandra installation

## Setup storage

```shell
kubectl apply -f biocache-cassandra.yaml 
```

## Install helm package with values.yml

```shell
helm apply -f biocache-cassandra.yaml
helm install collectory-mysql bitnami/mysql -f values.yaml
```