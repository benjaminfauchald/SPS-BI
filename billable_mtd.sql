
/*
 show_MTD_month_to_date_billables.sql


 */
CREATE OR REPLACE PROCEDURE `sps-business-insight.sps_raw_harvest.sp_month_to_date_by_role`(sps_role_id INT64)
BEGIN

/*
    DECLARE sps_role_id INT64;
    set  sps_role_id = 880331
*/

    select
        (select name from sps_raw_harvest.roles where id = sps_role_id) as role,
        sum(hours) as hours,
        sum(hours * billable_rate) as billable,
        sum(sps_raw_harvest.QuarterRound(hours)) as rounded_hours,
        sum(sps_raw_harvest.QuarterRound(hours) * billable_rate) as billable_rounded,
    from
        sps-business-insight.sps_raw_harvest.time_entries te
    where
        te.user_id in (select user_id from sps-business-insight.sps_raw_harvest.user_roles where role_id = sps_role_id)
        and EXTRACT(MONTH FROM te.spent_date) = EXTRACT(MONTH FROM DATE_SUB(CURRENT_DATE, INTERVAL 0 MONTH))
        and EXTRACT(YEAR FROM te.spent_date) = EXTRACT(YEAR FROM CURRENT_DATE)
        and billable = true
        ;
END;

    call `sps-business-insight.sps_raw_harvest.sp_month_to_date_by_role`(612789)

/*

BU - Morphosis	1,039	THB 615,324	880331
BU - Seven Peaks	6,133	THB 5,938,975	903545
Contractor - Savvycom	65	THB 28,200	932319
Copywriter	56	THB 9,180	912047
Design	639	THB 427,997	912042
Design Lead	44	THB 27,200	912044

Eng - Delivery team	34	THB 56,000	924293
Team - Apphuset	1,534	THB 1,567,800	754039
Team - Delivery	420	THB 808,702	287358
Team - Design	1,159	THB 625,622	284579
Team - Eng - Backend	1,256	THB 1,000,085	475492
Team - Eng - Cloud	292	THB 507,300	882456
Team - Eng - Mobile	1,328	THB 585,457	241695
Team - Eng - QA	1,307	THB 1,777,550	262970
Team - Eng - Web	1,384	THB 1,017,435	327255
Team - Marketing	121	THB 43,027	535066
Team - Marketing Ext	120	THB 40,527	934745
Team - Product	141	THB 283,200	876423


Eng - Management	15	THB 54,600	908890
Marketing	147	THB 37,562	934001
Role - Head	15	THB 54,600	908401
Role - Junior	171	THB 138,300	908387
Role - Mid	284	THB 179,509	911981
Role - Senior	140	THB 90,200	911980
UI Design	912	THB 607,600	933637
UX Design	1,368	THB 911,400	933639
UX Research Team	270	THB 172,793	933636
UX Researcher	135	THB 86,397	912043


 */