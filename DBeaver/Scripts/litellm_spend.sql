SELECT 
    user_id,
    date,
    spend,
    prompt_tokens,
    completion_tokens,
    cache_read_input_tokens,
    cache_creation_input_tokens,
    api_requests,
    successful_requests,
    failed_requests
FROM "LiteLLM_DailyUserSpend"
WHERE user_id = '31f1af64-606c-49ab-98b2-8e541c3a7efb'
  AND date >= '2025-11-01'


SELECT
    date_trunc('day', "startTime") AS date,  
    SUM(spend) AS total_spend,  
    SUM(total_tokens) AS total_tokens,  
    SUM(prompt_tokens) AS prompt_tokens,  
    SUM(completion_tokens) AS completion_tokens,  
    COUNT(*) AS api_requests  
FROM "LiteLLM_SpendLogs"  
WHERE "user" = '31f1af64-606c-49ab-98b2-8e541c3a7efb'  
  AND "startTime" >= '2025-11-01'::date
  AND "startTime" < '2025-11-19'::date  
GROUP BY date_trunc('day', "startTime")


--/user/daily/activity
SELECT
    dus.id,
    dus.date,
    dus.user_id,
    dus.api_key,
    dus.model,
    dus.model_group,
    dus.custom_llm_provider,
    dus.prompt_tokens,
    dus.completion_tokens,
    dus.spend,
    dus.api_requests,
    dus.successful_requests,
    dus.failed_requests,
    dus.cache_creation_input_tokens,
    dus.cache_read_input_tokens,
    dus.created_at,
    dus.updated_at,
    vt.team_id,
    vt.key_alias as api_key_alias,
    tt.team_alias
FROM "LiteLLM_DailyUserSpend" dus
LEFT JOIN "LiteLLM_VerificationToken" vt ON dus.api_key = vt.token
LEFT JOIN "LiteLLM_TeamTable" tt ON vt.team_id = tt.team_id
ORDER BY dus.date DESC, dus.created_at desc


--/global/spend/report"
WITH SpendByModelApiKey AS (
    SELECT
        sl.api_key,
        sl.model,
        SUM(sl.spend) AS model_cost,
        SUM(sl.prompt_tokens) AS model_input_tokens,
        SUM(sl.completion_tokens) AS model_output_tokens
    FROM
        "LiteLLM_SpendLogs" sl
    WHERE
        sl."startTime" BETWEEN '2025-11-01'::date AND '2025-11-20'::date
        and sl.api_key != ''
        --AND sl.api_key = '1f7d446b341130d11a5feb211b83ce067085c3f8b37de615bc295e8549288099'
    GROUP BY
        sl.api_key,
        sl.model
)
SELECT
    api_key,
    SUM(model_cost) AS total_cost,
    SUM(model_input_tokens) AS total_input_tokens,
    SUM(model_output_tokens) AS total_output_tokens,
    jsonb_agg(jsonb_build_object(
        'model', model,
        'total_cost', model_cost,
        'total_input_tokens', model_input_tokens,
        'total_output_tokens', model_output_tokens
    )) AS model_details
FROM
    SpendByModelApiKey
GROUP BY
    api_key
ORDER BY
    total_cost DESC;



WITH SpendByModelApiKey AS (
    SELECT date_trunc('day', sl."startTime") AS group_by_day,
      COALESCE(tt.team_alias, 'Unassigned Team') AS team_name,
      sl.model, sl.api_key,
      SUM(sl.spend) AS model_api_spend,
      SUM(sl.total_tokens) AS model_api_tokens
FROM "LiteLLM_SpendLogs" sl
LEFT JOIN "LiteLLM_TeamTable" tt 
ON sl.team_id = tt.team_id
WHERE sl."startTime" between '2025-11-01'::date AND '2025-11-20'::date
GROUP BY
    date_trunc('day', sl."startTime"),
    tt.team_alias, sl.model, sl.api_key
)
SELECT group_by_day,
     jsonb_agg(jsonb_build_object(
         'team_name', team_name,
         'total_spend', total_spend,
         'metadata', metadata
     )) AS teams
FROM (
    SELECT group_by_day,
        team_name,
        SUM(model_api_spend) AS total_spend,
        jsonb_agg(jsonb_build_object(
            'model', model,
            'api_key', api_key,
            'spend', model_api_spend,
            'total_tokens', model_api_tokens
        )) AS metadata
    FROM SpendByModelApiKey
    GROUP BY group_by_day, team_name
) AS aggregated
GROUP BY group_by_day ORDER BY group_by_day;