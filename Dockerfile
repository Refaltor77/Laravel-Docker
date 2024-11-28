FROM php:8.3-apache

# copies des fichiers du projects au bonne endroit dans le serveur web
COPY www-root/ /var/www/laravel/

# installation des dépendances necessaires
RUN apt-get update && apt-get install -y \
    zip unzip curl libpng-dev libonig-dev libxml2-dev libzip-dev git nodejs npm \
    && docker-php-ext-install pdo_mysql mbstring gd zip bcmath

# installation de composer
COPY --from=composer /usr/bin/composer /usr/bin/composer

# Activer le module mod_rewrite d'Apache
RUN a2enmod rewrite

# copie du fichier de configuration d'apache
COPY ./boilerplate.conf /etc/apache2/sites-available/000-default.conf
COPY ./start.sh /var/www/laravel/start.sh
COPY env/.env.prod /var/www/laravel/.env


# installations des dépendances du projet Laravel
WORKDIR /var/www/laravel/
RUN composer install
RUN npm install

# Création des dossiers manquants dans le répertoire storage
RUN mkdir storage/framework/{sessions,views,cache}

# Configuration des permissions des fichiers de Laravel
WORKDIR /var/www/
RUN chmod 777 -R laravel/


# exposition du port 80 du container
EXPOSE 80

WORKDIR /var/www/laravel/

RUN chmod 777 start.sh

# Commande pour démarrer Apache
CMD ["apache2-foreground"]
