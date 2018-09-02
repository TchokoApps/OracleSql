--Übungne zu Constraints
--1.8.2
--a + b)


drop table notiz  cascade constraints;
drop table person cascade constraints;
drop table firma cascade constraints;

-- Tabelle Firma erstellen

CREATE TABLE firma (
    f_nr      NUMBER(4),
    name      VARCHAR2(30),
    adresse   VARCHAR(50),
    constraint  pk_firma primary key (f_nr)
);


--- Tabelle Person erstellen

CREATE TABLE person (
    f_nr      NUMBER(4),
    p_nr      NUMBER(4),
    name      VARCHAR2(30),
    abteilungs_nr number(4),
   constraint pk_fp primary key (f_nr, p_nr),
   constraint fk_person_firma foreign key (f_nr) references firma ( f_nr)
   
);

-- Tabelle Notiz erstellen

CREATE TABLE  notiz (
    f_nr      NUMBER(4),
    p_nr      NUMBER(4),
    k_nr      NUMBER(4),
    notiz_text varchar2(50),
    notiz_status varchar2(15),
    datum     Date default sysdate,   
    constraint pk_no primary key (f_nr, p_nr, k_nr),
    constraint fk_no_person foreign key (f_nr, p_nr) references person (f_nr, p_nr),
    constraint ck_status check(notiz_status in ('OFFEN','ERLEDIGT','TERMIN'))
);

-----------------------------



delete from notiz;
delete from person;
delete from firma;

-------------------------------------------------------------------------------
insert into Firma values (1, 'Integrata Training AG', 'München');
insert into Firma values (2, 'ING DiBa', 'Frankfurt');
insert into Firma values (3, 'ALTER data GmbH', 'Tübingen ');
insert into person values (1, 1, 'Herr Huber', 10);
insert into person values (1, 2, 'Herr Maier', 20);
insert into person values (2, 1, 'Frau Nürnberger', 20);
insert into person values (3, 1, 'Herr Bejic', 10);
insert into notiz values (1, 1, 1, 'Hat angerufen', 'OFFEN', '01-JAN-99');
insert into notiz values (1, 1, 2, 'Termin vereinbart', 'ERLEDIGT', '01-MAI-99');

commit;


-------------------------------------
select * from firma;
select * from person;
select * from notiz;
-------------------------------------

--c)

--c)  Was passiert, wenn Sie folgende Werte eintragen? 
--    Firma: (1, 'Audi', 'Ingolstadt') 
--    Person: (2, 1, 'Frau Bauer', 20) 

insert into firma values (1, 'Audi', 'Ingolstadt') ;
--ORA-00001: Unique Constraint (REF1.PK_FIRMA) verletzt

insert into Person values  (2, 1, 'Frau Bauer', 20) ;
--ORA-00001: Unique Constraint (REF1.PK_FP) verletzt

--d)  Können Sie die Firma mit Nr.2 löschen? Warum / Warum nicht? 

delete from firma
where f_nr = 2;

--ORA-02292: Integritäts-Constraint (REF1.FK_PERSON_FIRMA) verletzt - untergeordneter Datensatz gefunden


--e) (*) Löschen Sie nun den Fremdschlüssel der Tabelle Person, um Wartungsarbeiten durchzuführen. 
alter table person
    drop constraint FK_PERSON_FIRMA;
------------------------------------------

-- Fügen Sie nun folgende Werte in die Tabelle Person ein: Person: (4,1,'Herr Habicht',10) 

insert into person values ( 4,1,'Herr Habicht', 10);

--warum funktioniert das? weil der Fremschlüssel gelöscht wurde.
----------------------------------------------------------------------

select * from person;
select * from firma;

commit;
--Legen Sie nun erneut einen Fremdschlüssel auf die Spalte f_nr, der auf den Primarschlüssel der Tabelle Firma zeigt.
alter table person
    add constraint fk_person_firma foreign key (f_nr)
    references firma ( f_nr);
---------------------------------------------------------

--ORA-02298: (REF1.FK_PERSON_FIRMA) kann nicht validiert werden - übergeordnete Schlüssel nicht gefunden

--neuer datensatz ohne passende f_nr

insert into person values ( 5,1,'Herr Schmidt', 10);

commit;
-------------------------
select * from person;

----------------------------------------
--ausgangslage: Falsche Datensätze in der tabelle person
--wie kann ich diese Datensätze lokalisieren


select 
    *
from person left outer join firma
on person.F_NR = firma.F_NR
where firma.f_nr is null;
-----------------------------------------------------------

--rowid
select 
    rowid
    ,person.*
from person;
-------------------------------

--nutze die exceptions-tabelle, um die fehlerhaften datensätze anzuzeigen
alter table person
    add constraint fk_person_firma foreign key (f_nr)
    references firma ( f_nr)
    exceptions into exceptions;

--damit wird nicht das Problem behoben, aber wir haben die Info über die "faulen datensätze"

select 
    *
from exceptions;
------------------------------------------------------------------
select * from person 
where rowid in ('AAASJQAAHAAAAY7AAI', 'AAASJQAAHAAAAY7AAJ');
------------------------------------------------------------------

--Um den Fremdschlüssel wieder zu anlegen zu können, müssen entweder die Firmen nachgetragen werden
--oder der FK kann mit der Option novalidate angelegt werden. Das heißt, die bestehenden Datenästze werden nicht
--geprüft, der schlüssel wird trotzdem angelegt. Aber zukünftige falscheingaben werden
--mit einer Fehlermeldung abgewiesen

--Novalidate


alter table person
    add constraint fk_person_firma foreign key (f_nr)
    references firma ( f_nr) novalidate;

---------------------------------------------------------

--jetzt werden nur zukünftig fehlerhafte DS abgelehnt


insert into person values ( 6,1,'Frau Klinger', 10);

--ORA-02291: Integritäts-Constraint (REF1.FK_PERSON_FIRMA) verletzt - übergeordneter Schlüssel nicht gefunden

--systemtabelle , in der die Inforamtion nachzuschauen ist

select 
    *
from user_constraints
where table_name = 'PERSON';
-------------------------------------------

select 
    *
from user_cons_columns
where table_name = 'PERSON';
-------------------------------------------













