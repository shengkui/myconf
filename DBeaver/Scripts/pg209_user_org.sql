SELECT ui.user_id, ui.user_name, uo.org_id, org.org_name FROM dis.user_info ui
  INNER JOIN dis.user_org uo ON uo.user_id = ui.user_id
  INNER JOIN dis.org org ON org.org_id = uo.org_id
  WHERE ui.user_name = 'shengkui.leng@advantech.com.cn';

--查询用户所属的 org
SELECT org.org_name FROM dis.user_info ui
  INNER JOIN dis.user_org uo ON uo.user_id = ui.user_id
  INNER JOIN dis.org org ON org.org_id = uo.org_id
  WHERE ui.user_name = 'shengkui.leng@advantech.com.cn';

--查询用户的当前 org
SELECT org.org_name FROM dis.user_info ui
  INNER JOIN dis.org org ON org.org_id = ui.current_org_id
  WHERE ui.user_name = 'shengkui.leng@advantech.com.cn';

--查询 main org
SELECT org_name FROM dis.org org WHERE org.main = TRUE;

--查询用户当前 org 的 org_name 和 app_name
SELECT org.org_name, org.app_name FROM dis.user_info ui 
  INNER JOIN dis.org org ON org.org_id = ui.current_org_id
  WHERE ui.user_name = 'shengkui.leng@advantech.com.cn';

--查询属于某个 org 的 UDF
SELECT org.org_name, org.app_name, udf.udf_name, udf.name udf_alias, udf.code, udf.kind,
  udf.type FROM dis.udf udf
INNER JOIN dis.org org ON org.org_id = udf.org_id;
  WHERE org.app_name = 'main'

--查询用户的当前 org 的 org_id
SELECT org.org_id FROM dis.user_info ui
  INNER JOIN dis.org org ON org.org_id = ui.current_org_id
  WHERE ui.user_name = 'shengkui.leng@advantech.com.cn';

SELECT udf.udf_name, udf.code, udf.kind,udf.type FROM dis.udf udf
  INNER JOIN dis.org org ON org.org_id = udf.org_id
  WHERE org.org_id = 'C3aJrkMZzd82';

SELECT udf.udf_name, udf.code, udf.kind, udf.type FROM dis.udf udf
  INNER JOIN dis.org org ON org.org_id = udf.org_id
  WHERE org.org_id = (SELECT org.org_id FROM dis.user_info ui
      INNER JOIN dis.org org ON org.org_id = ui.current_org_id
      WHERE ui.user_name = 'shengkui.leng@advantech.com.cn');

SELECT udf.udf_name, udf.code, udf.kind, udf.type FROM dis.udf udf  
  INNER JOIN dis.org org ON org.org_id = udf.org_id  
  INNER JOIN dis.user_info ui ON ui.current_org_id = org.org_id  
  WHERE ui.user_name = 'shengkui.leng@advantech.com.cn';

SELECT udf.udf_name, udf.code, udf.kind, udf.type FROM dis.udf udf
  INNER JOIN dis.org org ON org.org_id = udf.org_id
  INNER JOIN dis.user_info ui ON org.org_id = ui.current_org_id
  WHERE ui.user_name = 'shengkui.leng@advantech.com.cn';


-----------------------------------------------------------------------
--使用用户名，查询某个用户所属 ORG 的 UDF
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
