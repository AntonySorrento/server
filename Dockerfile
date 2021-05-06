FROM debian:buster

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y nginx
RUN apt-get install openssl
RUN apt-get install -y mariadb-server mariadb-client
RUN apt-get install -y php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline
RUN apt-get install -y php-mbstring php-zip php-gd
RUN apt-get install -y php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip

COPY srcs/start.sh ./
COPY srcs/wordpress ./var/www/localhost/wordpress
COPY srcs/config.inc.php ./
COPY srcs/default ./
COPY srcs/defaultoff ./

RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN tar xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN mv phpMyAdmin-4.9.0.1-all-languages var/www/localhost/phpmyadmin
RUN mv ./config.inc.php var/www/localhost/phpmyadmin
RUN chmod 660 /var/www/localhost/phpmyadmin/config.inc.php
RUN chown -R www-data:www-data /var/www/localhost/phpmyadmin

CMD bash /start.sh

EXPOSE 80
EXPOSE 443
