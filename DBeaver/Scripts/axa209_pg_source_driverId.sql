-- 查找 driverId为特定值的行--
SELECT * FROM dis.source
  WHERE source.type = 'jdbc'
    AND (config::jsonb -> 'basic' -> 'driverId') = '"GzkeAy3pz6kM"';

-- 根据 source 表中 config::jsonb -> 'basic' -> 'driverId'的值，
-- 在 driver 表找到 driverId 对应的行，比较它们的 org_id 字段，找到 org_id 不相等的记录。
SELECT s.source_id, s.source_name, s.org_id AS source_org_id,
    d.driver_id, d.driver_name, d.org_id AS driver_org_id
FROM dis.source s
JOIN dis.driver d
ON d.driver_id = (s.config::json->'basic'->>'driverId') -- 提取 driverId 文本值
WHERE s.type = 'jdbc'
  AND s.org_id IS DISTINCT FROM d.org_id;  -- 处理 NULL 情况下的不相等
