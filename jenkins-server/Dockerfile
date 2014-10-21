FROM jenkins:1.583
MAINTAINER Matt Smith <mtscout6@gmail.com>

USER root

RUN apt-get update -y \
  && apt-get install -y --no-install-recommends \
    ca-certificates \
  && rm -rf /var/lib/apt/lists/*

# TODO: Remove --insecure flag from curl since that's 'insecure' darn corporate firewall....
RUN  mkdir -p /tmp/META-INF \
  && mkdir -p /tmp/WEB-INF/plugins \
  && curl -L https://updates.jenkins-ci.org/download/plugins/scm-api/0.2/scm-api.hpi -o /tmp/WEB-INF/plugins/scm-api.hpi --insecure \
  && curl -L https://updates.jenkins-ci.org/download/plugins/git/2.2.7/git.hpi -o /tmp/WEB-INF/plugins/git.hpi --insecure \
  && curl -L https://updates.jenkins-ci.org/download/plugins/git-client/1.10.2/git-client.hpi -o /tmp/WEB-INF/plugins/git-client.hpi --insecure \
  && curl -L https://updates.jenkins-ci.org/download/plugins/multi-branch-project-plugin/0.1.2/multi-branch-project-plugin.hpi -o /tmp/WEB-INF/plugins/multi-branch-project-plugin.hpi --insecure \
  && curl -L https://updates.jenkins-ci.org/download/plugins/durable-task/0.7/durable-task.hpi -o /tmp/WEB-INF/plugins/durable-task.hpi --insecure \
  && curl -L https://updates.jenkins-ci.org/download/plugins/docker-plugin/0.8/docker-plugin.hpi -o /tmp/WEB-INF/plugins/docker-plugin.hpi --insecure \
  && curl -L https://updates.jenkins-ci.org/download/plugins/credentials/1.18/credentials.hpi -o /tmp/WEB-INF/plugins/credentials.hpi --insecure \
  && curl -L https://updates.jenkins-ci.org/download/plugins/ssh-credentials/1.9/ssh-credentials.hpi -o /tmp/WEB-INF/plugins/ssh-credentials.hpi --insecure \
  && curl -L https://updates.jenkins-ci.org/download/plugins/ssh-slaves/1.8/ssh-slaves.hpi -o /tmp/WEB-INF/plugins/ssh-slaves.hpi --insecure \
  && curl -L https://updates.jenkins-ci.org/download/plugins/rebuild/1.22/rebuild.hpi -o /tmp/WEB-INF/plugins/rebuild.hpi --insecure \
  && curl -L https://updates.jenkins-ci.org/download/plugins/copyartifact/1.32/copyartifact.hpi -o /tmp/WEB-INF/plugins/copyartifact.hpi --insecure \
  && curl -L https://updates.jenkins-ci.org/download/plugins/token-macro/1.10/token-macro.hpi -o /tmp/WEB-INF/plugins/token-macro.hpi --insecure \
  && curl -L https://updates.jenkins-ci.org/download/plugins/run-condition/1.0/run-condition.hpi -o /tmp/WEB-INF/plugins/run-condition.hpi --insecure \
  && curl -L https://updates.jenkins-ci.org/download/plugins/conditional-buildstep/1.3.3/conditional-buildstep.hpi -o /tmp/WEB-INF/plugins/conditional-buildstep.hpi --insecure \
  && curl -L https://updates.jenkins-ci.org/download/plugins/timestamper/1.5.14/timestamper.hpi -o /tmp/WEB-INF/plugins/timestamper.hpi --insecure \
  && unzip -p /usr/share/jenkins/jenkins.war META-INF/MANIFEST.MF \
    | sed "/^\s*$/q" \
    > /tmp/META-INF/MANIFEST.MF

# Install Role strategy plugin ? Determine after getting LDAP setup.

RUN cd /tmp \
  && zip -d /usr/share/jenkins/jenkins.war META-INF/JENKINS.SF \
  && zip -d /usr/share/jenkins/jenkins.war META-INF/JENKINS.RSA \
  && zip --grow /usr/share/jenkins/jenkins.war META-INF/MANIFEST.MF \
  && zip -d /usr/share/jenkins/jenkins.war WEB-INF/plugins/ant.hpi \
  && zip -d /usr/share/jenkins/jenkins.war WEB-INF/plugins/cvs.hpi \
  && zip -d /usr/share/jenkins/jenkins.war WEB-INF/plugins/translation.hpi \
  && zip --grow /usr/share/jenkins/jenkins.war WEB-INF/plugins/scm-api.hpi \
  && zip --grow /usr/share/jenkins/jenkins.war WEB-INF/plugins/git.hpi \
  && zip --grow /usr/share/jenkins/jenkins.war WEB-INF/plugins/git-client.hpi \
  && zip --grow /usr/share/jenkins/jenkins.war WEB-INF/plugins/multi-branch-project-plugin.hpi \
  && zip --grow /usr/share/jenkins/jenkins.war WEB-INF/plugins/durable-task.hpi \
  && zip --grow /usr/share/jenkins/jenkins.war WEB-INF/plugins/docker-plugin.hpi \
# TODO: Resolve with result from https://issues.jenkins-ci.org/browse/JENKINS-25153
  && zip --grow /usr/share/jenkins/jenkins.war WEB-INF/plugins/credentials.hpi \
  && zip --grow /usr/share/jenkins/jenkins.war WEB-INF/plugins/ssh-slaves.hpi \
  && zip --grow /usr/share/jenkins/jenkins.war WEB-INF/plugins/ssh-credentials.hpi \
  && zip --grow /usr/share/jenkins/jenkins.war WEB-INF/plugins/rebuild.hpi \
  && zip --grow /usr/share/jenkins/jenkins.war WEB-INF/plugins/copyartifact.hpi \
  && zip --grow /usr/share/jenkins/jenkins.war WEB-INF/plugins/token-macro.hpi \
  && zip --grow /usr/share/jenkins/jenkins.war WEB-INF/plugins/run-condition.hpi \
  && zip --grow /usr/share/jenkins/jenkins.war WEB-INF/plugins/conditional-buildstep.hpi \
  && zip --grow /usr/share/jenkins/jenkins.war WEB-INF/plugins/timestamper.hpi \
  && rm -rf /tmp/WEB-INF

#Timezone
# TODO: This isn't working figure this out
COPY sysconfig/jenkins /etc/sysconfig/jenkins

USER jenkins
