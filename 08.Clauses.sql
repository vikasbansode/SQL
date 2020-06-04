-- CLAUSES

-- 1. SELECT
-- 2. FROM
-- 3. WHERE
-- 4. GROUP BY
-- 5. HAVING
-- 6. ORDER BY



CREATE TABLE tblsales
    ([Product] varchar(8), [SalesAmount] int)
;
    
INSERT INTO tblsales
    ([Product], [SalesAmount])
VALUES
    ('iphone', 500),
    ('laptop', 800),
    ('iphone', 1000),
    ('speakers', 400),
    ('laptop', 600)
;
-- SELECT CLAUSE

SELECT * from tblsales;

-- FROM CLAUSE

Select * FROM tblsales;

-- WHERE CLAUSE

select Product, SUM(SalesAmount) AS TotalSales
from tblsales
WHERE Product IN ('iphone','Speakers')
group by Product

-- GROUP BY CLAUSE

select Product, SUM(SalesAmount) AS TotalSales
from tblsales
GROUP BY Product

-- HAVING CLAUSE

select Product, SUM(SalesAmount) AS TotalSales
from tblsales
group by Product
HAVING  SUM(SalesAmount) > 1000;

-- ORDER BY CLAUSE

select * from tblsales
ORDER BY Product asc;

select * from tblsales
ORDER BY Product desc;

-- Difference b/w WHERE and HAVING CLAUSE

-- 1. WHERE clause cannot be used with aggregates where as HAVING can.
-- 2. WHERE Clasue is used for filtering individual rows where as HAVING Clause is used to filter groups.
-- 3. WHERE comes before GROUP BY Clause. It means WHERE Clause filters rows before aggregate calculations are performed and 
--    HAVING comes after GROUP BY Clause. It means HAVING Clause filters rows after aggregate calculation are performed.
-- 4. from a performance standpoint, HAVING is slower than WHERE and should be avoided when possible.

-- NOTE : WHERE and HAVING can be used together in SELECT query. In this case WHERE clause is applied first to filter individual rows.
-- The rows are then grouped and aggregate calculations are performed, and then the HAVING clause filter the groups. 

-- WHERE AND HAVING clause together.

select Product, SUM(SalesAmount) AS TotalSales
from tblsales
WHERE Product IN ('iphone','speakers')
GROUP BY Product
HAVING  SUM(SalesAmount) > 1000;