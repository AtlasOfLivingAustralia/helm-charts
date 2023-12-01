# ALA storage installation

This chart setups up a storage class and persistent volume claims for MySQL, Cassandra and SOLR.

## Install helm package with values.yml

```shell
helm install ala-storage . -f ../common-values.yaml
```