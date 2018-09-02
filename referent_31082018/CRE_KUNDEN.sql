create table kunden
(KundenNr   varchar2(10)
,Firma      varchar2(30)   
,Land       varchar2(30)
,Bundesland varchar2(30)
,Ort       varchar2(30)  
);
------------------------------------

select * from kunden;
------------------------------------
delete from kunden;
------------------------------------
commit;

