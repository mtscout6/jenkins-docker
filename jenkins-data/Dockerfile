FROM busybox
MAINTAINER Matt Smith <mtscout6@gmail.com>

RUN mkdir -p /var/jenkins_home \
  && chown -R default /var/jenkins_home

VOLUME /var/jenkins_home

CMD ["true"]
