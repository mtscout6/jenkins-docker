FROM jenkins:1.583
MAINTAINER Matt Smith <mtscout6@gmail.com>

USER root

RUN apt-get update -y \
  && apt-get install -y --no-install-recommends \
    ca-certificates \
  && rm -rf /var/lib/apt/lists/*

# TODO: Remove --insecure flag from curl since that's 'insecure'
RUN mkdir -p /tmp/WEB-INF/plugins \
  && curl -L https://updates.jenkins-ci.org/latest/scm-api.hpi -o /tmp/WEB-INF/plugins/scm-api.hpi --insecure \
  && curl -L https://updates.jenkins-ci.org/latest/git.hpi -o /tmp/WEB-INF/plugins/git.hpi --insecure \
  && curl -L https://updates.jenkins-ci.org/latest/git-client.hpi -o /tmp/WEB-INF/plugins/git-client.hpi --insecure \
  && curl -L https://updates.jenkins-ci.org/latest/multi-branch-project-plugin.hpi -o /tmp/WEB-INF/plugins/multi-branch-project-plugin.hpi --insecure \
  && curl -L https://updates.jenkins-ci.org/latest/durable-task.hpi -o /tmp/WEB-INF/plugins/durable-task.hpi --insecure \
  && curl -L https://updates.jenkins-ci.org/latest/docker-plugin.hpi -o /tmp/WEB-INF/plugins/docker-plugin.hpi --insecure
# TODO: Updated ssh slaves and ssh credentials plugins

WORKDIR /tmp

RUN  zip --grow /usr/share/jenkins/jenkins.war WEB-INF/plugins/scm-api.hpi \
  && zip --grow /usr/share/jenkins/jenkins.war WEB-INF/plugins/git.hpi \
  && zip --grow /usr/share/jenkins/jenkins.war WEB-INF/plugins/git-client.hpi \
  && zip --grow /usr/share/jenkins/jenkins.war WEB-INF/plugins/multi-branch-project-plugin.hpi \
  && zip --grow /usr/share/jenkins/jenkins.war WEB-INF/plugins/durable-task.hpi \
  && zip --grow /usr/share/jenkins/jenkins.war WEB-INF/plugins/docker-plugin.hpi \
  && rm -rf /tmp/WEB-INF

WORKDIR /

USER jenkins
