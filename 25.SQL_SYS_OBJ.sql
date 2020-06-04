-- TO RESET THE IDENTITY

DBCC CHECKIDENT (tblname,RESEED,0)

-- INSERTING DELETED AUTO INCREAMENT 

SET IDENTITY_INSERT tblname ON

-- TURNING OFF IDENTITY

SET IDENTITY_INSERT tblname OFF

-- Get the list of Tables

Select * from SYSOBJECTS where xtype = 'U';

-- get the list of tables

select * from sys.tables;

-- get the list of tables and views

select * from INFORMATION_SCHEMA.TABLES;

-- get the list of different types (XTYPE) in database

select Distinct XTYPE from SYSOBJECTS;

-- get table Space

EXECUTE master.sys.sp_MSforeachdb 'USE [?]; EXEC sp_spaceused null, false';

USE DB2;  
GO  
EXEC sp_spaceused N'Employee';  
GO  

-- get list of all databases.
 
SELECT name, database_id, create_date  
FROM sys.databases ;  
GO  

-- get database log size

USE master 
GO 
DBCC SQLPERF(logspace) 

-- get free space 

USE DB2 
GO 
DBCC SHRINKFILE (DB2) 

-- get list of foreign keys

SELECT 
  OBJECT_NAME(parent_object_id) AS [FK Table],
  name AS [Foreign Key],
  OBJECT_NAME(referenced_object_id) AS [PK Table]
FROM sys.foreign_keys
WHERE parent_object_id = OBJECT_ID('Fact.Order');

EXEC sp_fkeys 
  @fktable_name = 'Order', 
  @fktable_owner = 'Fact';

-- get list of primary key

SELECT Col.Column_Name from 
    INFORMATION_SCHEMA.TABLE_CONSTRAINTS Tab, 
    INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE Col 
WHERE 
    Col.Constraint_Name = Tab.Constraint_Name
    AND Col.Table_Name = Tab.Table_Name
    AND Constraint_Type = 'PRIMARY KEY'
    AND Col.Table_Name = 'tblStudent';