-- Question7
-- There is a table courses with columns: student and class

-- Please list out all classes which have more than or equal to 5 students.

-- For example, the table:

-- +---------+------------+
-- | student | class      |
-- +---------+------------+
-- | A       | Math       |
-- | B       | English    |
-- | C       | Math       |
-- | D       | Biology    |
-- | E       | Math       |
-- | F       | Computer   |
-- | G       | Math       |
-- | H       | Math       |
-- | I       | Math       |
-- +---------+------------+

INSERT INTO `jdbc`.`class`
(`student`,
`class`)
VALUES
('A', 'Math'), ('B', 'English'), ('C', 'Math'), ('D', 'Biology'), ('E', 'Math'), ('F', 'Computer'),
('G', 'Math'), ('H', 'Math'), ('I', 'English');

select * from classes;

-- solution
select a.class from (select class, count(*) from classes group by class having count(*)>=5)a;

select class from classes group by class having count(distinct student)>=5;