FROM tomcat:latest
MAINTAINER jingood2 <jingood2@sk.com>

ENV REDIS_IP="0.tcp.ngrok.io" \
    REDIS_PORT=14518

RUN rm -rf /usr/local/tomcat/webapps/*
COPY tomcat_env/tomcat_conf /usr/local/tomcat/conf/
COPY tomcat_env/tomcat_conf /usr/local/tomcat/lib/
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

WORKDIR /usr/local/tomcat/bin
CMD ["catalina.sh", "run"]