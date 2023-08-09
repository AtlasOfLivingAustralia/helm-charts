
# Installing biocache-service

## Setup configmaps

```shell
kubectl create configmap biocache-config --from-file=/data/ansible-generated/biocache/config/
```

## Install helm package with values.yml
```shell
helm install biocache-service . -f values.yaml
```

