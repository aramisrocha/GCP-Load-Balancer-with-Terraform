#! /bin/bash
apt-get update -y && apt-get install apache2 -y && apt-get install php7.0 -y && mv /var/www/html/index.html /var/www/html/index.php &&
cat <<EOF > /var/www/html/index.php
<html><body><h2>Lab Pj03 Aramis ServerName ${HOSTNAME}</h2>
</body></html>
EOF