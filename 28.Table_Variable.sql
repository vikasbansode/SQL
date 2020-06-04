-- TABLE VARIABLES

DECLARE @tvar TABLE (col1 int, col2 int)
select * from @tvar
select * from tempdb.INFORMATION_SCHEMA.TABLES;
GO