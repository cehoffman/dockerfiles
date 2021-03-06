FROM debian:buster-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV GOSU_VERSION 1.12
ENV CONFD_VERSION 0.16.0

RUN apt-get update && \
    apt-get install -y --no-install-recommends locales gnupg2 && \
    rm -rf /var/lib/apt/lists/* && \
    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.utf8

RUN gpg --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 && \
    apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y --no-install-recommends ca-certificates wget && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /etc/confd/{conf.d,templates} && \
    wget -qO /usr/local/bin/confd https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-$(dpkg --print-architecture) && \
    wget -qO /usr/local/bin/gosu http://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture) && \
    wget -qO /usr/local/bin/gosu.asc http://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture).asc && \
    gpg --verify /usr/local/bin/gosu.asc && \
    rm /usr/local/bin/gosu.asc && \
    chmod +x /usr/local/bin/gosu /usr/local/bin/confd && \
    rm -rf /root/.gnupg
