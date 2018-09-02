-- uterabfrage ( subselect)
-----------------------------------------------
-- wer verdient am meisten?
SELECT
    *
FROM
    emp
WHERE
    sal = (
        SELECT
            MAX(sal)
        FROM
            emp
    );
    
--------------------------------------------------
---1:6:2
--a)

SELECT
    empno,
    ename,
    sal
FROM
    emp e
WHERE
        deptno = (
            SELECT
                deptno
            FROM
                emp
            WHERE
                ename = 'SMITH'
        )
    AND
        ename != 'SMITH';

-------
--b)

SELECT
    empno,
    ename,
    sal
FROM
    emp
WHERE
    sal < (
        SELECT
            AVG(sal)
        FROM
            emp
    )
ORDER BY
    sal,
    empno;
    
-----
--c)

SELECT
    empno,
    ename,
    deptno
FROM
    emp e
WHERE
    deptno = (
        SELECT
            e2.deptno
        FROM
            emp e2
        WHERE
                e2.ename LIKE 'A%'
            AND
                e.deptno = e2.deptno
    )
ORDER BY e.empno DESC;

---
-- d)

SELECT
    empno,
    deptno,
    ename,
    job
FROM
    emp
WHERE
    deptno = (
        SELECT
            deptno
        FROM
            dept d
        WHERE
            d.dname = 'RESEARCH'
    );
    
--e)

SELECT
    empno,
    ename,
    hiredate
FROM
    emp e
WHERE
    e.deptno IN (
        SELECT
            d2.deptno
        FROM
            dept d2
        WHERE
                d2.loc = 'NEW YORK'
            OR
                d2.loc = 'DALLAS'
    );