
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

--使用 ORG app_name 名，查询某个 ResourceGroup 的 UDF
SELECT udf.udf_name, udf.code, udf.kind,udf.type, udf.org_id FROM dis.udf udf
  INNER JOIN dis.org org ON org.org_id = udf.org_id
  WHERE org.app_name = 'wpjonaqompvq';

--Username -> AppName
SELECT org.app_name FROM dis.user_info ui
  INNER JOIN dis.org org ON org.org_id = ui.current_org_id
  WHERE ui.user_name = 'shengkui.leng@advantech.com.cn';


SELECT udf.udf_name, udf.code, udf.org_id FROM dis.udf udf
  INNER JOIN dis.org org ON org.org_id = udf.org_id
  WHERE org.app_name =
    (SELECT org.app_name FROM dis.user_info ui
       INNER JOIN dis.org org ON org.org_id = ui.current_org_id
       WHERE ui.user_name = 'shengkui.leng@advantech.com.cn');

SELECT udf.udf_name, udf.code, udf.org_id
FROM dis.user_info ui
JOIN dis.org o1 ON ui.current_org_id = o1.org_id -- 利用 user_name 获取 current_org_id 并找到对应的 org 表记录
JOIN dis.org o2 ON o1.app_name = o2.app_name     -- 找到所有拥有相同 app_name 的 org 记录
JOIN dis.udf ON o2.org_id = udf.org_id           -- 查询这些 org 对应的 udf 记录
WHERE ui.user_name = 'shengkui.leng@advantech.com.cn';
