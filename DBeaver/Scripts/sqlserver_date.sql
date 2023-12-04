--SELECT COUNT(*) FROM dbo.sfc_ods_sap_ztmm
--  WHERE CREATE_DATE != '00000000' AND CAST(CREATE_DATE AS date) < CAST('20230624' AS date)

--SELECT * FROM dbo.sfc_ods_sap_ztmm
--  WHERE CAST(CREATE_DATE AS date)<CONVERT(varchar(100), GETDATE()-25, 112)
  
SELECT COUNT(*) FROM dbo.sfc_ods_sap_ztmm
  WHERE "CREATE_DATE" != '00000000' AND CAST(CREATE_DATE AS date)<CONVERT(varchar(100), GETDATE()-25, 112)

--SELECT COUNT(*) FROM "dbo"."sfc_ods_sap_ztmm"
--  WHERE ("CREATE_DATE" IS NOT NULL) AND ("CREATE_DATE" != '00000000') AND (CAST("CREATE_DATE" AS date) < '2023-06-24')

--SELECT CAST("CREATE_DATE" AS date) FROM "dbo"."sfc_ods_sap_ztmm"
  
---------------------------------------------------------------  
--不支持 EXTRACT
--SELECT EXTRACT(MONTH FROM '2023-11-30')

--支持 DATEPART
SELECT * FROM "dbo"."it_data"
  WHERE ("Date" IS NOT NULL) 
  AND (DATEPART(MONTH, "Date") = 11)
  AND (DATEPART(YEAR, "Date") = 2023)

SELECT * FROM "dbo"."it_data"
  WHERE ("Date" IS NOT NULL)
  AND (DATEPART(MONTH, "Date") = DATEPART(MONTH,GETDATE()))
  AND (DATEPART(YEAR, "Date") =  DATEPART(YEAR,GETDATE()))
