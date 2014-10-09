FROM jenkins:1.583
MAINTAINER Matt Smith <mtscout6@gmail.com>

USER root

RUN \
  curl -L https://updates.jenkins-ci.org/latest/git.hpi -o /tmp/WEB-INF/plugins/git.hpi && \
  curl -L https://updates.jenkins-ci.org/latest/git-client.hpi -o /tmp/WEB-INF/plugins/git-client.hpi

#RUN apt-get update -y \
#  && apt-get install -y --no-install-recommends \
#  && rm -rf /var/lib/apt/lists/* \

USER jenkins
