--SELECT * FROM sql_history WHERE start_time >= timestamptz '2023-08-01 00:00:00 +0800'
--  AND start_time < timestamptz '2023-08-03 00:00:00 +0800' ORDER BY duration DESC LIMIT 20
--SELECT * FROM sql_history WHERE start_time >= timestamptz '2023-08-01T00:00:00+0800'
--  AND start_time < timestamptz '2023-08-03T00:00:00+0800' ORDER BY duration DESC LIMIT 20

--SELECT * FROM sql_history WHERE start_time >= timestamptz '2023-08-01T00:00:00Z'
--  AND start_time < timestamptz '2023-08-23T00:00:00Z' ORDER BY duration DESC LIMIT 20

SELECT * FROM sql_history WHERE start_time >= '2023-07-01T00:00:00Z'
  AND start_time < '2023-08-23T00:00:00Z' ORDER BY duration DESC LIMIT 20
