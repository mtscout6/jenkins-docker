FROM mtscout6/jenkins-slave
MAINTAINER Matt Smith <mtscout6@gmail.com>

RUN  apt-get update -y \
  && apt-get install -y --no-install-recommends \
    curl \
    wget \
    python \
    build-essential \
  && rm -rf /var/lib/apt/lists/* /tmp/*

RUN  mkdir -p /tmp  \
  && cd /tmp \
  && curl -L http://nodejs.org/dist/v0.10.32/node-v0.10.32.tar.gz -o node-v0.10.32.tar.gz \
  && tar xvzf node-v0.10.32.tar.gz

RUN  cd /tmp/node-v* \
  && ./configure \
  && CXX="g++ -Wno-unused-local-typedefs" make \
  && CXX="g++ -Wno-unused-local-typedefs" make install \
  && rm -rf /tmp/*

ENV DEBIAN_FRONTEND noninteractive
ENV DISPLAY :20.0

# Maybe this is the answer: http://stackoverflow.com/questions/24691790/how-do-i-get-karma-webdriver-launcher-to-use-my-selenium-server-grid

# Install Chromium. For running karma tests
RUN  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list \
  && apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    fonts-ipafont-gothic \
    xfonts-100dpi \
    xfonts-75dpi \
    xfonts-scalable \
    xfonts-cyrillic \
    lxde-core \
    lxterminal \
    x11vnc \
    xvfb \
    fluxbox \
    google-chrome-stable \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir -p ~/.vnc

# http://unix.stackexchange.com/questions/4921/sh-startup-files-over-ssh
RUN echo '\n# Node.js\nexport PATH="node_modules/.bin:$PATH"' >> /home/jenkins/.bashrc

EXPOSE 5901

# TODO: Change back to ssl when corporate firewall gets out of the way.
RUN npm config set registry http://registry.npmjs.org/ \
  && npm install npm@2.1.3 -g
