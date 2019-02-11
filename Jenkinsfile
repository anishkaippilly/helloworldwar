pipeline {
    agent any
    tools {
        maven 'MVN'
    }
    stages {
        stage('01 - Test'){
            steps {
                git url: 'https://github.com/anishkaippilly/helloworldwar'
                sh 'mvn clean test'
                cleanWs()
            }
        }
        stage('02 - Package') {
            steps {
                git url: 'https://github.com/anishkaippilly/helloworldwar'
                sh 'mvn package'
            }
        }
        stage('03 - Build Image') {
	    environment {
 	    registry = "anishkaippilly/tomcat-workshop"
    	    registryCredential = ‘dockerhub’
	    dockerImage = ''
	    }
	   
            steps {
		script {
			docker.build registry + ":$BUILD_NUMBER"
		}
    	stage('04 - Deploy Image') {
      	     steps{
        	script {
          		docker.withRegistry( '', registryCredential ) {
            		dockerImage.push()
          		}
        	  }
      		}
    	   }

	    stage('05 - Remove Unused docker image') {
      		steps{
        	     sh "docker rmi $registry:$BUILD_NUMBER"
      		     }
                }

//                sh 'docker build -t anishkaippilly/tomcat .'
//		sh 'docker stop tomcat'
//		sh 'docker rm tomcat'
//		sh 'docker run -d -p 8090:8080 --name tomcat anishkaippilly/tomcat'
//            }
        }
    }
}
