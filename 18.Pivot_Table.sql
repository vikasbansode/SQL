------ Quickly generating list of column heading technique useful when generating Pivot table ------

-- STEP 1

SELECT 
	CountryName
FROM
	tblCountry

-- STEP 2

SELECT 
	',[' + CountryName + ']'
FROM
	tblCountry

-- STEP 3

SELECT 
	QUOTENAME(CountryName)
FROM
	tblCountry

-- STEP 4

SELECT 
	QUOTENAME(CountryName,'''')
FROM
	tblCountry

-- STEP 5

SELECT 
	',' + QUOTENAME(CountryName)
FROM
	tblCountry


-- PIVOT TABLES

Create table tblSalesAgent
(
SalesAgent nvarchar(20),
SalesCountry nvarchar(5),
SalesAmount money
);

insert into tblSalesAgent (SalesAgent,SalesCountry,SalesAmount) values ('Tom','UK',200)
insert into tblSalesAgent (SalesAgent,SalesCountry,SalesAmount) values ('John','US',180)
insert into tblSalesAgent (SalesAgent,SalesCountry,SalesAmount) values ('John','UK',260)
insert into tblSalesAgent (SalesAgent,SalesCountry,SalesAmount) values ('David','India',450)
insert into tblSalesAgent (SalesAgent,SalesCountry,SalesAmount) values ('Tom','India',350)
insert into tblSalesAgent (SalesAgent,SalesCountry,SalesAmount) values ('David','US',200)
insert into tblSalesAgent (SalesAgent,SalesCountry,SalesAmount) values ('Tom','US',130)
insert into tblSalesAgent (SalesAgent,SalesCountry,SalesAmount) values ('John','India',540)
insert into tblSalesAgent (SalesAgent,SalesCountry,SalesAmount) values ('John','UK',120)
insert into tblSalesAgent (SalesAgent,SalesCountry,SalesAmount) values ('David','Uk',220)
insert into tblSalesAgent (SalesAgent,SalesCountry,SalesAmount) values ('John','UK',420)
insert into tblSalesAgent (SalesAgent,SalesCountry,SalesAmount) values ('David','US',320)
insert into tblSalesAgent (SalesAgent,SalesCountry,SalesAmount) values ('Tom','US',300)
insert into tblSalesAgent (SalesAgent,SalesCountry,SalesAmount) values ('Tom','UK',660)
insert into tblSalesAgent (SalesAgent,SalesCountry,SalesAmount) values ('John','India',430)
insert into tblSalesAgent (SalesAgent,SalesCountry,SalesAmount) values ('David','India',230)

Select * from tblSalesAgent;

Select		SalesAgent,INDIA,US,UK
from		tblSalesAgent
PIVOT
(
	sum(SalesAmount)
	for salesCountry
	IN ([India],[US],[UK])

) AS PivotTable;


Select		SalesAgent,INDIA,US,UK
from		
(
	Select		SalesAgent, SalesCountry, SalesAmount
	from		tblSalesAgent	

) as SourceTale
PIVOT
(
	SUM(SalesAmount) for SalesCountry
	IN (India,US,UK)

) as PivotTable;


--====-====-====-====-====-====-====-====-====-====-====-====-====-====-====-====-====-====

USE Movies;

SELECT * FROM
	(SELECT
		CountryName,
		FilmID
	FROM
		tblCountry AS c
	INNER JOIN
		tblFilm AS f 
	ON c.CountryID = f.FilmCountryID) AS BaseData
PIVOT
(
 COUNT(FilmID)
 FOR CountryName
 IN (
		 [China]
		,[France]
		,[Japan]
		,[New Zealand]
		,[United Kingdom]
		,[United States]
		,[Germany]
		,[Russia]
  )	

) AS PivotTable


--------------------------------------------------------

SELECT * FROM
	(SELECT
		CountryName
		,YEAR(FilmReleaseDate) AS [FilmYear]
		,FilmID
	FROM
		tblCountry AS c
	INNER JOIN
		tblFilm AS f 
	ON c.CountryID = f.FilmCountryID) AS BaseData
PIVOT
(
 COUNT(FilmID)
 FOR CountryName
 IN (
		 [China]
		,[France]
		,[Japan]
		,[New Zealand]
		,[United Kingdom]
		,[United States]
		,[Germany]
		,[Russia]
  )	

) AS PivotTable
ORDER BY
	FilmYear DESC


---- DYNAMIC Pivot Table

-- STEP 1

DECLARE @ColumnNames NVARCHAR(MAX) =''

SELECT @ColumnNames += QUOTENAME(CountryName) + ','
FROM tblCountry

SET @ColumnNames = LEFT(@ColumnNames,LEN(@ColumnNames) - 1)

PRINT @ColumnNames

-- STEP 2

DECLARE @ColumnNames NVARCHAR(MAX) =''
DECLARE @SQL NVARCHAR(MAX) = ''
SELECT @ColumnNames += QUOTENAME(CountryName) + ','
FROM tblCountry

SET @ColumnNames = LEFT(@ColumnNames,LEN(@ColumnNames) - 1)

SET @SQL =
'SELECT * FROM
	(SELECT
		CountryName
		,YEAR(FilmReleaseDate) AS [FilmYear]
		,FilmID
	FROM
		tblCountry AS c
	INNER JOIN
		tblFilm AS f 
	ON c.CountryID = f.FilmCountryID) AS BaseData
PIVOT
(
 COUNT(FilmID)
 FOR CountryName
 IN ('
		+ @ColumnNames +
	 ')	
 ) AS PivotTable
ORDER BY
	FilmYear DESC'

EXECUTE sp_executesql @SQL



