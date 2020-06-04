-- JOINS in SQL - are used to retrive data from 2 or more related tables. in general tables are related to
-- each other using foreign key constraint.


-- 1. INNER JOIN
-- 2. LEFT JOIN
-- 3. RIGHT JOIN
-- 4. FULL JOIN
-- 5. CROSS JOIN

CREATE TABLE tblDepartment
(
Id				INT NOT NULL PRIMARY KEY,
DepartmentName	varchar(50),
Location		varchar(10),
DepartmentHead	varchar(50),
);

insert into tblDepartment values (1,'IT','London','Rick');
insert into tblDepartment values (2,'Payroll','Delhi','Ron');
insert into tblDepartment values (3,'HR','New York','Christie');
insert into tblDepartment values (4,'Other Department','Sydney','Cindrella');


CREATE TABLE tblEmployee
(
ID				INT NOT NULL PRIMARY KEY,
Name			varchar(20),
Gender			varchar(10),
Salary			money,
DepartmentId	INT CONSTRAINT tblEmployee_deptId_FK
FOREIGN KEY (DepartmentId) REFERENCES tblDepartment(Id)
);

insert into tblEmployee values (1,'Tom','Male',4000,1);
insert into tblEmployee values (2,'Pam','Female',3000,3);
insert into tblEmployee values (3,'John','Male',3500,1);
insert into tblEmployee values (4,'Sam','Male',4500,2);
insert into tblEmployee values (5,'Todd','Male',2800,2);
insert into tblEmployee values (6,'Ben','Male',7000,2);
insert into tblEmployee values (7,'Sara','Female',4800,3);
insert into tblEmployee values (8,'Valarie','Female',5500,1);
insert into tblEmployee values (9,'James','Male',6500,NULL);
insert into tblEmployee values (10,'Russell','Male',8800,NULL);

Select * from tblEmployee;
Select * from tbldepartment;

-- INNER JOIN

SELECT		Name,Gender,Salary,DepartmentName 
FROM		tblEmployee
INNER JOIN	tblDepartment
ON			tblEmployee.DepartmentId = tblDepartment.Id;

-- LEFT JOIN

SELECT		Name,Gender,Salary,DepartmentName 
FROM		tblEmployee
LEFT JOIN	tblDepartment
ON			tblEmployee.DepartmentId = tblDepartment.Id;

-- RIGHT JOIN

SELECT		Name,Gender,Salary,DepartmentName 
FROM		tblEmployee
RIGHT JOIN	tblDepartment
ON			tblEmployee.DepartmentId = tblDepartment.Id;

-- FULL JOIN

SELECT		Name,Gender,Salary,DepartmentName 
FROM		tblEmployee
FULL JOIN	tblDepartment
ON			tblEmployee.DepartmentId = tblDepartment.Id;

-- CROSS JOIN

SELECT		Name,Gender,Salary,DepartmentName 
FROM		tblEmployee
CROSS JOIN	tblDepartment

-- JOINS with where clause only retrive non-matching rows
-- INNER JOIN

SELECT		Name,Gender,Salary,DepartmentName 
FROM		tblEmployee
INNER JOIN	tblDepartment
ON			tblEmployee.DepartmentId = tblDepartment.Id
WHERE		DepartmentId IS NULL;

-- LEFT JOIN

SELECT		Name,Gender,Salary,DepartmentName 
FROM		tblEmployee
LEFT JOIN	tblDepartment
ON			tblEmployee.DepartmentId = tblDepartment.Id
WHERE		DepartmentId IS NULL;

-- RIGHT JOIN

SELECT		Name,Gender,Salary,DepartmentName 
FROM		tblEmployee
RIGHT JOIN	tblDepartment
ON			tblEmployee.DepartmentId = tblDepartment.Id
WHERE		DepartmentId IS NULL;

-- FULL JOIN

SELECT		Name,Gender,Salary,DepartmentName 
FROM		tblEmployee
RIGHT JOIN	tblDepartment
ON			tblEmployee.DepartmentId = tblDepartment.Id
WHERE		DepartmentId IS NULL;

-- SELF JOIN

CREATE TABLE Employee
    ([emp_id] int, [Name] varchar(4), [ManagerID] varchar(4))
;
    
INSERT INTO Employee
    ([emp_id], [Name], [ManagerID])
VALUES
    (1, 'Mike', '3'),
    (2, 'Rob', '1'),
    (3, 'Todd', NULL),
    (4, 'Ben', '1'),
    (5, 'Sam', '1')
;

select * from Employee;

-- INNER JOIN

select		E.Name as Employee, M.Name as Manager 
from		Employee E
INNER JOIN	Employee M
ON			E.ManagerID=M.emp_id

-- LEFT JOIN

select		E.Name as Employee, M.Name as Manager 
from		Employee E
LEFT JOIN	Employee M
ON			E.ManagerID=M.emp_id

-- RIGHT JOIN

select		E.Name as Employee, M.Name as Manager 
from		Employee E
RIGHT JOIN	Employee M
ON			E.ManagerID=M.emp_id

-- FULL JOIN

select		E.Name as Employee, M.Name as Manager 
from		Employee E
FULL JOIN	Employee M
ON			E.ManagerID=M.emp_id

-- CROSS JOIN

select		E.Name as Employee, M.Name as Manager
from		Employee E
CROSS JOIN	Employee M