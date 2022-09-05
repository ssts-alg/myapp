#! /bin/bash

sed -i 's|version: .*|PROJECTVERSION: "${PROJECT_VERSION}"|' app.ymlcat kubernetes/deployment1.yaml
kubectl apply -f kubernetes/deployment1.yaml
