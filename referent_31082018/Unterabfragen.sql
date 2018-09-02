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

--Wer verdient am meisten in seiner Abteilung?

SELECT
    e.empno,
    e.ename,
    e.sal,
    e.deptno
FROM
    emp e
WHERE
    e.sal = (
                SELECT
                    MAX(e2.sal)
                FROM
                    emp e2
                WHERE
                    e2.deptno = e.deptno
            );
------------------------------------------------


--zeige die Mitarbeiter aus der Abteilung von 7839 ( king)
SELECT
    e.empno,
    e.ename,
    e.sal
FROM
    emp e
WHERE
    e.deptno = (
                    SELECT
                        e2.deptno
                    FROM
                        emp e2
                    WHERE
                        e2.empno = 7839
               );
---------------------------------------------

--Wer hat die gleiche provision wie der kollege mit Personalnummer 7839?

SELECT
    e.empno,
    e.ename,
    e.sal,
    e.comm
FROM
    emp e
WHERE
    nvl(e.comm,-1) = (
                    SELECT
                        nvl(e2.comm,-1)
                    FROM
                        emp e2
                    WHERE
                        e2.empno = 7839
            );
--------------------------------------------


--zur erinnerung

select 
    *
from emp 
WHERE job in ('MANAGER', 'SALESMAN')  ;

----------------------------------------------


--welche Abteilungen haben mitarbeiter?
SELECT
    d.deptno,
    d.dname
FROM
    dept d
WHERE
    d.deptno IN (
                    SELECT
                        distinct e.deptno
                    FROM
                        emp e
                );
----------------------------------------------

--welche Abteilungen haben keine mitarbeiter?
--Vorsicht Null-werte im Subselect werden mit NOT in zu Fallen....

SELECT
    d.deptno,
    d.dname
FROM
    dept d
WHERE
    d.deptno NOT IN (
                    SELECT
                        distinct e.deptno
                    FROM
                        emp e
                    where deptno is not null
                );
------------------------------------------------------------

--2. weg
--Dieser Abfragetyp ist resistent gegen NUll-Probleme

SELECT
    d.deptno,
    d.dname
FROM
    dept d
WHERE
    NOT EXISTS (
                SELECT
                    1
                FROM
                    emp e
                WHERE
                    e.deptno = d.deptno
    );
--------------------------------------------------

--zeige die Abteilungen, deren nummer größer ist als die kleinste Nummer eines CLERKs

--Variante 3 (mit JOIN):
SELECT 		 
    d.dname
    , d.deptno 	
FROM 	dept d INNER JOIN
        (  SELECT 
                MIN(e.deptno) AS dnumber		      
           FROM emp e 		      
           WHERE e.job = 'CLERK') a	
ON d.deptno > a.dnumber;
------------------------------------------

--Variante 2

SELECT
    d.dname,
    d.deptno
FROM
    dept d
WHERE
    d.deptno > (
                    SELECT
                        MIN(e.deptno)
                    FROM
                        emp e
                    WHERE
                        e.job = 'CLERK'
                );
--Variante 1
SELECT
    d.dname,
    d.deptno
FROM
    dept d
WHERE
    d.deptno > ANY (
                        SELECT
                            e.deptno
                        FROM
                            emp e
                        WHERE
                            e.job = 'CLERK'
                    );
    




