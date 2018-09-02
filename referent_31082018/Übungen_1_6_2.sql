--‹bungen zu Unterabfragen

--1.6.2 ‹bungen zu Unterabfragen 
--a) Erstellen Sie eine Abfrage, um Personalnummer, Namen und Gehalt aller Mitarbeiter anzuzeigen, 
--die in derselben Abteilung arbeiten wie ein Mitarbeiter mit Name SMITH. 
--Schlieﬂen Sie alle Mitarbeiter mit Name SMITH von der Anzeige aus.

select 
    empno
    ,ename
    ,sal
from emp 
where deptno = (select 
                    deptno 
                from emp 
                where ename ='SMITH')
AND ename <> 'SMITH';
-----------------------------------------------

--b) Erstellen Sie eine Abfrage, um Mitarbeiternummer, Namen und Gehalt aller Mitarbeiter anzuzeigen, 
--die weniger als das Durchschnittsgehalt der Firma verdienen. 
--Sortieren Sie das Ergebnis in aufsteigender Reihenfolge nach Gehalt und Mitarbeiternummer. 

select 
    empno
    ,ename
    ,sal
from emp 
where sal < (select 
                    avg(sal) 
             from emp )
order by sal, empno;             
-----------------------------------------

--c) Erstellen Sie eine Abfrage, welche Mitarbeiternummer, Namen und Abteilungsnummer 
--aller Mitarbeiter anzeigt, die in derselben Abteilung arbeiten wie ein Mitarbeiter, 
--dessen Name mit einem 'A' beginnt. 

select 
    empno
    ,ename
    ,sal
from emp 
where deptno in (select 
                    e2.deptno 
                from emp e2
                where e2.ename like 'A%');

---------------------------------------------------

--2. Lˆsung ( korreliert)
select 
    empno
    ,ename
    ,sal
from emp 
where deptno in (select 
                    e2.deptno 
                from emp e2
                where e2.ename like 'A%'
                and emp.deptno = e2.deptno);

----------------------------------------------------
--d) Zeigen Sie Personalnummer, Abteilungsnummer, Name und Beruf aller Mitarbeiter an,
--die in Abteilungen arbeiten mit Abteilungsname   RESEARCH.


select 
    empno
    ,DEPTNO
    ,ename
    ,job
from emp 
where deptno in (select 
                    deptno 
                 from dept
                 where dname = 'RESEARCH');
-----------------------------------------------------

--‹bungen zu JOIN 
select 
    empno
    ,emp.DEPTNO
    ,ename
    ,job
from emp  left outer join dept
on emp.deptno = dept.deptno
where dept.dname = 'RESEARCH';

----------------------------------------------

--e) Zeigen Sie Personalnummer, Namen und Einstellungsdatum aller Mitarbeiter an, 
--deren Abteilung (LOC) in NEW YORK oder DALLAS ist.  

select 
    empno
    ,ename
    ,hiredate
    ,deptno
from emp 
where deptno in (select 
                    deptno 
                 from dept
                 where loc = 'DALLAS' or loc = 'NEW YORK');

-------------------------------------------------------------------









                
                