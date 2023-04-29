SHOW DATABASES;

CREATE DATABASE my_db;

SHOW DATABASES; #DB一覧を表示します。

#DBの削除
DROP DATABASE my_db;

# performance_schemaを利用
USE performance_schema;

#利用中のDBを表示
SELECT DATABASE();

USE my_db;
