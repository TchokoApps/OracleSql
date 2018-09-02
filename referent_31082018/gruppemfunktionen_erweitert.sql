--Gruppenfunktionen ticken anders
--NULL_Werte werden in den Berechnungen ( AVG, SUM, COUNT) vernachlässigt
--Count ignoriert die Felder mit NULL-Werten 

select 
    avg(comm)  as avg_comm
    ,round(avg(sal),0)  as avg_sal
    ,count(empno)  as anz_ma
    ,count(comm)  as anz_prov
    ,count(nvl(comm, 0))   as anz_comm
from emp;
------------------------------------


--MIN  und MAX

select
    min(hiredate)  
    ,max(hiredate)
    ,round(max(hiredate) -min(hiredate))  as AnzTage
from emp;

------------------------------------------------------

select 
    min(ename)
    ,max(ename)
from emp;
------------------------------------------

select 
    deptno
    ,sum(sal)
from emp
where deptno is not null
group by deptno
order by deptno;
----------------------------

--Sortieren nach aliasnamen
select 
    job
    ,count(job)  as anz_ma
from emp 
group by job
order by anz_ma desc;

--------------------------------------------

--weitere Einschränkung auf die Ergebnismenge nach dem gruppieren
select 
    deptno
    ,max(sal)
from emp 
group by deptno
having  max(sal) >=3000
order by deptno;
--------------------------------------

insert into emp ( empno, ename, hiredate) values (4811,'MEIER',trunc(sysdate));

commit;
--------------------------------------
--zeige alle Jobs mit ihren durchschnittsgehältern über 2000 €

select 
    job
    ,round(avg(sal))  as avg_sal
from emp
where job is not null
group by job
having avg(sal)>2000
order by avg_sal desc;
--------------------------------------

select 
    to_char(hiredate, 'Q/YYYY')
    ,count(*)  as anz_MA
from emp
group by to_char(hiredate, 'Q/YYYY')
order by to_char(hiredate, 'Q/YYYY') ;

-------------------------------------------------

















