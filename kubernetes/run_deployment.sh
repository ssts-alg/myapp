#! /bin/bash

sed  "s/PROJECTVERSION/$PROJECT_VERSION/g" kubernetes/deployment.yaml > kubernetes/deployment1.yaml
kubectl apply -f kubernetes/deployment1.yaml
# kubectl apply -f kubernetes/deployment.yaml
