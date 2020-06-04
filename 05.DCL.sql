-- DCL (Data Control Language)

-- 1. GRANT TABLE
-- 2. REVOKE TABLE

-- GRANT TABLE

GRANT SELECT,INSERT,UPDATE, DELETE ON test TO USERNAME;
GRANT ALL ON test TO USERNAME;
GRANT SELECT ON test TO public;

-- REVOKE TABLE

REVOKE DELETE ON employees FROM anderson;
REVOKE ALL ON employees FROM anderson;
REVOKE SELECT ON employees FROM public;