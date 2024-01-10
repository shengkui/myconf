--SELECT * FROM dbo.emp_info WHERE "LOCAL_NAME" = N'林文斌'

--SELECT * FROM dbo.emp_info WHERE "DEP2" = N'AOnline AE'
--SELECT * FROM dbo.emp_info WHERE "TIMECLASSCODE"  = N'ACL01'

--SELECT * FROM dbo.emp_info WHERE "LOCAL_NAME" LIKE N'%文'
--SELECT * FROM dbo.emp_info WHERE "LOCAL_NAME" LIKE N'林%'
--SELECT * FROM dbo.emp_info WHERE "LOCAL_NAME" LIKE N'%林文斌%'

SELECT * FROM dbo.emp_info WHERE "LOCAL_NAME" LIKE N'林%斌'