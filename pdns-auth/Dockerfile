FROM quay.io/cehoffman/pdns-base

COPY pdns.conf.tmpl /etc/confd/templates/
COPY pdns.toml /etc/confd/conf.d/
COPY entrypoint.sh /bin/

ENTRYPOINT ["/bin/entrypoint.sh"]
