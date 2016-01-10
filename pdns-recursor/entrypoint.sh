#!/bin/sh

if [ -n "$RECURSOR_FORWARD_ZONES" ]; then
  eval "RECURSOR_FORWARD_ZONES=\"$RECURSOR_FORWARD_ZONES\""
  export RECURSOR_FORWARD_ZONES
fi

/usr/local/bin/confd --onetime --backend env

exec pdns_recursor
