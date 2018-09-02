CREATE TABLE projekte (
    projnr    NUMBER(4),
    projbez   VARCHAR2(50),
    dauer     NUMBER(5),
    kickoff   DATE,
    budget    NUMBER(10),
    CONSTRAINT pk_projekte PRIMARY KEY ( projnr ),
    CONSTRAINT ck_budget CHECK (
        budget >= 0
    )
);

INSERT INTO projekte VALUES (
    5000,
    'Windows 10',
    90,
    '1.1.18',
    50000
);

INSERT INTO projekte VALUES (
    5005,
    'Oracle 12c',
    30,
    '1.3.18',
    10000
);

SELECT
    *
FROM
    projekte;

UPDATE projekte
    SET
        projbez = 'WINDOWS 10'
WHERE
    projnr = 5000;

UPDATE projekte
    SET
        projbez = 'ORACLE 12C'
WHERE
    projnr = 5005;

SELECT
    *
FROM
    projekte;
------------------------------------

CREATE TABLE projektmitarbeit (
    projnr      NUMBER(4),
    empno       NUMBER(4),
    wochenstd   NUMBER(4,2),
    CONSTRAINT pk_pm PRIMARY KEY ( projnr,empno ),
    CONSTRAINT fk_pm_projekte FOREIGN KEY ( projnr )
        REFERENCES projekte ( projnr ),
    CONSTRAINT fk_pm_emp FOREIGN KEY ( empno )
        REFERENCES emp ( empno ),
    CONSTRAINT ck_wostd CHECK (
        wochenstd BETWEEN 0 AND 60
    )
);

SELECT
    *
FROM
    emp
ORDER BY empno;

---------------------------------------------------

SELECT
    e.empno,
    e.ename,
    pm.projnr,
    p.projbez
FROM
    emp e
    INNER JOIN projektmitarbeit pm ON e.empno = pm.empno
    INNER JOIN projekte p ON pm.projnr = p.projnr
ORDER BY e.empno;
---------------------------------------------------
-- füge der tabelle emp eine neue spalte hinzu

ALTER TABLE emp ADD gender CHAR(1);

ALTER TABLE emp ADD CONSTRAINT ch_gender CHECK (
    gender IN (
        'M','F'
    )
);
---------------------------------------------------
-- ändern sie alle mitarbeiter auf 'F',wenn sie in abteilung 30 arbeiten

UPDATE emp
    SET
        gender = 'F'
WHERE
    deptno = 30;

UPDATE emp
    SET
        gender = 'M'
WHERE
    deptno != 30;

SELECT
    *
FROM
    emp
ORDER BY deptno;

UPDATE emp
    SET
        gender = 'M'
WHERE
    gender IS NULL;

SELECT
    *
FROM
    emp
ORDER BY deptno;

COMMIT;
------------------------

CREATE OR REPLACE VIEW testview AS
    SELECT
        tbuch.*
    FROM
        tbuch
    WHERE
        buchnr >= 10;
-----------------------------------

SELECT
    *
FROM
    testview;
----------------------------------------

CREATE OR REPLACE VIEW v_jahresgehalt AS
    SELECT
        empno,
        ename,
        sal * 12 + nvl(
            comm,
            0
        ) * 12 AS yearsal
    FROM
        emp
    WHERE
        sal IS NOT NULL
    ORDER BY yearsal DESC;
----------------------

SELECT
    *
FROM
    v_jahresgehalt;
----------------------------------
-- in join der aufgabe g muss der name der l
-- 1.8.3 übungen

--a)

CREATE OR REPLACE VIEW emp_view AS
    SELECT
        emp.*
    FROM
        emp;

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
    FROM
        emp
    WHERE
        deptno = 10;

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
    
--f)

CREATE OR REPLACE VIEW emp_deptname_view AS
    SELECT
        emp.*,
        d.dname
    FROM
        emp
        INNER JOIN dept d ON emp.deptno = d.deptno;

SELECT
    *
FROM
    emp_deptname_view

--g)

CREATE OR REPLACE VIEW emp_deptname_salgrade_view AS
    SELECT
        emp_deptname_view.*,
        s.grade
    FROM
        emp_deptname_view
        INNER JOIN salgrade s ON emp_deptname_view.sal BETWEEN s.losal AND s.hisal
    ORDER BY emp_deptname_view.sal;

SELECT
    *
FROM
    emp_deptname_salgrade_view;
--------------------------------------------------
select * from REF1.TBUCH;
select * from buch;