FROM tomcat

MAINTAINER Anish Aravindakshan "<anish.kaippilly@gmail.com>"

RUN apt-get update && apt-get -y upgrade

WORKDIR /usr/local/tomcat

#COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
#COPY context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml

COPY helloworldwar.war /usr/local/tomcat/webapps/helloworldwar.war

EXPOSE 8090
