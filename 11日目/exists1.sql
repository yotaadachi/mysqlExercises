USE day_10_14_db;

SELECT * FROM departments;

SELECT * FROM employees;

-- EXIST

/* ①employeeの結果が出る。
 * ②EXISTS句内のサブクエリの結果が出る。
 * ③①について、②で取得した結果に該当するレコードが抽出される。
 * */
SELECT * FROM employees AS em
WHERE EXISTS(
 SELECT * FROM departments AS dt WHERE em.department_id = dt.id
);

-- IN

SELECT * FROM employees AS em
WHERE em.department_id IN (SELECT id FROM departments);

SELECT * FROM employees AS em
WHERE EXISTS(
 SELECT 1 FROM departments AS dt WHERE dt.name IN ("営業部", "開発部") AND em.department_id = dt.id
);

SELECT * FROM customers AS ct
WHERE EXISTS(SELECT * FROM orders AS od WHERE ct.id = od.customer_id AND od.order_date = "2020-12-31");

SELECT * FROM employees AS em1
WHERE NOT EXISTS(SELECT 1 FROM employees AS em2 WHERE em2.manager_id = em1.id);
