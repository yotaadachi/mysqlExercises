SHOW TABLES;

SELECT * FROM employees;

DESCRIBE employees;

-- 部署一覧
SELECT * FROM departments;

-- 副問い合わせ
SELECT * 
FROM employees
WHERE department_id 
IN(SELECT id
FROM departments
WHERE name
IN("経営企画部", "営業部"));

SELECT * FROM students;
SELECT * FROM users;

-- 複数カラムのIN（副問い合わせ）
SELECT * FROM students
WHERE (first_name, last_name) IN (
  SELECT first_name, last_name FROM users
 );

-- 集計関数（副問い合わせ）
DESCRIBE employees;

SELECT * FROM employees
WHERE age = (
 SELECT MAX(age) FROM employees
);

SELECT * FROM employees
WHERE age < (
 SELECT AVG(age) FROM employees
);

SHOW TABLES;

-- FROM句で使用する（副問い合わせ）
SELECT MAX(tmp_emp.avg_age) AS "部署ごとの平均年齢の最大"
FROM(
 SELECT department_id, AVG(age) AS avg_age
 FROM employees GROUP BY department_id
) AS tmp_emp;

DESCRIBE employees;

-- 年代の集計（副問い合わせ）
SELECT MAX(tmp_emp.age_count),
 MIN(tmp_emp.age_count)
FROM(
 SELECT FLOOR(age/10), COUNT(*) AS age_count FROM employees
 GROUP BY FLOOR(age/10)
) AS tmp_emp;


-- SELECTの中で使用（副問い合わせ）
DESCRIBE orders;
DESCRIBE customers;

SELECT
 cs.id,
 cs.first_name,
 cs.last_name,
 (
  SELECT MAX(order_date)
  FROM orders AS order_max 
  WHERE cs.id = order_max.customer_id
 ) AS "直近の注文日",
 (
  SELECT SUM(order_amount * order_price)
  FROM orders AS tmp_order
  WHERE cs.id = tmp_order.customer_id
 ) AS "全支払金額"
FROM
 customers AS cs
WHERE
 cs.id < 10;
 
-- CASEと使用（副問い合わせ）
SELECT
 emp.*, 
 CASE
  WHEN emp.department_id = (
   SELECT id FROM departments WHERE name = "経営企画部"
  )
  THEN "経営層"
  ELSE "その他"
 END AS "役割"
FROM
 employees AS emp;

SELECT
 emp.*,
 CASE
 	WHEN emp.id IN(
 	SELECT DISTINCT employee_id FROM salaries WHERE payment > (
     SELECT AVG(payment) FROM salaries
     )
 	) THEN "○"
 	ELSE "×"
 END　AS "平均より給料が高いか"
FROM
　employees AS emp;