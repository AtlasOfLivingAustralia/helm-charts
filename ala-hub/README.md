# ALA hub installation

## Import config

```shell
kubectl create configmap ala-hub-config --from-file=/data/ansible-generated/ala-hub/config/
```

## Install helm package with values.yml

```shell
helm install ala-hub . -f values.yaml
```