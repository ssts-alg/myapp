pipeline {
  agent any
  environment {
  DOCKER_TOKEN = credentials("DockerHub")
  }
  options { buildDiscarder(logRotator(numToKeepStr: '10')) }
  stages {
        stage('Docker Login') {
            steps {
                echo 'Hello, Docker Login'
                sh 'printenv'
                sh 'docker --version'
                sh "docker login -u ${DOCKER_TOKEN_USR} -p ${DOCKER_TOKEN_PSW}"
            }
        }
        stage('Build') {
            agent { docker 'maven:3-alpine' }
            steps {
                echo 'Hello, Maven'
                sh 'mvn --version'
                // sh 'mvn clean package'
            }
        }
        stage('Publish') {
            steps {
                sh 'chmod +x ./scripts/upload_to_s3.sh'
                sh './scripts/upload_to_s3.sh'
            }
        }
        stage('Python') {
          agent {
              docker {
                  image 'python:latest'
              }
            }
            steps {
                sh '''
                python --version
                '''
            }
        }

    stage('Terraform') {
      agent {
          docker {
              image 'devopsmptech/terrafom:latest'
              args '-i --entrypoint='
          }
        }
        steps {
          sh "terraform --version"
            // sh '''
            // echo "kannan"
            // terraform --version
            // // cd terraform/
            // // terraform init
            // // terraform plan
            // '''
        }
    }
    stage('Ansible') {
      agent {
          docker {
              image 'devopsmptech/ansible:0.0.1'
          }
        }
        steps {
          sh "ansible --version"
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
