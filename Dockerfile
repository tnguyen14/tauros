FROM jenkins:2.7.2-alpine
MAINTAINER Tri Nguyen <tnguyen@demandware.com>

USER root
RUN apk add --no-cache nodejs

RUN chown -R jenkins /usr/lib/node_modules /usr/bin /usr/share

RUN npm install -g dwupload

USER jenkins
COPY plugins.txt /usr/share/jenkins/ref/
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt
ENV JAVA_OPTS -Duser.timezone=America/New_York
