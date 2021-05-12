CREATE TABLE Sales(
	trx_id int,
	cust_id int,
	product_id int,
	payment_date Date,
	amount int
);

INSERT INTO Sales Values (1, 1, 111, '2016-02-02', 150);
INSERT INTO Sales Values (1, 1, 111, '2015-01-02', 150);
INSERT INTO Sales Values (1, 1, 111, '2016-01-03', 50);
INSERT INTO Sales Values (1, 1, 111, '2015-02-03', 50);


/**
 ** 这个函数并不可以在postgreSQL中运行，因为函数和语法不兼容。
 ** 先把东西放在这。
 **/

SELECT  cust_id,
        SUM(IF( YEAR(payment_date) = 2016, amount, 0)) AS sum_2016,
        SUM(IF( YEAR(payment_date) = 2015, amount, 0)) AS sum_2015,
        SUM(amount) AS TOTAL
FROM sales
GROUP BY cust_id