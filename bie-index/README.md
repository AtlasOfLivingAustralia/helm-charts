# BIE index installation

## Import config

```shell
kubectl delete configmap bie-index-config
kubectl create configmap bie-index-config --from-file=/data/ansible-generated/bie-index/
```

## Install helm package with values.yml

```shell
helm install bie-index . -f values.yaml -f ../common-values.yaml
```
