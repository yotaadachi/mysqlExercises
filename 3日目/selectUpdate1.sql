SELECT DATABASE();

USE my_db;

SHOW TABLES;

ALTER TABLE people RENAME COLUMN brith_day TO birth_day;

#　全レコード、全カラム
SELECT * FROM people;

# カラム一部
SELECT name, id, brith_day, name FROM people;

# AS句
SELECT id AS "番号", name AS "名前" FROM people;

# WHERE句
SELECT * FROM people WHERE id <= 4;

# UPDATE
UPDATE people SET brith_day ="1900-01-01";

SELECT * FROM people;

# UPDATE where
UPDATE people SET name="Taro", birth_day="2000-01-01" WHERE id=3;

UPDATE people SET name="Jiro", birth_day="2000-01-01" WHERE id>=4;

# DELETE: レコード削除
DELETE FROM people WHERE id>=4;
