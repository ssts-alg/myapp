#! /bin/bash

sed -i 's|version: .*|PROJECTVERSION: "${PROJECT_VERSION}"|' kubernetes/deployment.yaml
kubectl apply -f kubernetes/deployment.yaml
