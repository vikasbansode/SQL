-- MERGE

CREATE TABLE studentSource
    ([ID] int, [Name] varchar(4))
;
    
INSERT INTO studentSource
    ([ID], [Name])
VALUES
    (1, 'Mike'),
    (2, 'Sara')
;

CREATE TABLE StudentTarget
    ([ID] int, [Name] varchar(6))
;
    
INSERT INTO StudentTarget
    ([ID], [Name])
VALUES
    (1, 'Mike M'),
    (3, 'John')
;

Select * from studentSource;
select * from StudentTarget;

MERGE INTO StudentTarget AS T
USING studentSource AS S
ON T.ID = S.ID
WHEN MATCHED THEN
	UPDATE SET T.NAME = S.NAME
WHEN NOT MATCHED BY TARGET THEN
	INSERT (ID,NAME) VALUES(S.ID, S.NAME)
WHEN NOT MATCHED BY SOURCE THEN
	DELETE;


-- Not using DELETE

TRUNCATE TABLE studentSource;
TRUNCATE TABLE StudentTarget

INSERT INTO studentSource([ID], [Name]) VALUES (1, 'Mike'),(2, 'Sara');
INSERT INTO StudentTarget([ID], [Name]) VALUES(1, 'Mike M'),(3, 'John');

MERGE INTO StudentTarget AS T
USING studentSource AS S
ON T.ID = S.ID
WHEN MATCHED THEN
	UPDATE SET T.NAME = S.NAME
WHEN NOT MATCHED BY TARGET THEN
	INSERT (ID,NAME) VALUES(S.ID, S.NAME);


Select * from studentSource;
select * from StudentTarget;