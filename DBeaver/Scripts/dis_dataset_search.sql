select event.sub_message as sub_message, org.org_name, org.database_name, dataset.*
from "dataset"
left join org on org.org_id = dataset.org_id
left join event on
    event.join_key = dataset.dataset_id
    and event.event_id = (
        select MAX(event_id) from event where join_key = dataset.dataset_id
    )
where dataset_id = 'q42VOvkwbpzb'
order by dataset_name, "dataset"."dataset_id"
limit 1
