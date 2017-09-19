FROM quay.io/cehoffman/debian

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      gcc \
      libldap2-dev \
      libmysqlclient-dev \
      libpq-dev \
      libsasl2-dev \
      python \
      python-dev \
      python-pip && \
    mkdir -p /opt/local/powerdns-admin && cd /opt/local/powerdns-admin && \
    wget -qO- https://github.com/ngoduykhanh/PowerDNS-Admin/archive/e49510c028bec908306e0578523783898a992936.tar.gz | tar -zxf - --strip-components=1 && \
    pip install virtualenv && \
    virtualenv flask && \
    . flask/bin/activate && \
    pip install gunicorn psycopg2 && \
    pip install -r /opt/local/powerdns-admin/requirements.txt && \
    apt-get purge -y --auto-remove gcc python-dev python-pip && \
    rm -rf /var/lib/apt/lists/*

COPY powerdns-admin.py.tmpl /etc/confd/templates/
COPY powerdns-admin.toml /etc/confd/conf.d/
COPY entrypoint.sh /bin/

EXPOSE 80

ENTRYPOINT ["/bin/entrypoint.sh"]

