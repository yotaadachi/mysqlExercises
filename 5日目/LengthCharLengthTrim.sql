USE day_4_9_db;

-- LENGTH, CHAR_LENGTH
SELECT LENGTH("ABC");
SELECT LENGTH("あいう"); -- 9バイト数

SELECT name, LENGTH(name) FROM users;

SELECT CHAR_LENGTH("ABC");
SELECT CHAR_LENGTH("あいう"); -- 3文字数

SELECT name, CHAR_LENGTH(name) FROM users;

-- TRIM, LTRIM, RTRIM　空白削除
SELECT LTRIM(" ABC ");
SELECT RTRIM(" ABC ");
SELECT TRIM(" ABC ");


SELECT name, CHAR_LENGTH(name) AS name_length
FROM employees
WHERE CHAR_LENGTH(name) <> CHAR_LENGTH(TRIM(name));
-- UPDATEして空白を削除したものにする
UPDATE employees
SET name = TRIM(name)
WHERE CHAR_LENGTH(name) <> CHAR_LENGTH(TRIM(name));

