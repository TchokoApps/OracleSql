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
---------------------------------------------------
select
    *
    from projektmitarbeit;
--------------------------------------------------
select
    e.empno
    ,e.ename
    ,m.projnr
    ,p.projbez
from emp e inner join Projektmitarbeit m
on e.empno = m.empno
inner join Projekte p
on m.projnr = p.projnr
order by e.empno asc;
-------------------------------------------------
 ---füge der Tabelle emp eine neue Spalte hinzu
 alter table emp
 add gender char(1);
 -----------------------------------------------
 alter table emp
 add constraint ck_gender check (gender in ('M','F'));

-----------------------------------------------
----Ändern sie alle Mitarbeiter auf 'F' wenn sie in Abteilung 30 arbeiten
select
    *
from emp;    
select
    *
from emp
update emp
set gender = 'M'
where deptno != 30;
update emp
set gender = 'M'
where deptno is null;
commit;
-------------------------
----Drop table
-------------------------
---Views sind gespeicherte SELECT-Anweisungen, die als Objekte in der Datenbank gespeichert werden
create or replace view testview
    as 
        select
           tbuch.*
        from tbuch
        where buchnr >= 10;
-------------------------        
select
    *
from testview;    
------------------------
create or replace view v_jahresgehalt
    as
        select
            empno
            ,ename
            ,sal * 12 + nvl(comm,0)*12 as Yearsal
        from emp
        where sal is not null
        order by yearsal desc;
            
select
    *
    from v_jahresgehalt;
------------------------

    
    