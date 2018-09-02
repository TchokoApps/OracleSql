-- Einfaches SELECT
SELECT
    empno,
    ename,
    job,
    mgr,
    hiredate,
    deptno
FROM
    emp;
    
------------------------------------

SELECT
    emp.empno,
    emp.ename,
    emp.deptno
FROM
    emp;

------------------------------------
--DISTINCT unterscheidbare werte

SELECT ALL
    emp.empno,
    emp.ename,
    emp.sal
FROM
    emp;
------------------------------------

SELECT ALL
    deptno
FROM
    emp;
------------------------------------
-- Duplikate werden ausgebländet

SELECT DISTINCT
    deptno
FROM
    emp;
    
------------------------------------

SELECT
    deptno,
    job
FROM
    emp;

------------------------------------
-- durch distinct werden alle duplikate einer zeile entferne. keine gleihe zeile 2 oder mehrfach: ganze duplikate zeilen werden entfernt.

SELECT DISTINCT
    deptno,
    job
FROM
    emp;
    
------------------------------------
-- Alianamen benennen eine spalte zur Laufzeit des Befehls um.
-- spaltenalias

SELECT
    empno AS "MaNr",
    ename AS nachnam,
    sal AS gehalt,
    hiredate AS "Einstell-Datum"
FROM
    emp;
------------------------------------
--Tabellenalias benennt die Tabelelle zur Laufzeit der Abfrage um.

SELECT
    sl01.salgrade.grade
FROM
    sl01.salgrade;

-- is äquivalent zu

SELECT
    s.grade,
    s.hisal
FROM
    sl01.salgrade s;
------------------------------------
--Rechenoperatoren(+ - * /)

SELECT
    empno,
    ename,
    sal,
    sal * 2 AS doppelt,
    sal / 2 AS halb,
    sal + 200 AS erhoehung,
    sal - 100 AS abzug
FROM
    emp;
------------------------------------
-- Verketten mit ||

SELECT
    'Herr ' || ename AS anrede
FROM
    emp;
------------------------------------

SELECT
    ename || ' ' || deptno AS "Name und Department"
FROM
    emp;
------------------------------------
--Dezimalpunkt

SELECT
    ename,
    sal * 1.1 AS "Neues Gehalt"
FROM
    emp;
--------------------------------------
-- 1.1 Übungen zu SELECT (Kapitel 3)
-- 1.4.1 Allgemein Übungen zu SELECT

-- a)
sEleCt * fRoM emp;

-- b) 
select SAL, sal+10, '10' from EmP;

--c)
-- select empno, ename, sal; (nicht korrekt es fehlt der FROM clause)

--d) gibt aktuelles datum ein
select sysdate from emp;

--e)
select * from emp;

--f) der befehl ist falsch
--select *.* from emp; 

--g)
select 'Hallo' "Uberschrift" from emp;

--h) casesensiiv
select sal, sal "SAL", sal "sal", sal AS "Sal" from emp;

--i) spalte fehlt
select from emp;

-- 1.4.2 Verständnisübungen zu SELECT
--a)
select sysdate from dept;

--b)
select distinct job, deptno from emp;

--c)
select 'SELECT',ename,'FROM emp;' from emp;

--d)
select 'HALLO' || ename || ' du verdienst ' || sal from emp;

--e)
select sal*2, ename from emp;

--f)
select empno, ename, 9999 from emp;

--g)
select sysdate from dual;
describe dual;
select * from dual;

-- Umgang mit NULL Werten
select ename,sal,comm,sal+comm,job from emp;
-- ersetzungswert für NULL Werte mit NVL oder COALESCE
SELECT
    ename,
    sal,
    nvl(comm,0) AS comm,
    sal + nvl(comm,0) AS total,
    job
FROM
    emp;

SELECT
    ename,
    sal,
    COALESCE(comm,0) AS comm,
    sal + COALESCE(comm,0) AS total,
    job
FROM
    emp;
--------------------------------------
describe emp;
--------------------------------------
-- oracle sql developer
--------------------------------------
--Weitere Berechnungen
SELECT
    e.empno,
    e.ename,
    e.comm,
    nvl(e.comm,0) + 500 as comm_new
FROM
    emp e;
--------------------------------------
