-- DDL (Data Defination Language) 


-- 1. CREATE TABLE
-- 2. ALTER TABLE
-- 3. TRUNCATE TABLE
-- 4. DROP TABLE



-- CREATE TABLE

CREATE table test
(
ID INT NOT NULL PRIMARY KEY,
Name varchar(2)
);

-- ALTER TABLE

alter table test
ADD  "Age" INT;

-- TRUNCATE TABLE

TRUNCATE table test;

-- DROP TABLE

DROP table test;