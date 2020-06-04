-- DML (Data Manipulation Language)

-- 1. INSERT RECORDS
-- 2. UPDATE RECORDS
-- 3. DELETE RECORDS


-- INSERT RECORDS INTO TABLE

insert into test (ID,Name) values (1,'A');

-- UPDATE RECORDS INTO TABLE

update test set Age = 10 where Name = 'A';

-- DELETE RECORDS FROM TABLE

delete test where ID = 7;