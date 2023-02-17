select 
  CASE
      WHEN pipeline_id=5 THEN 'SPS'
      WHEN pipeline_id=20 THEN 'N/A'
      WHEN pipeline_id=9 THEN 'N/A'
      WHEN pipeline_id=10 THEN 'SPS'
      WHEN pipeline_id=2 THEN 'N/A'
      WHEN pipeline_id=8 THEN 'N/A'
      WHEN pipeline_id=4 THEN 'SPS'
      WHEN pipeline_id=19 THEN 'MPH'
      WHEN pipeline_id=16 THEN 'SPS'
      WHEN pipeline_id=17 THEN 'SPS'
      WHEN pipeline_id=1 THEN 'SPS'
      WHEN pipeline_id=6 THEN 'MPH'
      WHEN pipeline_id=11 THEN 'N/A'
      WHEN pipeline_id=18 THEN 'MPH'
      WHEN pipeline_id=15 THEN 'SPS'

      ELSE 'MISSING PIPELINE'
  END as BU,
  org_name,
  title,
  owner_name,

  formatted_value,
  weighted_value,
  (select name from pipedrive.stages s where s.id=d.stage_id and s.pipeline_id = d.pipeline_id) as stage_name,
  active,

  FORMAT_DATE('%b-%d-%Y', cast(close_time as date)) as close_time,
  FORMAT_DATE('%b-%d-%Y', cast(expected_close_date as date)) as expected_close_date,
  lost_reason,


* from `pipedrive.deals` d


where 
extract(year from add_time) = extract(year from current_date())
and
extract(year from add_time) = extract(year from current_date())


--select * from pipedrive.stages