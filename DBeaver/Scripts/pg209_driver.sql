-- 查询所有 driver
SELECT driver_id, file_name, org_id FROM dis.driver;

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