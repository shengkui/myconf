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

--查询用户的当前 org 的 org_id
SELECT org.org_id FROM dis.user_info ui
  INNER JOIN dis.org org ON org.org_id = ui.current_org_id
  WHERE ui.user_name = 'shengkui.leng@advantech.com.cn';
