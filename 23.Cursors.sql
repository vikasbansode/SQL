-- CURSOR -> Cursor are bad for performance never use it.

USE Movies;
DECLARE FilmCursor CURSOR
FOR
	SELECT
		FilmID
		,FilmName
		,FilmReleaseDate
	FROM 
		tblFilm
	OPEN FilmCursor
		FETCH NEXT FROM FilmCursor
			WHILE @@FETCH_STATUS = 0
		FETCH NEXT FROM FilmCursor
CLOSE FilmCursor
DEALLOCATE FilmCursor;