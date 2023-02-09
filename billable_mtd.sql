
/*
 show_MTD_month_to_date_billables.sql


 */
select
    sum(hours),
    sum(sps_raw_harvest.QuarterRound(hours))

from
    sps-business-insight.sps_raw_harvest.time_entries te
where
    te.user_id in (select user_id from sps-business-insight.sps_raw_harvest.user_roles where role_id = 880331)
    and EXTRACT(MONTH FROM te.spent_date) = EXTRACT(MONTH FROM DATE_SUB(CURRENT_DATE, INTERVAL 0 MONTH))
    and EXTRACT(YEAR FROM te.spent_date) = EXTRACT(YEAR FROM CURRENT_DATE)

/*

select name from sps-business-insight.sps_raw_harvest.time_entries




 880331,BU - Morphosis
932319,Contractor - Savvycom
911980,Role - Senior
911981,Role - Mid
903545,BU - Seven Peaks



 */