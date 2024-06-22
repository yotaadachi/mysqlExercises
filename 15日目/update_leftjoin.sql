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