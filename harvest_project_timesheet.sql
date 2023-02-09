

select
    te.project_id as project_id,
    (select name from sps-business-insight.sps_raw_harvest.projects p where te.project_id = p.id ) as project_name,
    (select code from sps-business-insight.sps_raw_harvest.projects p where te.project_id = p.id ) as project_code,

    CAST(FORMAT_DATETIME('%F', te.spent_date) as STRING) as spent_date,
    (select coalesce(first_name, ' ', last_name) from sps-business-insight.sps_raw_harvest.users u where u.id = te.user_id) as name,
    hours as hours,
    sps_raw_harvest.QuarterRound(hours) as rounded_hours,
    billable_rate,
    billable

from
    sps-business-insight.sps_raw_harvest.time_entries te
where
    --te.billable=true
    project_id = 33317953
    and EXTRACT(MONTH FROM te.spent_date) = EXTRACT(MONTH FROM DATE_SUB(CURRENT_DATE, INTERVAL 1 MONTH))
    and EXTRACT(YEAR FROM te.spent_date) = EXTRACT(YEAR FROM CURRENT_DATE)



--select * from  sps-business-insight.sps_raw_harvest.time_entries te limit 10