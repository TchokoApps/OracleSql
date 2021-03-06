-- Tabelle Firma erstellen

CREATE TABLE firma (
    f_nr      NUMBER(4),
    name      VARCHAR2(30),
    adresse   VARCHAR(50),
    constraint  pk_firma primary key (f_nr)
);

select * from firma;

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

drop table notiz;

CREATE TABLE  notiz (
    f_nr      NUMBER(4),
    p_nr      NUMBER(4),
    k_nr      NUMBER(4),
    notiz_text varchar2(50),
    notiz_status varchar2(2),
    datum Date default sysdate,   
    constraint pk_no primary key (f_nr, p_nr, k_nr),
    constraint fk_no_person foreign key (f_nr, p_nr) references person (f_nr, p_nr),
    constraint ck_status check(notiz_status in ('OFFEN','ERLEDIGT','TERMIN'))
);
