--NEED Boolean expression in WHERE clause !

--SELECT "name","onboard","salary","days","dept" FROM "dbo"."employee"
--  WHERE ((("salary" < 40000) = 1) OR (("salary" < 40000) IS NULL AND 1 IS NULL))
SELECT "name","onboard","salary","days","dept" FROM "dbo"."employee"
  WHERE (("salary" < 40000) OR ("salary" IS NULL AND 1 IS NULL))

SELECT "name","onboard","salary","days","dept" FROM "dbo"."employee"
  WHERE (CASE WHEN "salary" < 40000 THEN 0
              WHEN ("salary" >= 40000) AND ("salary" < 80000) THEN 1
              ELSE 2
              END) = 1

SELECT "name","onboard","salary","days","dept" FROM "dbo"."employee"
  WHERE ("days" >= 5)

SELECT "name","onboard","salary","days","dept" FROM "dbo"."employee"
  WHERE NOT ("days" >= 5)