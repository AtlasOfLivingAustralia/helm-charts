# Species Lists installation

## Import config

```shell
kubectl create configmap lists-service-config --from-file=/data/lists-service/config/
```

## Install helm package with values.yml

```shell
helm install lists-service . -f values.yaml -f /tmp/common-values.yaml
```

## Modify helm package with values.yml

```shell
helm upgrade lists-service . -f values.yaml -f /tmp/common-values.yaml
```

## Restart deployment, e.g. load the latest image or restart with new config
```shell
kubectl rollout restart deployment lists-service
```
