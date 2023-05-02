SELECT DATABASE();

DESCRIBE customers;

-- IS NULL
SELECT * FROM customers WHERE name IS NULL;

-- IS NOT NULL
SELECT * FROM customers WHERE name IS NOT NULL;

-- 空白
SELECT * FROM prefectures;

SELECT * FROM prefectures WHERE name is NULL;
SELECT * FROM prefectures WHERE name = "";

-- BETWEEN
SELECT * FROM users WHERE age BETWEEN 5 AND 10;

-- LIKE, NOT LIKE
SELECT * FROM users WHERE name LIKE"村%"; -- 前方一致

SELECT * FROM users WHERE name LIKE"%郎"; -- 後方一致

SELECT * FROM users WHERE name LIKE"%ed%"; -- 中間一致

SELECT * FROM prefectures WHERE name LIKE"福_%" ORDER BY name;


