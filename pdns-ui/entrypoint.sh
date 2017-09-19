#!/bin/sh

/usr/local/bin/confd --onetime --backend env

cd /opt/local/powerdns-admin

mkdir -p data/upload/avatar

. flask/bin/activate

./create_db.py
./db_upgrade.py

exec gunicorn -w ${PDNS_ADMIN_NUM_PROCESSES-2} -b 0.0.0.0:80 app:app
