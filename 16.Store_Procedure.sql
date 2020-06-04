-- STORE PROCEDURE

create procedure spgetemp
as
BEGIN
	select emp_name,gender from tblemp	
END

spgetemp;