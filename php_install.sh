#!/bin/bash
 
echo "It will install php..."
sleep 2
cd /usr/local/src
yum install -y libpng-devel freetype-devel libmcrypt libmcrypt-devel libjpeg-devel libxml2-devel openssl openssl-devel bzip2 bzip2-devel 
wget http://cn2.php.net/distributions/php-5.4.37.tar.bz2
tar jxvf php-5.4.37.tar.bz2
cd php-5.4.37
./configure --prefix=/usr/local/php --with-config-file-path=/usr/local/php/etc  --enable-fpm --with-fpm-user=php-fpm --with-fpm-group=php-fpm --with-mysql=/usr/local/mysql --with-mysql-sock=/tmp/mysql.sock --with-libxml-dir --with-gd --with-jpeg-dir --with-png-dir --with-freetype-dir --with-iconv-dir --with-zlib-dir --with-mcrypt --enable-soap --enable-gd-native-ttf --enable-ftp --enable-mbstring --enable-exif --disable-ipv6 --with-jpeg-dir=/usr/local/jpeg
make
make install
cp php.ini-production /usr/local/php/etc/php.ini
cp sapi/fpm/init.d.php-fpm /etc/init.d/php-fpm
mv /usr/local/php/etc/php-fpm.conf.default /usr/local/php/etc/php-fpm.conf
chmod 755 /etc/init.d/php-fpm
chkconfig --add php-fpm
chkconfig php-fpm on
useradd -s /sbin/nologin php-fpm
service php-fpm start