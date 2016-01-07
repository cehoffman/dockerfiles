FROM quay.io/cehoffman/debian

RUN rm -rf /var/lib/apt/lists/* && { \
        echo deb http://repo.powerdns.com/debian jessie-auth-40 main; \
        echo deb http://repo.powerdns.com/debian jessie-rec-40 main; \
    } > /etc/apt/sources.list.d/pdns.list && { \
        echo Package: pdns-*; \
        echo Pin: origin repo.powerdns.com; \
        echo Pin-Priority: 600; \
    } > /etc/apt/preferences.d/pdns && \
    wget -O- https://repo.powerdns.com/FD380FBB-pub.asc | apt-key add - && \
    apt-get update && \
    apt-get install -y --no-install-recommends pdns-recursor pdns-server pdns-backend-pgsql && \
    rm -rf /var/lib/apt/lists/*
