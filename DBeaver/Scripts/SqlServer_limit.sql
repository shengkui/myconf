--SELECT TOP 20 * FROM it_data ORDER BY idx
SELECT * FROM it_data ORDER BY idx OFFSET 0 ROWS FETCH NEXT 20 ROWS ONLY
