--SELECT idx,"Date","VALUE","部门","COSTELEMENT","COUNTRYREGION","BUSSINESSAREA" FROM 
--  (select tab.*, rownum rn from (select * from it_data order by idx) tab) WHERE rn > 8
--SELECT * FROM it_data ORDER BY idx OFFSET 8 ROWS


--without Order by
--SELECT * FROM it_data ORDER BY 1 OFFSET 8 ROWS

SELECT "EN_LABEL","EN_DESCRIPTION","ITEM_ID" FROM "CINDY"."TEST1000W" ORDER BY 1 FETCH NEXT 100 ROWS ONLY