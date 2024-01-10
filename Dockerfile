# Use the official PHP image with Apache
FROM php:latest

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Install necessary extensions and packages
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libzip-dev \
    unzip \
    && docker-php-ext-install -j$(nproc) iconv pdo pdo_mysql mysqli gd zip

# Download and install WordPress
RUN curl -O https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz --strip-components=1 && \
    rm latest.tar.gz && \
    chown -R www-data:www-data /var/www/html

# Cleanup
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Expose port 80 for HTTP
EXPOSE 80

# Start Apache web server
CMD ["apache2-foreground"]
