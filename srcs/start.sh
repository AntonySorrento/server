#CERTIFICAT SSL
mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=FR/ST=Paca/L=Nice/O=42 School/OU=asorrent/CN=localhost"
#NGINX
	#!/usr/bin/env bash --- set autoindex off
if [[ "${AUTOINDEX}" == "off" ]]; then
	rm ./default
	mv ./defaultoff etc/nginx/sites-available
	mv etc/nginx/sites-available/defaultoff etc/nginx/sites-available/default
	echo "************   autoindex off   **************"
else
	rm ./defaultoff
	mv ./default etc/nginx/sites-available
fi
mkdir var/www/localhost
cp /var/www/html/index.nginx-debian.html /var/www/localhost
ln -s etc/nginx/sites-available/default etc/nginx/sites-enabled
chown -R www-data /var/www/*
chmod -R 755 /var/www/*
#MYSQL
service mysql start
echo "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql -u root
echo "GRANT ALL ON wordpress.* TO 'wordpress_user'@'localhost' IDENTIFIED BY 'password';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
#PHPMYADMIN
# wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz # run dockerfile et efface ici
# tar xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz #
# mv phpMyAdmin-4.9.0.1-all-languages var/www/localhost/phpmyadmin #
# mv ./config.inc.php var/www/localhost/phpmyadmin #
# chmod 660 /var/www/localhost/phpmyadmin/config.inc.php #
# chown -R www-data:www-data /var/www/localhost/phpmyadmin #
service php7.3-fpm start
echo "GRANT ALL ON *.* TO 'asorrent'@'localhost' IDENTIFIED BY '123'" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
#WORDPRESS cette partie sera suprrimée
# wget https://wordpress.org/latest.tar.gz # je le fais une seule fois
# tar xvf latest.tar.gz # je le fais une seule fois
# mkdir var/www/localhost/wordpress # doit être fait dans le dockerfile avec RUN // je n'ai rien fait car plus pertinent avec la copie du dossier wordpress
# cp -a wordpress/. /var/www/localhost/wordpress # faire COPY dans le dockerfile dont le fichier wp-conf.. // pareil qu'au dessus
# mv ./wp-config.php /var/www/localhost/wordpress # sera fait directement dans le dossier srcs/wp // pareil qu'au dessus
#LANCEMENT
service nginx start
service mysql restart
service php7.3-fpm restart
sleep infinity
