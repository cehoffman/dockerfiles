FROM quay.io/cehoffman/pdns-base

# Revert to an older recursor because the 4.0 version crashes when forwarding
# zones. I didn't dig into if this was the recursor or the authoritative 4.0
# causing the problem but I think it was the recursor because the authoritative
# server never logged the request
RUN apt-get update && apt-get remove -y pdns-recursor && apt-get install -y pdns-recursor=3.6.2-2+deb8u2

COPY recursor.conf.tmpl /etc/confd/templates/
COPY recursor.toml /etc/confd/conf.d/
COPY entrypoint.sh /bin/

EXPOSE 53
EXPOSE 53/udp

ENTRYPOINT ["/bin/entrypoint.sh"]
