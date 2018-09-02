---------------------------------------------------------------
CREATE TABLE mitarbeiter (
    manr       NUMBER,
    vorname    VARCHAR2(30),
    nachname   VARCHAR2(30)
);

-----------------------------------------

INSERT INTO mitarbeiter VALUES (
    1,
    'Hans',
    '  Meier'
);

INSERT INTO mitarbeiter VALUES (
    1,
    'Hans',
    'Meier '
);

INSERT INTO mitarbeiter VALUES (
    1,
    'Hans',
    ' Meier '
);

INSERT INTO mitarbeiter VALUES (
    1,
    'Hans',
    '  Meier  '
);
----------------------------------------

SELECT
    *
FROM
    mitarbeiter;

----------------------------------------
-- trim,ltrim,rtrim

SELECT
    '|' || nachname || '|',
    '|' || ltrim(nachname) || '|',
    '|' || rtrim(nachname) || '|'
FROM
    mitarbeiter;

SELECT
    nachname,
    ltrim(nachname) AS links_abschneiden,
    rtrim(nachname) AS rechts_abschneiden,
    TRIM(nachname) AS beidseitig_abschneiden,
    length(TRIM(nachname) ) AS erst_schneiden_dann_zaehlen
FROM
    mitarbeiter;
----------------------------------------
-- length

SELECT
    nachname,
    length(nachname),
    TRIM(nachname),
    length(TRIM(nachname) )
FROM
    mitarbeiter;
----------------------------------------
-- substr

SELECT
    ename,
    job,
    substr(        job,        1,        5    ) AS job
FROM
    emp
WHERE
    job LIKE 'SALES%';
----------------------------------------

SELECT
    ename,
    replace(        job,        'MAN',        'WOMAN'    ) AS job
FROM
    emp
WHERE
    job LIKE 'SALES%';
----------------------------------------
-- concat

SELECT
    concat(
        'Herr ',
        initcap(ename)
    ) AS anrede,
    'Herr ' || initcap(ename)
FROM
    emp;
----------------------------------------
-- INSTR
-- suche ein Zeichen innerhalb einer zeichenkette

SELECT
    ename,
    instr(        ename,        'E'    )
FROM
    emp
WHERE
    instr(        ename,        'E'    ) = 4;
-------------------------------------------
-- übung 1.5.2
--a)

SELECT
    *
FROM
    emp
WHERE
    length(ename) = 5;
    
--b) to see again

SELECT
    *
FROM
    emp
WHERE
    ename LIKE 'A%';
    
SELECT
    *
FROM
    emp
WHERE
    instr(ename, 'A') = 1;
    
SELECT
    *
FROM
    emp
WHERE
    substr(ename, 1,1) = 'A';

--c)

SELECT
    empno,
    ename,
    replace(ename,'A','Ä') AS name
FROM
    emp;
    
--d)

SELECT
    *
FROM
    emp
WHERE
    instr(ename,'T') >= 2;
    
--e)

SELECT
    empno,
    ename,
    replace(ename,'T','TT') as "Name"
FROM
    emp
WHERE
    instr(ename,'T') >= 2 and length(ename) = 5;

--f)

SELECT
    empno,
    length(ename) + length(job) AS "Länge",
    concat(ename,job) AS "Name+Job"
FROM
    emp;
    
--g) to check later

SELECT
    empno,
    ename,
FROM
    emp;

-- h)

SELECT
    empno,
    ename,
    sal
FROM
    emp;