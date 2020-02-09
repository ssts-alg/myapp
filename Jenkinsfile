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
    stage('DockerBuild1') {
      sh label: '', script: 'docker build -t devopsmptech/my-app:0.0.0 .'
    }
}
