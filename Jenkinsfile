pipeline {
  agent any
  environment {
  DOCKER_TOKEN = credentials("DockerHub")
  }
  options { buildDiscarder(logRotator(numToKeepStr: '10')) }
  stages {
    stage('Ansible') {
        steps {
          sh '''
          ansible --version
          ./ansible/run_ansible.sh
          '''
        }
    }
  }
post {
  always {
          sh '''
            echo "I will execure always"
          '''
        }
  }
}
