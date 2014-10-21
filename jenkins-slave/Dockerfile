FROM ubuntu:14.04
MAINTAINER Matt Smith <mtscout6@gmail.com>

RUN useradd --create-home -G users jenkins  \
  && echo "jenkins:jenkins" | chpasswd \
  && apt-get update -y \
  && apt-get install -y --no-install-recommends \
    git \
    openssh-server \
    openjdk-7-jdk \
  && mkdir -p /var/run/sshd \
  && rm -rf /var/lib/apt/lists/*

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
