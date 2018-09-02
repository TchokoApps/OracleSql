--systemtabellen für Datenmodell

describe user_constraints;

select * from USER_CONSTRAINTS;
select * from USER_CONS_columns;
-----------------------------------

--Inner JOIN (schnittmenge)

select 
    *
from emp inner join dept
on emp.deptno = dept.deptno;

----------------------------------------
select 
    emp.empno
    ,emp.ename
    ,emp.deptno
    ,dept.dname
from emp inner join dept
on emp.deptno = dept.deptno;
-----------------------------------------

select 
    e.ename
    ,e.sal
    ,d.deptno
    ,d.dname
from emp e  inner join dept d
on e.deptno = d.deptno;
------------------------------------------

--OUTER JOIN  ( inner join + datensätze aus einer der beiden Tabellen)


--Left outer JOIN ( inner join + Datensäzte aus der Linken Tabelle des JOIN-Ausdrucks
select 
    *
from emp left outer join dept
on emp.deptno = dept.deptno;

--right outer JOIN
select 
    *
from emp right outer join dept
on emp.deptno = dept.deptno;

--FULL OUTER JOIN

select 
    *
from emp full outer join dept
on emp.deptno = dept.deptno;

-----------------------------------------------

--NON EQUI JOIN

--Zeige die Liste der Gehälter und der dazugehörigen gehaltsgruppen

select 
    emp.empno
    ,emp.ename
    ,emp.sal
    ,salgrade.grade
from emp inner join salgrade 
on emp.sal between salgrade.losal and salgrade.hisal;

---------------------------------------------------------------------------------

--SELFJOIN
--Tabelle wird gespiegelt, daher die beiden unterschiedlichen Aliasnamen für ein und diesselbe tabelle

select 
    MA.empno
    ,MA.ename
    ,MA.mgr
    ,chef.ename
from emp MA inner join emp CHEF
on ma.mgr = chef.empno;
-----------------------------------

--CROSS JOIN  ( Kreuzprodukt, kartesisches produkt)

select 
    *
from emp cross join dept;

-----------------------------------

select 
    *
from emp , dept;
---------------------------------
select 
    *
from emp , dept
where emp.deptno = dept.deptno;

------------------------
set timing on
set autotrace on
------------------------

set autotrace off
set timing off

------------------------------------------------------


















