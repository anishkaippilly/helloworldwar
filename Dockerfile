FROM tomcat

MAINTAINER Anish Aravindakshan "<anish.kaippilly@gmail.com>"

RUN apt-get update && apt-get -y upgrade

WORKDIR /usr/local/tomcat

RUN pwd
COPY workspace/Hello-World-War-Project/target/hello-world-war.war /usr/local/tomcat/webapps/helloworldwar.war

EXPOSE 8090
