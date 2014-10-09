FROM jenkins:1.583
MAINTAINER Matt Smith <mtscout6@gmail.com>

USER root

RUN mkdir -p /tmp/WEB-INF/plugins \
  && wget -O /tmp/WEB-INF/plugins/git.hpi https://updates.jenkins-ci.org/latest/git.hpi \
  && wget -O /tmp/WEB-INF/plugins/git-client.hpi https://updates.jenkins-ci.org/latest/git-client.hpi

#RUN apt-get update -y \
#  && apt-get install -y --no-install-recommends \
#  && rm -rf /var/lib/apt/lists/* \

USER jenkins
