SHOW DATABASES;

USE day_4_9_db;

-- UNIONは重複削除
SELECT * FROM new_students
UNION
SELECT * FROM students
ORDER BY id;

-- UNION ALLは重複削除しない
SELECT * FROM new_students
UNION ALL
SELECT * FROM students
ORDER BY id;

SELECT * FROM students WHERE id < 10
UNION ALL
SELECT * FROM new_students WHERE id > 250;

-- 型が同じだったら結合可能
SELECT id, name FROM students WHERE id < 10
UNION
SELECT age, name FROM users WHERE id < 10
ORDER BY id;

-- UNIONはカラム数を合わせないとエラー
SELECT id, name, height FROM students
UNION
SELECT age, name FROM users;