FROM php:7.3.6-fpm-alpine3.9
#instala o php:versão
RUN apk add --no-cache shadow
##instala o mysql e também o bash para entrar em container
RUN apk add bash mysql-client
##adiciona a extenção do php >> pdo para rodar o mysql
RUN docker-php-ext-install pdo pdo_mysql

#setando o diretório
WORKDIR /var/www
#remove a pasta html
RUN rm -rf /var/www/html
# instalação do composer (gerenciador de pacotes do PHP)
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#RUN composer install && \
#        && php artisan key:generate \
#        && php artisan cache:clear \
#        && chmod -R 755 storage
#RUN npm install
#
#COPY . /var/www
RUN chown -R www-data:www-data /var/www

RUN ln -s public html

RUN usermod -u 1000 www-data
USER www-data
#
EXPOSE 9000
ENTRYPOINT ["php-fpm"]
#
