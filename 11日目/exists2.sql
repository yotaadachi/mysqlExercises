-- EXISTS(NULLの存在する場合)

SELECT * FROM customers AS c1
WHERE EXISTS 
(SELECT * FROM customers_2 AS c2 WHERE c1.first_name =c2.first_name 
AND c1.last_name = c2.last_name
AND c1.phone_number = c2.phone_number);

-- NOT EXISTS（NULLも取り出される）
SELECT * FROM customers AS c1
WHERE NOT EXISTS
(SELECT * FROM customers_2 AS c2 WHERE c1.first_name = c2.first_name
AND c1.last_name = c2.last_name
AND c1.phone_number = c2.phone_number);