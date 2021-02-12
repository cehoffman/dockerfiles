FROM quay.io/cehoffman/pdns-base:4.4

COPY pdns.conf.tmpl /etc/confd/templates/
COPY pdns.toml /etc/confd/conf.d/
COPY entrypoint.sh /bin/

EXPOSE 53
EXPOSE 53/udp
EXPOSE 80

ENTRYPOINT ["/bin/entrypoint.sh"]
