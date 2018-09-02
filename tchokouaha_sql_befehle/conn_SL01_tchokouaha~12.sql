-- user tchoko
select * from user_users;
select * from user_sys_privs;
select * from session_privs;
select * from dba_sys_privs;

select * from USER_TAB_PRIVS_RECD;

insert into ref1.MITARBEITER values (2,'DAGMAR','HEUSCHKEL');
commit;

select * from MITARBEITER;
--------------------------
grant select on mitarbeiter to sl02,sl03,sl04;
select * from user_tab_privs_made;

revoke select on mitarbeiter from sl02;

---------------------------------------------
-- rollen erstellen; damit mehrere rechteauf einmal vergeben weden können.
create role mgr_role;
-- rechte an rollen granten
grant all on tbuch to mgr_role;
grant all on tautor to mgr_role;
grant all on tvautor to mgr_role;
grant all on tisbn to mgr_role;

---------------------------------
grant mgr_role to tchoko;

drop user tchoko;