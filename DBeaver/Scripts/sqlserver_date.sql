--SELECT COUNT(*) FROM dbo.sfc_ods_sap_ztmm
--  WHERE CREATE_DATE != '00000000' AND CAST(CREATE_DATE AS date) < CAST('20230624' AS date)

--SELECT * FROM dbo.sfc_ods_sap_ztmm
--  WHERE CAST(CREATE_DATE AS date)<CONVERT(varchar(100), GETDATE()-25, 112)
  
SELECT COUNT(*) FROM dbo.sfc_ods_sap_ztmm
  WHERE "CREATE_DATE" != '00000000' AND CAST(CREATE_DATE AS date)<CONVERT(varchar(100), GETDATE()-25, 112)

--SELECT COUNT(*) FROM "dbo"."sfc_ods_sap_ztmm"
--  WHERE ("CREATE_DATE" IS NOT NULL) AND ("CREATE_DATE" != '00000000') AND (CAST("CREATE_DATE" AS date) < '2023-06-24')

--SELECT CAST("CREATE_DATE" AS date) FROM "dbo"."sfc_ods_sap_ztmm"