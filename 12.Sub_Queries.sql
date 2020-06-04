-- SUB-QUERIES
-- Types of Sub-queries
-- 1. Non-Correlated subquery
-- 2. Correlated Subquery
-- 3. Nested Subuery

CREATE TABLE tblProducts
(
Id INT identity primary key,
Name varchar(50),
Description nvarchar(250)
);

insert into tblProducts values ('TV','52 inch black color LCD TV');
insert into tblProducts values ('Laptop','Very thin black color acer laptop');
insert into tblProducts values ('Desktop','HP high performance desktop');

CREATE TABLE tblProductSales
(
Id int primary key identity,
ProductId int foreign key references tblProducts(Id),
UnitPrice int,
QuantitySold int
);

insert into tblProductSales values(3,450,5),(2,250,4),(3,450,4),(3,450,9);
select * from tblProducts;
select * from tblProductSales;

-- 1. Non-Correlated subquery ->  A subquery which is not dependent on the outer query for its values.
-- Using sub-query -- This query return the product which we haven't sold it at least onece. that is TV

select Id,Name,[Description] from tblProducts
WHERE Id NOT IN (Select distinct Productid from tblProductSales)

-- Using join 

select tblProducts.Id,Name,[Description] from tblProducts
left join tblProductSales
on tblProducts.id = tblProductSales.ProductId
WHERE tblProductSales.ProductId IS NULL;

-- CORRELATED SUB-QUERIES -> If the subquery dependes on the outer query for its values, then that
-- subquery is called correlated sub query.

SELECT	Name,
(SELECT SUM(QuantitySold) FROM tblProductSales WHERE ProductId = tblProducts.Id)
FROM	tblProducts

------------------------------------------------------------------------------------

USE Movies;

-------------------- Example 1 ------------------------------

SELECT	FilmName,FilmReleaseDate
FROM	tblFilm
WHERE	FilmOscarWins =
		(SELECT		MAX(FilmOscarWins) 
		 FROM		tblFilm
		);


SELECT	FilmName,FilmRunTimeMinutes
FROM	tblFilm
WHERE	FilmRunTimeMinutes > 
(
SELECT	AVG(FilmRunTimeMinutes) 
FROM	tblFilm
);

-------------------- Example 2 ------------------------------

SELECT 
		FilmName
		,FilmRunTimeMinutes
		,(SELECT
			AVG(FilmRunTimeMinutes)
			FROM
				tblFilm) AS [AverageRunTime] 
FROM
	tblFilm
WHERE
	FilmRunTimeMinutes <=
	(SELECT
			AVG(FilmRunTimeMinutes)
	 FROM
			tblFilm) 

-------------------- Example 3 ------------------------------


SELECT
	FilmName
	,FilmReleaseDate
	,FilmBudgetDollars
FROM
	tblfilm
WHERE
	FilmBudgetDollars >
					(SELECT
						MAX(FilmBudgetDollars)
					FROM 
						tblFilm
					WHERE
						FilmReleaseDate < '2000-01-01')
	
	
SELECT
	FilmName
	,FilmReleaseDate
FROM 
	tblFilm	
WHERE
	FilmReleaseDate = 
				(SELECT
					FilmReleaseDate
				FROM
					tblFilm 
				WHERE
					FilmName = 'Casino')


-------------------- RETURNING MULTIPLE VALUES ------------------------------

SELECT
	FilmName,
	FilmDirectorID
FROM
	tblFilm
WHERE
	FilmDirectorID IN
					(
					SELECT
						DirectorID
					FROM
						tblDirector
					WHERE
						DirectorDOB BETWEEN '1946-01-01' AND '1946-12-31')


-------------------- CORRELATED SUB-QUERIES ------------------------------

SELECT
	c.CountryName
	,f.FilmName
	,f.FilmRunTimeMinutes
FROM
	tblFilm AS f
INNER JOIN
	tblCountry AS c
ON c.CountryID = f.FilmCountryID
WHERE
	f.FilmRunTimeMinutes =
	(
		SELECT MAX(FilmRunTimeMinutes)
		FROM tblFilm AS g
		WHERE g.FilmCountryID = f.FilmCountryID
	) 



-------------------- Expression in CORRELATED SUB-QUERIES ------------------------------

SELECT
	YEAR(F.FilmReleaseDate) AS y
	,f.FilmName
	,f.FilmRunTimeMinutes
FROM
	tblFilm AS f
WHERE
	f.FilmRunTimeMinutes >
	(
		SELECT AVG(FilmRunTimeMinutes)
		FROM tblFilm AS g
		WHERE YEAR(g.FilmReleaseDate) = YEAR(f.FilmReleaseDate)
	)
ORDER BY y;