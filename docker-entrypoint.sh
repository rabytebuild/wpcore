#!/bin/bash
set -e

# Wait for the MySQL database to be ready
until wp core is-installed --path=/var/www/html; do
  >&2 echo "WordPress is unavailable - sleeping"
  sleep 5
done

# Install WordPress if not installed
if [ ! -e /var/www/html/wp-config.php ]; then
  wp core install --url=http://localhost:80 --title="Your Site" --admin_user=admin --admin_password=admin --admin_email=admin@example.com --path=/var/www/html
fi

# Continue with the default entrypoint
exec docker-entrypoint.sh "$@"
