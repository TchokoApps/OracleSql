--Unterabfragen ( engl. SUBSELECT)

--wer vedient am meisten?

select 
    *
from emp 
where sal = ( select max(sal) from emp);

---------------------------------------------
--Wer ist als erster in die Firma eingetreten?

select 
    *
from emp 
where hiredate = ( select min(hiredate) from emp);
---------------------------------------------

--wer verdient mehr als der Durchschnitt der abteilung
--Korreliert Unterabfrage

SELECT
    e.empno,
    e.ename,
    e.sal,
    e.deptno
FROM
    emp e
WHERE
    e.sal > (
                SELECT
                    AVG(e2.sal) 
                FROM
                    emp e2
                WHERE
                    e2.deptno = e.deptno
            );
----------------------------------------    



