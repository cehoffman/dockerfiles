FROM quay.io/cehoffman/pdns-base

COPY pdns.conf.tmpl /etc/confd/templates/
COPY pdns.toml /etc/confd/conf.d/

ENTRYPOINT ["/usr/local/bin/confd"]
CMD ["--onetime", "--backend", "env"]
