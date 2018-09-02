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

revoke drop user  from  ref1, sl01, sl02, sl03, sl04;



