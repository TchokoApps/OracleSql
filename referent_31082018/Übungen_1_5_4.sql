--1.5.4 Übungen zu Gruppenfunktionen 
--a)  Geben Sie jeweils das Durchschnittsgehalt, Maximalgehalt und Minimalgehalt der Tabelle EMP an. 
select 
    round(avg(sal),4)  as "Mittel"
    ,max(sal) as max
    ,min(sal) as min
from emp;
------------------------------

--b)  Geben Sie alle Durchschnittsgehälter je Abteilung an. 

select 
    deptno
    ,round(avg(sal),4) as "Durchschnitt"
from emp 
where deptno is not null
group by deptno
order by deptno;
----------------------------------

--c)  Geben Sie das Maximalgehalt je Berufsgruppe an. 

select 
    job
    , max(sal)  as max_gehalt
from emp 
where job is not null
group by job;
---------------------------------------

--d) In welcher Abteilung arbeiten mindestens zwei Clerks? 

select 
    deptno
    ,job
    ,count(job)   as Anzahl
from emp 
where job = 'CLERK'
group by deptno, job
having count(job) = 2
order by deptno, job;

------------------------------------------

select distinct
    deptno
    ,job
from emp
order by deptno, job;

--e)  Zählen Sie die jeweiligen Mitarbeiter je Berufsgruppe, in der es mehr als einen Mitarbeiter gibt.

select 
    job
    ,count(ename ) as anzahl
from emp 
where job is not null
group by job
having count(ename) >1
order by job;

-------------------------------------

select 
    mgr
    ,count(*)
from emp
group by mgr;








