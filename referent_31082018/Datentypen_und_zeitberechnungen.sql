--Datentypen


--ROWID

select
    rowid
    ,emp.*
from emp;
-------------------------
select
    rowid
    ,dept.*
from dept;
-------------------------

select
    rowid
    ,dept.*
from dept
where rowid = 'AAAR7yAAHAAAALzAAD';
------------------------------------------

--date

select 
        sysdate
        ,TO_CHAR (SYSDATE, 'DD.MM.YYYY HH24:MI:SS')   as zeitstempel
        ,sysdate + 1  as morgen
        ,to_char(sysdate + 1/24, 'DD.MM.YYYY HH24:MI:SS')  as in_einer_std
        ,to_char(sysdate + 1/24/60, 'DD.MM.YYYY HH24:MI:SS')  as in_einer_min
        ,to_char(sysdate + 1/24/60/60, 'DD.MM.YYYY HH24:MI:SS')  as in_einer_sec
        ,sysdate-5
from dual;
----------------------------------

select 
    empno
    ,ename
    ,hiredate
    ,to_char(hiredate, 'DD/MM/YYYY') as hiredate
    ,to_char(hiredate, 'DD.MM.YYYY HH24:MI:SS')
from emp;
-----------------------------------

insert into emp ( empno, ename, hiredate) values ( 4711, 'TESTMAN', sysdate);

select * from emp
where hiredate >= '28.08.18';
----------------------------------------

--Uhrzeit abschneiden  TRUNC

select * from emp
where trunc(hiredate)= '28.08.18';

-------------------------------------


select * from emp
where trunc(hiredate)= trunc(sysdate);

-------------------------------------------






