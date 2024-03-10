SELECT DATABASE();

SHOW DATABASES;

USE day_10_14_db;

DESCRIBE employees;
DESCRIBE departments;
DESCRIBE salaries;

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




