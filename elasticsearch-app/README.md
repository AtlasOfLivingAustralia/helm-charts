## Install helm package

```shell
 helm install <custom-name>-elasticsearch . --namespace <namespace> --set application=<custom-name> --set eck-operator.enabled=false
```