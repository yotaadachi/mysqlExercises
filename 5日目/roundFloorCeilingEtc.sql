USE day_4_9_db;

-- ROUND, FLOOR, CEILING
SELECT ROUND(13.14, -1); # 四捨五入

SELECT FLOOR(3.14); # 切り捨て
SELECT FLOOR(3.84); # 切り捨て

SELECT CEILING(3.14); # 切り上げ

SELECT RAND(); # 0〜1
SELECT FLOOR(RAND() * 10); # 0〜10

SELECT POWER(3, 4);
SELECT weight / POWER(height/100, 2) AS BMI FROM students;

-- COALESCE: 最初にあるNULLでない値を返す
SELECT COALESCE(NULL, NULL, NULL, NULL, "A", NULL, NULL);

SELECT * FROM tests_score;
SELECT COALESCE(test_score_1, test_score_2, test_score_3) AS score FROM tests_score;