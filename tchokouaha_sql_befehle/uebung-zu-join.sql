-- übungen zu joins
-- empno,ename (emp),deptno,dname
SELECT
    e.empno,
    e.ename,
    d.deptno,
    d.dname,
    e.sal,
    s.grade
FROM
    emp e
    INNER JOIN dept d ON e.deptno = d.deptno
    INNER JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal;
--------------------
-- Bücher joi

SELECT
    b.buchnr,
    b.titel,
    b.erschj,
    b.preis,
    v.autornr,
    a.autor
FROM
    tbuch b
    LEFT OUTER JOIN tvautor v ON b.buchnr = v.buchnr
    LEFT OUTER JOIN tautor a ON a.autornr = v.autornr
WHERE
    b.preis IS NOT NULL;
-------------------------------------------------------------

SELECT
    nvl(
        TO_CHAR(d.deptno),
        'Keine deptno'
    ),
    d.dname,
    COUNT(empno) AS anz_ma,
    SUM(sal) AS sum_sal,
    round(AVG(sal) ) AS avg_sal
FROM
    emp e
    FULL OUTER JOIN dept d ON e.deptno = d.deptno
GROUP BY
    d.deptno,
    d.dname
ORDER BY d.deptno;
-------------------------------------------------------------
-- Inkonsistenzabfrage
-- suche autoren,die keine bücher geschrieben haben

SELECT
    a.*
FROM
    tautor a
    LEFT JOIN tvautor v ON a.autornr = v.autornr
WHERE
    v.buchnr IS NULL;
-------------------------------------------------------------

SELECT
    *
FROM
    tbuch b
    LEFT JOIN tvautor v ON b.buchnr = v.buchnr
WHERE
    v.autornr IS NULL;
------------------------------------------------------------------
-- fuege neue abteilung ein

INSERT INTO dept VALUES (
    50,
    'IT',
    'Frankfurt'
);

COMMIT;

UPDATE dept
    SET
        loc = 'HANAU'
WHERE
    deptno = 50;

SELECT
    *
FROM
    dept;

----------------------

ROLLBACK;

SELECT
    *
FROM
    dept;
------------------------

INSERT INTO emp (
    empno,
    ename,
    deptno
) VALUES (
    1,
    'TESTMAN',
    30
);

commit;

select * from emp;

select * from DEPT;

update emp set deptno = 30 where empno = 1;

commit;

delete from dept where DEPTNO = 30;

update emp
set sal = sal;

update emp 
set sal = (select max(sal) from emp);

rollback;

select * from emp;

create table 

