# Cassandra installation

## Setup storage

```shell
kubectl apply -f biocache-cassandra.yaml 
```

## Install helm package with values.yml

```shell
helm install species-lists-mysql bitnami/mysql -f values.yaml
```