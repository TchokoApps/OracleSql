--DML

DELETE FROM dept;

DELETE FROM dept WHERE  deptno = 40;

rollback;
------------------------

DELETE FROM emp 
WHERE deptno = 10;


