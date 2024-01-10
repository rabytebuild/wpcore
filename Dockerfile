# Use the official WordPress image
FROM wordpress:latest

# Set environment variables for MySQL connection
ENV WORDPRESS_DB_HOST=mysql \
    WORDPRESS_DB_NAME=wpcoreng \
    WORDPRESS_DB_USER=wpcoreng \
    WORDPRESS_DB_PASSWORD=palazzo

# Install wp-cli
RUN set -ex; \
    curl -o /usr/local/bin/wp -SL https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; \
    chmod +x /usr/local/bin/wp

# Expose port 80 for HTTP
EXPOSE 80

# Start Apache web server
CMD ["apache2-foreground"]

# Custom entrypoint to handle WordPress installation
COPY docker-entrypoint.sh /usr/local/bin/

# Ensure the entrypoint script is executable
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Set the custom entrypoint as the default entrypoint
ENTRYPOINT ["docker-entrypoint.sh"]
