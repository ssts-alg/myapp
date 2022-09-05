#! /bin/bash

project_version=$(echo $PROJECT_VERSION)
# PROJECT_VERSION=$(cat pom.xml | grep "version" | head -1 | awk '{print $1}' |  sed "s/<version>//" | sed "s/<.*//")
sed -i "s/PROJECTVERSION/$project_version/g" kubernetes/deployment.yaml
cat kubernetes/deployment.yaml
kubectl apply -f kubernetes/deployment.yaml
# kubectl apply -f kubernetes/deployment.yaml
