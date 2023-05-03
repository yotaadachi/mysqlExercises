USE day_4_9_db;

-- REPLACE: 置換
SELECT REPLACE("I like an apple", "apple", "lemon");

SELECT name FROM users WHERE name LIKE 'Mrs%';
SELECT REPLACE(name, "Mrs", "Ms") FROM users WHERE name LIKE 'Mrs%';

UPDATE users SET name = REPLACE(name, "Mrs", "Ms") WHERE name LIKE 'Mrs%';
SELECT name FROM users WHERE name LIKE 'Ms%';

-- UPPER LOWER（大文字、小文字）
SELECT UPPER("apple");
SELECT LOWER("APPLE");

SELECT name, UPPER(name), LOWER(name) FROM users; 

-- SUBSTRING: 一部取り出し
SELECT SUBSTRING(name, 2, 3), name FROM employees; 
SELECT * FROM employees WHERE SUBSTR(name, 2, 1) = "田";

-- REVERS: 逆順
SELECT REVERSE(name), name FROM employees;