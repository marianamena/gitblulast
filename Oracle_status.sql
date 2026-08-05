status.sql
set line 200
set pagesize 10000
select count(1),status,program,osuser,server from v$session where username='DEVELOP' group by status,program,server,osuser order by 1 desc;
