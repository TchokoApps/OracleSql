--Einfaches SELECT

SELECT
    empno
    ,ename
    ,job
    ,hiredate
    ,deptno
FROM EMP;
----------------------------------------------

SELECT
    emp.EMPNO
    ,emp.ename
    ,emp.deptno    
FROM emp;

--------------------------------------------------

--DISTINCT  unterscheidbare werte

select ALL          --zeige alle datensätze , auch duplikate
    emp.empno
    ,emp.ename
    ,emp.sal
from emp;
--------------------------------------------------

select  ALL
    deptno
from emp;
--------------------------------------------------

select  DISTINCT     --duplikate ausblenden
    deptno
from emp;

--------------------------------------------------

select  all
    deptno
    ,job
from emp;
------------------------------------------------
select  DISTINCT
    deptno
    ,job
from emp;
----------------------------------------------------------

--Aliasnamen benennen eine Spalte zur Laufzeit des Befehl um

--Spaltenalias

select 
    emp.empno           as "MaNr"
    ,emp.ename          as nachname
    ,emp.sal            as gehalt
    ,emp.hiredate          "Einstell-Datum"
from emp;

---------------------------------------------------------------

--Tabellenalias benennt die Tabelle zur Laufzeit der Abfrage um

select 
    ref1.salgrade.grade
    ,ref1.salgrade.hisal
from ref1.salgrade ;

--ist äquivalent zu 
select 
    s.grade
    ,s.hisal
from ref1.salgrade s;
-----------------------------------------------

--Rechenoperatoren ( +   -   *  / )

select 
    emp.empno
    ,emp.ename
    ,emp.sal * 2    as doppelt
    ,emp.sal / 2    as halb
    ,emp.sal + 200  as erhoehung
    ,emp.sal-100    as abzug
from emp ;
--------------------------------------

--Verketten mit ||

select 
    'Herr ' || ename   as anrede
from emp;
--------------------------------------


select 
    ename || ' ' || deptno
from emp;
--------------------------------------

--Dezimalpunkt

select 
    ename
    ,sal * 1.1   as "Neues Gehalt"
from emp;

------------------------------------------

--Übungen zu Einfachem SELECT
--1.4.1
select 
    9999
from emp;


--1.4.2
select 
    sysdate
from dual;
-----------------------------

describe dual;
-----------------------------
select
    *
from dual;
------------------------------

--Umgang mit Nullwerten

select 
    ename
    ,sal
    ,comm
    ,sal+comm
    ,job
from emp;

----------------------------------------------------------
--Ersetzungswert für NULL-wert mit NVL  oder COALESCE

--NVL
select 
    ename
    ,sal
    ,nvl(comm,0)         as comm
    ,sal+ nvl(comm,0)    as total
    ,job
from emp;
-------------------------------------------------------


--Coalesce
select 
    ename
    ,sal
    ,coalesce(comm,0)         as comm
    ,sal+ coalesce(comm,0)    as total
    ,job
from emp;

-----------------------------------------------------------

--Weitere Berechnungen

select 
    e.empno
    ,e.ename
    ,e.comm
    ,nvl(e.comm,0) + 500   as comm_new
from emp e;

--------------------------------------------







            







































