FROM openjdk:8-jdk
#FROM tomcat:latest 이걸로 하면 Code Build 실패
MAINTAINER hyunsukgo <hyunseokjung163@gmail.com>

ENV REDIS_IP="skcc-11st-001.a4w0c4.0001.apn2.cache.amazonaws.com" \
   REDIS_PORT=6379
ENV JAVA_OPTS=-Dspring.profiles.active=docker -Dfile.encoding=euc-kr

#RUN rm -rf /usr/local/tomcat/webapps/*
COPY tomcat_env/lib/redisson-all-3.12.3.jar /usr/local/tomcat/lib/redisson-all.jar
COPY tomcat_env/lib/redisson-tomcat-8-3.12.3.jar /usr/local/tomcat/lib/redisson-tomcat.jar
COPY tomcat_env/tomcat_conf /usr/local/tomcat/conf/
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

WORKDIR /usr/local/tomcat/bin
CMD ["catalina.sh", "run"]