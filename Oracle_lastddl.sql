lastddl.sql
set linesize 200
set pagesize 600
col owner for a20
col object_type  form a25
col object_name form a40
col created_date for a27
col "Last DDL Date" form a27
col status form a15
select owner, object_type, object_name, created as
created_date, last_ddl_time as "Last DDL Date",Status
from dba_objects where last_ddl_time > trunc(sysdate -1)
and owner != 'SYS'
order by 4
/
