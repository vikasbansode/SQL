-- CTE (COMMON TABLE EXPRESSION) -> is a temporary result set, that can be referenced within a SELECT, INSERT,UPDATE or DELETE Statement, that immediately follows the CTE.

Create table tblemployee1
(
Id INT NOT NULL primary key,
Name nvarchar(20),
Gender nvarchar(7),
DepartmentId INT
);

insert into tblemployee1(Id,Name,Gender,DepartmentId) values (1,'John','Male',3);
insert into tblemployee1(Id,Name,Gender,DepartmentId) values (2,'Mike','Male',3);
insert into tblemployee1(Id,Name,Gender,DepartmentId) values (3,'Pam','Female',3);
insert into tblemployee1(Id,Name,Gender,DepartmentId) values (4,'Todd','Male',3);
insert into tblemployee1(Id,Name,Gender,DepartmentId) values (5,'Sara','Female',3);
insert into tblemployee1(Id,Name,Gender,DepartmentId) values (6,'Ben','Male',3);	

Create table tbldepartment
(
DeptId INT NOT NULL PRIMARY KEY,
DeptName nvarchar(10)
);

insert into tbldepartment (DeptId,DeptName) values(1,'IT');
insert into tbldepartment (DeptId,DeptName) values(2,'Payroll');
insert into tbldepartment (DeptId,DeptName) values(3,'HR');
insert into tbldepartment (DeptId,DeptName) values(4,'Admin');

alter table tblemployee1
ADD constraint tblemp1_DepartmentId_FK
foreign key (DepartmentId) References tbldepartment(DeptId)

with EmployeeCount (DepartmentId,TotalEmployees)
as
(
	Select		DepartmentId, count(*) as TotalEmployees
	from		tblemployee1
	group by	DepartmentId
)
Select		DeptName, TotalEmployees
from		tbldepartment
JOIN		EmployeeCount
ON			tbldepartment.DeptId = EmployeeCount.DepartmentId
ORDER BY	TotalEmployees;

with Employee_Name_Gender
AS
(
	Select Id, Name, Gender from tblemployee1
)
update Employee_Name_Gender
set Gender  = 'male' WHERE Id = 3;

with Employee_Name_Gender
AS
(
	Select Id,Name,Gender from tblemployee1
)
Delete from tblemployee1 where Name = 'Ben';