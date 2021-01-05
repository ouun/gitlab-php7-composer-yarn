FROM php:7.4-fpm

# Updates
RUN apt-get update \
     && apt-get install -y curl wget apt-transport-https lsb-release ca-certificates

# Adds ZIP
RUN apt-get update \
     && apt-get install -y libzip-dev \
     && docker-php-ext-install zip

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

# Install NodeJS
RUN curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh && bash nodesource_setup.sh && apt-get -y --force-yes install nodejs

# Install Yarn
RUN npm install --global yarn
