SHOW DATABASES;

USE day_10_14_db;

SHOW TABLES;

-- LEFT JOIN
SELECT emp.id, emp.first_name, emp.last_name, dt.id AS department_id, dt.name AS department_name
FROM employees AS emp
LEFT OUTER JOIN departments AS dt
ON emp.department_id = dt.id;

SELECT * FROM enrollments AS enr
LEFT OUTER JOIN classes AS cs
ON enr.class_id = cs.id;

SELECT * FROM students AS std
LEFT OUTER JOIN enrollments AS enr
ON std.id = enr.student_id
LEFT OUTER JOIN classes AS cs 
ON enr.class_id = cs.id;

-- RIGHT JOIN
SELECT * FROM students AS std
RIGHT OUTER JOIN enrollments AS enr
ON std.id = enr.student_id
RIGHT OUTER JOIN classes AS cs 
ON enr.class_id = cs.id;


-- customers, orders, items, storesを紐づける（INNER JOIN）
-- customers.idで並び替える
SELECT
 ct.id, ct.last_name, od.item_id, od.order_amount, od.order_price, od.order_date, it.name, st.name
FROM customers AS ct
INNER JOIN orders AS od
ON ct.id = od.customer_id
INNER JOIN items AS it
ON od.item_id = it.id
INNER JOIN stores AS st
ON it.store_id = st.id
ORDER BY ct.id;

-- customers, orders, items, storesを紐づける(INNER JOIN)
-- customers.idで並び替える(ORDER BY)
-- customers.idが10で、orders.order_dateが 2020-08-01よりあとに絞り込む(WHERE)
SELECT
 ct.id, ct.last_name, od.item_id, od.order_amount, od.order_price, od.order_date, it.name, st.name
FROM customers AS ct
INNER JOIN orders AS od
ON ct.id = od.customer_id
INNER JOIN items AS it
ON od.item_id = it.id
INNER JOIN stores AS st
ON it.store_id = st.id
WHERE ct.id = 10 AND od.order_date > "2020-08-01"
ORDER BY ct.id;

-- サブクエリ化
SELECT
 ct.id, ct.last_name, od.item_id, od.order_amount, od.order_price, od.order_date, it.name, st.name
FROM（SELECT * FROM customers WHERE id = 10）AS ct
INNER JOIN (SELECT * FROM orders WHERE order_date > "2020-08-01") AS od
ON ct.id = od.customer_id
INNER JOIN items AS it
ON od.item_id = it.id
INNER JOIN stores AS st
ON it.store_id = st.id
ORDER BY ct.id;

-- GROUP BYの紐付け
SELECT * FROM customers AS ct
INNER JOIN
 (SELECT customer_id, SUM(order_amount * order_price) AS summary_price
   FROM orders
   GROUP BY customer_id) AS order_summary
ON ct.id = order_summary.customer_id;

-- SELF JOIN(自己結合)
SELECT
 CONCAT(emp1.last_name, emp1.first_name) AS "部下の名前",
 emp1.age AS "部下の年齢",
 CONCAT(emp2.last_name, emp2.first_name) AS "上司の名前",
 emp2.age AS "上司の年齢"
FROM employees AS emp1
LEFT OUTER JOIN employees AS emp2
ON emp1.manager_id = emp2.id;

-- CROSS JOIN
SELECT * FROM employees AS emp1 CROSS JOIN employees AS emp2
WHERE emp1.id = 1;

-- 計算結果とCASEで紐付け
SELECT
*,
CASE 
 WHEN cs.age > summary_customers.avg_age THEN "○"
 ELSE "×"
END AS  "平均年齢よりも年齢が高いか"
FROM customers AS cs
CROSS JOIN(
SELECT AVG(age) AS avg_age FROM customers
) AS summary_customers;

SELECT * FROM employees AS emp
CROSS JOIN
(SELECT AVG(payment) AS avg_payment FROM salaries) AS summary;



