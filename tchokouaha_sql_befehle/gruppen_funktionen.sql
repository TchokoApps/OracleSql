-- Gruppenfunktionen ticken anders
-- NULL Werte werden in den Berechnungen (AVG,SUM,COUNT) vernachlässigt
-- COUNT ignoriert die Fehler mit NULL Werten
SELECT
    AVG(comm) AS avg_comm
FROM
    emp;
-------------------------------

SELECT
    AVG(comm) AS avg_comm,
    round(
        AVG(sal),
        0
    ) AS avg_sal,
    COUNT(empno) AS anz_ma,
    COUNT(comm) AS anz_prov,
    COUNT(nvl(
        comm,
        0
    ) ) AS anz_comm
FROM
    emp;
-------------------------------

SELECT
    MIN(hiredate),
    MAX(hiredate),
    MAX(hiredate) - MIN(hiredate) AS anztage
FROM
    emp;
    
-------------------------------

SELECT
    MIN(ename),
    MAX(ename)
FROM
    emp;

SELECT
    ename
FROM
    emp
ORDER BY ename;

-------------------------------

SELECT
    deptno,
    SUM(sal)
FROM
    emp
WHERE
    deptno IS NOT NULL
GROUP BY
    deptno
ORDER BY deptno;

-------------------------------

SELECT
    job,
    COUNT(job) AS anz_ma
FROM
    emp
GROUP BY
    job
ORDER BY anz_ma;
--------------------------------------

SELECT
    COUNT(*)
FROM
    salgrade;

DESCRIBE salgrade;
--------------------------------------

SELECT
    deptno,
    MAX(sal)
FROM
    emp
GROUP BY
    deptno
HAVING
    MAX(sal) >= 3000
ORDER BY deptno;

SELECT
    *
FROM
    emp
ORDER BY deptno;
--------------------------------------

INSERT INTO emp (
    empno,
    ename,
    hiredate
) VALUES (
    4712,
    'MEIER',
    trunc(SYSDATE)
);

SELECT
    *
FROM
    emp;
--------------------------------------
-- Zeige alle jobs mit durchschnittsgehälter über 2000€

SELECT
    job,
    round(AVG(sal) ) AS avg_sal
FROM
    emp
WHERE
    job IS NOT NULL
GROUP BY
    job
HAVING
    AVG(sal) > 2000
ORDER BY avg_sal DESC;
--------------------------------------
-- Zhlt die Zeilen pro gruppe

SELECT
    TO_CHAR(
        hiredate,
        'Q/YYYY'
    ),
    COUNT(*) AS anz_ma
FROM
    emp
GROUP BY
    TO_CHAR(
        hiredate,
        'Q/YYYY'
    );

SELECT
    *
FROM
    emp
ORDER BY hiredate;
--------------------------------------
-- Übungen 1.5.4
-- a)

SELECT
    round(
        AVG(sal),
        4
    ) AS "Mittel",
    MAX(sal) AS "Max",
    MIN(sal) AS "Min"
FROM
    emp;
    
--b)

SELECT
    deptno,
    round(
        AVG(sal),
        4
    ) AS "Druchschnitt"
FROM
    emp
WHERE
    deptno IS NOT NULL
GROUP BY
    deptno
ORDER BY deptno;

--c)

SELECT
    job,
    MAX(sal) AS "Max_Gehalt"
FROM
    emp
WHERE
    job IS NOT NULL
GROUP BY
    job
ORDER BY job;

--d)

SELECT
    deptno,
    job,
    COUNT(job) AS "Anzahl"
FROM
    emp
WHERE
    job = 'CLERK'
GROUP BY
    deptno,
    job
HAVING
    COUNT(job) = 2
ORDER BY deptno;

--e)

SELECT
    job,
    COUNT(ename) AS "Anzahl"
FROM
    emp
WHERE
    job IS NOT NULL
GROUP BY
    job
HAVING
    COUNT(ename) > 1
ORDER BY job;
----------------------------
-- count die managers

SELECT
    mgr,
    COUNT(*)
FROM
    emp
GROUP BY
    mgr;
------------------------
--systemtabellen für Datenmodell

DESCRIBE user_constraints;

SELECT
    *
FROM
    user_constraints;

SELECT
    *
FROM
    user_cons_columns;

--------------------------------------
-- Inner JOIN (schnittmenge)

SELECT
    emp.empno,
    emp.ename,
    emp.deptno,
    dept.dname
FROM
    emp
    INNER JOIN dept ON emp.deptno = dept.deptno;

SELECT
    emp.empno,
    emp.ename,
    emp.deptno,
    dept.dname
FROM
    emp
    JOIN dept ON emp.deptno = dept.deptno;
    
--------------------------------------
-- Left outer JOIN

SELECT
    *
FROM
    emp
    LEFT OUTER JOIN dept ON emp.deptno = dept.deptno;

SELECT
    *
FROM
    emp
    LEFT JOIN dept ON emp.deptno = dept.deptno;
    
-- Right outer JOIN

SELECT
    *
FROM
    emp
    RIGHT OUTER JOIN dept ON emp.deptno = dept.deptno;

SELECT
    *
FROM
    emp
    RIGHT JOIN dept ON emp.deptno = dept.deptno;
    
-- Full outer JOIN

SELECT
    *
FROM
    emp
    FULL OUTER JOIN dept ON emp.deptno = dept.deptno;
------------------------------------
set timing on
set autotrace on

set autotrace off
set timing off

-- die fremschlüssel spalte sollte index kriegen (bedeutet sortiert werden)
-- die primärschlüssel spalte soll indexiert werden (bedeutet sortiert werden)
-- inner join etc benutzen: sehr wichtig