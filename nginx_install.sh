#!/bin/bash
echo "It will install nginx..."
sleep 2
cd /usr/local/src
yum install -y pcre-devel
wget http://nginx.org/download/nginx-1.6.2.tar.gz
tar zxvf nginx-1.6.2.tar.gz
cd nginx-1.6.2
./configure --prefix=/usr/local/nginx --with-pcre
make
make install
/usr/local/nginx/sbin/nginx

echo "Complete!!!"
sleep 2