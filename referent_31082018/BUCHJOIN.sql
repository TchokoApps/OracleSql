--Buchbestand  JOIN
--Zeige nur die B�cher, die �berhaupt eine ISBN haben

select 
    *
from tbuch  inner join tisbn
on tbuch.buchnr = tisbn.buchnr;
------------------------------------
--zeige nun alle b�cher, auch wemm sie keine ISBN haben

select 
    *
from tbuch  left join tisbn
on tbuch.buchnr = tisbn.buchnr;
-----------------------------------------

--Zeige nun alle b�cher mit isbn und die ISBN-Eintr�ge, zu denen es keine b�cher gibt
select 
    *
from tbuch  right join tisbn
on tbuch.buchnr = tisbn.buchnr;
-------------------------------------------
--Join zw. TBUCH und TVAUTOR
select 
    *
from tbuch inner join tvautor
on tbuch.buchnr = tvautor.buchnr;
-------------------------------------------
select 
    *
from tbuch inner join tvautor
on tbuch.buchnr = tvautor.buchnr
inner join tautor
on tvautor.autornr = tautor.autornr
inner join tisbn
on tbuch.BUCHNR = tisbn.BUCHNR;
-------------------------------------------
select 
    *
from tbuch left join tvautor
on tbuch.buchnr = tvautor.buchnr
left join tautor
on tvautor.autornr = tautor.autornr
left join tisbn
on tbuch.BUCHNR = tisbn.BUCHNR
order by 1;
-------------------------------------------
--Zeigen Sie die Anzahl (count) B�cher pro Autor - ON-Klausel
SELECT 
    tautor.autornr
    ,tautor.autor
    ,count(buchnr)
from tvautor inner join tautor
on tvautor.autornr = tautor.autornr
group by tautor.AUTORNR, tautor.autor;
-------------------------------------------
--Anzahl Autoren pro Buch buchnr titel count (tvauto.autornr)
SELECT 
    tbuch.buchnr
    ,tbuch.titel
    ,count(tvautor.AUTORnr) as Anzahl_Autoren
from tbuch inner join TVAUTOR
on  tbuch.buchnr = tvautor.buchnr
group by tbuch.buchnr
    ,tbuch.titel;
-------------------------------------------

