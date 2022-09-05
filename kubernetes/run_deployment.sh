#! /bin/bash

cat kubernetes/deployment.yaml | sed -i "s/PROJECTVERSION/${PROJECT_VERSION}/g" > kubernetes/deployment1.yaml
cat kubernetes/deployment1.yaml
kubectl apply -f kubernetes/deployment1.yaml
