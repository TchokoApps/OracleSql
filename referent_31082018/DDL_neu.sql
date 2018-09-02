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
-------------------------------------------------------------------------------
--Drop table 

drop table mitarbeiter;

drop table tbuch;

--papierkorb für gelöschte Objektee
select * from user_recyclebin;

--------------------------------------------
--wiederherstellen der Tabelle
flashback table tbuch to before drop;

--Gegenüberstellung TRUNCATE und DELETE

create table big_emp
    as
        select 
            *
        from emp ;
-----------------------------------------

insert into big_emp
    (select * from big_emp);
-----------------------------------------
commit;

select count(*) from big_emp;
-----------------------------------------

set timing on

delete from big_emp;
----------------------------------
rollback;

--------------------------------
truncate table big_emp;

drop table big_emp;
---------------------------------

--VIEWS  sind gespeicherte SELECT-Anweisungen, die als Objekte inder Datenbank gespeichert werden.

create or replace  view testview
    as  
        select 
            tbuch.*
        from tbuch
        where buchnr >= 10;

-------------------------------
select 
    *
from testview;
-------------------------------

create or replace view v_jahresgehalt
    as
        select 
            empno
            ,ename
            ,sal * 12 + nvl(comm, 0)*12  as Yearsal
        from emp 
        where sal is not null
        order by yearsal desc;

---------------------------------------
select * from V_JAHRESGEHALT;
----------------------------------------
--schwarze Löcher

create or replace view v_clerk
    as
        select 
            empno
            ,ename
            ,sal 
            ,job
        from emp
        where job = 'CLERK'
        with check option;
--------------------------------------------

--DML: insert, update, delete

insert into v_clerk values (5, 'MEIER', 2000, 'CLERK');
--------------------------------------------------------

select * from v_clerk;
commit;
-------------------------------------

select * from emp;
-------------------------------------

insert into v_clerk values (6, 'SCHMIDT', 2000, 'MANAGER');
------------------------------------
--with check option verhindert falscheingaben in die VIEW


--ORA-01402: Verletzung der WHERE-Klausel einer View WITH CHECK OPTION
insert into v_clerk values (7, 'SCHMIDT', 2000, 'MANAGER');

--INLINE-View

--TOP-DOWN-Analyse

SELECT
    ROWNUM,
    e2.ename,
    e2.sal
FROM
    (
        SELECT
            e.ename,
            e.sal
        FROM
            emp e
        where sal is not null
        ORDER BY e.sal DESC
    ) e2
WHERE   ROWNUM <= 3;
-------------------------------------


--Pseudospalte
select 
    rownum
    ,emp.*
from emp
order by ename;

----------Bottom up

SELECT
    ROWNUM,
    e2.ename,
    e2.sal
FROM
    (
        SELECT
            e.ename,
            e.sal
        FROM
            emp e
        where sal is not null
        ORDER BY e.sal asc
    ) e2
WHERE   ROWNUM <= 3;

---------------------------------------------------

create or replace  view emp_view
    as  
        select 
            emp.*
        from emp;
        
------------------------------------------

create or replace  view emp_view30
    as  
        select 
            empno
            ,ename
            ,job
            ,mgr
            ,hiredate
            ,deptno
        from emp
        where deptno = 30;
--------------------------------
create or replace  view empalle_view
    as  
        select 
            e.*
            ,d.dname
        from emp e inner join dept d
        on e.deptno = d.deptno;
--------------------------------
select
    *
    from empalle_view;
-------------------------------
create or replace  view empallesal_view
    as  
        select 
            e.*
            ,d.dname
            ,s.grade
        from emp e inner join dept d
        on e.deptno = d.deptno
        inner join salgrade s
        on e.sal between s.losal and s.hisal;
-----------------------------------
select
    *
from empallesal_view;    
----------------------------------
create or replace  view empkingneu_view
    as  
        select 
            emp.*
from emp;            
    select
    *
from   empkingneu_view
update empkingneu_view
set sal = 0
where job = 'PRESIDENT' and job is not null;
update empkingneu_view
set sal = 100
where ename = 'MEIER' or ename = 'TESTMAN';
select 
    *
from  empkingneu_view;   
----------------------------------------------
create or replace  view empallesal_view
    as  
        select 
            e.*         
                    from empalle_view e inner join salgrade s        
        on e.sal between s.losal and s.hisal;

select 
    *
from  empallesal_view  ;




































