--‹bungen zur WHERE-Klausel

--1.4.4

--a)  Geben Sie alle Mitarbeiter aus, die keine Provision bekommen.

select 
    *
from emp
where comm is null or comm = 0;
--------------------------------------

--b) Berechnen Sie die Monatsverdienste aller Mitarbeiter. Geben sie nur deren Personalnummer, die Namen, die Monatsverdienste und gesamte Monatsgeh‰lter aus.

select 
    empno
    ,ename
    ,sal   as "Monatsvedienst"
    ,sal + coalesce(comm, 0) as "Monatsgehalt"
from emp;



--c)  Berechnen Sie die Jahresgeh‰lter aller Mitarbeiter. Geben sie nur deren Personalnummer, Namen und die Jahresgeh‰lter aus
select 
    empno
    ,ename
    ,sal * 12  + coalesce(comm,0) * 12    as "Jahresgehalt"
from emp;

--d) Wie kann man das Festgehalt, die Provision und das Gesamtgehalt pro Jahr je Mitarbeiter berechnen? Die Gesamtgehaltspalte soll  ÑJ-Gehaltì heiﬂen

select 
    empno
    ,ename
    ,12 * nvl(sal,0)
    ,12 * nvl(comm, 0) 
    ,sal * 12  + coalesce(comm,0) * 12    as "J-Gehalt"
from emp;



--e) Welche Ausgabe erh‰lt man bei
SELECT * 
FROM emp 
WHERE mgr is NULL; 

--f) (*) Jeder Mitarbeiter soll mit seinem Namen, seiner Personalnummer und der Nummer seines Vorgesetzten ausgegeben werden. Herr King hat keinen Vorgesetzten, bei ihm soll als Nummer seines Chefs, seine eigene Mitarbeiternummer angegeben werden. 

select 
    empno
    ,ename
    ,nvl(mgr,empno)  as "Chef"
from emp;

--alternativ mit fester nummer des Chefs
select 
    empno
    ,ename
    ,nvl(mgr,7839)  as "Chef"
from emp;

---------------------------------------

--g) Geben Sie alle Mitarbeiter aus, die keinen Vorgesetzten und keine Provision haben. 
SELECT * 
FROM emp 
WHERE mgr is NULL and comm is null;

---------------------------------


