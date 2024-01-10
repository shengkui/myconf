--select dataset.*, org.database_name from dis.dataset inner join dis.org ON org.org_id = dataset.org_id where lineage is null or lineage = '{}'
--select dataset.*, org.database_name from dis.dataset inner join dis.org ON org.org_id = dataset.org_id where schema is null or schema = null::jsonb
--SELECT lineage FROM dis.dataset where lineage::text = '{}'::text;
--select lineage FROM dis.dataset where lineage = '{}'::jsonb;
SELECT dataset.*, org.database_name FROM dis.dataset inner join dis.org ON org.org_id = dataset.org_id WHERE lineage IS NULL or lineage = '{}'::jsonb