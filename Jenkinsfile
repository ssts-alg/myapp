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
      sh label: '', script: 'docker build -t devopsmptech/my-app:0.0.0 .'
    }
    stage('DockerLogin') {
      sh label: '', script: 'docker login -u devopsmptech -p dockerhub.com'
    }
    stage('DockerPushToDockerHub') {
      sh label: '', script: 'docker push devopsmptech/my-app:0.0.0'
    }
}
