-- user Dagmar

select * from USER_SYS_PRIVS;
--------------------------------------
select 
    *
from user_tab_privs_recd;
--------------------------------------

select 
    *
from ref1.mitarbeiter;
-------------------------------------

insert into ref1.mitarbeiter values (2, 'DAGMAR', 'HEUSCHKEL');
---------------------------------
commit;
---------------------------------


--welche rollen habe ich zugewiesen bekommen?

select * from USER_ROLE_PRIVs;

--welche rechte hat diese Rolle

select * from role_tab_privs;
-------------------------------------

--zeige die verwendung eines rechts aus der Liste der rechte
--rollenrechte werden erst nach einem DISCONNECT und erneuten Connect aktiv.

select * from ref1.tbuch;

