pipeline {
  agent any
  environment {
    PROJECT_VERSION = project_version().trim()

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
        # project_version=$(cat pom.xml | grep "version" | head -1 | awk '{print $1}' | sed "s/<version>//" | sed "s/<.*//")
        docker build -t sureshbabualg/myapp:${PROJECT_VERSION} .
        '''
      }

    }
    stage('Push Docker Image') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'docker-creds', passwordVariable: 'DOCKER_PASSWD', usernameVariable: 'DOCKER_USERNAME')]) {
          sh '''
         #  project_version=$(cat pom.xml | grep "version" | head -1 | awk '{print $1}' | sed "s/<version>//" | sed "s/<.*//")
          docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWD}
          docker push sureshbabualg/myapp:${PROJECT_VERSION}
          '''
        }
      }
    }
    stage('Deploy Docker Contioners') {
      steps {
        sh '''
        ssh -o StrictHostKeyChecking=no -i /var/lib/jenkins/docker.pem ec2-user@54.234.173.43 docker login -u "${DOCKER_USERNAME}" -p "${DOCKER_PASSWD}"
        ssh -o StrictHostKeyChecking=no -i /var/lib/jenkins/docker.pem ec2-user@54.234.173.43 docker pull sureshbabualg/myapp:${PROJECT_VERSION}
        '''
      }

    }
  }
}


def project_version() {
   return sh(returnStdout: true, script:"cat pom.xml | grep \"version\" | head -1 | awk \'{print \$1}\' | sed \"s/<version>//\" | sed \"s/<.*//\"")
 }
