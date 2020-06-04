-- TEMPORARY TABLES
-- Local Temp Table
Create Table #PersonDetails(ID int, Name nvarchar(20))

insert into #PersonDetails values(1,'Mike')
insert into #PersonDetails values(2,'John')
insert into #PersonDetails values(3,'Todd')

Select * from #PersonDetails;

Select name from tempdb..sysobjects
where name like '#PersonDetails%';  --- Local table create sequence no

-- Global Temp Table

Create Table ##PersonDetails(ID int, Name nvarchar(20))

insert into ##PersonDetails values(1,'Mike')
insert into ##PersonDetails values(2,'John')
insert into ##PersonDetails values(3,'Todd')

Select * from ##PersonDetails;

Select name from tempdb..sysobjects
where name like '##PersonDetails%'; -- does not create sequence no.
