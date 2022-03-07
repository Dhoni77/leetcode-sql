-- Question 13
-- Suppose that a website contains two tables, 
-- the Customers table and the Orders table. Write a SQL query to find all customers who never order anything.

-- Table: Customers.

-- +----+-------+
-- | Id | Name  |
-- +----+-------+
-- | 1  | Joe   |
-- | 2  | Henry |
-- | 3  | Sam   |
-- | 4  | Max   |
-- +----+-------+
-- Table: Orders.

-- +----+------------+
-- | Id | CustomerId |
-- +----+------------+
-- | 1  | 3          |
-- | 2  | 1          |
-- +----+------------+
-- Using the above tables as example, return the following:

-- +-----------+
-- | Customers |
-- +-----------+
-- | Henry     |
-- | Max       |
-- +-----------+


INSERT INTO `jdbc`.`customers`
(`id`,
`name`)
VALUES(1, 'Joe'), (2, 'Henry'),
(3, 'Sam'), (4, 'Max') ;

INSERT INTO `jdbc`.`orders`
(`id`,
`customerId`)
VALUES
(1, 3), (2, 1);

select name from customers c where c.id not in (select o.customerid from customers cus, orders o  where cus.id=o.customerid);

select * from orders;
