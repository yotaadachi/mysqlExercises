SHOW DATABASES;

USE day_10_14_db;

SHOW TABLES;

SELECT * FROM employees;

-- 部署一覧
SELECT * FROM departments;

-- INで絞り込む
SELECT * FROM employees WHERE department_id IN(1,2);

-- 副問い合わせを使う
SELECT * FROM departments WHERE name IN ("経営企画部", "営業部");

SELECT * FROM employees WHERE department_id IN 
(SELECT id FROM departments WHERE name IN ("経営企画部", "営業部"));

-- 複数カラムのIN（副問い合わせ）
SELECT * FROM students
WHERE (first_name, last_name) IN
(SELECT first_name, last_name FROM users);

-- 副問い合わせ：集計を使う
SELECT MAX(age) FROM employees;

SELECT * FROM employees
WHERE age < (SELECT AVG(age) FROM employees);