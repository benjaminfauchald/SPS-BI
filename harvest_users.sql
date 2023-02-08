SELECT
    FORMAT_DATETIME('%F', te.spent_date) as spent_date,
    sum(hours) as hours,
    u.first_name,
    u.last_name,
    u.email,
   (
            select
--                r.id,
              CASE
                WHEN r.id = 475492 THEN "Eng Backend Team"
                WHEN r.id = 82456 THEN "ENG Cloud Team"
                WHEN r.id = 924293 THEN "Eng Delivery Team"
                WHEN r.id = 908890 THEN "Eng Management Team"
                WHEN r.id = 241695 THEN "Eng Mobile Team"
                WHEN r.id = 262970 THEN "Eng QA Team"
                WHEN r.id =  327255 THEN "Eng Web Team"
                WHEN r.id =  535066 THEN "OP - Marketing team"
                WHEN r.id =  911980 THEN "Senior"
                WHEN r.id =  912045 THEN "UI Design"
            END
 --           */
                    from sps-business-insight.sps_raw_harvest.user_roles ur, sps-business-insight.sps_raw_harvest.roles r where ur.role_id = r.id and user_id=u.id and role_id in (

            -- Show only the roles that soo beng wants
            select
               id
                from  sps-business-insight.sps_raw_harvest.roles

                where
                (
                id =475492 -- Eng Backend Team
                or id = 882456 -- ENG Cloud Team
                or id = 924293 -- Eng Delivery Team
                --or id = 908890 -- Eng Management Team
                or id = 241695 -- Eng Mobile Team
                --or id = 262970 -- Eng QA Team
                or id = 327255 -- Eng Web Team
                --or id = 908401 -- Head
                or id = 535066  --"OP - Marketing team"
                --or id = 911980 --"Senior"
                or id = 912045 -- "UI Design"
                )
        )) as Team,

   (select  CASE
                WHEN r.id = 903545 THEN "Seven Peaks"
                WHEN r.id = 880331 THEN "Morphosis"
            END
            from sps-business-insight.sps_raw_harvest.user_roles ur, sps-business-insight.sps_raw_harvest.roles r where ur.role_id = r.id and user_id=u.id and role_id in (


            -- Show only the roles that soo beng wants
            select
               id
                from  sps-business-insight.sps_raw_harvest.roles

                where
                (
                id = 880331
                or id = 903545
                )
    )) as BU



FROM

    sps-business-insight.sps_raw_harvest.users u
    LEFT JOIN
    sps-business-insight.sps_raw_harvest.time_entries te on u.id=te.user_id

where
    te.user_id=u.id
    and
    CAST(FORMAT_DATETIME('%F', te.spent_date) as STRING) = CAST(DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY) as STRING)
group by
    FORMAT_DATETIME('%F', te.spent_date),
    u.first_name,
    u.last_name,
    u.email,
    u.id
