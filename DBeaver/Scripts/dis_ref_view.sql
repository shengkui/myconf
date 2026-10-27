SELECT dataset.*, org.database_name
FROM dataset
LEFT JOIN org ON org.org_id = dataset.org_id
WHERE dataset.type = 'view'          -- constant.DatasetTypeView
  AND dataset.ori_sql <> ''
  AND dataset.ori_sql ILIKE '%main.viewA%'   -- 转义后的 "%keyword%"
ORDER BY dataset.dataset_name;

SELECT dataset.*
FROM dataset
WHERE dataset.type = 'view'
  AND org_id = 'C3aJrkMZzd82'
  AND ori_sql IS NOT NULL 
  AND ori_sql <> ''
  AND ori_sql ~* 'main.viewA';