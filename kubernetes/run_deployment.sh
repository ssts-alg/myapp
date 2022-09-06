#! /bin/bash

project_version=$(echo $PROJECT_VERSION)
sed -i "s/PROJECTVERSION/$project_version/g" kubernetes/deployment.yaml
cat kubernetes/deployment.yaml
kubectl apply -f kubernetes/deployment.yaml
