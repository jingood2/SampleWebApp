FROM tomcat:latest
MAINTAINER hyunsukgo <hyunseokjung163@gmail.com>

ENV REDIS_IP="skcc-11st-001.a4w0c4.0001.apn2.cache.amazonaws.com" \
   REDIS_PORT=6379
#ENV REDISSON_ALL_URL https://repo1.maven.org/maven2/org/redisson/redisson-all/3.12.3/redisson-all-3.12.3.jar
#ENV REDISSON_TOMCAT_URL https://repo1.maven.org/maven2/org/redisson/redisson-tomcat-8/3.12.3/redisson-tomcat-8-3.12.3.jar
ENV JAVA_OPTS=-Dspring.profiles.active=docker -Dfile.encoding=euc-kr

#RUN rm -rf /usr/local/tomcat/webapps/*
#RUN curl -fsSL $REDISSON_ALL_URL -o /usr/local/tomcat/lib/redisson-all.jar
#RUN curl -fsSL $REDISSON_TOMCAT_URL -o /usr/local/tomcat/lib/redisson-tomcat.jar
COPY tomcat_env/lib/redisson-all-3.12.3.jar /usr/local/tomcat/lib/redisson-all.jar
COPY tomcat_env/lib/redisson-tomcat-8-3.12.3.jar /usr/local/tomcat/lib/redisson-tomcat.jar
COPY tomcat_env/tomcat_conf /usr/local/tomcat/conf/
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

WORKDIR /usr/local/tomcat/bin
CMD ["catalina.sh", "run"]