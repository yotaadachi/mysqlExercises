SELECT DATABASE();

SHOW DATABASES;

USE day_10_14_db;

DESCRIBE employees;
DESCRIBE departments;
DESCRIBE salaries;
DESCRIBE customers;
DESCRIBE orders;

-- 問題1
SELECT first_name, last_name FROM employees WHERE id < 10
UNION
SELECT first_name, last_name FROM customers WHERE id < 10;

-- 問題2
SELECT MAX(sal.payment),
       MIN(sal.payment),
       AVG(sal.payment)
FROM departments dep
INNER JOIN employees emp
ON dep.id = emp.department_id
INNER JOIN salaries sal
ON emp.id = sal.employee_id
WHERE dep.name = "営業部";

-- 問題3
SELECT CASE
 WHEN cla.id < 5 THEN "クラス1"
 ELSE "クラス2"
END AS "クラス分類",
COUNT(stu.id) 
FROM classes cla
INNER JOIN enrollments enr
ON cla.id = enr.class_id
INNER JOIN students stu
ON enr.student_id = stu.id
GROUP BY
CASE
 WHEN cla.id < 5 THEN "クラス1"
 ELSE "クラス2"
END;

-- 問題4
SELECT emp.id,
       SUM(sal.payment),
       AVG(sal.payment)
FROM employees emp
INNER JOIN salaries sal
ON emp.id = sal.employee_id
WHERE emp.age < 40
GROUP BY emp.id
HAVING AVG(sal.payment) > 7000000;

-- 問題5
SELECT SUM(ord.order_amount)
FROM customers cus
INNER JOIN orders ord
ON cus.id = ord.customer_id
GROUP BY cus.id;

SELECT
*,
(SELECT SUM(order_amount) FROM orders ord WHERE ord.customer_id = cst.id) AS sum_order_amount
FROM customers cst;

-- 問題6
DESCRIBE customers;
DESCRIBE orders;
DESCRIBE items;
DESCRIBE stores;

SELECT
CONCAT(customers.last_name, customers.first_name),
COUNT(*) 
FROM
(SELECT * FROM customers WHERE last_name LIKE "%田%") AS customers
INNER JOIN (SELECT * FROM orders WHERE order_date >= "2020-12-01") AS orders
ON customers.id = orders.customer_id
INNER JOIN items
ON orders.item_id = items.id
INNER JOIN (SELECT * FROM stores WHERE name = "山田商店") AS stores
ON items.store_id = stores.id
GROUP BY CONCAT(customers.last_name, customers.first_name);

-- 問題7
DESCRIBE salaries;
DESCRIBE employees;

SELECT *
FROM salaries
WHERE employee_id
IN (
 SELECT employee_id
 FROM salaries sal
 WHERE payment > 9000000
);

SELECT *
FROM salaries sal
INNER JOIN employees emp
ON sal.employee_id = emp.id
WHERE sal.payment > 9000000;

SELECT *
FROM employees emp
WHERE EXISTS(
 SELECT 1
 FROM salaries sal
 WHERE emp.id = sal.employee_id
 AND sal.payment > 9000000
);

-- 問題8
SELECT *
FROM employees
WHERE id
NOT IN (
 SELECT employee_id
 FROM salaries
);

SELECT *
FROM employees emp
LEFT OUTER JOIN salaries sal
ON emp.id = sal.employee_id
WHERE sal.employee_id IS NULL;

SELECT *
FROM employees emp
WHERE NOT EXISTS(
 SELECT 1
 FROM salaries sal
 WHERE sal.employee_id = emp.id
);

WITH customers_age AS(
 SELECT MAX(age) AS max_age, MIN(age) AS min_age, AVG(age) AS avg_age
 FROM customers
)
SELECT
 *,
 CASE
 	WHEN emp.age < ca.min_age THEN "最小未満"
 END
 
FROM employees AS emp
CROSS JOIN customers_age AS ca;



















