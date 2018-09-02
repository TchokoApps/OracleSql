--Arbeiten mit Funktionen

--MOD   gibt des reste einer Ganzzahldivision zurück
--zeige 10% des textbestands


--arithmetische Funktionen
select 
    *
from emp 
where mod(empno, 9) = 1;
---------------------------------------

select 
    power(2,10)
    ,power(2,-3)
from dual;
----------------------------------

--round und trunc

select 
    empno
    ,ename
    ,sal*12/13
    ,round(sal*12/13,2)  as runden
    ,trunc(sal*12/13,2)  as schneiden
from emp;
---------------------------------------------
--sign

select 
    sign(2354)
    ,sign(-365)
    ,sign(0)
from dual;
------------------------------------

--sqrt
select 
    sqrt(81)
from dual;
---------------------------------------

--Zeichenkettenfunktionen

--UPPER, LOWER, INITCAP

select 
    upper(ename)  as gross
    ,lower(ename)  as klein
    ,initcap(ename) as gross2
    ,'Sehr geehrter Herr ' || initcap(ename)  as anrede
from emp;

---------------------------------------------------------------

create table mitarbeiter(
manr    number,
vorname  varchar2(30),
nachname   varchar2(30)
);

-----------------------------------------

insert into MITARBEITER values
(1, 'Hans', '  Meier');

insert into MITARBEITER values
(1, 'Hans', 'Meier ');
insert into MITARBEITER values
(1, 'Hans', ' Meier ');

insert into MITARBEITER values
(1, 'Hans', '  Meier  ');
----------------------------------------

select * from MITARBEITER;

----------------------------------------
--TRIM, LTRIM,RTRIM
select 
    nachname
    ,ltrim(nachname)  as links_abschneiden
    ,rtrim(nachname)  as rechts_abschneiden
    ,trim(nachname)   as beidseitig_abschneiden
    ,length(trim(nachname))  as erst_schneiden_dann_zaehlen
from MITARBEITER;
------------------------------------------

--length
select 
    nachname
    ,length(nachname)
    , length(trim(nachname))  as erst_schneiden_dann_zaehlen
from mitarbeiter;

----------------------------------

--Substr

select 
    ename
    ,job
    ,substr(job,1,5) as job
from emp
where job like 'SALES%';
------------------------------------------------

select 
    ename
    , replace(job, 'MAN', 'WOMAN')  as job
from emp
where job like 'SALES%';
------------------------------------------------

--CONCAT

select
    concat('Herr ', INITCAP(ename))  as anrede
    ,'Herr ' || INITCAP(ename)  as anrede2
from emp;

-------------------------------------

--INSTR

--Suche eine Zeichen innerhalb einer zeichenkette, gib die Position des ersten Auffindens zurück

select 
    ename
    ,instr(ename, 'E')
from emp
where instr(ename,'E') =4;
-------------------------------------

select 
    ename
    ,instr(ename, 'E')
from emp
where instr(ename,'E') >0;
--------------------------------------

--LPAD  linksbündiges Auffüllen, RPAD

select 
    ename
    ,sal
    ,lpad(sal, 8,'*')
    ,rpad(sal, 8, '*')
from emp;
------------------------------------------




















