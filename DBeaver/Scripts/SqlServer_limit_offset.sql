--SELECT * FROM it_data ORDER BY idx OFFSET 8 ROWS FETCH NEXT 20 ROWS ONLY
SELECT Date,idx FROM it_data ORDER BY (SELECT 1) OFFSET 8 ROWS FETCH NEXT 20 ROWS ONLY

SELECT top (20) idx,Date,value,"部门",CostElement,CountryRegion,BussinessArea,ITSubArea,Scenario FROM (
    SELECT *, ROW_NUMBER() OVER (ORDER BY idx) AS r_n_n_9527 FROM it_data
) tab WHERE r_n_n_9527 > 8 ORDER BY idx

--SELECT top (20) idx,Date,value,"部门",CostElement,CountryRegion,BussinessArea,ITSubArea,Scenario FROM (
--    SELECT *, ROW_NUMBER() OVER (ORDER BY (select 1)) AS row_number FROM it_data
--) tab WHERE row_number > 8 ORDER BY (select 1)

--WITH Results_CTE AS (SELECT *, ROW_NUMBER() OVER (ORDER BY idx) AS row_number FROM it_data)
--  SELECT idx,Date,value,"部门",CostElement,CountryRegion,BussinessArea,ITSubArea,Scenario FROM Results_CTE 
--    WHERE row_number > 8 AND row_number <= 8+20
