select org.database_name, dataset.dataset_name, dataset.description from dataset inner join org on dataset.org_id = org.org_id
  where org.database_name = 'main'
