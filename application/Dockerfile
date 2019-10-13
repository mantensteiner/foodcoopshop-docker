FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
ENV FCS_VERSION="v2.6.2"
ENV FCS_SITE_CONF_NAME="010-foodcoopshop.conf"

RUN apt-get -y update --fix-missing --no-install-recommends
RUN apt-get -y upgrade

# Install useful tools & libs
RUN apt-get -yq install apt-utils nano wget dialog unzip curl cron

# MySQL
# RUN apt-get -yq install mysql-server mysql-client libmysqlclient-dev
# RUN apt-get -yq install mysql-client

RUN apt-get -yq install apache2 apache2-doc apache2-utils libexpat1 ssl-cert
# Enable apache modules
RUN a2enmod rewrite headers

# PHP
RUN apt-get -yq install libapache2-mod-php7.2 php7.2 php7.2-common php7.2-curl php7.2-dev php7.2-gd php-pear php-imagick php7.2-mysql php7.2-ps php7.2-xsl php7.2-intl php7.2-mbstring php7.2-xml

# Copy application files
WORKDIR /var/www
RUN wget https://github.com/foodcoopshop/foodcoopshop/releases/download/$FCS_VERSION/FoodCoopShop-$FCS_VERSION.zip
RUN unzip FoodCoopShop-$FCS_VERSION.zip
RUN rm FoodCoopShop-$FCS_VERSION.zip

COPY $FCS_SITE_CONF_NAME /etc/apache2/sites-available/$FCS_SITE_CONF_NAME
RUN ln -sr /etc/apache2/sites-available/$FCS_SITE_CONF_NAME /etc/apache2/sites-enabled
RUN rm /etc/apache2/sites-enabled/000-default.conf

RUN chown -R www-data:www-data foodcoopshop

WORKDIR /var/www/foodcoopshop

RUN chmod -R a+w ./files_private
RUN chmod -R a+w ./tmp
RUN chmod -R a+w ./webroot/cache
RUN chmod -R a+w ./webroot/files
RUN chmod -R a+w ./webroot/tmp

CMD apachectl -DFOREGROUND

# Cronjob should be configured on the host 
#RUN crontab -l > sgartlcron
#RUN echo "*/10 * * * * wget http://localhost/cron" >> sgartlcron