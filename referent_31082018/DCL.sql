--DCL  Data control language

select 
    *
from user_tablespaces;
------------------------------
select 
    *
from dba_tablespaces;

--------------------------------

--user anlegen

create user dagmar
identified by test
default tablespace users
temporary tablespace temp
quota unlimited on users;

--ORA-01031: Nicht ausreichende Berechtigungen

--wie verbinde ich den User mit der datenbank

--das minimale RECHT, um sich mit einer Datenbank zu verbinden : CREATE SESSION

--Als system anmelden

grant create user to public;
revoke create user from  public;

---------------------------------------

grant create session to public;

------------------------------------------

--ref1

select * from USER_SYS_PRIVS;

create table test5 as select * from tbuch;

--rechtevergabe auf Objekte an SL01, ...

grant select on mitarbeiter to SL01, SL02, SL03, SL04, dagmar;
grant insert, delete on mitarbeiter to SL01, SL02, SL03, SL04, dagmar;
grant update on mitarbeiter to SL01, SL02, SL03, SL04;
-------------------------------------

-----------------------------
--wer hat mir rechte vergeben?
select 
    *
from user_tab_privs_recd;

-------------------------------------
--wem habe ich rechte vergeben

select 
    *
from user_tab_privs_made;
-------------------------------------

--rechte entziehen

revoke insert on mitarbeiter from SL01, SL02, SL03, SL04, dagmar;
--ORA-01927: Sie können keine Berechtigungen entziehen, die Sie nicht erteilt haben.

--Rolle erstellen, damit mehrere rechte auf einmal vergeben werden können

create role buchrolle;
--ORA-01031: Nicht ausreichende Berechtigungen

--Rechte an Rolle granten

grant all on tbuch to buchrolle;     ---alle objektrechte auf tbuch aufeinmal
grant all on tautor to buchrolle;
grant select on tvautor to buchrolle;
grant select on tisbn to buchrolle;

----------------------------------------------
--vergebe die Rolle an selbsterstellten user

grant buchrolle to dagmar;
----------------------------------------------

--user Dagmar löschen

drop user dagmar;

--ORA-01031: Nicht ausreichende Berechtigungen


/***************  systemadmin ***************/

--Als system anmelden

grant create user to public;
revoke create user from  public;

---------------------------------------

grant create session to public;
------------------------------------------

select 
    *
from DBA_USERS;
----------------------------------------

grant create role  to ref1, sl01, sl02, sl03, sl04;

grant drop user  to ref1, sl01, sl02, sl03, sl04;




















