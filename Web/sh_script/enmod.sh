#!/bin/bash

a2enmod rewrite
a2dismod mpm_prefork
a2enmod mpm_event proxy_fcgi setenvif
a2enmod http2
a2enmod headers
a2enmod expires
a2enmod ssl
service php5.6-fpm start
a2enconf php5.6-fpm
service php5.6-fpm reload
service apache2 restart
service php5.6-fpm status
tail -f /var/log/apache2/error.log

