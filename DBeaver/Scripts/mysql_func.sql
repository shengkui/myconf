SELECT DATEDIFF('2009-07-31', '2009-07-8');

SELECT SHA1('abc');
SELECT SHA2('abc', 224);
SELECT CRC32('MySQL');
SELECT MD5('testing');

SELECT BIT_LENGTH('text');
SELECT CHAR_LENGTH('text');

SELECT CONCAT('My', 'S', 'QL');
SELECT CONCAT('My', NULL, 'QL');


SELECT TRIM('  1234  ');
SELECT LTRIM('  1234  ');
SELECT RTRIM('  1234  ');
SELECT TRIM(' 12' FROM '  1234  ');

SELECT floor(3.1411);
-- SELECT floor(3.1411, 3);

SELECT ASIN(0.2);
SELECT SIGN(-1);

-- SELECT `Date`,`value`,`department`,`Scenario ID` FROM `it_spend_detail`
--  WHERE (`Scenario ID` IS NOT NULL) AND (LOG10(CAST(`Scenario ID` AS DOUBLE) = 0.6020599913279624) ORDER BY `Date` ASC LIMIT 10;

SELECT `Date`,`value`,`department`,`Scenario ID` FROM `it_spend_detail`
  WHERE (`Scenario ID` IS NOT NULL) AND (LOG10(`Scenario ID`) = 0.6020599913279624) ORDER BY `Date` ASC LIMIT 10;
SELECT `Date`,`value`,`department`,`Scenario ID` FROM `it_spend_detail`
  WHERE (`Scenario ID` IS NOT NULL) AND (LOG10(CAST(`Scenario ID` AS decimal(53,9))) = 0.6020599913279624) ORDER BY `Date` ASC LIMIT 10;

SELECT `Date`,`value`,`department`,CAST(`Scenario ID` AS decimal(53,9)) FROM `it_spend_detail` LIMIT 10;
