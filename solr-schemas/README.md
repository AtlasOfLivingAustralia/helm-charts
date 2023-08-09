# Install SOLR schemas

## Create configmaps

```shell
kubectl create configmap bie-solr-config \
  --from-file=bie-solr-config/admin-extra.html \
  --from-file=bie-solr-config/admin-extra.menu-bottom.html \
  --from-file=bie-solr-config/admin-extra.menu-top.html \
  --from-file=bie-solr-config/bie_stopwords.txt \
  --from-file=bie-solr-config/data-config.xml \
  --from-file=bie-solr-config/elevate.xml \
  --from-file=bie-solr-config/mapping-ISOLatin1Accent.txt \
  --from-file=bie-solr-config/protwords.txt \
  --from-file=bie-solr-config/schema.xml \
  --from-file=bie-solr-config/solrconfig.xml \
  --from-file=bie-solr-config/spellings.txt \
  --from-file=bie-solr-config/stopwords.txt \
  --from-file=bie-solr-config/synonyms.txt
```

```shell
kubectl create configmap biocache-solr-config \
  --from-file=biocache-solr-config/elevate.xml \
  --from-file=biocache-solr-config/managed-schema \
  --from-file=biocache-solr-config/protwords.txt \
  --from-file=biocache-solr-config/solrconfig.xml \
  --from-file=biocache-solr-config/stopwords.txt \
  --from-file=biocache-solr-config/synonyms.txt
```

```shell
helm install solr-schemas . -f values.yaml
```