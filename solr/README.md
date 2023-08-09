# SOLR installation


## Setup storage

```shell
kubectl apply -f biocache-cassandra.yaml 

helm template . --values values.yaml --values ../aws-common-values.yaml -s biocache-cassandra.yaml 
```

## Install helm package with values.yml

```shell
helm install solr bitnami/solr -f values.yaml
```