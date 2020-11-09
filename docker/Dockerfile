FROM node:12.19.0-buster
ADD job.sh /
ENV WSK_INSTALL=https://github.com/apache/openwhisk-cli/releases/download/1.0.0/OpenWhisk_CLI-1.0.0-linux-amd64.tgz
RUN curl -sL ${WSK_INSTALL} | tar xzvf - -C /usr/bin wsk

CMD ["/job.sh"]

