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
