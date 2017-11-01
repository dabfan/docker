FROM docker:stable
MAINTAINER Dabija Afanasie <faneldabija2008@gmail.com>

RUN apk --no-cache add py-pip curl openssh-client bash git && \
    pip install docker-compose awscli ecs-deploy && \
    git clone https://github.com/titanium-codes/cibu.git /tmp/cibu && \
    mkdir -p /opt/cibu && mv /tmp/cibu/cibu/* /opt/cibu/ && mv /tmp/cibu/bin /usr/local/bin/cibu && \
    rm -rf /tmp/cibu && chmod +x /usr/local/bin/*