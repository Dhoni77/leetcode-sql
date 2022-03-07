INSERT INTO `jdbc`.`orders`
(`order_number`,
`customer_number`,
`order_date`,
`required_date`,
`shipped_date`,
`status`)
VALUES
(1, 1, '2017-04-09', '2017-04-13', '2017-04-12', 'Closed'),
(2, 2, '2017-04-09', '2017-04-13', '2017-04-12', 'Closed'),
(3, 3, '2017-04-09', '2017-04-13', '2017-04-12', 'Closed'),
(4, 3, '2017-04-09', '2017-04-13', '2017-04-12', 'Closed');

select * from orders;

select customer_number from (select customer_number,count(customer_number) order_count from orders group by customer_number) a order by order_count desc limit 1;

SELECT customer_number 
FROM orders
GROUP BY customer_number
ORDER BY COUNT(customer_number) DESC 
LIMIT 1;


