SELECT
  id,
    CURRENT_DATE() as spent_date,
    COALESCE((select sum(hours) from sps-business-insight.sps_raw_harvest.time_entries te
     where
       user_id=u.id
       and
       (
        CAST(FORMAT_DATETIME('%F', te.spent_date) as STRING) = CAST(DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY) as STRING)       )
       ),0) as hours,
    CONCAT(u.first_name, ' ', u.last_name) as Name,
    u.email as email,
    (select is_contractor from sps-business-insight.sps_raw_harvest.users where id = u.id) as contractor,
   ( --select 'N/A' /*

            select
                CASE
                    WHEN r.id = 754039 THEN "Team - Apphuset"
                    WHEN r.id = 287358 THEN "Team - Delivery"
                    WHEN r.id = 284579 THEN "Team - Design"
                    WHEN r.id = 475492 THEN "Team - Eng - Backend"
                    WHEN r.id = 882456 THEN "Team - Eng - Cloud"
                    WHEN r.id = 241695 THEN "Team - Eng - Mobile"
                    WHEN r.id = 262970 THEN "Team - Eng - QA"
                    WHEN r.id = 327255 THEN "Team - Eng - Web"
                    WHEN r.id = 535066 THEN "Team - Marketing"
                    WHEN r.id = 934745 THEN "Team - Marketing Ext"
                    WHEN r.id = 876423 THEN "Team - Product"
                END
            from sps-business-insight.sps_raw_harvest.user_roles ur, sps-business-insight.sps_raw_harvest.roles r where ur.role_id = r.id and user_id=u.id and role_id in (

            -- Show only the roles that soo beng wants
            select
               id
            from
                sps-business-insight.sps_raw_harvest.roles
            where
            (
            id =754039 -- Team - Apphuset
            or id = 287358 -- Team - Delivery
            or id = 284579 -- Team - Design
            or id = 475492 -- Team - Eng - Backend
            or id = 882456 -- Team - Eng - Cloud
            or id = 241695 -- Team - Eng - Mobile
            or id = 262970 -- Team - Eng - QA
            or id = 327255 -- Team - Eng - Web
            or id = 535066  --Team - Marketing
            or id = 934745 --  Team - Marketing Ext
            or id = 876423 --Team - Product
            )
            )
--*/

        ) as Team,

       (
            select
                CASE
                    WHEN r.id = 880331 THEN "Morphosis"
                    WHEN r.id = 903545 THEN "Seven Peaks"

                END
            from sps-business-insight.sps_raw_harvest.user_roles ur, sps-business-insight.sps_raw_harvest.roles r where ur.role_id = r.id and user_id=u.id and role_id in (

            -- Show only the roles that soo beng wants
            select
               id
            from

                sps-business-insight.sps_raw_harvest.roles
            where
            (
            id =903545 or id = 880331
            )

        )) as BU

FROM
    sps-business-insight.sps_raw_harvest.users u
where
    is_active = true
    and
    id <> 4380303 and -- jeremie
    id <> 2446903 and -- leif
    id <> 795889 and -- roy
    id <> 4342651 and -- accounting
    id <> 2637569 and -- apphuset
    id <> 3510610 and -- soo beng
    id <> 4470192 and -- office admin
    id <> 4420883 and -- benjamin
    id <> 4420703 and --stich
    id <> 4472929 and -- hr
    id <> 4325126 and  -- jostein
    id <>  795892  -- bixdev


group by
    u.first_name,
    u.last_name,
    u.email,
    u.id

order by hours

