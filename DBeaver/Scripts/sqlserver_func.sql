SELECT * from productionorder WHERE SUBSTRING(LastModified, 1, 7) = '2022-06'; 

SELECT * from productionorder WHERE UPPER("name") = 'Y20-5752217002-001';
SELECT * from productionorder WHERE LOWER("name") = 'y20-5752217002-001';

SELECT COALESCE(batchnumber, 0, batchnumber) from productionorder;

SELECT CONCAT(name, 'a', 'b') FROM productionorder;
SELECT CONCAT(name, 'a', NULL, 'b') FROM productionorder;
SELECT CONCAT('name', 'a', NULL, 'b');

SELECT * FROM it_spend_detail WHERE SQRT("Scenario ID") = SQRT(5) ORDER BY "Date"; 
SELECT * FROM it_spend_detail WHERE ROUND("Scenario ID"/1.2, 0) = 2 ORDER BY "Date";
SELECT * FROM it_spend_detail WHERE CEILING("Scenario ID"/1.2) = 3 ORDER BY "Date";

SELECT * FROM it_spend_detail WHERE LOG10("Scenario ID") = LOG10(1) ORDER BY "Date";

--SELECT LOG(10,4);
SELECT LOG(4,10);
SELECT LOG(4);

select ATN2(1,1);

--SQL Server 没有double 类型
--SELECT TOP 10 * FROM it_spend_detail WHERE ("Scenario ID" IS NOT NULL)
--  AND (LOG10(CAST("Scenario ID" AS double)) = 1.0) ORDER BY "Date" ASC;
SELECT TOP 10 * FROM it_spend_detail WHERE ("Scenario ID" IS NOT NULL)
  AND (LOG10(CAST("Scenario ID" AS float)) = LOG10(1.0)) ORDER BY "Date" ASC;
SELECT TOP 10 * FROM it_spend_detail WHERE ("Scenario ID" IS NOT NULL)
  AND (LOG10(CAST("Scenario ID" AS float(53))) = LOG10(1.0)) ORDER BY "Date" ASC;
SELECT TOP 10 * FROM it_spend_detail WHERE ("Scenario ID" IS NOT NULL)
  AND (LOG10("Scenario ID") = LOG10(1.0)) ORDER BY "Date" ASC;

SELECT * FROM it_spend_detail WHERE SIN("Scenario ID"/1.2) > 0.5 ORDER BY "Date";
SELECT TOP 10 * FROM it_spend_detail WHERE ("Scenario ID" IS NOT NULL)
  AND (COT(CAST("Scenario ID" AS float(53))) = COT(4)) ORDER BY "Date" ASC;  

SELECT TRIM('  1234  ');
SELECT LTRIM('  1234  ');
SELECT RTRIM('  1234  ');
SELECT TRIM(' 12' FROM '  1234  ');
-- SELECT TRIM(BOTH ' 12' FROM '  1234  ');

SELECT dateadd(day, 10, '2016-07-30');
SELECT datediff(day, '2016-07-30', '2016-09-01');

SELECT DATALENGTH(N'TEST1');
SELECT LEN(N'TEST1');
SELECT DATALENGTH(N'TEST1  ');
SELECT LEN(N'TEST1  ');   -- Ignore ending whitespaces
SELECT DATALENGTH(N'测试字符');
SELECT LEN(N'测试字符');
SELECT DATALENGTH(N'测试chinese字符');
SELECT LEN(N'测试chinese字符');
