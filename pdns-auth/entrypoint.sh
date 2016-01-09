#!/bin/sh

/usr/local/bin/confd --onetime --backend env
exec pdns_server
