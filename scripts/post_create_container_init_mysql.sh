#!bash

cd /workspace/mysql-server
mkdir bld
cd bld
cmake .. -DDOWNLOAD_BOOST=1 -DWITH_BOOST=. -DWITH_DEBUG=1  \
    && make \
    && make install

# Preconfiguration setup
groupadd mysql
useradd -r -g mysql -s /bin/false mysql
# End of source-build specific instructions
# Postinstallation setup
 cd /usr/local/mysql
 mkdir mysql-files
 chown mysql:mysql mysql-files
 chmod 750 mysql-files
 bin/mysqld --initialize --user=mysql
 bin/mysql_ssl_rsa_setup
 bin/mysqld_safe --user=mysql &
# Next command is optional
cp support-files/mysql.server /etc/init.d/mysql.server

# 设置环境变量
PATH="/usr/local/mysql/bin:${PATH}"