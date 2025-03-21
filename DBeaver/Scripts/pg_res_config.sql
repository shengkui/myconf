SELECT org_name, res_config->'spark_driver_memory' AS driver_memory,
       res_config->'total_executor_memory' AS executor_memory,
       res_config->'total_executor_cores' as executor_cores
FROM dis.org order by executor_memory;


SELECT org_name,res_config->'total_executor_memory' as executor_total_mem,
           res_config->'total_executor_cores' as executor_total_cores FROM dis.org

--获得内存和 CPU的总数
WITH resource_summary as (
	    SELECT res_config->'spark_driver_memory' as driver_total_memory,
	        res_config->'total_executor_memory' as total_executor_memory,
            res_config->'total_executor_cores' as total_executor_cores FROM dis.org)
        select sum(cast(driver_total_memory as integer)) driver_memory_sum,
            sum(CAST(total_executor_memory as integer)) executor_memory_sum,
            sum(cast(total_executor_cores as integer)) executor_cores_sum
		   FROM resource_summary;

--获得org资源列表
SELECT org_name, res_config->'spark_driver_memory' AS driver_memory,
        res_config->'total_executor_memory' AS executor_memory,
        res_config->'total_executor_cores' as executor_cores
		FROM dis.org order by executor_memory desc LIMIT 1 OFFSET 0;

SELECT org_name, res_config->'spark_driver_memory' AS driver_memory,
        res_config->'total_executor_memory' AS executor_memory,
        res_config->'total_executor_cores' as executor_cores
		FROM dis.org order by driver_memory desc;
