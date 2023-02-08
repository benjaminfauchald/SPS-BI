
select
         CAST(DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY) as STRING) as date,
        u.id,
        first_name,
        last_name,

        -- Total Hours
        COALESCE((select sum(hours) from sps-business-insight.sps_raw_harvest.time_entries te
        where
            user_id=u.id
            and
            (
                CAST(FORMAT_DATETIME('%F', te.spent_date) as STRING) = CAST(DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY) as STRING)       )
            ),0) as total_hours,

        -- Total billable hours
        COALESCE((select sum(hours) from sps-business-insight.sps_raw_harvest.time_entries te
        where
            user_id=u.id
            and te.billable = true
            and
            (
                CAST(FORMAT_DATETIME('%F', te.spent_date) as STRING) = CAST(DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY) as STRING)       )
            ),0) as billabe_hours,

        -- Total unbillable hours
        COALESCE((select sum(hours) from sps-business-insight.sps_raw_harvest.time_entries te
        where
            user_id=u.id
            and te.billable = false
            and
            (
                CAST(FORMAT_DATETIME('%F', te.spent_date) as STRING) = CAST(DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY) as STRING)       )
            ),0) as unbillable_hours,



            -- Total timely logged hours
        COALESCE((select sum(hours) from sps-business-insight.sps_raw_harvest.time_entries te
        where
            user_id=u.id
            and CAST(FORMAT_DATETIME('%F', te.spent_date) as STRING) = CAST(DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY) as STRING)
            and CAST(FORMAT_DATETIME('%F', te.spent_date) as STRING) =CAST(FORMAT_DATETIME('%F', te.created_at) as STRING)
        ),0) as timely_logged




from
    sps-business-insight.sps_raw_harvest.users u
where
    u.is_active = true

