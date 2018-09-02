--beispiele zu mengenoperatoren (SET-operatoren)

--UNION

select 
        *
from emp 
where job  in ('CLERK', 'ANALYST');

----------------------------------------

select 
        *
from emp 
where hiredate between '01.01.81' and '01.07.81';

----------------------------------

--Listen zusammenschieben
select 
        *
from emp 
where job  in ('CLERK', 'ANALYST')

UNION

select 
        *
from emp 
where hiredate between '01.01.81' and '01.07.81';
------------------------------------------------

--INTERSECT

select 
        *
from emp 
where job  in ('CLERK', 'ANALYST')
intersect
select 
        *
from emp 
where hiredate between '01.07.80' and '01.12.81';
----------------------------------------------------------

--Fasse Daten zusammen, deren Spaltenanzahl und Datentypen passen!!!!


select 
    dept.*
    ,null
from dept
union
select 
    empno
    ,ename
    ,job
    ,comm
from emp 
where deptno = 20 or deptno = 30;












