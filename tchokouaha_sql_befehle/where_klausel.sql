-- WHERE - Klausel
-- Ergebnismenge einschränken
SELECT
    *
FROM
    emp
WHERE
        deptno = 10
    OR
        deptno = 30;
-----------------------------------------------
SELECT * 
FROM emp
WHERE deptno = 20 and job = 'CLERK';
-----------------------------------------------
SELECT * 
FROM emp
WHERE hiredate >= '01.07.1981';
-----------------------------------------------
SELECT * 
FROM emp
WHERE hiredate between '01.02.1981' and '31.12.1981';
-----------------------------------------------
--AND geht vor OR
SELECT * 
FROM emp
WHERE job = 'CLERK' or job = 'MANAGER' and deptno = 10;
-----------------------------------------------
-- korrektur
SELECT * 
FROM emp
WHERE (job = 'CLERK' or job = 'MANAGER') and deptno = 10;
-----------------------------------------------
-- auch aus depno 30
SELECT * 
FROM emp
WHERE (job = 'CLERK' or job = 'MANAGER') and (deptno = 10 or deptno = 30);
-----------------------------------------------
-- IN Operator
-- syntax: IN (wert1, wert2, ...)
SELECT * 
FROM emp
WHERE job in ('MANAGER','SALESMAN');
-----------------------------------------------
SELECT * 
FROM emp
WHERE job in ('MANAGER','SALESMAN') and deptno = 30;
-----------------------------------------------
SELECT * 
FROM emp
WHERE ename between 'A' and 'M' order by ename;
-----------------------------------------------
-- LIKE leitet die Abfrage mit Platzhaltersymbolen ein
-- '%' für beliebige Zeichenkette
-- '_' für genau 1 Zeichen
-- alle namen mit einem 'A' an der dritten Stelle
SELECT * 
FROM emp
WHERE ename like '__A%';
-----------------------------------------------
-- Abfrage auf NULL werte mit IS NULL oder IS NOT NULL
SELECT * 
FROM emp
where comm is null;
-----------------------------------------------
-- jetzt mir provision
SELECT * 
FROM emp
where comm is not null;
-----------------------------------------------
--1.4.4 Übungen
--a) 
select * 
from emp 
where comm is null or comm = 0;
-----------------------------------------------
--b) to check again
select empno, ename, sal as "Monatsverdienst", sal+nvl(comm,0) as "Monatsgehalt"
from emp;
-----------------------------------------------
--c)
select empno, ename, sal*12 as "Jahresgehalt"
from emp; 
-----------------------------------------------
--d)
select empno, ename, 12*nvl(sal,0), 12*nvl(comm,0), 12*nvl(sal,0)+12*nvl(comm,0) as "J-Gehalt"
from emp;
-----------------------------------------------
--e) Man erhält eine leere Tabelle
select * from emp where mgr = NULL;
-----------------------------------------------
--f)
select empno, ename, nvl(mgr,empno) as "Chef"
from emp; 
-----------------------------------------------
--g
select * from emp where mgr is null and comm is null;
-----------------------------------------------
-- Listen sortieren
--ORDER BY
select * 
from emp
order by sal desc;
-----------------------------------------------
select * 
from emp
order by ename desc;
-----------------------------------------------
select * 
from emp
order by nvl(comm,-1) desc;
-----------------------------------------------
select empno as manr, ename as "nachname", deptno as "Abt-Nr", job
from emp 
order by deptno desc, ename desc;
-----------------------------------------------
-- nach Aliasnamen
select empno as manr, ename as nachname, deptno as "Abt-Nr", job
from emp 
order by "nachname" desc;
-----------------------------------------------
-- nach spaltenziffer
select * from emp
order by 4;
-----------------------------------------------
select * from emp
order by 8,3;
-----------------------------------------------
-- fetch first
select *
from emp
order by sal desc
fetch first 3 rows only; -- vorsicht hier kein mehrfachen zweitplatzierten
-----------------------------------------------
-- korrektur
select *
from emp
order by sal desc
fetch first 2 rows with ties;
-----------------------------------------------
select *
from emp
order by sal desc
fetch first 25 percent rows only;
-----------------------------------------------
select *
from emp
order by sal desc
fetch first 0.5 percent rows only;
-----------------------------------------------
select *
from emp
order by sal desc
fetch first 3 rows only;
-----------------------------------------------
-----------------------------------------------
-----------------------------------------------
-----------------------------------------------
-----------------------------------------------
-----------------------------------------------
-----------------------------------------------
