# Airflow installation

This is for installing airflow in a kubernetes cluster.
This sets up an airflow install with additional python libraries
used by Atlas DAGs.


## Setup storage

Use the airflow-storage chart before using this one.

```shell
helm install airflow-storage . -f ../common-values.yaml
```

## Install helm package with values.yml

```shell
helm dependency build
helm install airflow . -f values.yaml
```

Useful notes:
https://dev.to/aws-builders/apache-airflow-in-eks-cluster-dgo#Using-CDK-to-create-EFS-and-Access-Point-(AP)