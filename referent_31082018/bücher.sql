drop table tisbn;
drop table tvautor;
drop table tautor;
drop table tbuch;
commit;


CREATE TABLE Tbuch (
Buchnr number(5) ,
Erschj number(4) ,
Preis  number(7,2),
Titel VARCHAR2(40) 
);


CREATE TABLE Tisbn (
Buchnr number(5) ,
Isbn   VARCHAR2(10) ,
Lfdnr  number(1) 
);


CREATE TABLE Tautor (
Autornr number(5) ,
Autor VARCHAR2(40) 
);




CREATE TABLE Tvautor (
Buchnr  number(5) ,
Autornr number(5) ,
Lfdnr   number(1) 
);

commit;


DELETE FROM TBUCH;
DELETE FROM TAUTOR;
DELETE FROM TVAUTOR;
DELETE FROM TISBN;
COMMIT;

insert into Tautor values
(1,'BOELL');
insert into Tautor values
(2,'GRASS');
insert into Tautor values
(3,'ECO');
insert into Tautor values
(6,'SCHEIFELE');
insert into Tautor values
(10,'EMIL HACK');
insert into Tautor values
(11,'FRIEDA HOLZ');
insert into Tautor values
(20,'C. J. DATE');
insert into Tautor values
(21,'COLIN J. WHITE');
commit;

INSERT INTO Tbuch VALUES
(5,1988,3.50,'ANSICHTEN EINES CLOWNS');
INSERT INTO Tbuch VALUES
(6,1988,20.50,'DIE BLECHTROMMEL');
INSERT INTO Tbuch VALUES
(7,1989,99.99,'DER NAME DER ROSE');
INSERT INTO Tbuch VALUES
(8,1977,1.50,'DER BUTT');
INSERT INTO Tbuch VALUES
(9,1990,55.00,'DB2 FUER SIE');
INSERT INTO Tbuch VALUES
(11,1990,NULL,'ELVIS IN HEIDELBERG');
INSERT INTO Tbuch VALUES
(12,1989,NULL,'A GUIDE TO ORACLE');
INSERT INTO Tbuch VALUES
(18,1989,99.99,'DATABASE SYSTEMS');
INSERT INTO Tbuch VALUES
(27,NULL,49.99,'DIE JÜDIN VON TOLEDO');
commit;

INSERT INTO Tisbn VALUES
(8,'3472864303',1);
INSERT INTO Tisbn VALUES
(12,'0201501139',1);
INSERT INTO Tisbn VALUES
(99,'123456789x',1);
INSERT INTO Tisbn VALUES
(8,'34728643yx',2);
INSERT INTO Tisbn VALUES
(99,'1234567zzz',2);
INSERT INTO Tisbn VALUES
(5,'5647363090',1);
commit;

INSERT INTO Tvautor VALUES
(5,1,1);
INSERT INTO Tvautor VALUES
(6,2,1);
INSERT INTO Tvautor VALUES
(7,3,1);
INSERT INTO Tvautor VALUES
(8,2,1);
INSERT INTO Tvautor VALUES
(9,10,1);
INSERT INTO Tvautor VALUES
(9,11,2);
INSERT INTO Tvautor VALUES
(12,20,1);
INSERT INTO Tvautor VALUES
(12,21,2);

commit;

SELECT * FROM TBUCH order by buchnr;
SELECT * from tisbn order by buchnr;
SELECT * FROM TAUTOR order by autornr;
SELECT * FROM TVautor order by buchnr;


commit;




