-- PROGRAMMING
USE Movies;
-- FOR LOOP -- sql server doesn't have for loop
-- WHILE LOOP

DECLARE @Counter INT
DECLARE @MaxOscars INT
DECLARE @NumFilms INT

SET @MaxOscars = (SELECT MAX(FilmOscarWins) FROM tblFilm)
SET @Counter = 0

WHILE @Counter <= @MaxOscars
	BEGIN
		SET @NumFilms =
			(SELECT COUNT(*) FROM tblFilm WHERE FilmOscarWins = @Counter)

		PRINT CAST(@NumFilms AS VARCHAR(3)) + ' films have won ' +
			CAST(@Counter AS Varchar(2)) + ' Oscars'

		SET @Counter = @Counter + 1
	END


---- Example 1
DECLARE @Counter INT 
SET @Counter=1
WHILE ( @Counter <= 10)
BEGIN
    PRINT 'The counter value is = ' + CONVERT(VARCHAR,@Counter)
    SET @Counter  = @Counter  + 1
END

-- Example 2
DECLARE @Counter INT 
SET @Counter=1
WHILE ( @Counter <= 10)
BEGIN
    PRINT 'Somebody stops me!'
	SET @Counter  = @Counter  + 1
END

-- Example 3 break statement
DECLARE @Counter INT 
SET @Counter=1
WHILE ( @Counter <= 10)
BEGIN
  PRINT 'The counter value is = ' + CONVERT(VARCHAR,@Counter)
  IF @Counter >=7
  BEGIN
  BREAK
  END
    SET @Counter  = @Counter  + 1
END


-- Example 4 Continue Statement
DECLARE @Counter INT 
SET @Counter=1
WHILE ( @Counter <= 20)
BEGIN
 
  IF @Counter % 2 =1
  BEGIN
  SET @Counter  = @Counter  + 1
  CONTINUE
  END
    PRINT 'The counter value is = ' + CONVERT(VARCHAR,@Counter)
    SET @Counter  = @Counter  + 1
END


-- Example 5 Reading table records through the while loop

USE DB2
GO
DROP TABLE IF EXISTS SampleTable
CREATE TABLE SampleTable
(Id INT, CountryName NVARCHAR(100), ReadStatus TINYINT)
GO
INSERT INTO SampleTable ( Id, CountryName, ReadStatus)
Values	(1, 'Germany', 0),
        (2, 'France', 0),
        (3, 'Italy', 0),
		(4,'Netherlands',0),
		(5, 'Poland',0)
  
SELECT * FROM SampleTable



DECLARE @Counter INT , @MaxId INT, 
        @CountryName NVARCHAR(100)
SELECT @Counter = min(Id) , @MaxId = max(Id) 
FROM SampleTable
 
WHILE(@Counter IS NOT NULL
      AND @Counter <= @MaxId)
BEGIN
   SELECT @CountryName = CountryName
   FROM SampleTable WHERE Id = @Counter
    
   PRINT CONVERT(VARCHAR,@Counter) + '. country name is ' + @CountryName  
   SET @Counter  = @Counter  + 1        
END


-- CASE WHEN
USE DB2;

CREATE TABLE dbo.Employee 
( 
EmployeeID INT IDENTITY PRIMARY KEY, 
EmployeeName VARCHAR(100) NOT NULL, 
Gender VARCHAR(1) NOT NULL, 
StateCode VARCHAR(20) NOT NULL, 
Salary money NOT NULL,
) 
GO
USE [SQLShackDemo]
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 
GO
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [StateCode], [Salary]) VALUES (201, N'Jerome', N'M', N'FL', 83000.0000)
GO
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [StateCode], [Salary]) VALUES (202, N'Ray', N'M', N'AL', 88000.0000)
GO
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [StateCode], [Salary]) VALUES (203, N'Stella', N'F', N'AL', 76000.0000)
GO
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [StateCode], [Salary]) VALUES (204, N'Gilbert', N'M', N'Ar', 42000.0000)
GO
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [StateCode], [Salary]) VALUES (205, N'Edward', N'M', N'FL', 93000.0000)
GO
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [StateCode], [Salary]) VALUES (206, N'Ernest', N'F', N'Al', 64000.0000)
GO
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [StateCode], [Salary]) VALUES (207, N'Jorge', N'F', N'IN', 75000.0000)
GO
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [StateCode], [Salary]) VALUES (208, N'Nicholas', N'F', N'Ge', 71000.0000)
GO
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [StateCode], [Salary]) VALUES (209, N'Lawrence', N'M', N'IN', 95000.0000)
GO
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [StateCode], [Salary]) VALUES (210, N'Salvador', N'M', N'Co', 75000.0000)
GO
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO

Select * from Employee


-- Example 1
Select EmployeeName,
CASE
WHEN Salary >= 80000 AND Salary <= 100000 THEN 'Director'
WHEN Salary >= 50000 AND Salary < 80000 THEN 'Senior Consultant'
ELSE 'Director'
END AS Designation
FROM Employee

-- Example 2 with Order by clause
Select EmployeeName,Gender,Salary
from Employee
ORDER BY  CASE Gender
WHEN 'F' THEN Salary End DESC,
Case WHEN Gender='M' THEN Salary  
END

-- Example 3 with Group by Clause
Select 
 CASE
WHEN Salary >=80000 AND Salary <=100000 THEN 'Director'
WHEN Salary >=50000 AND Salary <80000 THEN 'Senior Consultant'
Else 'Director'
END AS Designation,
Min(salary) as MinimumSalary,
Max(Salary) as MaximumSalary
from Employee
Group By
CASE
WHEN Salary >=80000 AND Salary <=100000 THEN 'Director'
WHEN Salary >=50000 AND Salary <80000 THEN 'Senior Consultant'
Else 'Director'
END