--SELECT * FROM (select * from it_data order by idx) WHERE rownum <= 20

--SELECT "IDX","Date","VALUE","部门","COSTELEMENT","COUNTRYREGION","BUSSINESSAREA", "ITSUBAREA","SCENARIO" 
--    FROM (select tab.*, rownum rn from (select * from it_data order by idx) tab)
--    WHERE rn > 8;

SELECT "IDX", "Date", "VALUE", "部门", "COSTELEMENT", "COUNTRYREGION", "BUSSINESSAREA", "ITSUBAREA", "SCENARIO" 
    FROM (select tab.*, rownum rn from (select * from it_data order by idx) tab)
    WHERE rn > 8 AND rn <= 28;
