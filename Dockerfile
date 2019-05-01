FROM jenkins/jenkins:lts-alpine
MAINTAINER Tri Nguyen <tri@tridnguyen.com>

USER root
RUN apk add --no-cache nodejs

RUN chown -R jenkins /usr/lib/node_modules /usr/bin /usr/share

USER jenkins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
ENV JAVA_OPTS -Duser.timezone=America/New_York
