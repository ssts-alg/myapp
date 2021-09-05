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
  }
}
