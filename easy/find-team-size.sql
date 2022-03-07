-- Question 47
-- Table: Employee

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | employee_id   | int     |
-- | team_id       | int     |
-- +---------------+---------+
-- employee_id is the primary key for this table.
-- Each row of this table contains the ID of each employee and their respective team.
-- Write an SQL query to find the team size of each of the employees.

-- Return result table in any order.

-- The query result format is in the following example:

-- Employee Table:
-- +-------------+------------+
-- | employee_id | team_id    |
-- +-------------+------------+
-- |     1       |     8      |
-- |     2       |     8      |
-- |     3       |     8      |
-- |     4       |     7      |
-- |     5       |     9      |
-- |     6       |     9      |
-- +-------------+------------+
-- Result table:
-- +-------------+------------+
-- | employee_id | team_size  |
-- +-------------+------------+
-- |     1       |     3      |
-- |     2       |     3      |
-- |     3       |     3      |
-- |     4       |     1      |
-- |     5       |     2      |
-- |     6       |     2      |
-- +-------------+------------+
-- Employees with Id 1,2,3 are part of a team with team_id = 8.
-- Employees with Id 4 is part of a team with team_id = 7.
-- Employees with Id 5,6 are part of a team with team_id = 9.

select * from employee;

-- Debug
select *,count(e1.team_id) c from employee e1, employee e2 where e1.team_id=e2.team_id group by e1.employee_id,e1.team_id;

-- sol
select e1.employee_id, count(e1.team_id) team_size from employee e1, employee e2 where e1.team_id=e2.team_id group by e1.employee_id,e1.team_id order by e1.employee_id;

Select employee_id, b.team_size
from employee e
join 
(
Select team_id, count(team_id) as team_size
from employee
group by team_id) b
on e.team_id = b.team_id;

