# Species Lists installation

## Import config

```shell
kubectl create configmap lists-service-config --from-file=/data/lists-service/config/
```

## Install helm package with values.yml

```shell
helm install lists-service . -f values.yaml
```
