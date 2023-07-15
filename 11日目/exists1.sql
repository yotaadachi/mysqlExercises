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



