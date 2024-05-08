SELECT * from productionorder WHERE SUBSTR("LastModified", 1, 7) = '2022-06'; 
SELECT * from productionorder WHERE UPPER("Name") = 'Y20-5752217002-001';
SELECT * from productionorder WHERE LOWER("Name") = 'y20-5752217002-001';
SELECT COALESCE("BatchNumber", 0, "BatchNumber") from productionorder;
--SELECT CONCAT("Name", 'a', 'b') FROM productionorder;
--SELECT CONCAT("Name", 'a', NULL, 'b') FROM productionorder;

SELECT * FROM it_spend_detail WHERE SQRT("Scenario ID") = SQRT(5) ORDER BY "Date"; 
SELECT * FROM it_spend_detail WHERE ROUND("Scenario ID"/1.2) = 2 ORDER BY "Date";
SELECT * FROM it_spend_detail WHERE CEIL("Scenario ID"/1.2) = 3 ORDER BY "Date";
SELECT * FROM it_spend_detail WHERE SIN("Scenario ID"/1.2) > 0.5 ORDER BY "Date";
--SELECT * FROM it_spend_detail WHERE LOG10("Scenario ID") = LOG10(1) ORDER BY "Date";
SELECT LOG(10,4) "Temp" FROM it_spend_detail;
SELECT LN(10) "Temp" FROM it_spend_detail;
SELECT ROUND(4.6, 1) "Temp2" FROM it_spend_detail;

SELECT * FROM it_spend_detail WHERE POWER("Scenario ID", 3) = 27 ORDER BY "Date";

SELECT * FROM it_spend_detail WHERE LN("Scenario ID")=LN(10) ORDER BY "Date";

SELECT TRIM('  1234  ') "Temp" FROM it_spend_detail;
SELECT LTRIM('  1234  ') "Temp" FROM it_spend_detail;
SELECT RTRIM('  1234  ') "Temp" FROM it_spend_detail;
SELECT TRIM(' ' FROM '  1234  ') "Temp" FROM it_spend_detail;
--SELECT TRIM(' 12' FROM '  1234  ') "Temp" FROM it_spend_detail;

SELECT LOG(10,4) "Temp" FROM it_spend_detail;
SELECT * FROM it_spend_detail WHERE LOG(10, "Scenario ID") = LOG(10,4) AND rownum <= 10 ORDER BY "Date";
SELECT * FROM it_spend_detail WHERE ABS(LOG(10, "Scenario ID") - 0.6020599913) < 0.01 AND rownum <= 10 ORDER BY "Date";

