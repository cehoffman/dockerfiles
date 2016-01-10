#!/bin/sh

/usr/local/bin/confd --onetime --backend env

cd /opt/local/powerdns-admin

. flask/bin/activate

./create_db.py
./db_upgrade.py

# PowerDNS 4.0 change the url of the API to include /api/v1
sed "s/'\/server/'\/api\/v1\/server/g" -i app/models.py

gunicorn -w ${PDNS_ADMIN_NUM_PROCESSES-2} -b 0.0.0.0:80 app:app
