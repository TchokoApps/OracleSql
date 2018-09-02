--DML--Befehle

--Wann startet eine Transaktion?

--direkt nach einem connect

--f�ge neue Abteilung ein

insert into dept values
(50, 'IT', 'FRANKFURT');
----------------------------------

commit;
----------------------------------

update dept
set loc = 'HANAU'
where DEPTNO =50;
----------------------------------

select 
    *
from dept;
-----------------------------------
rollback;
-----------------------------------

--Schl�sselverletzungen

insert into dept values (30, 'EINKAUF', 'FRANKFURT');
--------------------------------------------------------
--ORA-00001: Unique Constraint (REF1.PK_DEPT) verletzt
update dept
set deptno = 99;
--------------------------------------------------------

--ORA-02291: Integrit�ts-Constraint (REF1.FK_DEPTNO) verletzt - �bergeordneter Schl�ssel nicht gefunden
insert into emp ( empno, ename, deptno)  values  (1,'TESTMAN', 70);
-------------------------------
--andere Abteilung
insert into emp ( empno, ename, deptno)  values  (1,'TESTMAN', 30);
commit;
-------------------------------

--L�sche abteilung 30
--ORA-02292: Integrit�ts-Constraint (REF1.FK_DEPTNO) verletzt - untergeordneter Datensatz gefunden
delete from dept
where deptno = 30;
-----------------------------

delete from dept
where deptno = 50;

commit;

-----------------------------------

update emp 
set sal = sal;

-----------------------------------

update emp 
set sal = ( select max(sal) from emp);
-------------------------------------

select * from emp;

rollback;
-------------------------------------
















