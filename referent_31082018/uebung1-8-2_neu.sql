--�bungne zu Constraints
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
insert into Firma values (1, 'Integrata Training AG', 'M�nchen');
insert into Firma values (2, 'ING DiBa', 'Frankfurt');
insert into Firma values (3, 'ALTER data GmbH', 'T�bingen ');
insert into person values (1, 1, 'Herr Huber', 10);
insert into person values (1, 2, 'Herr Maier', 20);
insert into person values (2, 1, 'Frau N�rnberger', 20);
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

--d)  K�nnen Sie die Firma mit Nr.2 l�schen? Warum / Warum nicht? 

delete from firma
where f_nr = 2;

--ORA-02292: Integrit�ts-Constraint (REF1.FK_PERSON_FIRMA) verletzt - untergeordneter Datensatz gefunden


--e) (*) L�schen Sie nun den Fremdschl�ssel der Tabelle Person, um Wartungsarbeiten durchzuf�hren. 
alter table person
    drop constraint FK_PERSON_FIRMA;
------------------------------------------

-- F�gen Sie nun folgende Werte in die Tabelle Person ein: Person: (4,1,'Herr Habicht',10) 

insert into person values ( 4,1,'Herr Habicht', 10);

--warum funktioniert das? weil der Fremschl�ssel gel�scht wurde.
----------------------------------------------------------------------

select * from person;
select * from firma;

commit;
--Legen Sie nun erneut einen Fremdschl�ssel auf die Spalte f_nr, der auf den Primarschl�ssel der Tabelle Firma zeigt.
alter table person
    add constraint fk_person_firma foreign key (f_nr)
    references firma ( f_nr);
---------------------------------------------------------

--ORA-02298: (REF1.FK_PERSON_FIRMA) kann nicht validiert werden - �bergeordnete Schl�ssel nicht gefunden

--neuer datensatz ohne passende f_nr

insert into person values ( 5,1,'Herr Schmidt', 10);

commit;
-------------------------
select * from person;

----------------------------------------
--ausgangslage: Falsche Datens�tze in der tabelle person
--wie kann ich diese Datens�tze lokalisieren


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

--nutze die exceptions-tabelle, um die fehlerhaften datens�tze anzuzeigen
alter table person
    add constraint fk_person_firma foreign key (f_nr)
    references firma ( f_nr)
    exceptions into exceptions;

--damit wird nicht das Problem behoben, aber wir haben die Info �ber die "faulen datens�tze"

select 
    *
from exceptions;
------------------------------------------------------------------
select * from person 
where rowid in ('AAASJQAAHAAAAY7AAI', 'AAASJQAAHAAAAY7AAJ');
------------------------------------------------------------------

--Um den Fremdschl�ssel wieder zu anlegen zu k�nnen, m�ssen entweder die Firmen nachgetragen werden
--oder der FK kann mit der Option novalidate angelegt werden. Das hei�t, die bestehenden Daten�stze werden nicht
--gepr�ft, der schl�ssel wird trotzdem angelegt. Aber zuk�nftige falscheingaben werden
--mit einer Fehlermeldung abgewiesen

--Novalidate


alter table person
    add constraint fk_person_firma foreign key (f_nr)
    references firma ( f_nr) novalidate;

---------------------------------------------------------

--jetzt werden nur zuk�nftig fehlerhafte DS abgelehnt


insert into person values ( 6,1,'Frau Klinger', 10);

--ORA-02291: Integrit�ts-Constraint (REF1.FK_PERSON_FIRMA) verletzt - �bergeordneter Schl�ssel nicht gefunden

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













