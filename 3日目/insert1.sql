SELECT DATABASE();

USE my_db;

CREATE TABLE people(
 id INT PRIMARY KEY,
 name VARCHAR(50),
 brith_day DATE DEFAULT "1990-01-01"
);

# INSERT1
INSERT INTO people VALUES(1, "タロウ", "2001-01-01");

# SELECT1
SELECT * FROM people;

DESCRIBE people;

# INSERT カラム指定
INSERT INTO people(id, name) VALUES(2, "Jiro");

# シングルクォート
INSERT INTO people(id, name) VALUES(3, 'Saburo');

INSERT INTO people VALUES(4, 'John''s son', '2021-01-01');