-- MAGIC TABLES ->

-- Magic Talbe is a inserted table that is used by triggers and this table is only
-- available in the context of a trigger. whenever you insert a row in talbe sql server maintain
-- magic table called inserted which retains a copy of the row that you have inserted into the
-- actual table

CREATE TABLE tblEmp_magic
(
Id				INT IDENTITY(1,1),
Name			Nvarchar(20),
Salary			Decimal(10,2),
Gender			Nvarchar(10),
DepartmentId	INT
);

insert into tblEmp_magic values('John',5000,'Male',3);
insert into tblEmp_magic values('Mike',3400,'Male',2);
insert into tblEmp_magic values('Pam',6000,'Female',1);
insert into tblEmp_magic values('Todd',4800,'Male',4);
insert into tblEmp_magic values('Sara',3200,'Female',1);
insert into tblEmp_magic values('Ben',4800,'Male',3);

Select * from tblEmp_magic;

CREATE TRIGGER trg_tblemp_ForInsert_magic
ON tblEmp_magic
FOR INSERT
AS
BEGIN
	Select * from inserted -- inserted table is only availabe for context of trigger called magic 
END

insert into tblEmp_magic values ('Jane',1800,'Female',3);

DROP trigger trg_tblemp_ForInsert_magic;	


