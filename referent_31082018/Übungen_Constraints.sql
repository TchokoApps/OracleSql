--1.8.2 Übungen zu Constraints

--c)
insert into firma values ( 1, 'AUDI', 'Ingolstadt');
--ORA-00001: Unique Constraint (SL12.PK_FIRMA) verletzt
insert into person values(2, 1, 'Frau Bauer', 20);
--ORA-00001: Unique Constraint (SL12.PK_PERSON) verletzt

--d)
delete from firma 
where f_nr = 2;

--ORA-02292: Integritäts-Constraint (SL12.FK_F_NR) verletzt - 
--untergeordneter Datensatz gefunden

--e)
--Lösche Fremdschlüssel von person
select 
    *
from user_constraints
where table_name = 'PERSON';
-----------------------------------

Alter table person
drop constraint FK_F_NR;
--------------------------------------

insert into person values (4,1,'Herr Habicht',10);
commit;

----------------------------------------

--keine kontrolle über fremdschlüssel, deshalb erfolgreicher insert

alter table person 
add constraint fk_f_nr foreign key ( f_nr) references firma ( f_nr);

--Was passiert?
--ORA-02298: (SL12.FK_F_NR) kann nicht validiert werden - 
--übergeordnete Schlüssel nicht gefunden

select 
    *
from user_constraints
where table_name = 'PERSON';



select * from user_recyclebin;



--novalidate: alter Bestand wird nicht geprüft, aber zukünftige Datensätze
alter table person 
add constraint fk_f_nr foreign key ( f_nr) references firma ( f_nr) novalidate;

------------------------------------------------
insert into person values (4,2,'Frau Meier',10);
------------------------------------------------

--f)
alter table person 
add constraint fk_f_nr foreign key ( f_nr) references firma ( f_nr)
exceptions into exceptions;

---------------------------------------------
create table exceptions(row_id rowid,
	                owner varchar2(30),
	                table_name varchar2(30),
		        constraint varchar2(30));
-----------------------------------------------

select * from exceptions;
--------------------------------------
describe exceptions;
-------------------------

--JOIN ZWISCHEN Exceptions und Person
select rowid, p.* from person p;
select * from exceptions;
----------------------------------
select 
    e.*
    ,p.*
from exceptions e inner join person p 
on e.row_id = p.rowid;
------------------------------

insert into firma
values ( 4,'BMW','MÜNCHEN');

commit;

delete from exceptions;
commit;

--lege den Fremdschlüssel wieder auf
alter table person 
add constraint fk_f_nr foreign key ( f_nr) references firma ( f_nr)
exceptions into exceptions;


