temp.sql
-- #####################################################################
-- Author       : Mark D Powell (http://www.jlcomp.demon.co.uk/faq)
-- Create Date  : 17 August 2001
-- Purpose      : Sort usage by user with join to v$session
-- Usage        : @temp
--
--              Changes
-- Name         Date            Change Description
-- philipv      12Nov02         reformatted and added total extent use
--                              SQL
-- philipv      9Feb03          added temp extent usage query
--                              replaced previous temp per user query
--
-- #####################################################################

set pages 50
--column tablespace format a12
--column username format a14
column MB format 9,999,999,999.9
--comp sum of MB on username
--break on username nodup skip 1

--select se.username ,se.sid ,su.extents ,
-- su.blocks * to_number(rtrim(p.value)) /1024/1024 "MB" ,tablespace
-- from v$sort_usage su ,v$parameter p ,v$session se
-- where p.name = 'db_block_size'
-- and su.session_addr = se.saddr
-- order by MB
--/

SELECT s.username, u.tablespace, u.contents, u.extents, u.blocks
 FROM v$session s, v$sort_usage u
 WHERE s.saddr=u.session_addr
 ORDER BY s.username
-- ORDER BY u.extents, u.blocks
/

prompt extent_size  : size of one extent, in number of Oracle blocks
prompt total_extents: total number of extents in the segment (free or in use)
prompt used_extents : total number of extents currently in use
prompt free_extents : total number of extents currently marked as free
prompt max_used_size: maximum number of extents ever needed by an operation (like a sort)

SELECT tablespace_name, extent_size, total_extents, used_extents,free_extents, max_used_size
 FROM v$sort_segment
/

set pages 100
