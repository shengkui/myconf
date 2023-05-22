--SELECT tab.* FROM (select * from it_data order by idx) tab WHERE rownum <= 20;
--SELECT * FROM (select * from it_data order by idx) WHERE rownum <= 20
--SELECT * FROM it_data ORDER BY idx FETCH NEXT 20 ROWS ONLY

--without Order by
SELECT * FROM it_data FETCH NEXT 20 ROWS ONLY

--SELECT tab.* FROM (select * from TEST1000W) tab WHERE rownum <= 20;
--SELECT * FROM TEST1000W OFFSET 10 ROWS FETCH NEXT 20 ROWS ONLY