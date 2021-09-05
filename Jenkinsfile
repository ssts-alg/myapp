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
    stage('Building Docker Image ') {
      steps {
        sh 'pwd'
        sh 'ls'
        // sh 'docker build -t sureshbabualg/myapp:0.0.0 .'
      }

    }
  }
}
