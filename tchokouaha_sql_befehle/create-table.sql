CREATE TABLE projekte (
    projnr    NUMBER(4),
    projbez   VARCHAR2(50),
    dauer     NUMBER(5),
    kickoff   DATE,
    budget    NUMBER(10),
    CONSTRAINT pk_projekte PRIMARY KEY ( projnr ),
    CONSTRAINT ck_budget CHECK (
        budget >= 0
    )
);

INSERT INTO projekte VALUES (
    5000,
    'Windows 10',
    90,
    '1.1.18',
    50000
);

INSERT INTO projekte VALUES (
    5005,
    'Oracle 12c',
    30,
    '1.3.18',
    10000
);

SELECT
    *
FROM
    projekte;