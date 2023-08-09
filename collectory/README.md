# Collectory installation

## Import config

```shell
kubectl create configmap collectory-config --from-file=/data/ansible-generated/collectory/config
```

## Install helm package with values.yml

```shell
helm install collectory . -f values.yaml -f ../common-values.yaml
```
