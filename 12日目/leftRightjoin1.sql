SHOW DATABASES;

SELECT DATABASE();

-- LEFT JOIN
SELECT emp.id,
 	   emp.first_name,
 	   emp.last_name ,
 	   emp.age,
 	   emp.manager_id,
 	   COALESCE(dt.id, "該当なし") AS department_id,
 	   dt.name
FROM employees AS emp
LEFT JOIN departments AS dt
ON emp.department_id = dt.id;

DESCRIBE enrollments;
DESCRIBE classes;
SELECT * FROM enrollments;
SELECT * FROM classes;

SELECT *
FROM enrollments en
LEFT JOIN classes cl
ON en.class_id = cl.id;

SELECT * 
FROM students std
LEFT JOIN enrollments enr
ON std.id = enr.student_id
LEFT JOIN classes AS cs
ON enr.class_id = cs.id;

-- RIGHT JOIN
SELECT * 
FROM students std
RIGHT JOIN enrollments enr
ON std.id = enr.student_id
RIGHT JOIN classes AS cs
ON enr.class_id = cs.id;

