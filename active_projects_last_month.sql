

select
        p.id as project_id
        name as project_name,
        code as project_code,
        (
            select
                coalesce(sum(hours),0)
            from
                sps-business-insight.sps_raw_harvest.time_entries te
            where
                EXTRACT(MONTH FROM te.spent_date) = EXTRACT(MONTH FROM DATE_SUB(CURRENT_DATE, INTERVAL 1 MONTH))
                and
                EXTRACT(YEAR FROM te.spent_date) = EXTRACT(YEAR FROM CURRENT_DATE)
                and
                p.id = te.project_id
        ) as total_hours

       from sps-business-insight.sps_raw_harvest.projects p
where
        id in
          (
            select project_id
            from sps-business-insight.sps_raw_harvest.time_entries te
            where
            EXTRACT(MONTH FROM te.spent_date) = EXTRACT(MONTH FROM DATE_SUB(CURRENT_DATE, INTERVAL 1 MONTH))
            and
            EXTRACT(YEAR FROM te.spent_date) = EXTRACT(YEAR FROM CURRENT_DATE)
           )



