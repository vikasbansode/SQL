-- VIEWS

create view viewempbydept
as
select e.emp_id,e.emp_name,e.salary,e.Gender,d.dept_name
from tblemp as e
join tbldept as d
on e.dept_id = d.dept_id;

select * from viewempbydept;