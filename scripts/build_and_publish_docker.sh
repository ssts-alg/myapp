#! /bin/bash

mvn clean package

project_version=$(cat pom.xml  | grep "<version>" | head -1 | awk '{print $1}' | sed "s/<version>//" | sed "s/<.*//")

docker build -t myapp .

docker tag myapp:latest 380377972418.dkr.ecr.us-east-1.amazonaws.com/myapp:$project_version

docker tag myapp:latest devopsmptech/myapp:$project_version


aws configure set region us-east-1

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 380377972418.dkr.ecr.us-east-1.amazonaws.com

docker push 380377972418.dkr.ecr.us-east-1.amazonaws.com/myapp:$project_version


docker login -u $DOCKER_HUB_USERNAME -p $DOCKER_HUB_PASSWORD

docker push devopsmptech/myapp:$project_version
