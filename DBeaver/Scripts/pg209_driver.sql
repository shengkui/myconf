-- 查询所有 driver
SELECT driver_id, file_name, org_id, created_by FROM dis.driver;

--使用用户名，查询该用户所属 ORG 的 driver
SELECT driver.driver_id, driver.file_name FROM dis.driver driver
  INNER JOIN dis.user_info ui ON driver.org_id = ui.current_org_id
  WHERE ui.user_name = 'shengkui.leng@advantech.com.cn';

SELECT driver.driver_id, driver.file_name FROM dis.driver driver
  INNER JOIN dis.user_info ui ON driver.org_id = ui.current_org_id
  WHERE ui.user_name = 'user1';

--使用 ORG app_name 名，查询某个 ORG 的 driver
SELECT driver.driver_id, driver.file_name FROM dis.driver driver
  INNER JOIN dis.org org ON org.org_id = driver.org_id
  WHERE org.app_name = 'main';

SELECT driver.driver_id, driver.file_name FROM dis.driver driver
  INNER JOIN dis.org org ON org.org_id = driver.org_id
  WHERE org.app_name = 'group1';

--使用用户名，查询和该用户所在 org 属于同一个 resource group 的所有 org 的 driver
SELECT driver.driver_id, driver.file_name
  FROM dis.user_info ui
  JOIN dis.org o1 ON ui.current_org_id = o1.org_id
  JOIN dis.org o2 ON o1.app_name = o2.app_name
  JOIN dis.driver ON o2.org_id = driver.org_id
  WHERE ui.user_name = 'user1';

--查找 driver 表中 org_id 为空的记录，使用它的 created_by 字段查找 user_info 表，找到匹配记录的 current_org_id
SELECT d.driver_id, d.created_by, u.current_org_id, d.org_id 
  FROM dis.driver d
  JOIN dis.user_info u ON d.created_by = u.user_name
  WHERE d.org_id IS NULL;

--查找 driver 表中 org_id 为空的记录，使用它的 created_by 字段查找 user_info 表（与 user_name 字段比较）。
--使用匹配记录的 current_org_id 更新 driver.org_id
UPDATE dis.driver
  SET org_id = user_info.current_org_id
  FROM dis.user_info
  WHERE driver.org_id IS NULL
    AND driver.created_by = user_info.user_name;
