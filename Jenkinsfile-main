pipeline {
  agent any
  environment {
  DOCKER_TOKEN = credentials("DockerHub")
  GIT_PRIVATE = credentials("GitHub")

  }
  options { buildDiscarder(logRotator(numToKeepStr: '10')) }
  stages {
    stage('Ansible') {
        steps {
         withCredentials([usernameColonPassword(credentialsId: 'GitHub', variable: 'GIT_PRIVATE')]) {
          sh '''
          ansible --version
          export ANSIBLE_HOST_KEY_CHECKING=False
          ./ansible/run_ansible.sh
          '''
        }
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
