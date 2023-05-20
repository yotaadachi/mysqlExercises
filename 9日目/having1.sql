USE day_4_9_db;

-- HAVING
SELECT department, AVG(salary) FROM employees 
GROUP BY department
HAVING AVG(salary) > 398000;

SELECT birth_place, age, COUNT(*) FROM users
GROUP BY birth_place, age
HAVING COUNT(*) > 1
ORDER BY COUNT(*);

-- HAVINGのみ
SELECT
"重複なし"
FROM
 users
HAVING
 COUNT(DISTINCT name) <> COUNT(name);