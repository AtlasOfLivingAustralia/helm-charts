# Species Lists installation

## Import config

```shell
kubectl create configmap species-lists-config --from-file=/data/ansible-generated/specieslist-webapp/config/
```

## Install helm package with values.yml

```shell
helm install species-lists . -f values.yaml
```
