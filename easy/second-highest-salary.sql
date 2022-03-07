-- Question 15
-- Write a SQL query to get the second highest salary from the Employee table.

-- +----+--------+
-- | Id | Salary |
-- +----+--------+
-- | 1  | 100    |
-- | 2  | 200    |
-- | 3  | 300    |
-- +----+--------+
-- For example, given the above Employee table, the query should return 200 as the second highest salary. 
-- If there is no second highest salary, then the query should return null.

-- +---------------------+
-- | SecondHighestSalary |
-- +---------------------+
-- | 200                 |
-- +---------------------+

-- solution 
select max(salary) second_highest_salary from employee where salary!=(select max(salary) from employee);

-- solution 2

with CTE as(
select salary, dense_rank() over (order by Salary DESC) as grader from Employee)

select max(salary) as SecondHighestSalary from CTE 
where grader=2;