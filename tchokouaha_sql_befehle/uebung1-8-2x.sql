-----------------------------------------
--a)
DROP TABLE notiz CASCADE CONSTRAINTS;

DROP TABLE person CASCADE CONSTRAINTS;

DROP TABLE firma CASCADE CONSTRAINTS;

-- Tabelle Firma erstellen

CREATE TABLE firma (
    f_nr      NUMBER(4),
    name      VARCHAR2(30),
    adresse   VARCHAR(50),
    CONSTRAINT pk_firma PRIMARY KEY ( f_nr )
);

SELECT
    *
FROM
    firma;

--- Tabelle Person erstellen

CREATE TABLE person (
    f_nr            NUMBER(4),
    p_nr            NUMBER(4),
    name            VARCHAR2(30),
    abteilungs_nr   NUMBER(4),
    CONSTRAINT pk_fp PRIMARY KEY ( f_nr,p_nr ),
    CONSTRAINT fk_person_firma FOREIGN KEY ( f_nr )
        REFERENCES firma ( f_nr )
);

-- Tabelle Notiz erstellen

CREATE TABLE notiz (
    f_nr           NUMBER(4),
    p_nr           NUMBER(4),
    k_nr           NUMBER(4),
    notiz_text     VARCHAR2(50),
    notiz_status   VARCHAR2(15),
    datum          DATE DEFAULT SYSDATE,
    CONSTRAINT pk_no PRIMARY KEY ( f_nr,p_nr,k_nr ),
    CONSTRAINT fk_no_person FOREIGN KEY ( f_nr,p_nr )
        REFERENCES person ( f_nr,p_nr ),
    CONSTRAINT ck_status CHECK (
        notiz_status IN (
            'OFFEN','ERLEDIGT','TERMIN'
        )
    )
);

-----------------------------------------
--b)

DELETE FROM notiz;

DELETE FROM person;

DELETE FROM firma;

INSERT INTO firma VALUES (
    1,
    'Integrata Training AG',
    'München'
);

INSERT INTO firma VALUES (
    2,
    'ING DiBa',
    'Frankfurt'
);

INSERT INTO firma VALUES (
    3,
    'ALTER data GmbH',
    'Tübingen '
);

INSERT INTO person VALUES (
    1,
    1,
    'Herr Huber',
    10
);

INSERT INTO person VALUES (
    1,
    2,
    'Herr Maier',
    20
);

INSERT INTO person VALUES (
    2,
    1,
    'Frau Nürnberger',
    20
);

INSERT INTO person VALUES (
    3,
    1,
    'Herr Bejic',
    10
);

INSERT INTO notiz VALUES (
    1,
    1,
    1,
    'Hat angerufen',
    'OFFEN',
    '01-JAN-99'
);

INSERT INTO notiz VALUES (
    1,
    1,
    2,
    'Termin vereinbart',
    'ERLEDIGT',
    '01-MAI-99'
);

COMMIT;
-------------------------------------------------------------------------

SELECT
    *
FROM
    firma;

SELECT
    *
FROM
    person;

SELECT
    *
FROM
    notiz;
-------------------------------------------------------------------------
--c)

INSERT INTO firma VALUES (
    1,
    'Audi',
    'Ingolstadt'
);
-------------------------------------------------------------------------
--d)

DELETE FROM firma WHERE
    f_nr = 2;
-- ORA-02292: Integritäts-Constraint (SL01.FK_PERSON_FIRMA) verletzt - untergeordneter Datensatz gefunden

ALTER TABLE person DROP CONSTRAINT fk_person_firma;

INSERT INTO person VALUES (
    4,
    1,
    'Herr Habicht',
    10
);

-- warum funktioniert das? Weil der Fremdschlüssel gelöscht wurde.

ALTER TABLE person ADD CONSTRAINT fk_person_firma FOREIGN KEY ( f_nr )
    REFERENCES firma ( f_nr )
NOVALIDATE;
-- ORA-02298: (SL01.FK_PERSON_FIRMA) kann nicht validiert werden - übergeordnete Schlüssel nicht gefunden

-- neuer datensatz ohne passende f_nr

INSERT INTO person VALUES (
    5,
    1,
    'Herr Schmidt',
    10
);

COMMIT;
---------------------------------

SELECT
    *
FROM
    person;
---------------------------------
-- ausgangslage: Falsche 

CREATE TABLE exceptions (
    row_id       ROWID,
    owner        VARCHAR2(30),
    table_name   VARCHAR2(30),
    constraint   VARCHAR2(30)
);
-----------------------------------

SELECT
    ROWID,
    person.*
FROM
    person;
-----------------------------------
-- nutze die exceptions-tabelle,um die fehlerhaften datensätze anzuzeigen

ALTER TABLE person ADD CONSTRAINT fk_person_firma FOREIGN KEY ( f_nr )
    REFERENCES firma ( f_nr )
EXCEPTIONS INTO exceptions;

DROP TABLE exceptions;

SELECT
    *
FROM
    exceptions;
----------------------------------------

SELECT
    *
FROM
    person
WHERE
    ROWID IN (
        'AAASJiAAHAAAAbOAAE','AAASJiAAHAAAAbOAAF'
    );
-----------------------------------------
-- um den Fremdschlüssel wieder anlegen zu können,müssen entweder die firmen nachgetragen werden
-- oder der fk mit der option novalidate angelegt wrden. das heißt ...

SELECT
    *
FROM
    person;
---------------------------------------------------------
-- user anlegen

CREATE USER tchoko IDENTIFIED BY test
    DEFAULT TABLESPACE users
    TEMPORARY TABLESPACE temp
    QUOTA UNLIMITED ON users;
-- ORA-01031: Nicht ausreichende Berechtigungen
--------------------------------------------------------------
-- wie verbinde ich den user mit der der datenbank
-- das minimale recht, um sich mit einer datenbank zu verbinden: CREATE SESSION recht
