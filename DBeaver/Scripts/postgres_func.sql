SELECT * from public.productionorder where SUBSTRING(LastModified, 1, 7) = '2022-06' ORDER BY LastModified; 
SELECT * from public.productionorder where SUBSTR(LastModified, 1, 7) = '2022-06' ORDER BY LastModified; ; 
SELECT substring('Spark SQL' FROM 5 FOR 3);
 
SELECT * from productionorder where UPPER("name") = 'Y20-5752217002-001';
SELECT * from productionorder where LOWER("name") = 'y20-5752217002-001';

select COALESCE(batchnumber, 0, batchnumber)  from productionorder;

SELECT CONCAT(name, 'a', 'b') FROM productionorder limit 5;
SELECT CONCAT('name', 'a', NULL, 'b');

SELECT * FROM it_spend_detail WHERE (SQRT("Scenario ID") = 2.23606797749979) ORDER BY "Date" LIMIT 10
SELECT * FROM it_spend_detail WHERE ROUND("Scenario ID"/1.2) = 2 ORDER BY "Date" LIMIT 10;
SELECT * FROM it_spend_detail WHERE CEIL("Scenario ID"/1.2) = 3 ORDER BY "Date" LIMIT 10;

SELECT * FROM it_spend_detail WHERE SIN("Scenario ID"/1.2) > 0.5 ORDER BY "Date" LIMIT 10;

SELECT TRIM('  1234  ');
SELECT LTRIM('  1234  ');
SELECT RTRIM('  1234  ');
SELECT TRIM(' 12' FROM '  1234  ');
SELECT TRIM(LEADING  ' 12' FROM '  1234  '); 

SELECT * FROM "it_spend_detail" WHERE ("Scenario ID" IS NOT NULL) AND (LOG10(CAST("Scenario ID" AS DOUBLE PRECISION)) = 0.6020599913279624)   ORDER BY "Date" ASC  LIMIT 10

SELECT CHAR_LENGTH('TEST1');
SELECT CHAR_LENGTH('TEST1  ');
SELECT CHAR_LENGTH('测试字符');
SELECT BIT_LENGTH('TEST1');
SELECT BIT_LENGTH('测试字符');

SELECT overlay('Spark SQL' PLACING 'CORE' FROM 7);
SELECT overlay('Spark SQL' PLACING 'ANSI ' FROM 7 FOR 0);

SELECT LOG(10,4);
--SELECT LOG(4); --= LOG(10,4)
SELECT LN(10);

select ATANH(0);
select ATAN2(1,1);