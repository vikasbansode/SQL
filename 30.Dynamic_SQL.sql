-- Dynamic SQL 
USE Movies;


-- Normal Query

SELECT * FROM tblFilm;

-- Using EXECUTE

EXECUTE ('SELECT * FROM tblFilm');

-- Using sp_executesql

EXEC sp_executesql N'SELECT * FROM tblFilm';

-- Concatenating an SQL String

DECLARE @Tablename NVARCHAR(128)
DECLARE @SQLString NVARCHAR(MAX)

SET @Tablename = N'tblFilm'

SET @SQLString = N'SELECT * FROM ' + @Tablename

EXEC sp_executesql @SQLString

-- Concatenating Numbers

DECLARE @Number INT
DECLARE @NumberString NVARCHAR(4)
DECLARE @SQLString NVARCHAR(MAX)

SET @Number = 10
SET @NumberString = CAST(@Number AS nvarchar(4))

SET @SQLString = N'SELECT TOP ' + @NumberString + ' * FROM tblFilm ORDER BY FilmReleaseDate';

EXEC sp_executesql @SQLString

-- Creating Store Procedures

CREATE PROC spVariableTable
(
	@TableName NVARCHAR(128)

)
AS
BEGIN
	DECLARE @SQLString NVARCHAR(MAX)

	SET @SQLString = N'SELECT * FROM ' + @TableName

	EXEC sp_executesql @SQLString

END


EXEC spVariableTable 'tblFilm'
EXEC spVariableTable 'tblActor'


-- Altering Proc

ALTER PROC spVariableTable
(
	@TableName NVARCHAR(128)
	,@Number INT

)
AS
BEGIN
	DECLARE @SQLString NVARCHAR(MAX)
	DECLARE @NumberString NVARCHAR(4)

	SET @NumberString = CAST(@Number AS NVARCHAR(4))
	SET @SQLString = N'SELECT  TOP ' + @NumberString + '* FROM ' + @TableName

	EXEC sp_executesql @SQLString

END


EXEC spVariableTable 'tblFilm',10
EXEC spVariableTable 'tblActor',20


-- Dynamic SQL and the IN operator

CREATE PROC spFilmYears
(
	@YearList NVARCHAR(MAX)
)
AS
BEGIN
	DECLARE @SQLString NVARCHAR(MAX)
	SET @SQLString= 'SELECT *
	FROM tblFilm
	WHERE YEAR(FilmReleaseDate) IN (' + @YearList + ')
	ORDER BY FilmReleaseDate'

	EXEC sp_executesql @SQLString
END

EXEC spFilmYears '2000,2001,2002'


-- Parameters of sp_executesql

EXEC sp_executesql
	N'SELECT FilmName, FilmReleaseDate, FilmRunTimeMinutes
	FROM tblFilm
	WHERE FilmRunTimeMinutes > @Length'
	,N'@Length INT'
	,@Length = 120

EXEC sp_executesql
	N'SELECT FilmName, FilmReleaseDate, FilmRunTimeMinutes
	FROM tblFilm
	WHERE FilmRunTimeMinutes > @Length
	AND FilmReleaseDate > @StartDate'
	,N'@Length INT,@StartDate DATETIME'
	,@Length = 180
	,@StartDate = '2000-01-01'

-- SQL Injection -- danger

CREATE PROC spInjection
(
	@TableName NVARCHAR(128)

)
AS
BEGIN
	DECLARE @SQLString NVARCHAR(MAX)

	SET @SQLString = N'SELECT * FROM ' + @TableName

	EXEC sp_executesql @SQLString

END

CREATE table tbltest -- This created for check the injection
(
ID INT,
Name Nvarchar(10)
);

EXEC spInjection 'tblActor; DROP TABLE tblTest' -- This sql injection Attack
-- After executing above statement tbltest is dropped it is dangers stuff.