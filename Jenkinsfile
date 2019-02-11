pipeline {
  environment {
    registry = "anishkaippilly/tomcat-workshop"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent any
  tools {maven 'MVN' }
  stages {
    stage('Test') {
      steps {
        git 'https://github.com/anishkaippilly/helloworldwar.git'
	sh 'mvn clean test'
	cleanWs()
      }
    }
    stage('package') {
       steps {
	 git 'https://github.com/anishkaippilly/helloworldwar.git'
         sh 'mvn package'
       }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
         script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
   stage('Docker Purge') {
     steps {
     sh 'docker image prune -fa'
     sh 'docker stop tomcat'
     sh 'docker rm tomcat -f'
     deleteDir()
     }
   }
   stage('Start Docker'){
     steps {
     sh 'docker run -d -p 8090:8090 --name tomcat anishkaippilly/tomcat-workshop":$BUILD_NUMBER"'
     }
   }	
  }
}
