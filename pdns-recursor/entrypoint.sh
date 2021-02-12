#!/bin/sh

if [ -n "$RECURSOR_FORWARD_ZONES" ]; then
  eval "RECURSOR_FORWARD_ZONES=\"$RECURSOR_FORWARD_ZONES\""
  export RECURSOR_FORWARD_ZONES
fi

/usr/local/bin/confd --onetime --backend env

mkdir -p "/var/run/pdns-recursor"
chown root:pdns "/var/run/pdns-recursor"

exec pdns_recursor
