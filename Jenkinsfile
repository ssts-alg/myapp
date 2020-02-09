node {
    stage('SourceCodeFromGIT') {
        git credentialsId: 'GitHub', poll: false, url: 'https://github.com/suresh-devops/myapp.git'
    }
    stage('MavenBuildWithOutTests') {
      sh label: '', script: 'mvn clean package -DskipTests'
    }
    stage('MavenBuildWithOutTests') {
      sh label: '', script: 'mvn clean package'
    }
    stage('DockerBuild') {
      sh label: '', script: "docker build -t ${DOCKER_USERNAME}/my-app:0.0.0 ."
    }
    stage('DockerLogin') {
      withCredentials([usernamePassword(credentialsId: 'GitHub', passwordVariable: 'DOCKER_PASS', usernameVariable: 'DOCKER_USERNAME')]) {
        sh label: '', script: "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASS}"
      }
    }
    stage('DockerPushToDockerHub') {
      sh label: '', script: "docker push ${DOCKER_USERNAME}/my-app:0.0.0"
    }
}
