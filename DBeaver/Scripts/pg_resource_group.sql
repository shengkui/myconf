SELECT sum(driver_memory_g) driver_memory, sum(executor_cpu*executor_num) AS executor_cores,
	sum(executor_memory_g*executor_num) as executor_memory
	from dis.resource_group;

SELECT DISTINCT g.group_name, g.driver_memory_g, g.executor_cpu, g.executor_num, g.executor_memory_g 
    FROM dis.resource_group g
    JOIN dis.org o
    ON o.app_name = g.group_id
   
--Get summary of resource usage info.
WITH used_res_grp AS (
    SELECT DISTINCT g.group_name, g.driver_memory_g, g.executor_cpu, g.executor_num, g.executor_memory_g 
    FROM dis.resource_group g
    JOIN dis.org o ON o.app_name = g.group_id)
SELECT sum(driver_memory_g) as driver_memory_sum,
    sum(executor_cpu*executor_num) as executor_memory_sum,
	sum(executor_memory_g*executor_num) as executor_cores_sum
	FROM used_res_grp;


--Get detail info of resource usage for all orgs.
SELECT DISTINCT o.org_name, g.group_name, g.driver_memory_g, g.executor_cpu, g.executor_num, g.executor_memory_g 
    FROM dis.resource_group g
	JOIN dis.org o ON o.app_name = g.group_id

WITH org_resource as(
    SELECT DISTINCT o.org_name, g.group_name, g.driver_memory_g, g.executor_cpu, g.executor_num, g.executor_memory_g 
    FROM dis.resource_group g
	JOIN dis.org o ON o.app_name = g.group_id)
SELECT org_name, driver_memory_g as driver_memory, 
	  executor_memory_g*executor_num as executor_memory,
	  executor_cpu*executor_num as executor_cores
    FROM org_resource
    order by executor_memory desc;

-- Get all resource groups have been assigned to at lease one org.
SELECT DISTINCT g.* FROM dis.resource_group g
    JOIN dis.org o ON o.app_name = g.group_id;

SELECT DISTINCT "group_id" FROM dis.resource_group r
    INNER JOIN dis.org o ON o.app_name = r.group_id;
