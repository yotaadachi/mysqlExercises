USE day_10_14_db;

SELECT * FROM departments;

SELECT * FROM employees;

-- EXSITS
SELECT * FROM employees AS em
WHERE EXISTS(
 SELECT * FROM departments AS dt
 WHERE em.department_id = dt.id
);

-- IN
SELECT * FROM employees AS em
WHERE em.department_id IN (SELECT id FROM departments);

SELECT * FROM employees AS em
WHERE EXISTS(
 SELECT * FROM departments AS dt WHERE dt.name IN ("営業部","開発部") AND em.department_id = dt.id
);

DESCRIBE orders;

SELECT * FROM customers AS ct
WHERE EXISTS (
 SELECT * FROM orders AS od
 WHERE ct.id = od.customer_id
 AND od.order_date = "2020-12-31"
);

SELECT * FROM employees AS em1
WHERE EXISTS(
 SELECT 1 FROM employees AS em2
 WHERE em1.manager_id = em2.id
);

