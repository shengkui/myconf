
-----------------------------------------------------------------------
--查询属于某个 org 的 UDF
SELECT udf.udf_name, udf.code, udf.kind, udf.type, udf.org_id FROM dis.udf udf
  INNER JOIN dis.org org ON org.org_id = udf.org_id
  WHERE org.org_id = 'C3aJrkMZzd82';

SELECT udf.udf_name, udf.code, udf.kind, udf.type FROM dis.udf udf
  INNER JOIN dis.org org ON org.org_id = udf.org_id
  WHERE org.org_id = (SELECT org.org_id FROM dis.user_info ui
      INNER JOIN dis.org org ON org.org_id = ui.current_org_id
      WHERE ui.user_name = 'shengkui.leng@advantech.com.cn');

SELECT udf.udf_name, udf.code, udf.kind, udf.type FROM dis.udf udf
  INNER JOIN dis.org org ON org.org_id = udf.org_id
  INNER JOIN dis.user_info ui ON org.org_id = ui.current_org_id
  WHERE ui.user_name = 'shengkui.leng@advantech.com.cn';

-----------------------------------------------------------------------
--使用用户名，查询该用户所属 ORG 的 UDF
SELECT udf.udf_name, udf.code, udf.kind, udf.type, udf.org_id FROM dis.udf udf
  INNER JOIN dis.user_info ui ON udf.org_id = ui.current_org_id
  WHERE ui.user_name = 'shengkui.leng@advantech.com.cn';

SELECT udf.udf_name, udf.code, udf.kind, udf.type, udf.org_id FROM dis.udf udf
  INNER JOIN dis.user_info ui ON udf.org_id = ui.current_org_id
  WHERE ui.user_name = 'user1';

--使用 ORG app_name 名，查询某个 ORG 的 UDF
SELECT udf.udf_name, udf.code, udf.kind,udf.type, udf.org_id FROM dis.udf udf
  INNER JOIN dis.org org ON org.org_id = udf.org_id
  WHERE org.app_name = 'main';

SELECT udf.udf_name, udf.code, udf.kind,udf.type, udf.org_id FROM dis.udf udf
  INNER JOIN dis.org org ON org.org_id = udf.org_id
  WHERE org.app_name = 'group1';
