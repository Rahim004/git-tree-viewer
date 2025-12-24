# Используем официальный образ Apache с PHP 8.2
FROM php:8.2-apache

# Устанавливаем системные зависимости и необходимые PHP-модули для Joomla
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    zip \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd pdo pdo_mysql zip

# Включаем модуль Apache rewrite для работы ЧПУ (человеко-понятных URL)
RUN a2enmod rewrite

# Копируем конфигурационный файл виртуального хоста Apache (если потребуется)
# COPY ./apache-config.conf /etc/apache2/sites-available/000-default.conf

# Устанавливаем рабочую директорию
WORKDIR /var/www/html

# Меняем владельца файлов для корректной работы Apache
RUN chown -R www-data:www-data /var/www/html

# Указываем, что контейнер слушает на порту 80
EXPOSE 80
