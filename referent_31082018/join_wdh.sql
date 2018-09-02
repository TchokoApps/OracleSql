--Übungen zu JOINS
--empno, ename  (emp), deptno, dname (dept), grade  ( salgrade)

select
    e.empno 
    ,e.ename
    ,d.deptno
    ,d.dname
from emp e inner join dept d 
on e.deptno = d.deptno;
-------------------------------------------------

select
    e.empno 
    ,e.ename
    ,d.deptno
    ,d.dname
    ,e.sal
    ,s.grade
from emp e inner join dept d 
    on e.deptno = d.deptno
inner join salgrade s
    on e.sal >= s.losal and e.sal <= s.hisal;
------------------------------------------------------

--Bücher join

--buchnr , titel, erschj, preis, autornr, autor
select 
    b.buchnr
    ,b.titel
    ,b.erschj
    ,b.preis
    ,nvl(to_char(v.autornr),'keine')  as autornr          --ersetze datentyp zahl mit text-Eintrag
from tbuch b left outer join tvautor v
    on b.BUCHNR = v.buchnr
where preis is not null;

----------------------------------------

select 
    b.buchnr
    ,b.titel
    ,b.erschj
    ,b.preis
    ,nvl(to_char(v.autornr),'keine')  as autornr       
    ,autor
from tbuch b left outer join tvautor v
    on b.BUCHNR = v.buchnr
left outer join tautor a
    on a.autornr = v.autornr
where preis is not null;
----------------------------------------------------

--zeige die Abteilungen ( deptno, dname) und die Anzahl MA, Gesamtgehalt und das Durchschnittsgehalt

select 
   nvl(to_char(d.deptno),'Keine deptno')   as deptno
    ,d.dname
    ,count(empno) as anz_ma
    ,sum(sal)  as sum_sal
    ,round(avg(sal))  as avg_sal
from emp e full outer join dept d
on e.deptno = d.deptno
group by d.DEPTNO, d.dname    --hier muß die Spalte aufgenommen werden, die in der Liste erscheinen soll
order by d.deptno;

-----------------------------------------------------
--Inkonsistenzabfrage

--suche Autoren, die keine Bücher geschrieben haben

-- outer join zwischen tautor und tvautor

select 
    a.*
from tautor a left join tvautor v
on a.autornr = v.autornr
where v.buchnr is null;
----------------------------------------------

--zeige alle bücher ohne autoren

select 
   b.*
from tbuch b left join tvautor v
on b.buchnr = v.buchnr
where v.AUTORNR is null;

----------------------------------------





























