create database metastore;
use metastore;
source /usr/lib/hive/scripts/metastore/upgrade/mysql/hive-schema-0.13.0.mysql.sql;

create user 'hive'@'localhost' identified by 'hive';
revoke all privileges, grant option from 'hive'@'localhost';
grant select,insert,update,delete,lock tables,execute on metastore.* to 'hive'@'localhost';
flush privileges;
