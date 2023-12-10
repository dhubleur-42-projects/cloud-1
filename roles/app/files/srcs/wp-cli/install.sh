PROTECT_FILE="/var/www/html/.wordpress_protect"

if  [ ! -f "$PROTECT_FILE" ]; then
	echo "Wordpress is not installed, installing..."

	rm -f /var/www/html/wp-config.php
	wp config create	--dbname="$WORDPRESS_DB_NAME" \
						--dbuser="$WORDPRESS_DB_USER" \
						--dbpass="$WORDPRESS_DB_PASSWORD" \
						--dbhost="$WORDPRESS_DB_HOST" \
						--path="/var/www/html" \
						--allow-root --skip-check

	/usr/local/bin/wp core install	--path=/var/www/html \
									--url="https://wordpress.$DOMAIN_NAME" \
									--title="Pouet Site" \
									--admin_user="$WP_ADMIN_USER" \
									--admin_password="$WP_ADMIN_PASSWORD" \
									--admin_email="$WP_ADMIN_EMAIL"

	touch $PROTECT_FILE

	echo "Wordpress installed !"
fi

echo "Wordpress is ready !"
exit 0