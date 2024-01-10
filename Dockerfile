# Use the official WordPress image
FROM wordpress:latest

# Set the working directory to the WordPress installation
WORKDIR /var/www/html

# Copy custom themes and plugins (if needed)
# COPY custom-theme/ wp-content/themes/custom-theme/
# COPY custom-plugin/ wp-content/plugins/custom-plugin/

# Expose port 80 for the web server
EXPOSE 80

# Environment variables for configuring WordPress
ENV WORDPRESS_DB_HOST=mysql1.serv00.com
ENV WORDPRESS_DB_USER=m7754_wpcoreng
ENV WORDPRESS_DB_PASSWORD=Rabiu2004@
ENV WORDPRESS_DB_NAME=m7754_wpcoreng

# Volumes for persisting data
VOLUME /var/www/html/wp-content
VOLUME /var/www/html/plugins

# Copy the wp-config.php with custom configuration
#COPY wp-config.php /var/www/html/wp-config.php

# Switch to the root user for installation and configuration
#USER root

# Install additional tools if needed
# For example, if you need to use wp-cli, you can install it here

# Switch back to the WordPress user
USER www-data
