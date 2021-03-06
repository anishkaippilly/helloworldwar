FROM tomcat

MAINTAINER Anish Aravindakshan "<anish.kaippilly@gmail.com>"

RUN apt-get update && apt-get -y upgrade

COPY target/hello-world-war.war /usr/local/tomcat/webapps/helloworldwar.war

WORKDIR /usr/local/tomcat

EXPOSE 8090
