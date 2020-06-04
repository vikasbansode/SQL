-- DERIVED TABLES

select * from
(
select emp_name,salary, salary + 500 as totalsalary from tblemp
) as tblsalary
where totalsalary > 3000;