--Listen sortieren

--ORDER BY

select 
    *
from emp
order by sal desc;
-----------------------------
select 
    *
from emp
order by ename desc;
-----------------------------

--Null nach unten
select 
    *
from emp
order by nvl(comm,-1) desc;

---------------------------------------------

--nach mehreren Spalten

select 
    empno   as manr
    ,ename  as nachname
    ,deptno as "Abt-Nr"
    ,job
from emp;
-----------------------------------------

select 
    empno   as manr
    ,ename  as nachname
    ,deptno as "Abt-Nr"
    ,job
from emp
order by deptno  desc, ename  desc;
----------------------------------------------------

--nach Aliasnamen
select 
    empno   as manr
    ,ename  as "nachname"
    ,deptno as "Abt-Nr"
    ,job
from emp
order by "nachname" desc;

------------------------------------------------------

--nach Spaltenziffer

select 
    *
from emp 
order by 2;
-------------------------

select 
    *
from emp 
order by 8,3;
------------------------------
--oracle 12c
--fetch first rows only

select 
    *
from emp 
order by sal desc
fetch first 2 rows only;   --vorsicht hier keine mehrfachen zweitplatzierten

----------------------
--korrektur: with ties

select 
    *
from emp 
order by sal desc
fetch first 2 rows with ties;
--------------------------------------

select 
    *
from emp 
order by sal desc
fetch first 25 percent rows only;

------------------------------------------------


select 
    *
from emp 
order by sal desc
fetch first 0.5 percent rows only;
------------------------------------------------

select 
    *
from emp 
fetch first 3 rows only;
--------------------------------------------------






















