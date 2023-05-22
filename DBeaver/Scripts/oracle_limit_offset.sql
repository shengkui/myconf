--SELECT "IDX","Date","VALUE","部门","COSTELEMENT","COUNTRYREGION","BUSSINESSAREA","ITSUBAREA","SCENARIO" 
--    FROM (select tab.*, rownum rn from (select * from it_data order by idx) tab) WHERE rn>8 AND rn<=28
SELECT * FROM it_data ORDER BY idx OFFSET 8 ROWS FETCH NEXT 20 ROWS ONLY

--without Order by
--SELECT * FROM it_data ORDER BY 1 OFFSET 0 ROWS FETCH NEXT 20 ROWS ONLY