-- TCL (Transaction Control Language)

-- 1. COMMIT
-- 2. ROLLBACK

-- COMMIT TABLE

DELETE FROM tblcustomers WHERE AGE = 25;
COMMIT;

-- ROLLBACK TABLE

DELETE FROM tblcustomers WHERE AGE = 25;
ROLLBACK;
