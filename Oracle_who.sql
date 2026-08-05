who.sql
alter session set nls_calendar=gregorian;
alter session set nls_date_format='DD-MON-YYYY HH24:MI:SS';
col sid1 for a11
set line 200
heading "SID|Serial"
set pages 1000
col machine for a33
col program for a30
col username for a15
col osuser for a25
select s.status,s.sid||','||s.serial# sid1,s.program,s.osuser,s.username,s.machine,logon_time
--,s.schemaname
--select 'alter system kill session '''||s.sid||','||s.serial#||'''immediate;'
-- ,p.spid
from gv$session s
--, gv$process p
--select distinct(program) from v$session
--where lower(program) like '%iohand%' or lower(program) like '%ware%'
--where lower(program) like '%ussd-app%'
--where lower(program) like '%httpd%'
--where lower(terminal) like 'mt%'
--where lower(osuser) = ''
--where upper(username) like '%%' or upper(username) like '%%'
--where upper(username) like '%%'
--where upper(username) like '%%'
--where upper(username) not in ('SYS')
--where upper(username) like '%%'
 where upper(username) like '%DEVELOP%'
--where lower(machine) like '%001'
--and sid = 211 or sid = 191
--and s.status = 'INACTIVE'
--where s.status != 'KILLED'
--where s.status = 'INACTIVE' and s.schemaname = ''
--or machine like '%'
--order by osuser,username,machine
--order by status desc ,program desc, 3,4
order by 7 desc,2;
--order by logon_time desc;
--/
