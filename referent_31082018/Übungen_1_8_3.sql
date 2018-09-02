-- in join der aufgabe g muss der name der l
-- 1.8.3 übungen

--a)

CREATE OR REPLACE VIEW emp_view AS
    SELECT
        emp.*
    FROM  emp;

--b) CREATE OR REPLACE VIEW emp_view AS

CREATE OR REPLACE VIEW emp_view10 AS
    SELECT
        empno,
        ename,
        job,
        mgr,
        hiredate,
        deptno,
        gender
    FROM     emp
    WHERE    deptno = 10;
----------------------------------------------

select * from EMP_VIEW10;
-----------------------------------------------
CREATE OR REPLACE VIEW emp_view20 AS
    SELECT
        empno,
        ename,
        job,
        mgr,
        hiredate,
        deptno,
        gender
    FROM
        emp
    WHERE
        deptno = 20;

CREATE OR REPLACE VIEW emp_view30 AS
    SELECT
        empno,
        ename,
        job,
        mgr,
        hiredate,
        deptno,
        gender
    FROM
        emp
    WHERE
        deptno = 30;

SELECT
    *
FROM
    emp_view30;
    
--f) Erstellen Sie eine View, die alle Mitarbeiterdaten inkl. Abteilungsnamen (DNAME) beinhaltet. 


CREATE OR REPLACE VIEW emp_deptname_view AS
    SELECT
        emp.*,
        d.dname
    FROM  emp
    INNER JOIN dept d 
    ON emp.deptno = d.deptno;

-----------------------------------------------------------
SELECT
    *
FROM
    emp_deptname_view;



--g)
-- Erstellen Sie nun basierend auf der View aus Aufgabe f) 
--eine weitere View, die zusätzlich die Gehaltsklasse des Mitarbeiters (SALGRADE) angibt. 



CREATE OR REPLACE VIEW emp_deptname_salgrade_view AS
    SELECT
        emp_deptname_view.*,
        s.grade
    FROM emp_deptname_view INNER JOIN salgrade s 
        ON emp_deptname_view.sal BETWEEN s.losal AND s.hisal
    ORDER BY emp_deptname_view.sal;
---------------------------------------
SELECT
    *
FROM
    emp_deptname_salgrade_view;
--------------------------------------------------