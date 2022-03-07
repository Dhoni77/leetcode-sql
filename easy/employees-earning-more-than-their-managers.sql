/**
The Employee table holds all employees including their managers. Every employee has an Id, and there is also a column for the manager Id.
+----+-------+--------+-----------+
| Id | Name  | Salary | ManagerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | NULL      |
| 4  | Max   | 90000  | NULL      |
+----+-------+--------+-----------+
Given the Employee table, write a SQL query that finds out employees who earn more than their managers. For the above table, Joe is the only employee who earns more than his manager.
+----------+
| Employee |
+----------+
| Joe      |
+----------+
**/

/**
Approach I: Using WHERE clause [Accepted]
Algorithm
As this table has the employee's manager information, we probably need to select information from it twice.
**/
# Write your MySQL query statement below
# select a.Name as `Employee`
# from 
#     Employee as `a`,
#     Employee as `b`
# where
#     a.ManagerId = b.Id
#     and a.Salary > b.Salary;

/**
Approach II: Using JOIN clause [Accepted]
Algorithm
Actually, JOIN is a more common and efficient way to link tables together, and we can use ON to specify some conditions.

INSERT INTO `jdbc`.`employee`
(`id`,
`name`,
`salary`,
` managerid`)
VALUES
(1, 'Joe', 7000, 3), (2, 'Henry', 8000, 4), (3, 'Sam', 6000, null), (4, 'Max', 9000, null);

select salary from (select salary from employee manager where manager.managerid=null) as msalary ;

select a.Name as Employee
from employee a, employee b
where a.salary>b.salary and b.id=a.managerid;


select a.managerid as Employee from employee a, employee b where (a.salary>b.salary) and (a.managerid=b.id);