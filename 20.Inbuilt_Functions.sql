-- STRING FUNCTIONS
Select ASCII('A');
Select CHAR(65);
select LTRIM('  Hello');
Select RTRIM('Hello   ');
select UPPER('hello');
Select LOWER('HELLO');
Select REVERSE('Hello');
Select LEN('Hello');
Select LEFT('ABCDF',3);
Select RIGHT('ABCDF',3);
Select CHARINDEX('@','sara@aaa.com',1);
Select SUBSTRING('Sara@aaa.com',6,7);
Select REPLICATE('Vikas ',3);
select SPACE(5);
select PATINDEX('%aaa.com','sara@aaa.com');
select REPLACE('@gmail.com','@amdocs.com','vikas.bansode@amdocs.com');

-- DATE TIME FUNCTION

select GETDATE();
select CURRENT_TIMESTAMP;
select SYSDATETIME();
Select SYSDATETIMEOFFSET();
Select GETUTCDATE();
Select SYSUTCDATETIME();
Select ISDATE('vikas');
Select ISDATE(GETDATE());
Select DAY(GETDATE());
Select MONTH(GETDATE());
Select YEAR(GETDATE());

-- MATH FUNCTIONS

Select ABS(-5);
Select CEILING(9.9);
Select FLOOR(9.9);
Select POWER(2,3);
Select RAND(1);
Select SQUARE(9);
Select SQRT(81);
Select ROUND(10.5556,2)