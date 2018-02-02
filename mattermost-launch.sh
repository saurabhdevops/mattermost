#!/bin/bash -x

DB_HOST=${DB_HOST:-xxxxxxxxxxxxxxxxxxxxxxxxx.rds.amazonaws.com}
DB_PORT_3306_TCP_PORT=${DB_PORT_3306_TCP_PORT:-3306}
MM_USERNAME=${DB_USER:-xxxxxxxxxx}
MM_PASSWORD=${DB_PASSWORD:-xxxxxxxxxx}
MM_DBNAME=${DB_DATABASE:-xxxxxxxxx}

echo -ne "Configure MySQL database connection..."
#sed -e 's#"DataSource": "mmuser:mostest@tcp(mysql:3306)/mattermost_test?charset=utf8mb4,utf8"#"DataSource": "'"$DB_USER:$DB_PASSWORD@tcp($DB_HOST:$DB_PORT_3306_TCP_PORT)/$DB_DATABASE?charset=utf8mb4,utf8"'"#' \
    /opt/mattermost/config/config.json > /tmp/config.json

#cat /tmp/config.json >/opt/mattermost/config/config.json
echo "done"

exec /opt/mattermost/bin/platform
