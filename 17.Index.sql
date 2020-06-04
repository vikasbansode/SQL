-- INDEX

create index ix_tblemp_salary
on tblemp (salary asc)

sp_helpindex tblemp;

drop index tblemp.ix_tblemp_salary;