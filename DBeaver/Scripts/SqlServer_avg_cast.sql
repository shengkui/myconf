SELECT TOP 20 "部门",avg(CAST(value AS bigint)) FROM dbo.it_data GROUP BY "部门" ORDER BY "部门"