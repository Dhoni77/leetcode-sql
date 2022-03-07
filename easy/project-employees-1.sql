select project_id, round(avg(experience_years), 2) average_years from 
project inner join employee on project.employee_id=employee.employee_id
group by project_id;

-- solution 2
Select a.project_id, round(sum(b.experience_years)/count(b.employee_id),2) as average_years
from project as a
join
employee as b
on a.employee_id=b.employee_id
group by a.project_id;