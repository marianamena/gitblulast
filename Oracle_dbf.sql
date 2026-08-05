#dbf.sql

set lin 100
col file_name for a65
select a.autoextensible,b.bigfile,a.file_name,bytes/1024/1024 from dba_data_files a,dba_tablespaces b
where a.tablespace_name=b.tablespace_name and b.tablespace_name like '&Tablespace_Name';
