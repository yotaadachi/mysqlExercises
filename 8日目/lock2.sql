USE day_4_9_db;

UPDATE customers SET age = 44 WHERE id = 2;

SELECT * FROM customers;

UPDATE customers SET age = 44 WHERE id = 1;

SELECT * FROM customers WHERE id = 1 FOR SHARE;