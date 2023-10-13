SELECT event.sub_message as sub_message, org.org_name, org.database_name, dataset.*
FROM "dataset"
left join org ON org.org_id = dataset.org_id
left join event ON event.join_key = dataset.dataset_id 
     and event.event_id = (SELECT MAX(event_id) FROM event where join_key = dataset.dataset_id)
WHERE dataset_id = 'q42VOvkwbpzb'
ORDER BY dataset_name,"dataset"."dataset_id"
LIMIT 1
