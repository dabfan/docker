FROM docker:stable
MAINTAINER Dabija Afanasie <faneldabija2008@gmail.com>

ENV NODE_VERSION 6-alpine
ENV NODE_LOGLEVEL error

RUN apk update && apk upgrade && \
    apk --no-cache add py-pip curl openssh-client bash git bc && \
    pip install docker-compose awscli ecs-deploy && \
    printf "#!/bin/sh\ndocker run --rm -t -v \$PWD:/app --workdir /app -e NPM_CONFIG_LOGLEVEL=\$NODE_LOGLEVEL node:\$NODE_VERSION npm install" > /usr/local/bin/npm-install && \
    git clone https://github.com/titanium-codes/cibu.git /tmp/cibu && \
    mkdir -p /opt/cibu && mv /tmp/cibu/cibu/* /opt/cibu/ && mv /tmp/cibu/bin /usr/local/bin/cibu && \
    rm -rf /tmp/cibu && chmod +x /usr/local/bin/*
