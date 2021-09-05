pipeline {
  agent any
  environment {
    USER_NAME = "Mahesh"
    AWS_REGION = "us-west-2"

  }
  stages {
    stage('Maven Build') {
      steps {
        sh 'mvn clean package'
      }

    }
    stage('Building Docker Image') {
      steps {
        sh 'docker build -t sureshbabualg/myapp:0.0.0 .'
      }

    }
    stage('Push Docker Image') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'docker-creds', passwordVariable: 'DOCKER_PASSWD', usernameVariable: 'DOCKER_USERNAME')]) {
          sh 'docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWD}'
          sh 'docker push sureshbabualg/myapp:0.0.0'
        }
      }
    }
  }
}
