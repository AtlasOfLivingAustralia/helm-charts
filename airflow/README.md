# Airflow installation

This is for installing airflow in a kubernetes cluster.
This is for non-production use only.

## Setup storage

```shell
kubectl apply -f airflow-biocache-cassandra.yaml 
```

## Install helm package with values.yml

```shell
helm repo add apache-airflow https://airflow.apache.org
helm install airflow apache-airflow/airflow -f values.yaml
```

Useful notes:
https://dev.to/aws-builders/apache-airflow-in-eks-cluster-dgo#Using-CDK-to-create-EFS-and-Access-Point-(AP)