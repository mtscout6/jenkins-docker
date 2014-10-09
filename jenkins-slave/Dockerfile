FROM ubuntu:14.04
MAINTAINER Matt Smith <mtscout6@gmail.com>

RUN useradd -u 102 jenkins \
  && echo "jenkins:jenkins" | chpasswd \
  && apt-get update -y \
  && apt-get install -y --no-install-recommends \
    git \
    openssh-server \
    openjdk-7-jdk \
  && mkdir -p /var/run/sshd \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir -p /home/jenkins \
  && chown 102:106 /home/jenkins

EXPOSE 22

CMD ["/use/sbin/sshd", "-D"]
