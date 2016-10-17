#!/bin/bash
dir=`pwd`

mv $dir/nginx_start   /etc/init.d/nginx
chmod 755 /etc/init.d/nginx 
chkconfig --add nginx   
chkconfig nginx on
