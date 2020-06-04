-- USER DEFINED FUNCTION
-- Scaler Function

ALTER FUNCTION CalculateAge (@DOB Date)
RETURNS INT
AS
BEGIN
DECLARE @AGE INT
SET @AGE = DATEDIFF(YEAR,@DOB,GETDATE()) -
			CASE
				WHEN (MONTH(@DOB) > MONTH(GETDATE())) OR
					 (MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE()))
				THEN 1
				ELSE 0
			END
RETURN @AGE
END

Select dbo.CalculateAge('08/11/2011');



Create FUNCTION dbo.ufnGetCustomerData (@CustomerID int)  
RETURNS varchar (50)
AS   
BEGIN  
    DECLARE @CustomerName varchar(50);  
    SELECT @CustomerName = customername   
    FROM [WideWorldImporters].[Sales].[Customers] C
    WHERE C.CustomerID=@CustomerID
      RETURN @CustomerName;  
END;

CREATE OR ALTER FUNCTION Sales.SalesQuantity
    (@Description NVARCHAR(100))
RETURNS SMALLINT
AS
BEGIN
    DECLARE @Count SMALLINT
 
    SELECT @Count= Quantity 
    FROM Sales.OrderLines
    WHERE Description=@Description;
 
    RETURN(@Count)
END;
GO


CREATE FUNCTION sales.udfNetSale(
    @quantity INT,
    @list_price DEC(10,2),
    @discount DEC(4,2)
)
RETURNS DEC(10,2)
AS 
BEGIN
    RETURN @quantity * @list_price * (1 - @discount);
END;

-- inline table valued functions

USE DB2;
SELECT * FROM tblEmployee;


CREATE Function fn_EmployeesByGender
(@Gender nvarchar(10))
RETURNS Table
AS
RETURN
(
SELECT Id, Name, Gender, DepartmentId
FROM tblEmployee
WHERE Gender = @Gender
);

Select * from fn_EmployeesByGender('Female')


-- Multi-Statement table values functions

CREATE TABLE tblfunction
    ([Id] int, [Name] varchar(4), [DateOfBirth] datetime, [Gender] varchar(6), [DepartmentId] int)
;
    
INSERT INTO tblfunction
    ([Id], [Name], [DateOfBirth], [Gender], [DepartmentId])
VALUES
    (1, 'Sam', '1980-12-30 00:00:00', 'Male', 1),
    (2, 'Pam', '1982-09-01 00:00:00', 'Female', 2),
    (3, 'John', '1985-08-22 00:00:00', 'Male', 1),
    (4, 'Sara', '1979-11-29 00:00:00', 'Female', 3),
    (5, 'Todd', '1978-11-29 00:00:00', 'Male', 1)
;


CREATE Function fn_MSTVF_GetEmployee()
RETURNS @Table Table (Id INT, Name nvarchar(20),DOB Date)
AS
BEGIN
	insert into @Table
	Select Id,Name,CAST(DateOfBirth as Date) from tblfunction

	RETURN
	
END

Select * from fn_MSTVF_GetEmployee()


