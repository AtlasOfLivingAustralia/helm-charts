#!/bin/bash

mkdir -p repo

for dir in */; do
    if [ "$dir" != "repo" ]; then
      dir_name=$(basename "$dir")
      helm dependency update "$dir_name"
      helm package "$dir_name" -d repo
    fi
done

helm repo index repo --url https://helm-charts.ala.org.au
aws s3 sync repo s3://ala-helm-charts-dev-cdn/helm-charts
