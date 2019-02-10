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
            environment {
                TOMCAT_CREDS = credentials('tomcat-credentials')
                TOMCAT_URL = credentials('tomcat-url')
            }
            steps {
#                sh 'curl -s --upload-file ${WORKSPACE}/target/argentum-web.war "http://${TOMCAT_CREDS_USR}:${TOMCAT_CREDS_PSW}@${TOMCAT_URL}:8080/manager/text/deploy?path=/argentum-web&update=true"'
                sh 'docker build -t anishkaippilly/tomcat .'
		sh 'docker stop tomcat'
		sh 'docker rm tomcat'
		sh 'docker run -d -p 8090:8080 --name tomcat anishkaippilly/tomcat'
            }
        }
    }
}
