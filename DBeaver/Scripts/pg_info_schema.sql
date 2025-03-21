SELECT * FROM information_schema.columns WHERE table_name = 'citylist';

select * from information_schema.tables;
select * from information_schema.tables where table_schema = 'public';
SELECT table_name FROM information_schema.tables WHERE table_schema='public'

SELECT schema_name FROM information_schema.schemata;

SELECT c.column_name, c.data_type, e.data_type AS element_type
FROM information_schema.columns c LEFT JOIN information_schema.element_types e
     ON ((c.table_catalog, c.table_schema, c.table_name, 'TABLE', c.dtd_identifier)
       = (e.object_catalog, e.object_schema, e.object_name, e.object_type, e.collection_type_identifier))
WHERE c.table_schema='public' AND c.table_name = 'citylist'
ORDER BY c.ordinal_position;