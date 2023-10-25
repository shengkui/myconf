--SELECT * FROM public.sql_history 
--  WHERE start_time BETWEEN timestamp '2023-07-05 00:00:00' and timestamp '2023-07-25 00:00:00'
--  ORDER BY duration DESC;

SELECT * FROM public.sql_history
  WHERE start_time >= timestamptz '2023-08-01 00:00:00 +0800' AND start_time < timestamptz '2023-08-25 00:00:00 +0800'
  ORDER BY duration DESC;

--SELECT * FROM public.sql_history
--  WHERE start_time >= timestamp '2023-07-05' AND start_time < timestamp '2023-07-25'
--  ORDER BY duration DESC;
