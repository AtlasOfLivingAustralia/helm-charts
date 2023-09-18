# Species Lists installation

## Import config

```shell
kubectl create configmap lists-api-config --from-file=/data/ansible-generated/lists-api/config/
```

## Install helm package with values.yml

```shell
helm install lists-api . -f values.yaml
```
