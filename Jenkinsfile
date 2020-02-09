node {
    stage('SourceCodeFromGIT') {
        git credentialsId: 'GitHub', poll: false, url: 'https://github.com/suresh-devops/myapp.git'
    }
    VERSION = sh (
      script: 'sh scripts/project_version.sh',
      returnStdout: true
      ).trim()
    stage('MavenBuildWithOutTests') {
      sh label: '', script: 'mvn clean package -DskipTests'
    }
    stage('MavenBuildWithOutTests') {
      sh label: '', script: 'mvn clean package'
    }
    stage('DockerBuild') {
      withCredentials([usernamePassword(credentialsId: 'DockerHub', passwordVariable: 'DOCKER_PASS', usernameVariable: 'DOCKER_USERNAME')]) {
        sh label: '', script: "docker build -t ${DOCKER_USERNAME}/my-app:${VERSION} ."
      }
    }
    stage('DockerLogin') {
      withCredentials([usernamePassword(credentialsId: 'DockerHub', passwordVariable: 'DOCKER_PASS', usernameVariable: 'DOCKER_USERNAME')]) {
        sh label: '', script: "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASS}"
      }
    }
    stage('DockerPushToDockerHub') {
      withCredentials([usernamePassword(credentialsId: 'DockerHub', passwordVariable: 'DOCKER_PASS', usernameVariable: 'DOCKER_USERNAME')]) {
        sh label: '', script: "docker push ${DOCKER_USERNAME}/my-app:${VERSION}"
      }
    }
    stage('DeployOnDevSever') {
    withCredentials([usernamePassword(credentialsId: 'DockerHub', passwordVariable: 'DOCKER_PASS', usernameVariable: 'DOCKER_USERNAME')]) {
      sshagent(['ec2-user']) {
        sh label: '', script: "scripts/deploy_on_dev.sh"
    }
  }
  stage('SendEmail') {
    mail bcc: '', body: 'Job Was Successfully Build', cc: '', from: '', replyTo: '', subject: 'Myapp', to: 'devops.mptech@gmail.com'
  }
}
