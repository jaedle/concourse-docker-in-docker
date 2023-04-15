FROM alpine:3.17

ENV DOCKER_CHANNEL=stable \
    DOCKER_VERSION=23.0.3

RUN apk --update --no-cache add \
        bash \
        curl \
        device-mapper \
        iptables \
        util-linux \
        ca-certificates \
        make

RUN curl -fL "https://download.docker.com/linux/static/${DOCKER_CHANNEL}/x86_64/docker-${DOCKER_VERSION}.tgz" | tar zx && \
  mv /docker/* /bin/ && chmod +x /bin/docker*

COPY entrypoint.sh /bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
