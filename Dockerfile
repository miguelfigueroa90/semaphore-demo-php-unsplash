# Dockerfile
# Use the offical php apache images as a starting point
FROM php:7.4-apache

# COPY the file into the image
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

# Laravel requires Apache’s mod_rewrite plugin to be enabled, we can do this using the a2enmod utility
RUN a2enmod rewrite

# get the source files inside the container
COPY src /var/www/
RUN chown -R www-data:www-data /var/www

# Run the Apache server in the background
# Call the start script
CMD ["start-apache"]
