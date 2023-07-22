USE day_10_14_db;

SHOW TABLES;

SELECT * FROM employees;

-- WINDOWS関数
SELECT *, AVG(age) OVER(), COUNT(*) OVER()
FROM employees;

-- PARTITION BY: 分割してその中で集計する
SELECT *, AVG(age) OVER(PARTITION BY department_id) AS avg_age,
COUNT(*) OVER(PARTITION BY department_id) AS count_department
FROM employees;

SELECT DISTINCT CONCAT(COUNT(*) OVER(PARTITION BY FLOOR(age/10)), "人")AS age_count, FLOOR(age/10)
FROM employees;

-- 日付ごとに集計
SELECT *, SUM(order_amount * order_price) OVER(PARTITION BY order_date)
FROM orders;

-- ORDER BY
SELECT *, COUNT(*) OVER(ORDER BY age) AS tmp_count
FROM employees;

SELECT *, SUM(order_price) OVER(ORDER BY order_date, customer_id)
FROM orders;