--DDL  DATA DEFINITION LANGUAGE

--Alle befehle haben eine AUTOCOMMIT
--namensvergabe im Schema eindeutig


create table projekte(
ProjNr          number(4),
ProjBez         varchar2(50),
Dauer           number(5),
Kickoff         date,
Budget          number(10),
constraint  pk_projekte primary key (ProjNr),
constraint  ck_Budget  check ( budget >=0 )
);

--------------------------------------------------

insert into projekte values (5000,'WINDOWS 10', 90,'01.01.2018', 50000);
insert into projekte values (5005,'ORACLE 12C', 30,'01.03.2018', 10000);
commit;
--------------------------------------------------

select * from projekte;

---------------------------------------------------

create table projektmitarbeit(
ProjNr          number(4),
empno           number(4),
Wochenstd       number(4,2),
constraint pk_pm primary key (projnr, empno),
constraint fk_pm_projekte foreign key (ProjNr) references projekte ( projnr),
constraint fk_pm_emp foreign key (empno) references emp (empno),
constraint ck_wostd  check ( Wochenstd between 0 and 60)
);

-------------------------------------------------------
insert into projektmitarbeit values (5000,7839,20);
insert into projektmitarbeit values (5000,7788,20);
insert into projektmitarbeit values (5000,7902,20);
insert into projektmitarbeit values (5000,7566,20);
insert into projektmitarbeit values (5000,7782,20);
insert into projektmitarbeit values (5005,7839,20);
insert into projektmitarbeit values (5005,7934,20);
insert into projektmitarbeit values (5005,7900,20);
insert into projektmitarbeit values (5005,7788,20);


commit;
---------------------------------------------------------

--empno, ename, projnr, projbez

select 
    e.empno
    ,e.ename
    ,pm.projnr
    ,p.projbez
from emp e inner join projektmitarbeit pm    
on e.empno = pm.empno
inner join projekte p
on pm.projnr = p.projnr
order by e.empno;
--------------------------------------------

--füge der Tabelle emp eine neue Spalte hinzu!

alter table emp 
add gender char(1);
-------------------------------

alter table emp 
add constraint ck_gender check (gender in ('M','F'));
--------------------------------------------------------------


--Ändern Sie alle Mitarbeiter auf 'F', wenn sie in Abteilung 30 arbeiten
update emp 
set gender = 'F'
where deptno = 30;
--------------------------

update emp 
set gender = 'M'
where gender is null;

--commit;























