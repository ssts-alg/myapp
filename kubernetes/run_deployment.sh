#! /bin/bash
PROJECT_VERSION=$(cat pom.xml | grep "version" | head -1 | awk '{print $1}' |  sed "s/<version>//" | sed "s/<.*//")
sed  "s/PROJECTVERSION/$PROJECT_VERSION/g" kubernetes/deployment.yaml > kubernetes/deployment1.yaml
kubectl apply -f kubernetes/deployment1.yaml
cat kubernetes/deployment1.yaml
# kubectl apply -f kubernetes/deployment.yaml
