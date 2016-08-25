FROM jenkinsci/jenkins:2.19
MAINTAINER Tri Nguyen <tnguyen@demandware.com>

USER root
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get update && apt-get install -y nodejs

RUN chown -R jenkins /usr/lib/node_modules /usr/bin /usr/share

RUN npm install -g dwupload

USER jenkins
COPY plugins.txt /usr/share/jenkins/ref/
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt
ENV JAVA_OPTS -Duser.timezone=America/New_York
