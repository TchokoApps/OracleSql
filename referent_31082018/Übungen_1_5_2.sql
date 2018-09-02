--�bungen zu zeichenkettenfunktionen

--1.5.2 �bungen zu Zeichenkettenfunktionen 
--a) Welche Mitarbeiter haben einen Namen, der aus 5 Buchstaben besteht? 

select 
    *
from emp 
where length(ename) = 5;
----------------------------------

--b) Welche Mitarbeiternamen beginnen mit einem 'A'? Nennen Sie zwei Wege. 

select 
    *
from emp 
where ename like 'A%';
---------------------------
select 
    empno
    ,ename
    , instr(ename, 'A')  as Position_a
from emp 
where instr(ename, 'A') = 1;

-------------------------------------------
select 
    empno
    ,ename
    , instr(ename, 'A')  as Position_a
from emp 
where substr(ename, 1,1) = 'A';
-------------------------------------------

--c) Ersetzen Sie bitte (nur f�r die Anzeige auf dem Bildschirm) im Namen der Mitarbeiter alle 'A' durch '�' . 

select 
    empno
    ,ename
    , replace(ename, 'A', '�')  as name
from emp;

-----------------------------------------------

--d) (*) Wie kann man herausfinden, ob ein Mitarbeitername ein 'T' 
-- an der 2-ten bis x-ten Stelle enth�lt? 

select 
    *
from emp 
where instr(ename, 'T') >=2;
---------------------------------------

--e) (*) Die Ausgabe von Teilaufgabe 1.5.2.a) soll nun so umformuliert werden, 
--dass nur die Mitarbeiter die ein 'T' im Namen haben ausgegeben werden und zwar mit zwei 'T' (= 'TT'). 

select 
    empno
    ,ename
    ,replace(ename, 'T', 'TT')
from emp 
where length(ename) = 5 and ename like '%T%';
--alternativ  instr(ename, 'T')>0
-----------------------------------------------------

--f) Geben Sie die Gesamtl�nge der Spalten ENAME und JOB aus und geben Sie diese beiden Spalten 
--miteinander verkn�pft aus. 
select 
    empno
    ,length(concat(ename, job))
    ,concat(ename, job)   as "Name+Job"
from emp;

-----------------------------------------------

--g)  (*) Schneiden Sie alle Buchstaben ab, die im Mitarbeiternamen vor dem ersten 'A' vorkommen.

select 
    empno
    ,ename
    ,substr(ename, instr(ename,'A'))
    ,instr(ename,'A')
from emp;

--h) (**) Sie m�chten die Gehaltsh�he der Mitarbeiter �graphisch� darstellen. 
-- So soll jeder Mitarbeiter f�r je gerundete EUR 500,- ein �=� bekommen. 

select 
    EMPNO 
    ,ENAME    
    ,SAL 
    ,substr('=============================', 1, sal/500) || '>' || sal  as sal
from emp;

--------------------------------------------


