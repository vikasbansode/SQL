-- CONSTRAINTS

-- 1. PRIMARY KEY CONSTRAINT
-- 2. FOREIGN KEY CONSTRAINT
-- 3. DEFAULT CONSTRAINT
-- 4. CHECK CONSTRAINT
-- 5. UNIQUE CONSTRAINT
-- 6. NOT NULL CONSTRAINT


-- PRIMARY KEY CONSTRAINT

CREATE TABLE tblStudent
(
ID INT NOT NULL PRIMARY KEY,
NAME nvarchar(20),
Age INT,
Gender nvarchar(7),
Email nvarchar(50)
)

-- FOREIGN KEY CONSTRAINT

CREATE TABLE tblClass
(
class_Id INT PRIMARY KEY,
Class_Name nvarchar(10),
Student_Id INT CONSTRAINT tblStudent_ID_FK
FOREIGN KEY (Student_Id) REFERENCES tblStudent(ID)
);

-- DEFAULT CONSTRAINT

ALTER TABLE tblStudent
ADD CONSTRAINT df_tblperson_Gender
DEFAULT 'NA' for Gender;

-- CHECK CONSTRAINT

ALTER TABLE tblStudent
ADD CONSTRAINT ck_tblperson_Age
CHECK (Age > 6 AND Age < 21);

-- UNIQUE CONSTRAINT

ALTER TABLE tblStudent
ADD CONSTRAINT UQ_tblperson_Email
UNIQUE(Email);

-- NOT NULL CONSTRAINT

CREATE TABLE tbltest
(
ID INT NOT NULL,
Name nvarchar(10)
)