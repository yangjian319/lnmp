#!/bin/bash
 
echo "It will install Mysql..."
sleep 2
 
cd /usr/local/src/
## base on different version of mysql,you need to change the download link.change the following 3 lines.
wget http://mirrors.sohu.com/mysql/MySQL-5.1/mysql-5.1.72-linux-x86_64-glibc23.tar.gz
tar zxvf mysql-5.1.72-linux-x86_64-glibc23.tar.gz
/bin/mv mysql-5.1.72-linux-x86_64-glibc23 /usr/local/mysql
 
## 
useradd -s /sbin/nologin mysql
cd /usr/local/mysql
mkdir -p /data/mysql ; chown -R mysql:mysql /data/mysql
./scripts/mysql_install_db --user=mysql --datadir=/data/mysql
rm -rf /etc/my.cnf
cp support-files/my-large.cnf /etc/my.cnf
cp support-files/mysql.server  /etc/init.d/mysqld
chmod 755 /etc/init.d/mysqld
sed -i '46s#basedir=#basedir=/usr/local/mysql#' /etc/init.d/mysqld
sed -i '47s#datadir=#datadir=/data/mysql#' /etc/init.d/mysqld
chkconfig --add mysqld
chkconfig mysqld on
service mysqld start
echo '#!/bin/bash' > /etc/profile.d/path.sh
sed -i '/sh/a\export PATH=$PATH:/usr/local/mysql/bin' /etc/profile.d/path.sh
source /etc/profile.d/path.sh

echo "Complete!!!"
sleep 2