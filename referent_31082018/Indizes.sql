--index: sortierte Speicherung der daten in einem eigenen INDEX-Segment


drop table big_emp;
--set timing on

create table big_emp
    as select * from emp;
------------------------------
insert into big_emp
    select * from big_emp;
-------------------------------------------

set autotrace on

commit;


-----------------------------------
--erstelle eine neue spalte 
alter table big_emp 
add nr  number;

-------------------------------

update big_emp
set nr = rownum;

commit;
--------------------------------
--miss die Laufzeit des befehls ohne index

select *  from big_emp 
where nr  = 999999;

----------------------------------

--erzeuge einen Index auf der Spalte nr

create index big_emp_idx on big_emp ( nr);

--------------------------------------------


select *  from big_emp 
where nr  = 1000085;

--Idee: primärschlüssel sind automatisch indiziert
--  alle Fremdschlüsselspalten sollten indiziert werden, um den abgleich beim INNER JOIN zu beschleunigen



