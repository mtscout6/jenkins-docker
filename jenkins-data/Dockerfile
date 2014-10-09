#FROM busybox
FROM ubuntu:14.04
MAINTAINER Matt Smith <mtscout6@gmail.com>

RUN useradd -u 102 jenkins \
  && mkdir -p /var/jenkins_home \
  && chown -R 102:106 /var/jenkins_home

#RUN mkdir -p /var/jenkins_home

VOLUME /var/jenkins_home

CMD ["true"]
