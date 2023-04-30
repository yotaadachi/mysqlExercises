SHOW TABLES;

DESCRIBE people;

ALTER TABLE people ADD age INT AFTER name;

SELECT * FROM people;

DELETE FROM people;

INSERT INTO people VALUES(1, "John", 18, "2001-01-01");
INSERT INTO people VALUES(2, "Alice", 15, "2003-01-01");
INSERT INTO people VALUES(3, "Paul", 19, "2000-01-01");
INSERT INTO people VALUES(4, "Chris", 17, "2001-01-01");
INSERT INTO people VALUES(5, "Vette", 20, "2001-01-01");
INSERT INTO people VALUES(6, "Tsuyoshi", 21, "2001-01-01");
INSERT INTO people VALUES(7, "Tsuyoshi", 21, "2001-01-01");

# ageで昇順
SELECT * FROM people ORDER BY age;

# ageで降順
SELECT * FROM people ORDER BY age DESC;

# nameで降順
SELECT * FROM people ORDER BY name DESC;

# 2つカラム
SELECT * FROM people ORDER BY birth_day DESC, name;

# DISTINCT
SELECT DISTINCT birth_day FROM people;

SELECT DISTINCT name, birth_day FROM people;

# LIMITは最初だけ
SELECT * FROM people LIMIT 3;

# 飛ばして表示（3行飛ばして、2行表示）
SELECT * FROM people LIMIT 3, 2;

SELECT * FROM people LIMIT 2 OFFSET 3;