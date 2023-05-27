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

-- 副問い合わせ：FROMで用いる
SELECT
MAX(avg_age) AS "部署ごとの平均年齢の最大",
MIN(avg_age) AS "部署ごとの平均年齢の最小"
FROM
(SELECT department_id, AVG(age) AS avg_age FROM employees GROUP BY department_id) AS tmp_emp;

-- 年代の集計
SELECT
 MAX(age_count), MIN(age_count)
FROM
(SELECT FLOOR(age/10)*10, COUNT(*) AS age_count FROM employees GROUP BY FLOOR(age/10)) AS age_summary;

-- 副問い合わせ：SELECTの中に書く
SELECT * FROM customers;
SELECT * FROM orders;

SELECT
 cs.id,
 cs.first_name,
 cs.last_name,
(
  SELECT MAX(order_date) FROM orders AS order_max WHERE cs.id = order_max.customer_id
) AS "最新の注文",
(
  SELECT MIN(order_date) FROM orders AS order_max WHERE cs.id = order_max.customer_id
) AS "最古の注文",
(
  SELECT SUM(order_amount * order_price) FROM orders AS order_max WHERE cs.id = order_max.customer_id
) AS "全支払い金額"
FROM 
 customers AS cs
WHERE
 cs.id < 10;
 
