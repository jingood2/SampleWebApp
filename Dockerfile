FROM tomcat:latest
MAINTAINER hyunsukgo <hyunseokjung163@gmail.com>

ENV REDIS_IP="skcc-11st.a4w0c4.ng.0001.apn2.cache.amazonaws.com" \
    REDIS_PORT=6379
ENV REDISSON_ALL_URL https://repository.sonatype.org/service/local/artifact/maven/redirect?r=central-proxy&g=org.redisson&a=redisson-all&v=3.12.1&e=jar
ENV REDISSON_TOMCAT_URL https://repository.sonatype.org/service/local/artifact/maven/redirect?r=central-proxy&g=org.redisson&a=redisson-tomcat-8&v=3.12.1&e=jar
ARG conf
ARG warpath
ARG lib

RUN rm -rf /usr/local/tomcat/webapps/*
RUN curl -fsSL $REDISSON_ALL_URL -o /usr/local/tomcat/lib/redisson-all.jar
RUN curl -fsSL $REDISSON_TOMCAT_URL -o /usr/local/tomcat/lib/redisson-tomcat.jar
COPY tomcat_env/tomcat_conf /usr/local/tomcat/conf/
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

WORKDIR /usr/local/tomcat/bin
CMD ["catalina.sh", "run"]
