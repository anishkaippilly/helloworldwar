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
        stage('03 - Deploy') {
            steps {
//                sh 'curl -s --upload-file ${WORKSPACE}/target/argentum-web.war "http://${TOMCAT_CREDS_USR}:W}@${TOMCAT_URL}:8080/"'
                sh 'docker build -t anishkaippilly/tomcat .'
		sh 'docker stop tomcat'
		sh 'docker rm tomcat'
		sh 'docker run -d -p 8090:8080 --name tomcat anishkaippilly/tomcat'
            }
        }
    }
}
