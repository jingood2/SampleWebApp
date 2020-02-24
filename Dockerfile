FROM tomcat:latest
MAINTAINER hyunsukgo <hyunseokjung163@gmail.com>

ARG conf
ARG warpath
ARG lib

RUN rm -rf /usr/local/tomcat/webapps/*
COPY $conf/* /usr/local/tomcat/conf/
COPY $warpath /usr/local/tomcat/webapps/ROOT.war
COPY $lib/* /usr/local/tomcat/lib/

WORKDIR /usr/local/tomcat/bin
CMD ["catalina.sh", "run"]
