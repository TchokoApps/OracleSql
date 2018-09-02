--WHERE - Klausel
--Ergebnismenge einschränken

select 
    *
from emp 
WHERE deptno = 10 or deptno = 30;
-------------------------------------------

select 
    *
from emp 
WHERE  deptno = 20 and job = 'CLERK';

-------------------------------------------

select 
    *
from emp 
WHERE hiredate >= '01.07.1981';

-------------------------------------------


select 
    *
from emp 
WHERE  hiredate between '01.01.1981' and '31.12.1981';

--------------------------------------------
--AND geht vor OR

select 
    *
from emp 
WHERE job ='CLERK' or job = 'MANAGER' and deptno = 10;

--korrektur
select 
    *
from emp 
WHERE ( job ='CLERK' or job = 'MANAGER') and deptno = 10;

----------------------------------------------------------------
--auch aus deptno 30


select 
    *
from emp 
WHERE ( job ='CLERK' or job = 'MANAGER') and (deptno = 10 or deptno = 30);

--IN-Operator

--syntax:  IN  (wert1, wert2, ...)  

select 
    *
from emp 
WHERE job in ('MANAGER', 'SALESMAN')  ;
-------------------------------------------------

select 
    *
from emp 
WHERE job in ('MANAGER', 'SALESMAN') and deptno =30;

-------------------------------------------------

--Between

select 
    *
from emp 
WHERE ename between 'A' and 'N';
--------------------------------------------

--LIKE leitet die Abfrage mit Platzhaltersymbolen ein
-- '%'  für beliebige Zeichenkette
-- '_' für genau 1 Zeichen

--alle namen mit einem 'A' an der dritten Stelle

select 
    *
from emp 
WHERE ename like '__A%';

---------------------------------------------------

--Abfrage auf NULL-werte mit IS NULL oder IS NOT NULL

select 
    *
from emp 
WHERE comm is null;
----------------------------

--jetzt mit Provision

select 
    *
from emp 
WHERE comm is not null;
----------------------------

--Falsch, weil mathematische exaktheit auf einen unendlich großen wert trifft
select 
    *
from emp 
WHERE comm = NULL;

--------------------------------------------

--ALL ANY SOME

SELECT e.*
FROM 	emp e
WHERE e.deptno > ALL (10, 20);
-- irgendeiner ANY bzw. SOME

--reicht größer als Minimum...
SELECT e.*
FROM 	emp e
WHERE e.sal > ANY (1000, 3000);

----------------------------------

select 
    *
from emp 
WHERE comm is null;

-------------------

select 
    *
from emp 
WHERE comm = 0;

-----------------------

select 
    *
from emp 

    empno
    ,ename
    ,SAL
    ,comm;

























