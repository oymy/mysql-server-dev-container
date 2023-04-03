#!bash

cd /workspace/mysql-server
mkdir bld
cd bld
cmake .. -DDOWNLOAD_BOOST=1 -DWITH_BOOST=. -DWITH_DEBUG=1  \
    && make \
    && make install

# End of source-build specific instructions
# Postinstallation setup
 cd /usr/local/mysql
 mkdir mysql-files
 chown mysql:mysql mysql-files
 chmod 750 mysql-files
# Initialize MySQL with an empty password
bin/mysqld --initialize-insecure --user=root

bin/mysql_ssl_rsa_setup
#用root 方便gdb 调试
bin/mysqld_safe --user=root &
# Wait for MySQL server to start
sleep 5

# Allow remote connections and set an empty password
bin/mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '';"
bin/mysql -e "CREATE USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '';"
bin/mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;"
bin/mysql -e "FLUSH PRIVILEGES;"

# Next command is optional
cp support-files/mysql.server /etc/init.d/mysql.server

# 设置环境变量
PATH="/usr/local/mysql/bin:${PATH}"

kill `cat data/*.pid`
