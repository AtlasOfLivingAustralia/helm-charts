# Helm charts for deploying Atlas of Living Australia (ALA) components

Note: This repository is a work in progress.

## Introduction

This repository contains a number of Helm charts for deploying Atlas of Living Australia (ALA) components
to a Kubernetes cluster. 

## Prerequisites

- Kubernetes 1.12+
- Helm 3.12.2+
- Persistent Volume provisioner support in the underlying infrastructure

## Elastic Kubernetes Service (EKS)

These charts have been tested on [EKS](https://docs.aws.amazon.com/eks/latest/userguide/what-is-eks.html)
For notes on how to setup an EKS cluster, see [this description](../terraform-v0/eks/EKS.md).

## Installation

### Add Helm repository - coming soon...

To add the `ala` Helm repository, run the following command:

```bash        
helm repo add ala https://ala-helm-repo......s3.amazonaws.com
```

## Installation of all configmaps

Application configuration files (Yaml, properties and JSON files) first need to be generated using ansible.
This is done using ansible using ala-install. 
See [ala-install repository](https://github.com/AtlasOfLivingAustralia/ala-install/tree/master/utils) 

```shell
ala-data-generator --data=/data --inv=~/dev/ansible-inventories/ generate collectory
ala-data-generator --data=/data --inv=~/dev/ansible-inventories/ generate bie
```

Once generated, they can be uploaded to kubernetes using the `kubectl create configmap` command.

```shell
kubectl create configmap collectory-config --from-file=/data/generated-config/collectory/config
kubectl create configmap biocache-config --from-file=/data/ansible-generated/biocache/config/
kubectl create configmap bie-index-config --from-file=/data/ansible-generated/bie-index/config/
kubectl create configmap species-lists-config --from-file=/data/ansible-generated/specieslist-webapp/config/
kubectl create configmap ala-hub-config --from-file=/data/ansible-generated/ala-hub/config/
```

## Installation of components

### 1. Storage

This helm chart creates a persistent volume claims for the databases and indexes which
use standard helm charts that rely on existing volume claims. 

```shell
helm install ala-storage ala-storage -f common-values.yaml
```

### 2. Databases

```shell
helm install collectory-mysql bitnami/mysql -f collectory-mysql/values.yaml -f common-values.yaml
helm install species-lists-mysql bitnami/mysql -f species-lists-mysql/values.yaml -f common-values.yaml
helm install biocache-cassandra bitnami/cassandra -f biocache-cassandra/values.yaml -f common-values.yaml
```

### 3. Indexes
```shell
helm install solr bitnami/solr -f solr/values.yaml -f common-values.yaml
helm install solr-schemas solr-schemas -f solr-schemas/values.yaml -f common-values.yaml
```
 
### 4. Webapps
```shell
helm install species-lists species-lists -f species-lists/values.yaml -f common-values.yaml
helm install name-matching-service name-matching-service -f name-matching-service/values.yaml -f common-values.yaml
helm install sensitive-data-service sensitive-data-service -f sensitive-data-service/values.yaml -f common-values.yaml
helm install bie-index bie-index -f bie-index/values.yaml -f common-values.yaml
helm install biocache-service biocache-service -f biocache-service/values.yaml -f common-values.yaml
helm install ala-hub ala-hub -f ala-hub/values.yaml -f common-values.yaml
helm install collectory collectory -f collectory/values.yaml -f common-values.yaml
```

### 5. Data management (only required if not using managed Airflow)
```shell
helm install airflow bitnami/airflow -f airflow/values.yaml
```
