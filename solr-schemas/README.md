# Install SOLR schemas

## Create configmaps

```shell
kubectl create configmap bie-solr-config --from-file=bie-solr-config
kubectl create configmap biocache-solr-config --from-file=biocache-solr-config
```

```shell
helm install solr-schemas . -f values.yaml
```