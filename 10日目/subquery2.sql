USE day_10_14_db;

-- 副問い合わせ：CASEと使う
SELECT 
 emp.*,
 CASE
 	WHEN emp.department_id = (SELECT id FROM departments WHERE name = "経営企画部")
 	THEN "経営層"
 	ELSE "その他"
 END AS "役割"
 FROM
 employees AS emp;

SELECT
 emp.*,
 CASE
 	WHEN emp.id IN(
 	SELECT DISTINCT employee_id FROM salaries WHERE payment > (SELECT AVG(payment) FROM salaries)
 	) THEN "○"
 	ELSE "×"
 END AS "給料が平均より高いか"
FROM
employees emp;