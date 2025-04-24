SELECT ui.user_id, ui.user_name, uo.org_id, org.org_name FROM dis.user_info ui
  INNER JOIN dis.user_org uo ON uo.user_id = ui.user_id
  INNER JOIN dis.org org ON org.org_id = uo.org_id
  WHERE ui.user_name = 'shengkui.leng@advantech.com.cn';

--查询用户所属的 org
SELECT org.org_name FROM dis.user_info ui
  INNER JOIN dis.user_org uo ON uo.user_id = ui.user_id
  INNER JOIN dis.org org ON org.org_id = uo.org_id
  WHERE ui.user_name = 'shengkui.leng@advantech.com.cn';

SELECT org.org_name, org.app_name FROM dis.user_info ui
  INNER JOIN dis.user_org uo ON uo.user_id = ui.user_id
  INNER JOIN dis.org org ON org.org_id = uo.org_id
  WHERE ui.user_name = 'shengkui.leng@advantech.com.cn';

SELECT org.org_name, org.app_name FROM dis.user_info ui 
      INNER JOIN dis.org org ON org.org_id = ui.current_org_id 
      WHERE ui.user_name = 'shengkui.leng@advantech.com.cn';

--查询 main org
SELECT org_name FROM dis.org org WHERE org.main = TRUE;

--查询用户当前 org 的 org_name 和 app_name
SELECT org.org_name, org.app_name FROM dis.user_info ui 
  INNER JOIN dis.org org ON org.org_id = ui.current_org_id
  WHERE ui.user_name = 'shengkui.leng@advantech.com.cn';

--查询用户的当前 org 的 org_name
SELECT org.org_name FROM dis.user_info ui
  INNER JOIN dis.org org ON org.org_id = ui.current_org_id
  WHERE ui.user_name = 'shengkui.leng@advantech.com.cn';

--查询用户的当前 org 的 org_id
SELECT org.org_id, org.app_name FROM dis.user_info ui
  INNER JOIN dis.org org ON org.org_id = ui.current_org_id
  WHERE ui.user_name = 'shengkui.leng@advantech.com.cn';

--通过org id查询它的 database_name
select database_name from dis.org org where org.org_id = 'C3aJrkMZzd82';

SELECT * FROM dis.org WHERE app_name = 'p8wppvz89bw6' and org_id != 'NYaX28O75PlK';
