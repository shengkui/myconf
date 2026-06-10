select r.role_permission->> 'dataset' as role_permission
     from dis.role as r
     inner join dis.user_info ui on ui.user_name = 'myuser1'
     inner join dis.org o on o.org_id = 'C3aJrkMZzd82'
     inner join dis.user_org uo on uo.user_id = ui.user_id and uo.org_id = o.org_id and uo.role_id = r.role_id
     where r.role_permission->> 'dataset' in ('manage', 'view')
