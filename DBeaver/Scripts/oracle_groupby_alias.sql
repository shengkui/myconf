--error: ORA-00904: "D1": invalid identifier
SELECT CAST("D_DATE" as DATE, 'YYYY-MM-DD') AS d1, COUNT(*) AS cnt FROM "LENG"."MACHINE_OEE_INFO"
  WHERE ("MACHINE_NUMBER" IS NOT NULL) AND (NOT ("MACHINE_NUMBER" = 0E-10))
  GROUP BY d1
  ORDER BY cnt DESC NULLS LAST FETCH NEXT 1 ROWS ONLY;

--error: ORA-01861: literal does not match format string
SELECT CAST("D_DATE" as DATE) AS d1, COUNT(*) AS cnt FROM "LENG"."MACHINE_OEE_INFO"
  WHERE ("MACHINE_NUMBER" IS NOT NULL) AND (NOT ("MACHINE_NUMBER" = 0E-10))
  GROUP BY CAST("D_DATE" as DATE)
  ORDER BY cnt DESC NULLS LAST FETCH NEXT 1 ROWS ONLY;

--OK
SELECT CAST("D_DATE" as DATE, 'YYYY-MM-DD') AS d1, COUNT(*) AS cnt FROM "LENG"."MACHINE_OEE_INFO"
  WHERE ("MACHINE_NUMBER" IS NOT NULL) AND (NOT ("MACHINE_NUMBER" = 0E-10))
  GROUP BY CAST("D_DATE" as DATE, 'YYYY-MM-DD')
  ORDER BY cnt DESC NULLS LAST FETCH NEXT 1 ROWS ONLY;

--OK
SELECT CAST("D_DATE" as DATE, 'YYYY-MM-DD') AS d1, COUNT(*) AS cnt FROM "LENG"."MACHINE_OEE_INFO"
  WHERE ("MACHINE_NUMBER" IS NOT NULL) AND (NOT ("MACHINE_NUMBER" = 0E-10))
  GROUP BY D_DATE
  ORDER BY cnt DESC NULLS LAST FETCH NEXT 1 ROWS ONLY;

--OK
SELECT D_DATE, COUNT(*) AS cnt FROM "LENG"."MACHINE_OEE_INFO"
  WHERE ("MACHINE_NUMBER" IS NOT NULL) AND (NOT ("MACHINE_NUMBER" = 0E-10))
  GROUP BY D_DATE
  ORDER BY cnt DESC NULLS LAST FETCH NEXT 1 ROWS ONLY;

--OK
SELECT to_date("D_DATE", 'YYYY-MM-DD') AS d1 FROM "LENG"."MACHINE_OEE_INFO";
SELECT CAST("D_DATE" AS DATE, 'YYYY-MM-DD') AS d1 FROM "LENG"."MACHINE_OEE_INFO";

SELECT to_date("D_DATE", 'yyyy-MM-dd') AS d1 FROM "LENG"."MACHINE_OEE_INFO";
SELECT CAST("D_DATE" AS DATE, 'yyyy-MM-dd') AS d2 FROM "LENG"."MACHINE_OEE_INFO";



SELECT CAST(D_DATE AS DATE, 'yyyy-MM-dd'),COUNT(*) 
  FROM "LENG"."MACHINE_OEE_INFO" WHERE 1=0 
  GROUP BY CAST(D_DATE AS DATE, 'yyyy-MM-dd')
