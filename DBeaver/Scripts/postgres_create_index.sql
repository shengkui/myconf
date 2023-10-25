CREATE index IF NOT EXISTS hist_index_duration ON sql_history(duration);
CREATE INDEX IF NOT EXISTS hist_index_run_time ON sql_history(start_time, end_time);