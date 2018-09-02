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

