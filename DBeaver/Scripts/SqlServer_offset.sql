--SELECT * FROM it_data ORDER BY idx OFFSET 8 ROWS

SELECT idx, Date, value, "部门", CostElement, CountryRegion FROM (
    SELECT *, ROW_NUMBER() OVER (ORDER BY idx) AS row_number FROM it_data
) tab WHERE row_number > 8 ORDER BY idx