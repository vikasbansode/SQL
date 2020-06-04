-- TRIGGERS

CREATE TABLE tblEmp_trigger
(
Id				INT IDENTITY(1,1),
Name			Nvarchar(20),
Salary			Decimal(10,2),
Gender			Nvarchar(10),
DepartmentId	INT
);

insert into tblEmp_trigger values('John',5000,'Male',3);
insert into tblEmp_trigger values('Mike',3400,'Male',2);
insert into tblEmp_trigger values('Pam',6000,'Female',1);
insert into tblEmp_trigger values('Todd',4800,'Male',4);
insert into tblEmp_trigger values('Sara',3200,'Female',1);
insert into tblEmp_trigger values('Ben',4800,'Male',3);



CREATE TABLE tblEmp_Audit
(
Id			INT IDENTITY,
AuditData	Nvarchar(MAX)
);


------------------------ After Insert ------------------------

CREATE TRIGGER trg_tblemp_ForInsert
ON tblEmp_trigger
FOR INSERT
AS
BEGIN
	Declare @Id int
	Select @Id = Id from inserted

	insert into tblEmp_Audit values ('New employe with Id = ' +
	CAST(@Id as nvarchar(5)) + ' is added at ' + CAST(GETDATE() as nvarchar(20)))

END

insert into tblEmp_trigger values ('Jimmy',1800,'Female',3);

Select * from tblEmp_trigger;
Select * from tblEmp_Audit;


------------------------ After Delete ------------------------

CREATE TRIGGER trg_tblemp_ForDelete
ON tblEmp_trigger
FOR DELETE
AS
BEGIN
	Declare @Id int
	Select @Id = Id from deleted

	insert into tblEmp_Audit values ('New employe with Id = ' +
	CAST(@Id as nvarchar(5)) + ' is deleted at ' + CAST(GETDATE() as nvarchar(20)))

END


delete from tblEmp_trigger where Id=7;

Select * from tblEmp_trigger;
Select * from tblEmp_Audit;


------------------------------------ After Update ------------------------

CREATE TRIGGER trg_tblemp_ForUpdate  -- This trigger created for magic
ON tblEmp_trigger
FOR UPDATE
AS
BEGIN
	 Select * from deleted
	 Select * from inserted
END

update tblEmp_trigger set Name = 'Mike', Salary = 2000,Gender = 'Male' where Id = 2;


ALTER TRIGGER trg_tblemp_ForUpdate
ON tblEmp_trigger
FOR UPDATE
AS
BEGIN
	 Declare @Id int
	 Declare @OldName nvarchar(20),@NewName nvarchar(20)
	 Declare @OldSalary Decimal(10,2), @NewSalary Decimal(10,2)
	 Declare @OldGender nvarchar(20), @NewGender nvarchar(20)
	 Declare @OldDeptId int, @NewDeptId int

	 Declare @AuditString nvarchar(1000)

	 Select *
	 into #TempTable
	 from inserted

	 while(Exists(Select Id from #TempTable))
	 BEGIN
		Set @AuditString = ''

		select Top 1 @Id = Id, @NewName = Name,
		@NewGender = Gender, @NewSalary = Salary,
		@NewDeptId = DepartmentId
		from #TempTable

		Select @OldName = Name, @OldGender = Gender,
		@OldSalary = Salary, @OldDeptId = DepartmentId
		from deleted where Id = @Id


		set @AuditString = 'Employee with Id = ' + CAST(@Id as nvarchar(4)) + 'changed'
		if(@OldName <> @NewName)
			set @AuditString = @AuditString + 'NAME from ' + @OldName + ' to ' + @NewName

		if (@OldGender <> @NewGender)
			set @AuditString = @AuditString + ' GENDER from ' + @OldGender + ' to ' + @NewGender

		if (@OldSalary <> @NewSalary)
			set @AuditString = @AuditString + ' SALARY from ' + @OldSalary + ' to ' + cast(@NewSalary as nvarchar(10))

		if (@OldDeptId <> @NewDeptId)
			set @AuditString = @AuditString + ' DepartmentId from ' + @OldDeptId+ ' to ' + CAST(@NewDeptId as nvarchar(5))

		insert into tblEmp_Audit values(@AuditString)

		Delete from #TempTable where Id = @Id
	 END

END

update tblEmp_trigger set Name = 'Tods', Salary = 2000,Gender = 'Female' where Id = 4;

Select * from tblEmp_trigger;
Select * from tblEmp_Audit;



--------------- INSETED OF INSERT TRIGGER ---------------------------------------