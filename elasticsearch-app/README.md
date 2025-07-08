## Install helm package

```shell
 helm install testing-elasticsearch . --namespace <namespace> --set application=<custom-name> --set eck-operator.enabled=false
```