select ctid,org_id from dis.org;
select ctid,org_id from dis.org where ctid='(0,4)';
select ctid,org_id from dis.org 
 WHERE ctid BETWEEN '(0,0)'::tid AND '(10,10)'::tid

insert into public.employees values(17, 2, 'Ben', '1222567550') returning ctid;
select ctid,* from public.employees;
select ctid,* from public.employees where ctid='(0,16)';