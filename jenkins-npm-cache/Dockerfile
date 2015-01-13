FROM busybox
MAINTAINER Matt Smith <mtscout6@gmail.com>

RUN mkdir -p /home/jenkins/.npm \
  && chown -R default:default /home/jenkins/.npm

VOLUME /home/jenkins/.npm

CMD ["true"]
