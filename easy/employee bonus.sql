--	 Question 4
-- Select all employee's name and bonus whose bonus is < 1000.

-- Table:Employee

-- +-------+--------+-----------+--------+
-- | empId |  name  | supervisor| salary |
-- +-------+--------+-----------+--------+
-- |   1   | John   |  3        | 1000   |
-- |   2   | Dan    |  3        | 2000   |
-- |   3   | Brad   |  null     | 4000   |
-- |   4   | Thomas |  3        | 4000   |
-- +-------+--------+-----------+--------+
-- empId is the primary key column for this table.
-- Table: Bonus

-- +-------+-------+
-- | empId | bonus |
-- +-------+-------+
-- | 2     | 500   |
-- | 4     | 2000  |
-- +-------+-------+
-- empId is the primary key column for this table.
-- Example ouput:

-- +-------+-------+
-- | name  | bonus |
-- +-------+-------+
-- | John  | null  |
-- | Dan   | 500   |
-- | Brad  | null  |
-- +-------+-------+

select * from employee;

INSERT INTO `jdbc`.`employee` (`empid`, `name`, `supervisor`, `salary`) VALUES ('1', 'John', '3', '1000');
INSERT INTO `jdbc`.`employee` (`empid`, `name`, `supervisor`, `salary`) VALUES ('2', 'Dan', '3 ', '2000');
INSERT INTO `jdbc`.`employee` (`empid`, `name`, `salary`) VALUES ('3', 'Brad', '4000');
INSERT INTO `jdbc`.`employee` (`empid`, `name`, `supervisor`, `salary`) VALUES ('4', 'Thomas', '3', '4000');

select * from bonus;

INSERT INTO `jdbc`.`bonus` (`empid`, `bonus`) VALUES ('2', '500');
INSERT INTO `jdbc`.`bonus` (`empid`, `bonus`) VALUES ('4', '2000');

select name, b.bonus from employee e left join bonus b on e.empid=b.empid where b.bonus<1000 or b.bonus is null;