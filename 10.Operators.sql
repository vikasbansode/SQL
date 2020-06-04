-- OPERATORS

-- 01. UNION
-- 02. UNION ALL
-- 03. INTERSECT
-- 04. EXCEPT
-- 05. EXISTS
-- 06. AND
-- 07. OR
-- 08. IS NULL
-- 09. IS NOT NULL
-- 10. LIKE
-- 11. IN
-- 12. BETWEEN
-- 13. ALL
-- 14. ANY
-- 15. DISTINCT
-- 16. TOP 

CREATE TABLE emp_hyd
    ([EID] int, [ENAME] varchar(6), [SALARY] int)
;
    
INSERT INTO emp_hyd
    ([EID], [ENAME], [SALARY])
VALUES
    (101, 'Adams', 85000),
    (102, 'Scott', 34000),
    (103, 'James', 55000),
    (104, 'Warner', 12000)
;

select * from emp_hyd;

CREATE TABLE emp_chennai
    ([EID] int, [ENAME] varchar(6), [SALARY] int)
;
    
INSERT INTO emp_chennai
    ([EID], [ENAME], [SALARY])
VALUES
    (101, 'Adams', 85000),
    (105, 'Allen', 11000),
    (106, 'Miller', 98000)
;

select * from emp_chennai;

-- UNION -> to combined the result of two or more than two select statements as a single unit of values without duplicate values.

select * from emp_hyd
UNION
select * from emp_chennai;

-- UNION ALL

select * from emp_hyd
UNION ALL 
select * from emp_chennai;

-- INTERSECT -> it returns common values

select * from emp_hyd
INTERSECT
select * from emp_chennai;

-- EXCEPT/MINUS-Oracle -> to returns all values from the left hand side table which are not found in the right hand side table.

select * from emp_hyd
EXCEPT
select * from emp_chennai;

select * from emp_chennai
EXCEPT
select * from emp_hyd;

-- EXISTS

select * from emp_hyd
where EXISTS(select * from emp_chennai);

select * from emp_chennai
where EXISTS(select * from emp_hyd);

-- ARITHMATIC

select 1 + 1;
select 1 - 1;
select 10 / 5;
select 5 * 2;
Select (CASE WHEN 10 > 20 THEN 'greater' ELSE 'smaller' END) AS comparision;
Select (CASE WHEN 10 < 20 THEN 'greater' ELSE 'smaller' END) AS comparision;
Select (CASE WHEN 10 <= 20 THEN 'greater' ELSE 'smaller' END) AS comparision;
Select (CASE WHEN 10 >= 20 THEN 'greater' ELSE 'smaller' END) AS comparision;

-- CREATE RELEVANT TABLE FOR OTHER OPERATIONS.

CREATE TABLE tblcustomers
    ([ID] int, [NAME] varchar(8), [AGE] int, [ADDRESS] varchar(9), [SALARY] int)
;
    
INSERT INTO tblcustomers
    ([ID], [NAME], [AGE], [ADDRESS], [SALARY])
VALUES
    (1, 'Ramesh', 32, 'Ahmedabad', 2000),
    (2, 'Khilan', 25, 'Delhi', 1500),
    (3, 'kaushik', 23, 'Kota', 2000),
    (4, 'Chaitali', 25, 'Mumbai', 6500),
    (5, 'Hardik', 27, 'Bhopal', 8500),
    (6, 'Komal', 22, 'MP', 4500),
    (7, 'Muffy', 24, 'Indore', 10000)
;

-- AND

SELECT * FROM tblcustomers WHERE AGE >= 25 AND SALARY >= 6500;

-- OR

SELECT * FROM tblcustomers WHERE AGE >= 25 OR SALARY >= 6500;

-- IS NULL

SELECT * FROM tblcustomers WHERE AGE IS NULL;

-- IS NOT NULL

SELECT * FROM tblcustomers WHERE AGE IS NOT NULL;

-- LIKE

SELECT * FROM tblcustomers WHERE NAME LIKE 'Ko%';

-- IN

SELECT * FROM tblcustomers WHERE AGE IN ( 25, 27 );

-- BETWEEN

SELECT * FROM tblcustomers WHERE AGE BETWEEN 25 AND 27;

-- EXISTS

SELECT AGE FROM tblcustomers WHERE EXISTS (SELECT AGE FROM tblcustomers WHERE SALARY > 6500);

-- ALL

SELECT * FROM tblcustomers WHERE AGE > ALL (SELECT AGE FROM tblcustomers WHERE SALARY > 6500);

-- ANY

SELECT * FROM tblcustomers WHERE AGE > ANY (SELECT AGE FROM tblcustomers WHERE SALARY > 6500);

-- DISTINCT

SELECT DISTINCT * FROM tblcustomers;

-- TOP

SELECT TOP 3 * FROM tblcustomers;