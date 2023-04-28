FROM ubuntu:trusty

ARG mysql_db_imp=gpde_db_2023_03_16.sql

COPY mysql_conf/my.cnf /etc/mysql/conf.d/my.cnf
COPY mysql_conf/mysqld_charset.cnf /etc/mysql/conf.d/mysqld_charset.cnf

RUN apt-get update && \
    apt-get -yq install mysql-server-5.5 pwgen && \
    rm -rf /var/lib/apt/lists/* && \
    rm /etc/mysql/conf.d/mysqld_safe_syslog.cnf && \
    if [ ! -f /usr/share/mysql/my-default.cnf ] ; then cp /etc/mysql/my.cnf /usr/share/mysql/my-default.cnf; fi && \
    mysql_install_db > /dev/null 2>&1 && \
    touch /var/lib/mysql/.EMPTY_DB

COPY sh_script/run.sh /run.sh
COPY database.sql /database.sql
ENV MYSQL_USER=admin \
    MYSQL_PASS=**Random** \
    ON_CREATE_DB=**False** \
    REPLICATION_MASTER=**False** \
    REPLICATION_SLAVE=**False** \
    REPLICATION_USER=replica \
    REPLICATION_PASS=replica \
    ON_CREATE_DB=**False** \
    mysql_usr=admin \
    mysql_psw=admin \
    mysql_db_name=gopgo \
    db_import_sql=gpde_db_2023_03_16.sql

VOLUME  ["/etc/mysql", "/var/lib/mysql"]

EXPOSE 3306
CMD ["/run.sh"]
