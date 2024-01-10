# Use the official WordPress image
FROM wordpress:latest

# Expose port 80 for HTTP
EXPOSE 80

# Start Apache web server
CMD ["apache2-foreground"]
