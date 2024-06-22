SHOW DATABASES;

USE day_10_14_db;

SELECT * FROM employees;

ALTER TABLE employees
ADD department_name VARCHAR(255);

-- LFFT JOINしてUPDATEする
UPDATE employees AS emp
LEFT JOIN departments AS dt
ON emp.department_id = dt.id
SET emp.department_name = COALESCE(dt.name, "不明");

-- WITHを使ったUPDATE
SELECT * FROM stores;

ALTER TABLE stores ADD all_sales INT;

SELECT * FROM items;

SELECT * FROM orders;

WITH tmp_sales AS(
  SELECT ite.store_id,
    SUM(ord.item_id * ord.order_amount) AS total_sales
  FROM items ite
  INNER JOIN orders ord
  ON ite.id = ord.item_id
  GROUP BY ite.store_id
)
UPDATE stores st
INNER JOIN tmp_sales ts
ON st.id = ts.store_id
SET st.all_sales = ts.total_sales;

SELECT * FROM stores;


-- DELETE

SELECT * FROM employees
WHERE department_id = (
 SELECT id FROM departments WHERE name = "開発部"
)
