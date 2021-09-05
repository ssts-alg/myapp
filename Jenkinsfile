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
        sh '''
        project_version=$(cat pom.xml | grep "version" | head -1 | awk '{print $1}' | sed "s/<version>//" | sed "s/<.*//")
        docker build -t sureshbabualg/myapp:$project_version .
        '''
      }

    }
    stage('Push Docker Image') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'docker-creds', passwordVariable: 'DOCKER_PASSWD', usernameVariable: 'DOCKER_USERNAME')]) {
          sh '''
          project_version=$(cat pom.xml | grep "version" | head -1 | awk '{print $1}' | sed "s/<version>//" | sed "s/<.*//")
          docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWD}'
          docker push sureshbabualg/myapp:$project_version
          '''
        }
      }
    }
  }
}













def getpom_version() {
   return sh(returnStdout: true, script:"cat flute/_version.py | grep __version_ | awk '{print \$3}'")
 }
