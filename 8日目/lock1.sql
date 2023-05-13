SHOW DATABASES;

USE day_4_9_db;

START TRANSACTION;

SHOW TABLES;

SELECT * FROM customers;

-- 主キーでUPDATE（行ロック）
UPDATE customers SET age = 43 WHERE id = 1;

ROLLBACK;

START TRANSACTION;

-- テーブル全体のロック
UPDATE customers SET age = 42 WHERE name = "河野 文典";

ROLLBACK;

-- DELETE
START TRANSACTION;

-- 行ロック
DELETE FROM customers WHERE id = 1;
COMMIT;

-- INSERT 
START TRANSACTION;

INSERT INTO customers VALUES(1, "田中 一郎", 21, "1999-01-01");

SELECT * FROM customers;

COMMIT;

-- SELECTのロック
-- FOR SHARE（共有ロック）
START TRANSACTION;
SELECT * FROM customers WHERE id = 1 FOR SHARE;
ROLLBACK;

-- FOR UPDATE（排他ロック）
START TRANSACTION;
SELECT * FROM customers WHERE id = 1 FOR UPDATE;
ROLLBACK;
