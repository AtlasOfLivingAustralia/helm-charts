# Cassandra installation

## Setup storage

```shell
kubectl apply -f biocache-cassandra.yaml 
```

## Install helm package with values.yml

```shell
helm install biocache-cassandra bitnami/cassandra -f values.yaml
```