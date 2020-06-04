-- BULK COPY
CREATE DATABASE SourceDB;

USE SourceDB;

CREATE TABLE Departments
(
	ID int primary key identity,
	Name nvarchar(50),
	Location nvarchar(50)

);

insert into Departments values ('IT','New York');
insert into Departments values ('HR','London');
insert into Departments values ('Payroll','Mumbai');


CREATE TABLE Employees
(
	ID int primary key identity,
	Name nvarchar(50),
	Gender nvarchar(50),
	DepartmentID int foreign key references Departments(ID)
);

insert into Employees values ('Mark','Male',1);
insert into Employees values ('John','Male',1);
insert into Employees values ('Mary','Female',2);
insert into Employees values ('Steve','Male',2);
insert into Employees values ('Ben','Male',3);

CREATE DATABASE DestinationDB;
USE DestinationDB;


-- BACK UP TABLES

USE SourceDB;

SELECT * 
INTO Emp_tbl
From Employees

select * from Emp_tbl;