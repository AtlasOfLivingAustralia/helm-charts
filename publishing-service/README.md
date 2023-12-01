# Species Lists installation

## Import config

```shell
kubectl create configmap publishing-service-config --from-file=/data/publishing-service/config/
```

## Install helm package with values.yml

```shell
helm install publishing-service . -f values.yaml
```
